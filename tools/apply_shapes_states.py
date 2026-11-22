#!/usr/bin/env python3
"""把 154 个 Shapes shader 的渲染状态改成原版资产里的精确值 (最小侵入版)。

只改 SubShader 作用域里原有的状态行 (Tags/Cull/ZWrite/ZTest/Blend/BlendOp/ColorMask/
Offset/Stencil/AlphaToMask), 保持文件原有结构不变 —— 之前尝试把状态搬进 Pass 作用域
引入了括号残留, 导致 ShaderLab 解析失败, 这里不做结构搬迁。

用法:
  python3 tools/apply_shapes_states.py --states shader_extract/shapes_states.json [--apply]
"""
import argparse
import json
import re
from pathlib import Path

STATE_PREFIX = ("Tags", "Cull", "ZWrite", "ZTest", "Blend", "BlendOp", "ColorMask",
                "Offset", "Stencil", "AlphaToMask")
SHADER_NAME_RE = re.compile(r'^\s*Shader\s+"([^"]+)"', re.MULTILINE)


def build_block(st, indent):
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
            op = {"ReverseSubtract": "RevSub", "Subtract": "Sub"}.get(st["blend_op"], st["blend_op"])
            lines.append(f"BlendOp {op}")
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
            "\tReadMask [_StencilReadMask]",
            "\tWriteMask [_StencilWriteMask]",
            "}",
        ]
    return [indent + l for l in lines]


def strip_state(lines):
    out, i = [], 0
    while i < len(lines):
        s = lines[i].strip()
        if any(s.startswith(p) for p in STATE_PREFIX):
            if s.startswith("Stencil"):
                if "{" in s:
                    depth = s.count("{") - s.count("}")
                    i += 1
                    while i < len(lines) and depth > 0:
                        depth += lines[i].count("{") - lines[i].count("}")
                        i += 1
                    continue
                i += 1
                while i < len(lines) and not lines[i].strip():
                    i += 1
                if i < len(lines) and lines[i].strip().startswith("{"):
                    depth = lines[i].count("{") - lines[i].count("}")
                    i += 1
                    while i < len(lines) and depth > 0:
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
    start = None
    for i, l in enumerate(lines):
        if re.match(r"^\s*SubShader\b", l):
            start = i
            break
    if start is None:
        return None
    brace = start
    if "{" not in lines[start]:
        for k in range(start + 1, len(lines)):
            if lines[k].strip() == "{":
                brace = k
                break
    end = len(lines)
    depth = 1
    for k in range(brace + 1, len(lines)):
        if depth == 1 and re.match(
                r"^\s*(Pass\b|HLSLPROGRAM|CGPROGRAM|HLSLINCLUDE|CGINCLUDE)", lines[k]):
            end = k
            break
        depth += lines[k].count("{") - lines[k].count("}")
        if depth <= 0:
            end = k
            break
    body = lines[brace + 1:end]
    indent = "\t\t" if body and body[0].startswith("\t") else "        "
    cleaned = strip_state(body)
    block = build_block(st, indent)
    new = lines[:brace + 1] + block + cleaned + lines[end:]
    new_text = "\n".join(new)
    if new_text != text:
        if apply:
            path.write_text(new_text, encoding="utf-8")
        return True
    return False


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--states", default="shader_extract/shapes_states.json")
    ap.add_argument("--assets", default="Assets")
    ap.add_argument("--apply", action="store_true")
    args = ap.parse_args()
    states = json.load(open(args.states, encoding="utf-8"))
    changed = 0
    for p in Path(args.assets).rglob("*.shader"):
        m = SHADER_NAME_RE.search(p.read_text(encoding="utf-8", errors="ignore"))
        if not m or m.group(1) not in states:
            continue
        if process(p, states[m.group(1)], args.apply):
            changed += 1
            print(("[apply] " if args.apply else "[dry] ") + str(p))
    print(f"changed={changed} apply={args.apply}")


if __name__ == "__main__":
    main()
