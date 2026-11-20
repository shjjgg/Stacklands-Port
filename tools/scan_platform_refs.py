#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
平台服务引用 · 元数据级核对 (Steamworks.NET / Google.Apis)

从游戏/第三方托管 DLL 中解析:
  - Steamworks 命名空间下的 TypeRef 与 MemberRef(按父类型分组)
  - Google.Apis 命名空间下的 TypeRef 与 MemberRef(按父类型分组)
输出桩接覆盖基线台账。不解码 IL 方法体, 精确调用方类/方法需反编译确认。

用法:
  python3 scan_platform_refs.py --managed <Managed 目录> --out <输出目录>

产出:
  <out>/platform_refs.md / .json
"""
import argparse, os, re, json, datetime, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")

STEAM_NS = "Steamworks"
GOOGLE_NS_PREFIX = "Google.Apis"
GAME_DLLS = ["GameScripts.dll", "SokLoc.dll", "SokSheet.dll", "Assembly-CSharp.dll",
             "Assembly-CSharp-firstpass.dll", "csS.dll"]


def open_pe(path):
    try:
        return dnfile.dnPE(path)
    except Exception as e:
        return {"error": str(e)}


def parent_of(mref):
    try:
        row = mref.Class.row
        ns = str(getattr(row, "TypeNamespace", "") or "")
        tn = str(getattr(row, "TypeName", None) or getattr(row, "Name", None) or "")
        return ns, tn
    except Exception:
        return "", ""


def collect(pe, ns_pred):
    types = set()
    members = collections.defaultdict(set)
    for r in pe.net.mdtables.TypeRef.rows:
        ns = str(r.TypeNamespace) if r.TypeNamespace else ""
        tn = str(r.TypeName)
        if ns_pred(ns):
            types.add((ns, tn))
    for r in pe.net.mdtables.MemberRef.rows:
        ns, tn = parent_of(r)
        if ns_pred(ns):
            members[tn].add(str(r.Name))
    return sorted(types), {k: sorted(v) for k, v in sorted(members.items())}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--managed", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    result = {
        "scanned_at": datetime.datetime.now().isoformat(timespec="seconds"),
        "steam": {},
        "google": {},
    }

    for dll in GAME_DLLS:
        path = os.path.join(args.managed, dll)
        if not os.path.exists(path):
            continue
        pe = open_pe(path)
        if isinstance(pe, dict):
            result["steam"][dll] = {"error": pe["error"]}
            continue
        st, sm = collect(pe, lambda ns: ns == STEAM_NS)
        gt, gm = collect(pe, lambda ns: ns.startswith(GOOGLE_NS_PREFIX))
        if st:
            result["steam"][dll] = {
                "type_refs": [{"namespace": n, "name": t} for n, t in st],
                "member_refs": sm,
                "type_count": len(st),
                "member_count": sum(len(v) for v in sm.values()),
            }
        if gt:
            result["google"][dll] = {
                "type_refs": [{"namespace": n, "name": t} for n, t in gt],
                "member_refs": gm,
                "type_count": len(gt),
                "member_count": sum(len(v) for v in gm.values()),
            }

    os.makedirs(args.out, exist_ok=True)
    with open(os.path.join(args.out, "platform_refs.json"), "w", encoding="utf-8") as f:
        json.dump(result, f, ensure_ascii=False, indent=2)

    L = ["# 平台服务引用台账（Steamworks / Google.Apis · 元数据实测）\n",
         f"- 扫描时间: {result['scanned_at']}",
         "- 仅元数据 TypeRef/MemberRef；调用方类/方法与入参需反编译 IL 确认。\n"]

    L.append("## 1. Steamworks.NET 引用\n")
    for dll, info in result["steam"].items():
        if "error" in info:
            L.append(f"### {dll}（解析失败: {info['error']}）\n")
            continue
        L.append(f"### {dll} — {info['type_count']} 类型 / {info['member_count']} 成员\n")
        L.append("| 父类型 | 成员 |")
        L.append("|---|---|")
        member_types = set(info["member_refs"].keys())
        for tr in info["type_refs"]:
            n, t = tr["namespace"], tr["name"]
            mem = info["member_refs"].get(t, [])
            tag = "" if t in member_types else "（仅签名/字段引用，无成员调用）"
            L.append(f"| `{t}`{tag} | {', '.join(mem) if mem else '—'} |")
        L.append("")

    L.append("## 2. Google.Apis 引用\n")
    if result["google"]:
        for dll, info in result["google"].items():
            L.append(f"### {dll} — {info['type_count']} 类型 / {info['member_count']} 成员\n")
            L.append("| 父类型 | 成员 |")
            L.append("|---|---|")
            member_types = set(info["member_refs"].keys())
            for tr in info["type_refs"]:
                n, t = tr["namespace"], tr["name"]
                mem = info["member_refs"].get(t, [])
                tag = "" if t in member_types else "（仅签名/字段引用）"
                L.append(f"| `{n}.{t}`{tag} | {', '.join(mem) if mem else '—'} |")
            L.append("")
    else:
        L.append("游戏 DLL 未引用 Google.Apis。\n")

    with open(os.path.join(args.out, "platform_refs.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    steam_total = sum(v.get("member_count", 0) for v in result["steam"].values())
    steam_types = sum(v.get("type_count", 0) for v in result["steam"].values())
    print(f"[OK] Steam: {steam_types} 类型 / {steam_total} 成员; "
          f"Google DLL: {list(result['google'].keys())} -> {args.out}")


if __name__ == "__main__":
    main()
