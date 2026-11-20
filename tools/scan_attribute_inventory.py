#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
游戏自研程序集 · CustomAttribute 特性台账 (元数据级)

枚举 CustomAttribute 表, 按 Parent 归属到类型/字段/方法/属性/事件/参数/程序集,
解析特性构造器所属类型名, 分桶: Unity 序列化 / Unity 编辑器 / 编译器系统 /
第三方或自研。特性构造参数 blob 不解码, 具体参数值需反编译后补全。

用法:
  python3 scan_attribute_inventory.py --managed <Managed 目录> --out <输出目录>
"""
import argparse, os, json, datetime, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")

GAME_ASSEMBLIES = ["GameScripts.dll", "Assembly-CSharp.dll",
                   "Assembly-CSharp-firstpass.dll", "csS.dll"]

UNITY_SERIALIZATION = {"SerializeField", "SerializeReference", "NonSerialized",
                       "FormerlySerializedAs"}
UNITY_EDITOR = {"Header", "Tooltip", "Space", "Range", "TextArea", "HideInInspector",
                "DisallowMultipleComponent", "CreateAssetMenu", "ExecuteAlways",
                "ExecuteInEditMode", "RuntimeInitializeOnLoadMethod"}
COMPILER = {"CompilerGenerated", "DebuggerHidden", "IteratorStateMachine",
            "Extension", "ParamArray", "TupleElementNames", "AttributeUsage",
            "CompilationRelaxations", "RuntimeCompatibility", "Debuggable",
            "EditorBrowsable", "GeneratedCode", "Flags", "Conditional",
            "Nullable", "NullableContext", "Embedded"}


def short_name(name):
    base = name.rsplit(".", 1)[-1] if name else name
    if base and base.endswith("Attribute"):
        base = base[:-len("Attribute")]
    return base


def classify(full):
    s = short_name(full)
    if s in UNITY_SERIALIZATION:
        return "unity_serialization"
    if s in UNITY_EDITOR:
        return "unity_editor"
    if s in COMPILER:
        return "compiler"
    return "other"


def build_owner_maps(pe):
    """row_index -> (owner type full name, member name) for Field/Method/Property/Event。"""
    tdefs = pe.net.mdtables.TypeDef.rows
    field_owner, method_owner, prop_owner, event_owner = {}, {}, {}, {}

    pm = getattr(pe.net.mdtables, "PropertyMap", None)
    em = getattr(pe.net.mdtables, "EventMap", None)
    prop_map = {}
    if pm is not None:
        for m in pm.rows:
            owner = tdefs[m.Parent.row_index - 1]
            onm = f"{owner.TypeNamespace}.{owner.TypeName}" if owner.TypeNamespace else str(owner.TypeName)
            for p in m.PropertyList:
                prop_map[p.row_index] = onm
    event_map = {}
    if em is not None:
        for m in em.rows:
            owner = tdefs[m.Parent.row_index - 1]
            onm = f"{owner.TypeNamespace}.{owner.TypeName}" if owner.TypeNamespace else str(owner.TypeName)
            for e in m.EventList:
                event_map[e.row_index] = onm

    for td in tdefs:
        ns = str(td.TypeNamespace) if td.TypeNamespace else ""
        onm = f"{ns}.{td.TypeName}" if ns else str(td.TypeName)
        for f in td.FieldList:
            field_owner[f.row_index] = (onm, str(f.row.Name))
        for m in td.MethodList:
            method_owner[m.row_index] = (onm, str(m.row.Name))
    for ri, onm in prop_map.items():
        prow = pe.net.mdtables.Property.rows[ri - 1]
        prop_owner[ri] = (onm, str(prow.Name))
    for ri, onm in event_map.items():
        erow = pe.net.mdtables.Event.rows[ri - 1]
        event_owner[ri] = (onm, str(erow.Name))
    return field_owner, method_owner, prop_owner, event_owner


def attribute_type(pe, type_idx, method_owner):
    """返回 (特性类型全名, 桶)。Type 指向 ctor (MethodDef/MemberRef)。"""
    row = type_idx.row
    table = type_idx.table.name
    if table == "MethodDef":
        owner = method_owner.get(type_idx.row_index, (None, None))
        return owner[0] or "<local>"
    # MemberRef: Class -> TypeRef/TypeDef
    cls = row.Class
    crow = cls.row
    ns = str(getattr(crow, "TypeNamespace", "") or "")
    tn = str(getattr(crow, "TypeName", "?"))
    return f"{ns}.{tn}" if ns else tn


def resolve_parent(pe, parent, field_owner, method_owner, prop_owner, event_owner):
    table = parent.table.name if parent.table else "?"
    ri = parent.row_index
    if table == "TypeDef":
        row = pe.net.mdtables.TypeDef.rows[ri - 1]
        ns = str(row.TypeNamespace) if row.TypeNamespace else ""
        return table, (f"{ns}.{row.TypeName}" if ns else str(row.TypeName)), None
    if table == "Field":
        owner, name = field_owner.get(ri, ("?", "?"))
        return table, owner, name
    if table == "MethodDef":
        owner, name = method_owner.get(ri, ("?", "?"))
        return table, owner, name
    if table == "Property":
        owner, name = prop_owner.get(ri, ("?", "?"))
        return table, owner, name
    if table == "Event":
        owner, name = event_owner.get(ri, ("?", "?"))
        return table, owner, name
    if table == "Param":
        return table, "<param>", None
    if table == "Assembly":
        return table, "<assembly>", None
    return table, "?", None


def scan_assembly(path):
    pe = dnfile.dnPE(path)
    field_owner, method_owner, prop_owner, event_owner = build_owner_maps(pe)
    ca = getattr(pe.net.mdtables, "CustomAttribute", None)

    records = []
    parent_counter = collections.Counter()
    attr_counter = collections.Counter()
    bucket_counter = collections.Counter()

    if ca is not None:
        for r in ca.rows:
            atype = attribute_type(pe, r.Type, method_owner)
            bucket = classify(atype)
            ptable, owner, member = resolve_parent(
                pe, r.Parent, field_owner, method_owner, prop_owner, event_owner)
            records.append({"parent": ptable, "owner": owner, "member": member,
                            "attribute": atype, "bucket": bucket})
            parent_counter[ptable] += 1
            attr_counter[short_name(atype)] += 1
            bucket_counter[bucket] += 1

    unity = [x for x in records if x["bucket"] in ("unity_serialization", "unity_editor")]
    return {
        "attribute_count": len(records),
        "parent_breakdown": dict(parent_counter),
        "bucket_breakdown": dict(bucket_counter),
        "attribute_frequency": dict(attr_counter.most_common()),
        "unity_attributes": unity,
        "records": records,
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
    with open(os.path.join(args.out, "attribute_inventory.json"), "w", encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    L = ["# 自研程序集 CustomAttribute 特性台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         "- 元数据 CustomAttribute 枚举；特性构造参数 blob 未解码，具体参数值需反编译后补全。\n",
         "## 1. 汇总\n",
         "| 程序集 | 特性总数 | Unity 序列化 | Unity 编辑器 | 编译器/系统 | 其他 |",
         "|---|---:|---:|---:|---:|---:|"]
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            L.append(f"| {dll} | — | {info['error']} | | | |")
            continue
        b = info["bucket_breakdown"]
        L.append(f"| {dll} | {info['attribute_count']} | "
                 f"{b.get('unity_serialization', 0)} | {b.get('unity_editor', 0)} | "
                 f"{b.get('compiler', 0)} | {b.get('other', 0)} |")

    L.append("\n## 2. Unity 序列化 / 编辑器特性分布\n")
    L.append("| 程序集 | 特性 | 归属 | 成员 |")
    L.append("|---|---|---|---|")
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            continue
        for u in sorted(info["unity_attributes"],
                        key=lambda x: (x["attribute"], x["owner"], x["member"] or "")):
            L.append(f"| {dll} | `{short_name(u['attribute'])}` | `{u['owner']}` | "
                     f"{u['member'] or '—'} |")

    L.append("\n## 3. 全部特性频率（含编译器/自研/第三方）\n")
    L.append("| 程序集 | 特性 | 次数 |")
    L.append("|---|---|---:|")
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            continue
        for name, cnt in info["attribute_frequency"].items():
            L.append(f"| {dll} | `{name}` | {cnt} |")
        L.append("")

    with open(os.path.join(args.out, "attribute_inventory.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    for dll, info in ledger["assemblies"].items():
        if "error" not in info:
            b = info["bucket_breakdown"]
            print(f"[OK] {dll}: 特性 {info['attribute_count']} "
                  f"(Unity 序列化 {b.get('unity_serialization', 0)}, "
                  f"编辑器 {b.get('unity_editor', 0)}, 编译器 {b.get('compiler', 0)}, "
                  f"其他 {b.get('other', 0)})")
    print(f"-> {args.out}")


if __name__ == "__main__":
    main()
