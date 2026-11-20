#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
游戏自研程序集 · 字段清单与枚举值台账 (元数据级)

按 TypeDef.FieldList 枚举归属的 FieldDef, 统计字段数量与可见性/静态/字面量/
非序列化等标志; 对枚举类型解析底层类型并导出各成员整数值。
字段类型签名 blob 仅保留原始十六进制; 精确类型名/泛型实参/序列化特性需反编译后补全。

用法:
  python3 scan_field_inventory.py --managed <Managed 目录> --out <输出目录>
"""
import argparse, os, json, datetime, struct, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")

GAME_ASSEMBLIES = ["GameScripts.dll", "Assembly-CSharp.dll",
                   "Assembly-CSharp-firstpass.dll", "csS.dll"]

# ECMA-335 元素类型码 (value__ 签名第二项)
ELEMENT_TYPE = {
    0x02: "bool", 0x03: "char", 0x04: "sbyte", 0x05: "byte",
    0x06: "short", 0x07: "ushort", 0x08: "int", 0x09: "uint",
    0x0A: "long", 0x0B: "ulong", 0x0C: "float", 0x0D: "double",
    0x0E: "string", 0x18: "nint", 0x19: "nuint",
}
# 底层类型 -> struct 解码格式 (小端)
UNDERLYING_FMT = {
    "sbyte": "b", "byte": "B", "short": "h", "ushort": "H",
    "int": "i", "uint": "I", "long": "q", "ulong": "Q",
}


def base_type_name(td):
    ex = getattr(td, "Extends", None)
    if ex is None:
        return None
    row = getattr(ex, "row", None)
    if row is None:
        return None
    return str(getattr(row, "TypeName", None))


def visibility(flags):
    if flags.fdPublic:
        return "public"
    if flags.fdPrivate:
        return "private"
    if flags.fdFamily:
        return "protected"
    if flags.fdAssembly:
        return "internal"
    return "other"


def decode_const(underlying, raw):
    fmt = UNDERLYING_FMT.get(underlying)
    if fmt is None or not raw:
        return None
    size = struct.calcsize(fmt)
    if len(raw) < size:
        raw = raw + b"\x00" * (size - len(raw))
    return struct.unpack("<" + fmt, raw[:size])[0]


def field_const_map(pe):
    """HasConstant 编码索引 -> (const_type, raw bytes), 仅取 Field 父级。"""
    ctab = getattr(pe.net.mdtables, "Constant", None)
    out = {}
    if ctab is None:
        return out
    for c in ctab.rows:
        par = getattr(c, "Parent", None)
        table = getattr(par, "table", None)
        if table is not None and getattr(table, "name", None) == "Field":
            out[par.row_index] = (c.Type, c.Value.value)
    return out


def scan_assembly(path):
    pe = dnfile.dnPE(path)
    tdefs = pe.net.mdtables.TypeDef.rows
    consts = field_const_map(pe)

    types = []
    enums = []
    total = 0
    static = literal = initonly = not_serialized = 0
    vis_counter = collections.Counter()
    enum_member_total = 0

    for td in tdefs:
        ns = str(td.TypeNamespace) if td.TypeNamespace else ""
        nm = str(td.TypeName)
        if nm in ("<Module>", ""):
            continue
        is_enum = base_type_name(td) == "Enum"
        fields = []
        underlying = None

        for fidx in td.FieldList:
            fr = fidx.row
            fname = str(fr.Name)
            fl = fr.Flags
            total += 1
            vis = visibility(fl)
            vis_counter[vis] += 1
            if fl.fdStatic:
                static += 1
            if fl.fdLiteral:
                literal += 1
            if fl.fdInitOnly:
                initonly += 1
            if fl.fdNotSerialized:
                not_serialized += 1

            entry = {
                "name": fname,
                "visibility": vis,
                "static": bool(fl.fdStatic),
                "literal": bool(fl.fdLiteral),
                "init_only": bool(fl.fdInitOnly),
                "not_serialized": bool(fl.fdNotSerialized),
                "signature": fr.Signature.value.hex() if fr.Signature.value else "",
            }

            if is_enum and fname == "value__":
                el = fr.Signature.value[1] if fr.Signature.value else None
                underlying = ELEMENT_TYPE.get(el, f"0x{el:02x}")
            elif is_enum:
                ct, raw = consts.get(fidx.row_index, (None, None))
                entry["value"] = decode_const(underlying, raw) if underlying else None
            fields.append(entry)

        if is_enum:
            members = [{"name": e["name"], "value": e.get("value")}
                       for e in fields if e["name"] != "value__"]
            enum_member_total += len(members)
            enums.append({"namespace": ns, "name": nm,
                          "underlying": underlying, "members": members})
        else:
            types.append({"namespace": ns, "name": nm, "field_count": len(fields),
                          "fields": fields})

    return {
        "field_count": total,
        "static_count": static,
        "instance_count": total - static,
        "literal_count": literal,
        "init_only_count": initonly,
        "not_serialized_count": not_serialized,
        "visibility": dict(vis_counter),
        "enum_type_count": len(enums),
        "enum_member_count": enum_member_total,
        "enums": enums,
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
    with open(os.path.join(args.out, "field_inventory.json"), "w", encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    L = ["# 自研程序集字段清单 / 枚举值台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         "- 元数据 FieldDef 枚举（TypeDef.FieldList 归属）；字段类型签名 blob 未完全解码，"
         "精确类型名/泛型实参/序列化特性需反编译后补全。\n",
         "## 1. 汇总\n",
         "| 程序集 | 字段总数 | 静态 | 实例 | 字面量 | 只读 | 非序列化 | 枚举类型 | 枚举成员 |",
         "|---|---:|---:|---:|---:|---:|---:|---:|---:|"]
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            L.append(f"| {dll} | — | {info['error']} | | | | | | |")
            continue
        L.append(f"| {dll} | {info['field_count']} | {info['static_count']} | "
                 f"{info['instance_count']} | {info['literal_count']} | "
                 f"{info['init_only_count']} | {info['not_serialized_count']} | "
                 f"{info['enum_type_count']} | {info['enum_member_count']} |")

    L.append("\n## 2. 枚举成员取值\n")
    for dll, info in ledger["assemblies"].items():
        if "error" in info or not info["enums"]:
            continue
        L.append(f"\n### {dll}\n")
        for e in sorted(info["enums"], key=lambda x: x["name"]):
            full = f"{e['namespace']}.{e['name']}" if e["namespace"] else e["name"]
            mem = ", ".join(f"{m['name']}={m['value']}" for m in e["members"])
            L.append(f"- `{full}` (`{e['underlying']}`): {mem}")
        L.append("")

    with open(os.path.join(args.out, "field_inventory.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    for dll, info in ledger["assemblies"].items():
        if "error" not in info:
            print(f"[OK] {dll}: 字段 {info['field_count']}, "
                  f"枚举 {info['enum_type_count']} / 成员 {info['enum_member_count']}")
    print(f"-> {args.out}")


if __name__ == "__main__":
    main()
