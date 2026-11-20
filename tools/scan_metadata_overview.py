#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
元数据扫描总览与跨台账一致性核对

汇总 type / method / field / property-event / attribute / dependency /
interface-member 七份台账 JSON, 生成主索引表, 并执行闭合性与一致性断言。
只读已有台账, 不重新扫描 DLL。

用法:
  python3 scan_metadata_overview.py --root <PORT 根目录> --out <输出目录>
"""
import argparse, os, json, datetime

GAME_ASSEMBLIES = ["GameScripts.dll", "Assembly-CSharp.dll",
                   "Assembly-CSharp-firstpass.dll", "csS.dll"]

LEDGERS = {
    "type": "type_inventory/type_inventory.json",
    "method": "method_inventory/method_inventory.json",
    "field": "field_inventory/field_inventory.json",
    "property_event": "property_event_inventory/property_event_inventory.json",
    "attribute": "attribute_inventory/attribute_inventory.json",
    "dependency": "dependency_inventory/dependency_inventory.json",
    "interface_member": "interface_member_inventory/interface_member_inventory.json",
}


def load(root, rel):
    path = os.path.join(root, rel)
    if not os.path.exists(path):
        return None
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def get(asm, *keys):
    cur = asm
    for k in keys:
        if cur is None:
            return None
        cur = cur.get(k)
    return cur


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    ledgers = {name: load(args.root, rel) for name, rel in LEDGERS.items()}

    def asm(name, dll):
        data = ledgers[name]
        if not data:
            return {}
        return data.get("assemblies", {}).get(dll, {})

    rows = []
    checks = []

    def check(cid, desc, ok, detail=""):
        checks.append({"id": cid, "description": desc, "status": "PASS" if ok else "FAIL",
                       "detail": detail})

    for dll in GAME_ASSEMBLIES:
        t = asm("type", dll)
        m = asm("method", dll)
        f = asm("field", dll)
        p = asm("property_event", dll)
        a = asm("attribute", dll)
        dep = asm("dependency", dll)
        im = asm("interface_member", dll)

        rows.append({
            "assembly": dll,
            "typedef": t.get("typedef_count"),
            "monoscript": t.get("monoscript_count"),
            "methoddef": m.get("method_count"),
            "fielddef": f.get("field_count"),
            "propertydef": p.get("property_count"),
            "eventdef": p.get("event_count"),
            "customattr": a.get("attribute_count"),
            "assemblyref": dep.get("reference_count"),
            "memberref": im.get("memberref_count"),
            "interfaceimpl": im.get("interface_impl_count"),
        })

        # C1 枚举数: 类型台账 kind_counts.enum == 字段台账 enum_type_count
        enum_type = get(t, "kind_counts", "enum")
        enum_field = f.get("enum_type_count")
        if enum_type is not None and enum_field is not None:
            check(f"C1-{dll}", "枚举类型数: 类型台账 = 字段台账",
                  enum_type == enum_field, f"{enum_type} vs {enum_field}")

        # C2 方法闭合: 方法总数 == 各类型方法数求和
        if m:
            s = sum(x.get("method_count", 0) for x in m.get("types", []))
            check(f"C2-{dll}", "MethodDef 闭合: 总数 == 类型归属求和",
                  m["method_count"] == s, f"{m['method_count']} vs {s}")

        # C3 字段闭合: 字段总数 == 普通类型字段 + 枚举成员 + 每枚举 value__
        if f:
            s = sum(x.get("field_count", 0) for x in f.get("types", []))
            s += f.get("enum_member_count", 0) + f.get("enum_type_count", 0)
            check(f"C3-{dll}", "FieldDef 闭合: 总数 == 类型+枚举归属求和",
                  f["field_count"] == s, f"{f['field_count']} vs {s}")

        # C4 属性/事件闭合
        if p:
            check(f"C4a-{dll}", "PropertyDef 闭合: 总数 == 清单长度",
                  p["property_count"] == len(p.get("properties", [])),
                  f"{p['property_count']} vs {len(p.get('properties', []))}")
            check(f"C4b-{dll}", "EventDef 闭合: 总数 == 清单长度",
                  p["event_count"] == len(p.get("events", [])),
                  f"{p['event_count']} vs {len(p.get('events', []))}")

        # C5 特性分桶求和 == 总数
        if a:
            bs = sum(a.get("bucket_breakdown", {}).values())
            check(f"C5-{dll}", "CustomAttribute 闭合: 分桶求和 == 总数",
                  a["attribute_count"] == bs, f"{a['attribute_count']} vs {bs}")

        # C6 依赖未解析 == 0
        if dep:
            check(f"C6-{dll}", "AssemblyRef 磁盘未解析 = 0",
                  dep["unresolved_count"] == 0, f"未解析 {dep['unresolved_count']}")

        # C7 MemberRef TypeSpec 不超过总数
        if im:
            check(f"C7-{dll}", "MemberRef TypeSpec 计数 <= 总数",
                  im["memberref_typespec_count"] <= im["memberref_count"],
                  f"{im['memberref_typespec_count']}/{im['memberref_count']}")

    closure = ledgers["dependency"].get("closure", {}) if ledgers["dependency"] else {}
    check("C8-closure", "全量托管闭包未解析 = 0",
          closure.get("unresolved_count", -1) == 0,
          f"未解析 {closure.get('unresolved_count')}, DLL {closure.get('managed_dll_count')}")

    fail = [c for c in checks if c["status"] == "FAIL"]
    overview = {
        "generated_at": datetime.datetime.now().isoformat(timespec="seconds"),
        "assemblies": rows,
        "closure": closure,
        "checks": checks,
        "all_pass": not fail,
    }

    os.makedirs(args.out, exist_ok=True)
    with open(os.path.join(args.out, "metadata_overview.json"), "w", encoding="utf-8") as f:
        json.dump(overview, f, ensure_ascii=False, indent=2)

    L = ["# 元数据扫描总览（跨台账一致性核对）\n",
         f"- 生成时间: {overview['generated_at']}",
         "- 数据来源: type/method/field/property-event/attribute/dependency/interface-member 七份台账 JSON；只读汇总，不重新扫描 DLL。\n",
         "## 1. 自研程序集元数据主表\n",
         "| 程序集 | TypeDef | MonoScript | MethodDef | FieldDef | PropertyDef | EventDef | CustomAttribute | AssemblyRef | MemberRef | InterfaceImpl |",
         "|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|"]
    for r in rows:
        L.append(f"| {r['assembly']} | {r['typedef']} | {r['monoscript']} | {r['methoddef']} | "
                 f"{r['fielddef']} | {r['propertydef']} | {r['eventdef']} | {r['customattr']} | "
                 f"{r['assemblyref']} | {r['memberref']} | {r['interfaceimpl']} |")

    L.append(f"\n## 2. 全量托管闭包\n")
    L.append(f"- Managed DLL 总数: **{closure.get('managed_dll_count')}**")
    L.append(f"- 磁盘未解析引用: **{closure.get('unresolved_count')}**")
    L.append(f"- 含内嵌资源程序集: **{len(closure.get('resource_assemblies', {}))}**")

    L.append("\n## 3. 一致性断言\n")
    L.append("| 编号 | 核对项 | 结果 | 明细 |")
    L.append("|---|---|:---:|---|")
    for c in checks:
        L.append(f"| {c['id']} | {c['description']} | {c['status']} | {c['detail']} |")

    L.append("\n## 4. 台账索引\n")
    idx = [
        ("type_inventory/type_inventory.md", "类型清单（TypeDef/MonoScript/种类）"),
        ("method_inventory/method_inventory.md", "方法清单与生命周期消息"),
        ("field_inventory/field_inventory.md", "字段清单与枚举取值"),
        ("property_event_inventory/property_event_inventory.md", "属性/事件清单"),
        ("attribute_inventory/attribute_inventory.md", "CustomAttribute 特性分桶"),
        ("dependency_inventory/dependency_inventory.md", "引用闭包与内嵌资源"),
        ("interface_member_inventory/interface_member_inventory.md", "接口实现与外部成员引用"),
        ("blocked_metadata/blocked_metadata.md", "阻断子系统与原生 PInvoke"),
        ("platform_refs/platform_refs.md", "Steamworks / Google.Apis 引用"),
    ]
    for rel, desc in idx:
        L.append(f"- [{rel}]({rel}) — {desc}")

    L.append("\n> 口径说明: 方法台账的 `get_/set_` 前缀计数为命名前缀匹配；属性台账的 "
             "getter/setter 来自 MethodSemantics 关联（含显式接口实现），两者口径不同，"
             "不要求数值相等。\n")

    with open(os.path.join(args.out, "metadata_overview.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    print(f"[OK] 断言 {len(checks)} 项, FAIL {len(fail)}")
    print(f"-> {args.out}")
    if fail:
        for c in fail:
            print("  FAIL", c["id"], c["detail"])


if __name__ == "__main__":
    main()
