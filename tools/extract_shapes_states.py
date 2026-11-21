#!/usr/bin/env python3
"""导出 154 个 Shapes shader 的原版 ShaderLab 状态 (Blend/ZWrite/Queue/Stencil/...)。

为什么单独做: extract_pass_state.py 只覆盖 30 个自研 shader; Shapes 的 154 个
是我们用近似实现重建的, 状态必须逐字对齐原资产, 否则排序/深度/混合全都偏。

用法:
  python3 tools/extract_shapes_states.py --data <Stacklands_Data> --out shader_extract/shapes_states.json
"""
import argparse
import json
import os
from pathlib import Path

import UnityPy

BLEND = ["Zero", "One", "DstColor", "SrcColor", "OneMinusDstColor", "SrcAlpha",
         "OneMinusSrcColor", "DstAlpha", "OneMinusDstAlpha", "SrcAlphaSaturate", "OneMinusSrcAlpha"]
BLEND_OP = ["Add", "Subtract", "ReverseSubtract", "Min", "Max"]
COMPARE = ["Disabled", "Never", "Less", "Equal", "LessEqual", "Greater", "NotEqual",
           "GreaterEqual", "Always"]
CULL = {0: "Off", 1: "Front", 2: "Back"}
STENCIL_OP = ["Keep", "Zero", "Replace", "IncrSaturate", "DecrSaturate", "Invert", "IncrWrap", "DecrWrap"]


def v(x, default=0.0):
    if isinstance(x, dict):
        return x.get("val", default)
    return default if x is None else x


def nm(x, default=""):
    if isinstance(x, dict):
        return x.get("name", default) or default
    return default


def enum_name(table, value):
    try:
        i = int(value)
    except (TypeError, ValueError):
        return "?"
    return table[i] if 0 <= i < len(table) else f"?{i}"


def tags_of(state):
    t = state.get("m_Tags") or {}
    out = {}
    for pair in (t.get("tags", []) if isinstance(t, dict) else []):
        try:
            out[str(pair[0])] = str(pair[1])
        except Exception:
            pass
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True)
    ap.add_argument("--out", default="shader_extract/shapes_states.json")
    args = ap.parse_args()

    files = []
    for dp, _, fns in os.walk(args.data):
        files += [os.path.join(dp, f) for f in fns if f.endswith(".assets")]

    out = {}
    for fp in sorted(set(files)):
        env = UnityPy.load(fp)
        for o in env.objects:
            if o.type.name != "Shader":
                continue
            try:
                tt = o.read_typetree()
            except Exception:
                continue
            pf = tt.get("m_ParsedForm") or {}
            name = pf.get("m_Name") or ""
            if not name.startswith("Shapes/") or name in out:
                continue
            subs = pf.get("m_SubShaders") or []
            if not subs:
                continue
            passes = subs[0].get("m_Passes") or []
            if not passes:
                continue
            st = passes[0].get("m_State") or {}
            b = st.get("rtBlend0") or {}
            stencil = st.get("stencilOp") or {}
            tags = tags_of(st)
            sub_tags = tags_of(subs[0].get("m_Tags") or {})
            sub_low = {k.lower(): v for k, v in sub_tags.items()}
            tag_low = {k.lower(): v for k, v in tags.items()}
            out[name] = {
                "path_id": o.path_id,
                "keywords": [str(k) for k in (pf.get("m_KeywordNames") or [])],
                "queue": tag_low.get("queue", ""),
                "render_type": tag_low.get("rendertype", ""),
                "disable_batching": tag_low.get("disablebatching", sub_low.get("disablebatching", "")),
                "ignore_projector": tag_low.get("ignoreprojector", sub_low.get("ignoreprojector", "")),
                "pass_count": len(passes),
                "subshader_count": len(subs),
                "cull": CULL.get(int(v(st.get("culling"), 2)), "Back"),
                "ztest": enum_name(COMPARE, v(st.get("zTest"), 4)),
                "ztest_name": nm(st.get("zTest")),
                "zwrite": "On" if v(st.get("zWrite")) else "Off",
                "blend_src": enum_name(BLEND, v(b.get("srcBlend"), 1)),
                "blend_dst": enum_name(BLEND, v(b.get("destBlend"), 0)),
                "blend_src_a": enum_name(BLEND, v(b.get("srcBlendAlpha"), 1)),
                "blend_dst_a": enum_name(BLEND, v(b.get("destBlendAlpha"), 0)),
                "blend_op": enum_name(BLEND_OP, v(b.get("blendOp"), 0)),
                "color_mask": int(v(b.get("colMask"), 15)),
                "alpha_to_mask": bool(v(st.get("alphaToMask"))),
                "offset": [int(v(st.get("offsetFactor"))), int(v(st.get("offsetUnits")))],
                "stencil_comp": enum_name(COMPARE, v(stencil.get("comp") or {}, 8)),
                "stencil_pass": enum_name(STENCIL_OP, v(stencil.get("pass") or {}, 0)),
                "stencil_fail": enum_name(STENCIL_OP, v(stencil.get("fail") or {}, 0)),
                "stencil_zfail": enum_name(STENCIL_OP, v(stencil.get("zFail") or {}, 0)),
                "stencil_read": int(v(st.get("stencilReadMask"), 255)),
                "stencil_write": int(v(st.get("stencilWriteMask"), 255)),
                "stencil_ref": int(v(st.get("stencilRef"), 0)),
            }

    Path(args.out).parent.mkdir(parents=True, exist_ok=True)
    Path(args.out).write_text(json.dumps(out, ensure_ascii=False, indent=1), encoding="utf-8")
    print(f"shapes shaders={len(out)} -> {args.out}")


if __name__ == "__main__":
    main()
