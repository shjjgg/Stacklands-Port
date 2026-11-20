#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
游戏自研程序集 · 类型清单与脚本回填映射台账 (元数据级)

枚举 GameScripts / Assembly-CSharp / firstpass / csS 的 TypeDef, 记录命名空间、
类型名、种类(类/结构体/接口/枚举/委托)、直接基类, 并与静态扫描的 MonoScript
计数对照, 供 P2 脚本回填规划。不解码 IL 方法体, 基类链仅解析直接基类。

用法:
  python3 scan_type_inventory.py --managed <Managed 目录> --out <输出目录> [--scan-report <scan_report.json>]
"""
import argparse, os, json, datetime, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")

GAME_ASSEMBLIES = ["GameScripts.dll", "Assembly-CSharp.dll",
                   "Assembly-CSharp-firstpass.dll", "csS.dll"]

UNITY_BASE_MARKERS = ("MonoBehaviour", "ScriptableObject", "CardData", "StatusEffect",
                      "SokScreen", "CardRequirement", "CutsceneStep", "Blueprint",
                      "Enemy", "EventCard", "Harvestable", "ShapeDrawer", "Resource",
                      "Landmark", "CardRequirementResult")


def base_name(defrow):
    try:
        row = defrow.Extends.row
        ns = str(getattr(row, "TypeNamespace", "") or "")
        nm = str(getattr(row, "TypeName", None) or getattr(row, "Name", None) or "")
        return f"{ns}.{nm}" if ns else nm
    except Exception:
        return "?"


def classify(defrow, base):
    f = defrow.Flags
    if f.tdInterface:
        return "interface"
    if base == "System.Enum":
        return "enum"
    if base in ("System.MulticastDelegate", "System.Delegate"):
        return "delegate"
    if base == "System.ValueType":
        return "struct"
    return "class"


def scan_assembly(path):
    pe = dnfile.dnPE(path)
    types = []
    for r in pe.net.mdtables.TypeDef.rows:
        ns = str(r.TypeNamespace) if r.TypeNamespace else ""
        nm = str(r.TypeName)
        if nm in ("<Module>", ""):
            continue
        base = base_name(r)
        kind = classify(r, base)
        types.append({
            "namespace": ns,
            "name": nm,
            "kind": kind,
            "base": base,
            "unity_derived": any(m in base for m in UNITY_BASE_MARKERS),
        })
    return types


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--managed", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--scan-report", default="")
    args = ap.parse_args()

    ledger = {"scanned_at": datetime.datetime.now().isoformat(timespec="seconds"),
              "assemblies": {}}
    mono_by_assembly = {}
    if args.scan_report and os.path.exists(args.scan_report):
        rep = json.load(open(args.scan_report, encoding="utf-8"))
        mono_by_assembly = rep.get("scripts_by_assembly", {})

    for dll in GAME_ASSEMBLIES:
        path = os.path.join(args.managed, dll)
        if not os.path.exists(path):
            ledger["assemblies"][dll] = {"error": "文件不存在"}
            continue
        types = scan_assembly(path)
        kinds = collections.Counter(t["kind"] for t in types)
        unity = [t for t in types if t["unity_derived"]]
        ns_groups = collections.defaultdict(list)
        for t in types:
            ns_groups[t["namespace"] or "(global)"].append(t)
        ledger["assemblies"][dll] = {
            "typedef_count": len(types),
            "monoscript_count": mono_by_assembly.get(dll.replace(".dll", ""),
                                                     mono_by_assembly.get(dll)),
            "kind_counts": dict(kinds),
            "unity_derived_count": len(unity),
            "namespaces": {ns: [t["name"] for t in sorted(v, key=lambda x: x["name"])]
                           for ns, v in sorted(ns_groups.items())},
            "types": types,
        }

    os.makedirs(args.out, exist_ok=True)
    with open(os.path.join(args.out, "type_inventory.json"), "w", encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    L = ["# 游戏自研程序集类型清单 / 回填映射台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         "- 仅元数据 TypeDef；直接基类已解析，跨程序集基类链需反编译后补全。\n",
         "## 1. 汇总\n",
         "| 程序集 | TypeDef | MonoScript 基线 | 类/结构体 | 接口 | 枚举 | 委托 | Unity 派生(直接基类) |",
         "|---|---:|---:|---:|---:|---:|---:|---:|"]
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            L.append(f"| {dll} | — | {info['error']} | | | | | |")
            continue
        k = info["kind_counts"]
        L.append(f"| {dll} | {info['typedef_count']} | {info['monoscript_count']} | "
                 f"{k.get('class',0)+k.get('struct',0)} | {k.get('interface',0)} | "
                 f"{k.get('enum',0)} | {k.get('delegate',0)} | {info['unity_derived_count']} |")

    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            continue
        L.append(f"\n## 2. {dll}（按命名空间）\n")
        for ns, names in info["namespaces"].items():
            L.append(f"### {ns}（{len(names)}）\n")
            L.append("| 类型 | 种类 | 直接基类 |")
            L.append("|---|---|---|")
            for t in sorted(info["types"], key=lambda x: (x["namespace"], x["name"])):
                if t["namespace"] != ns and not (ns == "(global)" and not t["namespace"]):
                    continue
                L.append(f"| `{t['name']}` | {t['kind']} | {t['base']} |")
            L.append("")

    with open(os.path.join(args.out, "type_inventory.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    for dll, info in ledger["assemblies"].items():
        if "error" not in info:
            print(f"[OK] {dll}: TypeDef {info['typedef_count']}, "
                  f"MonoScript {info['monoscript_count']}, "
                  f"Unity 派生 {info['unity_derived_count']}")
    print(f"-> {args.out}")


if __name__ == "__main__":
    main()
