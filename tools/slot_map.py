#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
槽位表生成器 —— 把 cb0._mN 这种无名寄存器号, 还原成真实的材质属性名。

思路(不猜, 靠汇编锚点):
  1. 用 shader_extract/spec/<Name>.json 里的属性声明顺序, 按 Unity 的打包规则算出
     "如果属性从 cb0[0] 开始排, 每个属性落在哪个 float4 槽的哪个分量"。
  2. 到 shader_extract/asm_fxc/<Name>__*_PS.txt 里找结构性锚点:
        add  r?, cb0[a].y, cb0[b].x
        mad  r?, cb0[a].y, 0.58..., cb0[b].z
     这一对是"半尺寸X = 尺寸偏移 + _Rect.x" / "半尺寸Z = 0.58*尺寸偏移 + _Rect.z",
     FloorShader / FloorShaderForest / FloorShaderIsland 都是这个模式
     (已用 _Rect=(4.3,0,2.5,-0.43) 在真机上核对过)。于是 cb0[b] 就是 _Rect。
  3. 偏移量 prefix = 实测 _Rect 槽 - 预测 _Rect 槽, 这个 prefix 是引擎在 cb0 前面塞的
     全局常量条数, 对同一支 shader 的所有属性都成立。
  4. 输出 slot_map.csv: shader, property, kind, slot, comp, verified。

用法: python3 tools/slot_map.py
"""
import csv
import glob
import json
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SPEC = os.path.join(ROOT, "shader_extract", "spec")
ASM = os.path.join(ROOT, "shader_extract", "asm_fxc")
OUT = os.path.join(ROOT, "shader_extract", "slot_map.csv")

TEX = {"texture2d", "2d", "texture", "cubemap", "3d", "texture3d"}


def layout(props):
    """按 Unity 打包规则算 float 偏移: Color/Vector 对齐 4 占 4, Float 占 1, 贴图附带 _ST 占 4。"""
    idx = 0
    out = {}
    for p in props:
        t = str(p.get("type", "")).lower()
        n = p["name"]
        if t in TEX:
            out[n + "_ST"] = (idx, 4, "st")
            idx += 4
        elif t in ("color", "vector"):
            if idx % 4:
                idx += 4 - idx % 4
            out[n] = (idx, 4, t)
            idx += 4
        elif t in ("float", "range", "int"):
            out[n] = (idx, 1, t)
            idx += 1
        else:
            if idx % 4:
                idx += 4 - idx % 4
            out[n] = (idx, 4, t)
            idx += 4
    return out


def read_asm(name):
    files = sorted(glob.glob(os.path.join(ASM, f"{name}__*_PS.txt")))
    txt = ""
    used = []
    for f in files:
        body = open(f, encoding="utf-8", errors="ignore").read()
        txt += body + "\n"
        for m in re.finditer(r"cb0\[(\d+)\]", body):
            used.append(int(m.group(1)))
    return txt, sorted(set(used))


def find_rect_slot(asm):
    """找半尺寸锚点, 返回 (rect_slot, size_slot) 或 (None, None)。"""
    # add r?.x, cb0[a].y, cb0[b].x
    for m in re.finditer(r"add\s+\w+\.x,\s*cb0\[(\d+)\]\.y,\s*cb0\[(\d+)\]\.x", asm):
        a, b = int(m.group(1)), int(m.group(2))
        # 紧接着必须有一条 mad ..., cb0[a].y, 0.58..., cb0[b].z
        win = asm[m.end(): m.end() + 400]
        if re.search(r"mad\s+\w+\.z,\s*cb0\[%d\]\.y,\s*0\.58" % a, win) and \
           re.search(r"cb0\[%d\]\.z" % b, win):
            return b, a
    return None, None


def main():
    rows = []
    unresolved = []
    for path in sorted(glob.glob(os.path.join(SPEC, "*.json"))):
        spec = json.load(open(path, encoding="utf-8"))
        name = spec.get("name", os.path.basename(path))
        props = spec.get("properties", [])
        lay = layout(props)
        key = os.path.basename(path)[:-5]
        asm, used = read_asm(key)
        rect_slot, size_slot = find_rect_slot(asm)
        rect_name = "_Rect" if "_Rect" in lay else ("_StoneRect" if "_StoneRect" in lay else None)
        prefix = None
        if rect_slot is not None and rect_name:
            prefix = rect_slot - lay[rect_name][0] // 4

        for pname, (fidx, count, kind) in lay.items():
            slot = None
            comp = None
            ver = 0
            if prefix is not None and prefix >= 0:
                slot = fidx // 4 + prefix
                comp = fidx % 4
            rows.append([name, pname, kind, fidx, slot, comp, rect_slot or "", prefix if prefix is not None else "", ver])
        if prefix is None:
            unresolved.append((name, "无半尺寸锚点"))

    with open(OUT, "w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow(["shader", "property", "kind", "float_idx", "slot", "comp", "rect_slot", "prefix", "verified"])
        w.writerows(rows)

    ok = sum(1 for r in rows if r[4] is not None)
    print(f"写出 {OUT}")
    print(f"属性行={len(rows)} 已定位={ok} 未定位={len(rows)-ok}")
    for name, why in unresolved:
        print(f"  [未解] {name}: {why}")


if __name__ == "__main__":
    main()
