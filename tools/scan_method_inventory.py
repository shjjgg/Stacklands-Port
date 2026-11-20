#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
游戏自研程序集 · 方法清单与 Unity 生命周期消息台账 (元数据级)

按 TypeDef.MethodList 枚举归属的 MethodDef, 统计方法数量, 标记 Unity 生命周期消息(Awake/Start/
Update/OnEnable/...)、构造函数、属性访问器, 供脚本回填时核对原版事件钩子是否保留。
不解码方法体与参数签名; 精确签名/重写关系需反编译后补全。

用法:
  python3 scan_method_inventory.py --managed <Managed 目录> --out <输出目录>
"""
import argparse, os, json, datetime, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")

GAME_ASSEMBLIES = ["GameScripts.dll", "Assembly-CSharp.dll",
                   "Assembly-CSharp-firstpass.dll", "csS.dll"]

UNITY_LIFECYCLE = {
    "Awake", "OnEnable", "OnDisable", "Start", "Reset", "OnValidate",
    "Update", "FixedUpdate", "LateUpdate", "OnDestroy",
    "OnApplicationPause", "OnApplicationFocus", "OnApplicationQuit",
    "OnTriggerEnter", "OnTriggerEnter2D", "OnTriggerExit", "OnTriggerExit2D",
    "OnCollisionEnter", "OnCollisionEnter2D", "OnCollisionExit", "OnCollisionExit2D",
    "OnMouseDown", "OnMouseUp", "OnMouseEnter", "OnMouseExit",
    "OnBecameVisible", "OnBecameInvisible", "OnPreCull", "OnPostRender",
    "OnRectTransformDimensionsChange", "OnBeforeTransformParentChanged",
    "OnTransformParentChanged", "OnTransformChildrenChanged",
    "OnCanvasHierarchyChanged", "OnDrawGizmos", "OnSerialize", "OnDeserialize",
}


def methods_of(typedef):
    # MethodList 为该类型直接拥有的 MethodDef 索引列表 (含 .row)
    out = []
    for idx in typedef.MethodList:
        try:
            out.append(idx.row)
        except Exception:
            pass
    return out


def scan_assembly(path):
    pe = dnfile.dnPE(path)
    tdefs = pe.net.mdtables.TypeDef.rows

    types = []
    total_methods = 0
    lifecycle_types = []
    lifecycle_methods = []
    ctors = 0
    accessors = 0

    for i, td in enumerate(tdefs):
        ns = str(td.TypeNamespace) if td.TypeNamespace else ""
        nm = str(td.TypeName)
        if nm in ("<Module>", ""):
            continue
        ms = methods_of(td)
        names = [str(m.Name) for m in ms]
        total_methods += len(names)
        ctors += sum(1 for n in names if n == ".ctor" or n == ".cctor")
        accessors += sum(1 for n in names if n.startswith("get_") or n.startswith("set_"))
        life = [n for n in names if n in UNITY_LIFECYCLE]
        if life:
            lifecycle_types.append(f"{ns}.{nm}" if ns else nm)
            lifecycle_methods.extend((f"{ns}.{nm}" if ns else nm, n) for n in life)
        types.append({"namespace": ns, "name": nm, "method_count": len(names),
                      "lifecycle": life})

    return {
        "method_count": total_methods,
        "ctor_count": ctors,
        "accessor_count": accessors,
        "lifecycle_type_count": len(lifecycle_types),
        "lifecycle_method_count": len(lifecycle_methods),
        "lifecycle_types": lifecycle_types,
        "lifecycle_methods": lifecycle_methods,
        "types": types,
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--managed", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    ledger = {"scanned_at": datetime.datetime.now().isoformat(timespec="seconds"),
              "assemblies": {}}

    for dll in GAME_ASSEMBLIES:
        path = os.path.join(args.managed, dll)
        if not os.path.exists(path):
            ledger["assemblies"][dll] = {"error": "文件不存在"}
            continue
        ledger["assemblies"][dll] = scan_assembly(path)

    os.makedirs(args.out, exist_ok=True)
    with open(os.path.join(args.out, "method_inventory.json"), "w", encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    L = ["# 自研程序集方法清单 / Unity 生命周期消息台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         "- 元数据 MethodDef 枚举（TypeDef.MethodList 归属）；方法体、参数签名、重写关系需反编译后补全。\n",
         "## 1. 汇总\n",
         "| 程序集 | 方法总数 | 构造函数 | 属性访问器 | 含生命周期方法的类型 | 生命周期消息数 |",
         "|---|---:|---:|---:|---:|---:|"]
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            L.append(f"| {dll} | — | {info['error']} | | | |")
            continue
        L.append(f"| {dll} | {info['method_count']} | {info['ctor_count']} | "
                 f"{info['accessor_count']} | {info['lifecycle_type_count']} | "
                 f"{info['lifecycle_method_count']} |")

    L.append("\n## 2. Unity 生命周期消息分布\n")
    life_counter = collections.Counter()
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            continue
        for _, m in info["lifecycle_methods"]:
            life_counter[m] += 1
    L.append("| 生命周期消息 | 出现次数 |")
    L.append("|---|---:|")
    for m, c in life_counter.most_common():
        L.append(f"| `{m}` | {c} |")

    for dll, info in ledger["assemblies"].items():
        if "error" in info or not info["lifecycle_types"]:
            continue
        L.append(f"\n## 3. {dll} 含生命周期方法的类型\n")
        L.append("| 类型 | 生命周期消息 |")
        L.append("|---|---|")
        for t in sorted(info["types"], key=lambda x: x["name"]):
            if t["lifecycle"]:
                full = f"{t['namespace']}.{t['name']}" if t["namespace"] else t["name"]
                L.append(f"| `{full}` | {', '.join(t['lifecycle'])} |")
        L.append("")

    with open(os.path.join(args.out, "method_inventory.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    for dll, info in ledger["assemblies"].items():
        if "error" not in info:
            print(f"[OK] {dll}: 方法 {info['method_count']}, "
                  f"生命周期类型 {info['lifecycle_type_count']}, "
                  f"消息 {info['lifecycle_method_count']}")
    print(f"-> {args.out}")


if __name__ == "__main__":
    main()
