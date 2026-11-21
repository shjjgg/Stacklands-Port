#!/usr/bin/env python3
"""把 154 个 Shapes shader 的 SubShader 状态块改成原版资产里的精确值。

只改状态行 (Tags/Cull/ZTest/ZWrite/Blend/ColorMask/Offset/Stencil/AlphaToMask),
不碰 HLSL 代码, 所以是"零行为猜测"的修正: 排序、深度、混合立刻与原版一致。

用法:
  python3 tools/apply_shapes_states.py --states shader_extract/shapes_states.json [--apply]
  不带 --apply 只打印将要改动的文件与差异摘要。
"""
import argparse
import json
import re
from pathlib import Path

STATE_PREFIX = ("Tags", "Cull", "ZWrite", "ZTest", "Blend", "BlendOp", "ColorMask",
                "Offset", "Stencil", "AlphaToMask", "Fog", "Lighting")
SHADER_NAME_RE = re.compile(r'^\s*Shader\s+"([^"]+)"', re.MULTILINE)


def build_block(st, indent="\t\t"):
    lines = []
    tags = []
    if st["queue"]:
        tags.append(f'"Queue"="{st["queue"]}"')
    if st["render_type"]:
        tags.append(f'"RenderType"="{st["render_type"]}"')
    if st["ignore_projector"]:
        tags.append(f'"IgnoreProjector"="{st["ignore_projector"]}"')
    if st["disable_batching"]:
        tags.append(f'"DisableBatching"="{st["disable_batching"]}"')
    lines.append("Tags { " + " ".join(tags) + " }")
    if st["cull"] != "Back":
        lines.append(f"Cull {st['cull']}")
    lines.append(f"ZTest [{st['ztest_name']}]" if st["ztest_name"] == "_ZTest"
                 else f"ZTest {st['ztest']}")
    lines.append(f"ZWrite {st['zwrite']}")
    if (st["blend_src"], st["blend_dst"]) != ("One", "Zero") or \
       (st["blend_src_a"], st["blend_dst_a"]) != ("One", "Zero"):
        blend = f"Blend {st['blend_src']} {st['blend_dst']}"
        if (st["blend_src_a"], st["blend_dst_a"]) != (st["blend_src"], st["blend_dst"]):
            blend += f", {st['blend_src_a']} {st['blend_dst_a']}"
        lines.append(blend)
        if st["blend_op"] != "Add":
            lines.append(f"BlendOp {st['blend_op']}")
    if st["color_mask"] != 15:
        mask = "".join(c for i, c in enumerate("RGBA") if st["color_mask"] & (1 << i)) or "0"
        lines.append(f"ColorMask {mask}")
    if st["alpha_to_mask"]:
        lines.append("AlphaToMask On")
    if st["offset"] != [0, 0]:
        lines.append(f"Offset {st['offset'][0]}, {st['offset'][1]}")
    if (st["stencil_comp"], st["stencil_pass"]) != ("Always", "Keep") or \
       st["stencil_ref"] or st["stencil_read"] != 255 or st["stencil_write"] != 255:
        lines += [
            "Stencil {",
            "\tRef [_StencilID]",
            "\tComp [_StencilComp]",
            "\tPass [_StencilOpPass]",
            f"\tReadMask [_StencilReadMask]",
            f"\tWriteMask [_StencilWriteMask]",
            "}",
        ]
    return [indent + l if l else l for l in lines]


def strip_state(lines):
    """删掉 SubShader 作用域里原有的状态行, 返回 (保留行, 起始索引)。"""
    out = []
    i = 0
    while i < len(lines):
        s = lines[i].strip()
        if any(s.startswith(p) for p in STATE_PREFIX):
            if s.startswith("Stencil") and "{" in s and "}" not in s:
                depth = 1
                i += 1
                while i < len(lines) and depth:
                    depth += lines[i].count("{") - lines[i].count("}")
                    i += 1
                continue
            i += 1
            continue
        out.append(lines[i])
        i += 1
    return out


def process(path, st, apply):
    text = path.read_text(encoding="utf-8", errors="ignore")
    lines = text.split("\n")
    # 找到 SubShader { 行
    start = None
    for i, l in enumerate(lines):
        if re.match(r"^\s*SubShader\s*\{?\s*$", l):
            start = i
            break
    if start is None:
        return None
    # SubShader 到第一个 Pass 之间的状态区
    end = len(lines)
    for j in range(start + 1, len(lines)):
        if re.match(r"^\s*(Pass\b|HLSLPROGRAM|CGPROGRAM|HLSLINCLUDE|Tags\s*\{.*LIGHTMODE)", lines[j]):
            end = j
            break
    # SubShader 和它的 '{' 可能分两行, 状态块必须插在 '{' 之后
    brace = start
    if "{" not in lines[start]:
        for k in range(start + 1, end):
            if lines[k].strip() == "{":
                brace = k
                break
    body = lines[brace + 1:end]
    cleaned = strip_state(body)
    block = build_block(st)
    new_lines = lines[:brace + 1] + block + cleaned + lines[end:]
    new_text = "\n".join(new_lines)
    if new_text != text:
        if apply:
            path.write_text(new_text, encoding="utf-8")
        return "\n".join(block)
    return ""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--states", default="shader_extract/shapes_states.json")
    ap.add_argument("--assets", default="Assets")
    ap.add_argument("--apply", action="store_true")
    args = ap.parse_args()
    states = json.load(open(args.states, encoding="utf-8"))

    changed, missing = 0, []
    for p in Path(args.assets).rglob("*.shader"):
        text = p.read_text(encoding="utf-8", errors="ignore")
        m = SHADER_NAME_RE.search(text)
        if not m:
            continue
        name = m.group(1)
        st = states.get(name)
        if st is None:
            continue
        res = process(p, st, args.apply)
        if res is None:
            continue
        if res:
            changed += 1
            if not args.apply:
                print(f"[dry] {p} ({name})\n{res}\n")

    for name in states:
        found = False
        for p in Path(args.assets).rglob("*.shader"):
            m = SHADER_NAME_RE.search(p.read_text(encoding="utf-8", errors="ignore"))
            if m and m.group(1) == name:
                found = True
                break
        if not found:
            missing.append(name)
    print(f"changed={changed} missing_files={len(missing)} apply={args.apply}")
    if missing[:10]:
        print("missing:", missing[:10])


if __name__ == "__main__":
    main()
