#!/usr/bin/env python3
"""按"同名资产 + 同属性"把 PORT 里悬空的 guid 重指向到新导出(/tmp/arout2)里的等价资产,
并把对应的 Texture2D(.png + .meta, 保留新导出的 guid)拷进 Assets/Texture2D。
用法: python3 tools/repair_dangling_refs.py --new /tmp/arout2/ExportedProject/Assets [--apply]
"""
import argparse
import glob
import os
import re
import shutil
import sys

PORT_ASSETS = "Assets"
EXCLUDE = {"0000000000000000f000000000000000", "0000000000000000e000000000000000",
           "00000000000000000000000000000000"}


def guid_of_meta(path):
    try:
        head = open(path, errors="ignore").read(120)
    except OSError:
        return None
    m = re.search(r"guid: ([0-9a-f]{32})", head)
    return m.group(1) if m else None


def collect_guids(root):
    out = set()
    for m in glob.glob(root + "/**/*.meta", recursive=True):
        g = guid_of_meta(m)
        if g:
            out.add(g)
    return out


def index_new(new_root):
    """basename -> 文件路径; guid -> 资产文件路径(去 .meta)"""
    by_name, by_guid = {}, {}
    for f in glob.glob(new_root + "/**/*", recursive=True):
        if not os.path.isfile(f) or f.endswith(".meta"):
            continue
        by_name.setdefault(os.path.basename(f), []).append(f)
        g = guid_of_meta(f + ".meta") if os.path.exists(f + ".meta") else None
        if g:
            by_guid.setdefault(g, f)
    return by_name, by_guid


def props_of(path):
    """属性名 -> 该行 guid(首次出现)"""
    d = {}
    try:
        text = open(path, errors="ignore").read()
    except OSError:
        return d
    for line in text.split("\n"):
        m = re.search(r"guid: ([0-9a-f]{32})", line)
        if not m:
            continue
        key = line.split(":")[0].strip()
        d.setdefault(key, m.group(1))
    return d


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--new", default="/tmp/arout2/ExportedProject/Assets")
    ap.add_argument("--apply", action="store_true")
    a = ap.parse_args()

    port_guids = collect_guids(PORT_ASSETS)
    by_name, by_guid = index_new(a.new)

    targets = [f for f in glob.glob(PORT_ASSETS + "/**/*", recursive=True)
               if os.path.isfile(f) and f.endswith((".mat", ".asset", ".prefab", ".unity"))
               and os.path.getsize(f) < 4_000_000]

    repaired, unresolved = 0, []
    for f in targets:
        text = open(f, errors="ignore").read()
        dangling = [g for g in set(re.findall(r"guid: ([0-9a-f]{32})", text))
                    if g not in port_guids and g not in EXCLUDE]
        if not dangling:
            continue
        cand = by_name.get(os.path.basename(f), [])
        if not cand:
            unresolved.append((f, dangling, "新导出无同名资产"))
            continue
        newp = cand[0]
        newprops = props_of(newp)
        for g in dangling:
            # 找到 PORT 里引用该 guid 的属性名
            keys = [ln.split(":")[0].strip() for ln in text.split("\n")
                    if g in ln and "guid:" in ln]
            g2 = None
            for k in keys:
                if k in newprops and newprops[k] != g:
                    g2 = newprops[k]
                    break
            if not g2:
                unresolved.append((f, [g], "属性名对不上"))
                continue
            src = by_guid.get(g2)
            if not src:
                unresolved.append((f, [g], "新 guid 在导出里找不到资产"))
                continue
            if a.apply:
                dst = os.path.join(PORT_ASSETS, "Texture2D", os.path.basename(src))
                if not os.path.exists(dst):
                    shutil.copy2(src, dst)
                    shutil.copy2(src + ".meta", dst + ".meta")
                text = text.replace(g, g2)
            repaired += 1
        if a.apply:
            open(f, "w", encoding="utf-8").write(text)

    print(f"可修复悬空引用 {repaired} 处, 未解决 {len(unresolved)} 处")
    for f, g, why in unresolved[:8]:
        print("  ", os.path.basename(f), why, g[:8])
    return 0


if __name__ == "__main__":
    sys.exit(main())
