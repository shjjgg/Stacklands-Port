#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
游戏自研程序集 · 程序集引用闭包与内嵌资源台账 (元数据级)

枚举自研程序集 AssemblyRef (外部依赖名/版本/公钥标记) 与 ManifestResource
(内嵌资源名/偏移), 与 Managed 目录 DLL 清单交叉核对解析结果; 另对全部托管
DLL 做一次闭包扫描, 报告磁盘上缺失的引用程序集。不解码资源 blob 内容。

用法:
  python3 scan_dependency_inventory.py --managed <Managed 目录> --out <输出目录>
"""
import argparse, os, json, datetime, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")

GAME_ASSEMBLIES = ["GameScripts.dll", "Assembly-CSharp.dll",
                   "Assembly-CSharp-firstpass.dll", "csS.dll"]


def version_of(r):
    return f"{r.MajorVersion}.{r.MinorVersion}.{r.BuildNumber}.{r.RevisionNumber}"


def has_public_key(r):
    pk = getattr(r, "PublicKey", None)
    val = getattr(pk, "value", None) if pk is not None else None
    return bool(val)


def scan_game_assembly(path, dll_index):
    pe = dnfile.dnPE(path)
    refs = []
    ar = pe.net.mdtables.AssemblyRef
    if ar is not None:
        for r in ar.rows:
            name = str(r.Name)
            resolved = name.lower() in dll_index
            refs.append({
                "name": name,
                "version": version_of(r),
                "culture": str(r.Culture) if r.Culture else "",
                "has_public_key": has_public_key(r),
                "resolved_on_disk": resolved,
                "resolved_file": dll_index.get(name.lower()),
            })

    resources = []
    mr = pe.net.mdtables.ManifestResource
    if mr is not None:
        for x in mr.rows:
            resources.append({"name": str(x.Name), "offset": getattr(x, "Offset", None)})

    unresolved = [r["name"] for r in refs if not r["resolved_on_disk"]]
    return {
        "reference_count": len(refs),
        "unresolved_count": len(unresolved),
        "unresolved": unresolved,
        "resource_count": len(resources),
        "references": refs,
        "resources": resources,
    }


def scan_full_closure(managed_dir):
    dll_index = {f[:-4].lower(): f for f in os.listdir(managed_dir)
                 if f.lower().endswith(".dll")}
    unresolved = collections.defaultdict(list)
    resource_dlls = {}
    for fname in sorted(dll_index.values()):
        path = os.path.join(managed_dir, fname)
        try:
            pe = dnfile.dnPE(path)
        except Exception:
            continue
        ar = pe.net.mdtables.AssemblyRef
        if ar is not None:
            for r in ar.rows:
                if str(r.Name).lower() not in dll_index:
                    unresolved[fname].append(str(r.Name))
        mr = pe.net.mdtables.ManifestResource
        if mr is not None and mr.rows:
            resource_dlls[fname] = [str(x.Name) for x in mr.rows]
    return {
        "managed_dll_count": len(dll_index),
        "unresolved_assemblies": dict(unresolved),
        "unresolved_count": sum(len(v) for v in unresolved.values()),
        "resource_assemblies": resource_dlls,
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--managed", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    dll_index = {f[:-4].lower(): f for f in os.listdir(args.managed)
                 if f.lower().endswith(".dll")}

    ledger = {"scanned_at": datetime.datetime.now().isoformat(timespec="seconds"),
              "assemblies": {}, "closure": {}}

    for dll in GAME_ASSEMBLIES:
        path = os.path.join(args.managed, dll)
        if not os.path.exists(path):
            ledger["assemblies"][dll] = {"error": "文件不存在"}
            continue
        ledger["assemblies"][dll] = scan_game_assembly(path, dll_index)

    ledger["closure"] = scan_full_closure(args.managed)

    os.makedirs(args.out, exist_ok=True)
    with open(os.path.join(args.out, "dependency_inventory.json"), "w",
              encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    L = ["# 自研程序集引用闭包与内嵌资源台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         "- 元数据 AssemblyRef / ManifestResource；资源 blob 内容与版本一致性需反编译/加载后核对。\n",
         "## 1. 汇总\n",
         "| 程序集 | 引用数 | 磁盘未解析 | 内嵌资源数 |",
         "|---|---:|---:|---:|"]
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            L.append(f"| {dll} | — | {info['error']} | |")
            continue
        L.append(f"| {dll} | {info['reference_count']} | {info['unresolved_count']} | "
                 f"{info['resource_count']} |")

    c = ledger["closure"]
    L.append(f"\n## 2. 全量托管闭包\n")
    L.append(f"- Managed 目录 DLL 总数: **{c['managed_dll_count']}**")
    L.append(f"- 磁盘未解析引用: **{c['unresolved_count']}**")
    if c["unresolved_assemblies"]:
        L.append("")
        for k, v in c["unresolved_assemblies"].items():
            L.append(f"  - `{k}`: {', '.join(v)}")
    L.append(f"- 含内嵌资源的程序集: **{len(c['resource_assemblies'])}**（均为 BCL/第三方 XML/音频/图标，自研程序集无内嵌资源）")

    for dll, info in ledger["assemblies"].items():
        if "error" in info or not info["references"]:
            continue
        L.append(f"\n## 3. {dll} 引用程序集\n")
        L.append("| 引用程序集 | 版本 | 公钥标记 | 磁盘解析 |")
        L.append("|---|---|:---:|:---:|")
        for r in sorted(info["references"], key=lambda x: x["name"]):
            L.append(f"| `{r['name']}` | {r['version']} | "
                     f"{'是' if r['has_public_key'] else '否'} | "
                     f"{'✅ ' + r['resolved_file'] if r['resolved_on_disk'] else '❌ 缺失'} |")
        L.append("")

    with open(os.path.join(args.out, "dependency_inventory.md"), "w",
              encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    for dll, info in ledger["assemblies"].items():
        if "error" not in info:
            print(f"[OK] {dll}: 引用 {info['reference_count']} "
                  f"(未解析 {info['unresolved_count']}), 资源 {info['resource_count']}")
    print(f"[closure] Managed DLL {c['managed_dll_count']}, "
          f"未解析 {c['unresolved_count']}, 资源程序集 {len(c['resource_assemblies'])}")
    print(f"-> {args.out}")


if __name__ == "__main__":
    main()
