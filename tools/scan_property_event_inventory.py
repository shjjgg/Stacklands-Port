#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
游戏自研程序集 · 属性 (PropertyDef) 与事件 (EventDef) 清单台账 (元数据级)

按 PropertyMap / EventMap 把属性、事件归属到 TypeDef, 并经 MethodSemantics
关联 getter/setter/addOn/removeOn/fire 方法名。属性类型签名/事件委托类型
需反编译后补全。

用法:
  python3 scan_property_event_inventory.py --managed <Managed 目录> --out <输出目录>
"""
import argparse, os, json, datetime, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")

GAME_ASSEMBLIES = ["GameScripts.dll", "Assembly-CSharp.dll",
                   "Assembly-CSharp-firstpass.dll", "csS.dll"]


def semantics_map(pe):
    """HasSemantics 编码索引 -> {role: 方法名}。role: getter/setter/add/remove/fire。"""
    tab = getattr(pe.net.mdtables, "MethodSemantics", None)
    out = collections.defaultdict(dict)
    if tab is None:
        return out
    role_of = [("msGetter", "getter"), ("msSetter", "setter"),
               ("msAddOn", "add"), ("msRemoveOn", "remove"), ("msFire", "fire")]
    for row in tab.rows:
        assoc = getattr(row, "Association", None)
        if assoc is None or assoc.table is None:
            continue
        key = (assoc.table.name, assoc.row_index)
        mname = str(row.Method.row.Name)
        flags = row.Semantics
        for attr, role in role_of:
            if getattr(flags, attr, False):
                out[key][role] = mname
    return out


def scan_assembly(path):
    pe = dnfile.dnPE(path)
    tdefs = pe.net.mdtables.TypeDef.rows
    sem = semantics_map(pe)

    tdef_name = {i + 1: td for i, td in enumerate(tdefs)}

    properties = []
    events = []

    # --- PropertyMap ---
    pm = getattr(pe.net.mdtables, "PropertyMap", None)
    prop_total = getter_n = setter_n = 0
    if pm is not None:
        for m in pm.rows:
            owner = tdef_name.get(m.Parent.row_index) if m.Parent else None
            ns = str(owner.TypeNamespace) if owner and owner.TypeNamespace else ""
            onm = str(owner.TypeName) if owner else ""
            for pidx in m.PropertyList:
                prow = pidx.row
                s = sem.get(("Property", pidx.row_index), {})
                entry = {"namespace": ns, "type": onm, "name": str(prow.Name),
                         "getter": s.get("getter"), "setter": s.get("setter")}
                properties.append(entry)
                prop_total += 1
                if entry["getter"]:
                    getter_n += 1
                if entry["setter"]:
                    setter_n += 1

    # --- EventMap ---
    em = getattr(pe.net.mdtables, "EventMap", None)
    event_total = add_n = remove_n = fire_n = 0
    if em is not None:
        for m in em.rows:
            owner = tdef_name.get(m.Parent.row_index) if m.Parent else None
            ns = str(owner.TypeNamespace) if owner and owner.TypeNamespace else ""
            onm = str(owner.TypeName) if owner else ""
            for eidx in m.EventList:
                erow = eidx.row
                s = sem.get(("Event", eidx.row_index), {})
                entry = {"namespace": ns, "type": onm, "name": str(erow.Name),
                         "add": s.get("add"), "remove": s.get("remove"),
                         "fire": s.get("fire")}
                events.append(entry)
                event_total += 1
                if entry["add"]:
                    add_n += 1
                if entry["remove"]:
                    remove_n += 1
                if entry["fire"]:
                    fire_n += 1

    return {
        "property_count": prop_total,
        "property_getter_count": getter_n,
        "property_setter_count": setter_n,
        "event_count": event_total,
        "event_add_count": add_n,
        "event_remove_count": remove_n,
        "event_fire_count": fire_n,
        "properties": properties,
        "events": events,
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
    with open(os.path.join(args.out, "property_event_inventory.json"), "w",
              encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    L = ["# 自研程序集属性 / 事件清单台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         "- 元数据 PropertyDef / EventDef 枚举（PropertyMap/EventMap 归属，"
         "MethodSemantics 关联访问器）；属性类型与事件委托类型需反编译后补全。\n",
         "## 1. 汇总\n",
         "| 程序集 | 属性总数 | 含 getter | 含 setter | 事件总数 | 含 add | 含 remove | 含 fire |",
         "|---|---:|---:|---:|---:|---:|---:|---:|"]
    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            L.append(f"| {dll} | — | {info['error']} | | | | | |")
            continue
        L.append(f"| {dll} | {info['property_count']} | {info['property_getter_count']} | "
                 f"{info['property_setter_count']} | {info['event_count']} | "
                 f"{info['event_add_count']} | {info['event_remove_count']} | "
                 f"{info['event_fire_count']} |")

    for dll, info in ledger["assemblies"].items():
        if "error" in info:
            continue
        if info["properties"]:
            L.append(f"\n## 2. {dll} 属性\n")
            L.append("| 类型 | 属性 | getter | setter |")
            L.append("|---|---|---|---|")
            for p in sorted(info["properties"], key=lambda x: (x["type"], x["name"])):
                full = f"{p['namespace']}.{p['type']}" if p["namespace"] else p["type"]
                L.append(f"| `{full}` | `{p['name']}` | "
                         f"{p['getter'] or '—'} | {p['setter'] or '—'} |")
        if info["events"]:
            L.append(f"\n## 3. {dll} 事件\n")
            L.append("| 类型 | 事件 | add | remove | fire |")
            L.append("|---|---|---|---|---|")
            for e in sorted(info["events"], key=lambda x: (x["type"], x["name"])):
                full = f"{e['namespace']}.{e['type']}" if e["namespace"] else e["type"]
                L.append(f"| `{full}` | `{e['name']}` | {e['add'] or '—'} | "
                         f"{e['remove'] or '—'} | {e['fire'] or '—'} |")
        L.append("")

    with open(os.path.join(args.out, "property_event_inventory.md"), "w",
              encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    for dll, info in ledger["assemblies"].items():
        if "error" not in info:
            print(f"[OK] {dll}: 属性 {info['property_count']} "
                  f"(getter {info['property_getter_count']}/setter "
                  f"{info['property_setter_count']}), 事件 {info['event_count']}")
    print(f"-> {args.out}")


if __name__ == "__main__":
    main()
