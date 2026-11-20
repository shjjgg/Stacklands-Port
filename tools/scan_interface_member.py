#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
游戏自研程序集 · 接口实现与外部成员引用台账 (元数据级)

- InterfaceImpl: 类型 -> 实现的接口 (TypeDefOrRef 解析)。
- MemberRef: 外部/基类成员引用, 按声明类型 (TypeRef) 分桶统计成员名;
  TypeSpec (泛型实例) 单独计数, 不展开泛型实参。

用法:
  python3 scan_interface_member.py --managed <Managed 目录> --out <输出目录>
"""
import argparse, os, json, datetime, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")

GAME_ASSEMBLIES = ["GameScripts.dll", "Assembly-CSharp.dll",
                   "Assembly-CSharp-firstpass.dll", "csS.dll"]


def type_name_from_index(idx):
    if idx is None or idx.table is None:
        return None
    row = idx.row
    if idx.table.name == "TypeSpec":
        return "<TypeSpec>"
    ns = str(getattr(row, "TypeNamespace", "") or "")
    tn = str(getattr(row, "TypeName", "?"))
    return f"{ns}.{tn}" if ns else tn


def scan_assembly(path):
    pe = dnfile.dnPE(path)
    tdefs = pe.net.mdtables.TypeDef.rows
    owner = {i + 1: t for i, t in enumerate(tdefs)}

    # --- InterfaceImpl ---
    impls = []
    ii = pe.net.mdtables.InterfaceImpl
    if ii is not None:
        for row in ii.rows:
            t = owner.get(row.Class.row_index)
            ns = str(t.TypeNamespace) if t and t.TypeNamespace else ""
            tn = str(t.TypeName) if t else "?"
            owner_full = f"{ns}.{tn}" if ns else tn
            iface = type_name_from_index(row.Interface)
            impls.append({"owner": owner_full, "interface": iface})

    implementing_types = {x["owner"] for x in impls}
    distinct_interfaces = {x["interface"] for x in impls}

    # --- MemberRef ---
    members = []
    mr = pe.net.mdtables.MemberRef
    ref_by_type = collections.Counter()
    ref_members = collections.defaultdict(collections.Counter)
    typespec_count = 0
    if mr is not None:
        for row in mr.rows:
            cls = row.Class
            if cls.table.name == "TypeSpec":
                typespec_count += 1
                declaring = "<TypeSpec 泛型实例>"
            else:
                declaring = type_name_from_index(cls) or "?"
            mname = str(row.Name)
            members.append({"declaring_type": declaring, "member": mname,
                            "via_typespec": cls.table.name == "TypeSpec"})
            if cls.table.name != "TypeSpec":
                ref_by_type[declaring] += 1
                ref_members[declaring][mname] += 1

    return {
        "interface_impl_count": len(impls),
        "implementing_type_count": len(implementing_types),
        "distinct_interface_count": len(distinct_interfaces),
        "impls": impls,
        "memberref_count": len(members),
        "memberref_typespec_count": typespec_count,
        "memberref_by_type": dict(ref_by_type.most_common()),
        "members": members,
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
    with open(os.path.join(args.out, "interface_member_inventory.json"), "w",
              encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    L = ["# 自研程序集接口实现 / 外部成员引用台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         "- 元数据 InterfaceImpl / MemberRef；泛型实参、成员签名与调用点需反编译后补全。\n",
         "## 1. 汇总\n",
         "| 程序集 | 接口实现数 | 实现接口的类型 | 不同接口 | MemberRef 总数 | 其中 TypeSpec 泛型 |",
         "|---|---:|---:|---:|---:|---:|"]
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            L.append(f"| {dll} | — | {info['error']} | | | |")
            continue
        L.append(f"| {dll} | {info['interface_impl_count']} | "
                 f"{info['implementing_type_count']} | {info['distinct_interface_count']} | "
                 f"{info['memberref_count']} | {info['memberref_typespec_count']} |")

    for dll, info in ledger["assemblies"].items():
        if "error" in info or not info["impls"]:
            continue
        L.append(f"\n## 2. {dll} 接口实现\n")
        L.append("| 类型 | 实现接口 |")
        L.append("|---|---|")
        for x in sorted(info["impls"], key=lambda y: (y["owner"], y["interface"] or "")):
            L.append(f"| `{x['owner']}` | `{x['interface']}` |")
        L.append("")

    for dll, info in ledger["assemblies"].items():
        if "error" in info or not info["memberref_by_type"]:
            continue
        L.append(f"\n## 3. {dll} MemberRef 按声明类型（TypeRef）分布\n")
        L.append("| 声明类型 | 成员引用次数 |")
        L.append("|---|---:|")
        for t, c in info["memberref_by_type"].items():
            L.append(f"| `{t}` | {c} |")
        L.append("")

    with open(os.path.join(args.out, "interface_member_inventory.md"), "w",
              encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    for dll, info in ledger["assemblies"].items():
        if "error" not in info:
            print(f"[OK] {dll}: 接口实现 {info['interface_impl_count']}, "
                  f"MemberRef {info['memberref_count']} "
                  f"(TypeSpec {info['memberref_typespec_count']})")
    print(f"-> {args.out}")


if __name__ == "__main__":
    main()
