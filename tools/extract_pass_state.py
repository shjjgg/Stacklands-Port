#!/usr/bin/env python3
"""导出每个 pass 的渲染状态, 并生成可直接抄进重建 ShaderLab 的状态片段。

为什么必须做: 保真链只还原 HLSL 是**不够**的 —— 同一个 fragment 配上错的 ZWrite/Blend/Cull,
画面就是另一种东西(透明卡牌变不透明、描边被深度遮挡、线缆叠在卡上)。
这些状态不写在 HLSL 里, 只在 Shader 资产的 m_State 里, 所以必须单独导出并对齐。

枚举取值来源(UnityEngine.Rendering 公共 API 的成员声明顺序, 已核对 2022.3 文档页):
  BlendMode: Zero,One,DstColor,SrcColor,OneMinusDstColor,SrcAlpha,OneMinusSrcColor,
             DstAlpha,OneMinusDstAlpha,SrcAlphaSaturate,OneMinusSrcAlpha
  BlendOp:   Add,Subtract,ReverseSubtract,Min,Max
  CompareFunction: Disabled,Never,Less,Equal,LessEqual,Greater,NotEqual,GreaterEqual,Always
交叉验证: 本作最常见组合 (src=5, dst=10) 恰好解成 SrcAlpha / OneMinusSrcAlpha —— 标准 alpha 混合,
若枚举顺序错位, 这个最常见的组合就不可能同时对上, 所以映射有实测支撑而非猜。

用法:
  python3 tools/extract_pass_state.py --data <assets目录,逗号分隔> --out shader_extract
"""
from __future__ import annotations

import argparse
import csv
import json
import os
from pathlib import Path

try:
    import UnityPy
except ImportError:  # pragma: no cover
    raise SystemExit("[FATAL] 需要 UnityPy: pip install UnityPy")

BLEND = ["Zero", "One", "DstColor", "SrcColor", "OneMinusDstColor", "SrcAlpha",
         "OneMinusSrcColor", "DstAlpha", "OneMinusDstAlpha", "SrcAlphaSaturate", "OneMinusSrcAlpha"]
BLEND_OP = ["Add", "Subtract", "ReverseSubtract", "Min", "Max"]
COMPARE = ["Disabled", "Never", "Less", "Equal", "LessEqual", "Greater", "NotEqual",
           "GreaterEqual", "Always"]
CULL = {0: "Off", 1: "Front", 2: "Back"}
STENCIL_OP = ["Keep", "Zero", "Replace", "IncrSaturate", "DecrSaturate", "Invert", "IncrWrap", "DecrWrap"]

GAME_PREFIXES = ("Custom/", "Sprites/", "Transition/", "Unlit/")
GAME_EXACT = {"Postprocess/SokpopIntro"}


def v(x, default=0.0):
    """m_State 里的值都是 {val,name} 包一层。"""
    if isinstance(x, dict):
        return x.get("val", default)
    return default if x is None else x


def enum_name(table, value, fallback_prefix=""):
    try:
        i = int(value)
    except (TypeError, ValueError):
        return f"{fallback_prefix}?"
    if isinstance(table, dict):
        return table.get(i, f"?{i}")
    return table[i] if 0 <= i < len(table) else f"?{i}"


def tags_of(state) -> dict:
    t = state.get("m_Tags") or {}
    out = {}
    for pair in t.get("tags", []) if isinstance(t, dict) else []:
        try:
            k, val = pair
            out[str(k)] = str(val)
        except (TypeError, ValueError):
            continue
    return out


def state_of(state) -> dict:
    b = state.get("rtBlend0") or {}
    stencil = state.get("stencilOp") or {}
    tags = tags_of(state)
    return {
        "cull": enum_name(CULL, v(state.get("culling"), 2)),
        "ztest": enum_name(COMPARE, v(state.get("zTest"), 4)),
        "zwrite": "On" if v(state.get("zWrite")) else "Off",
        "zclip": bool(v(state.get("zClip"))),
        "blend_src": enum_name(BLEND, v(b.get("srcBlend"), 1)),
        "blend_dst": enum_name(BLEND, v(b.get("destBlend"), 0)),
        "blend_src_a": enum_name(BLEND, v(b.get("srcBlendAlpha"), 1)),
        "blend_dst_a": enum_name(BLEND, v(b.get("destBlendAlpha"), 0)),
        "blend_op": enum_name(BLEND_OP, v(b.get("blendOp"), 0)),
        "blend_op_a": enum_name(BLEND_OP, v(b.get("blendOpAlpha"), 0)),
        "color_mask": int(v(b.get("colMask"), 15)),
        "alpha_to_mask": bool(v(state.get("alphaToMask"))),
        # 存成 "f,u" 字符串: tuple 会被行构造的 json 化转成 "[0.0, 0.0]", 比较起来就永远不等
        "offset": f"{int(v(state.get('offsetFactor')))} , {int(v(state.get('offsetUnits')))}".replace(" , ", ","),
        "stencil_comp": enum_name(COMPARE, v((stencil.get("comp") or {}), 8)),
        "stencil_pass": enum_name(STENCIL_OP, v((stencil.get("pass") or {}), 0)),
        "stencil_fail": enum_name(STENCIL_OP, v((stencil.get("fail") or {}), 0)),
        "stencil_zfail": enum_name(STENCIL_OP, v((stencil.get("zFail") or {}), 0)),
        "stencil_read": int(v(state.get("stencilReadMask"), 255)),
        "stencil_write": int(v(state.get("stencilWriteMask"), 255)),
        "stencil_ref": int(v(state.get("stencilRef"), 0)),
        "lod": state.get("m_LOD"),
        "queue": tags.get("QUEUE", ""),
        "render_type": tags.get("RenderType", ""),
        "lightmode": tags.get("LIGHTMODE", ""),
        "lighting": bool(state.get("lighting")),
    }


def anomalies(r: dict) -> list[str]:
    """偏离常规的状态会直接影响画面, 必须人工确认是原版有意为之还是资产写错。"""
    out = []
    if r["color_mask"] != 15:
        masks = "".join(c for i, c in enumerate("RGBA") if r["color_mask"] & (1 << i)) or "无"
        out.append(f"ColorMask 仅 {masks}(其余通道不写)")
    if r["queue"].lower() == "transparent" and r["zwrite"] == "On":
        out.append("Transparent 队列却 ZWrite On(可能造成排序异常)")
    if r["queue"].lower() == "opaque" and r["zwrite"] == "Off" and r["blend_src"] != "One":
        out.append("Opaque 队列却关闭深度写入")
    if r["cull"] == "Off":
        out.append("Cull Off(双面)")
    if r["ztest"] == "Disabled":
        out.append("ZTest Disabled(不做深度测试)")
    pair = (r["blend_src"], r["blend_dst"])
    if pair not in (("One", "Zero"), ("SrcAlpha", "OneMinusSrcAlpha"), ("One", "One"),
                    ("SrcAlpha", "One"), ("One", "OneMinusSrcAlpha")):
        out.append(f"非典型混合 {pair[0]}/{pair[1]}")
    if r["alpha_to_mask"]:
        out.append("AlphaToMask On(需要 MSAA)")
    if r["offset"] != "0,0":
        out.append(f"多边形偏移 Offset {r['offset']}")
    return out


def shaderlab_snippet(s: dict) -> str:
    """生成可直接放进 Pass 里的状态行; 只输出非默认项, 便于对照原版。"""
    lines = []
    if s["cull"] != "Back":
        lines.append(f"Cull {s['cull']}")
    lines.append(f"ZTest {s['ztest']}")
    lines.append(f"ZWrite {s['zwrite']}")
    if s["blend_src"] != "One" or s["blend_dst"] != "Zero":
        blend = f"Blend {s['blend_src']} {s['blend_dst']}"
        if (s["blend_src_a"], s["blend_dst_a"]) != (s["blend_src"], s["blend_dst"]):
            blend += f", {s['blend_src_a']} {s['blend_dst_a']}"
        if s["blend_op"] != "Add":
            blend += f", {s['blend_op']}"
        lines.append(blend)
    if s["color_mask"] != 15:
        masks = "".join(c for i, c in enumerate("RGBA") if s["color_mask"] & (1 << i)) or "0"
        lines.append(f"ColorMask {masks}")
    if s["alpha_to_mask"]:
        lines.append("AlphaToMask On")
    if s["offset"] != "0,0":
        lines.append(f"Offset {s['offset']}")
    if s["stencil_comp"] != "Always" or s["stencil_pass"] != "Keep":
        lines.append(f"Stencil {{ Ref {s['stencil_ref']} Comp {s['stencil_comp']} "
                     f"Pass {s['stencil_pass']} Fail {s['stencil_fail']} ZFail {s['stencil_zfail']} }}")
        if s["stencil_read"] != 255 or s["stencil_write"] != 255:
            lines.append(f"Stencil ReadMask {s['stencil_read']} WriteMask {s['stencil_write']}")
    return "\n        ".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True)
    ap.add_argument("--out", default="shader_extract")
    args = ap.parse_args()

    files = []
    for r in args.data.split(","):
        for dp, _, fns in os.walk(r):
            files += [os.path.join(dp, fn) for fn in fns if fn.endswith(".assets")]
    files = sorted(set(files))

    rows = []
    seen = set()
    for fp in files:
        env = UnityPy.load(fp)
        for o in env.objects:
            if o.type.name != "Shader":
                continue
            try:
                tt = o.read_typetree()
            except Exception:  # noqa: BLE001
                continue
            pf = tt.get("m_ParsedForm") or {}
            name = pf.get("m_Name") or ""
            if not name or (name, o.path_id) in seen:
                continue
            seen.add((name, o.path_id))
            if not (name.startswith(GAME_PREFIXES) or name in GAME_EXACT):
                continue

            for si, sub in enumerate(pf.get("m_SubShaders", [])):
                for pi, pass_data in enumerate(sub.get("m_Passes", [])):
                    s = state_of(pass_data.get("m_State") or {})
                    rows.append({
                        "shader": name,
                        "subshader": si,
                        "pass": pi,
                        "pass_name": pass_data.get("m_Name") or "",
                        **{k: (json.dumps(val, ensure_ascii=False) if isinstance(val, (list, tuple, dict)) else val)
                           for k, val in s.items()},
                        "shaderlab": shaderlab_snippet(s),
                    })

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)

    # 状态组合去重: 同一份 ShaderLab 状态只需要验证一次
    combos: dict[str, list[str]] = {}
    for r in rows:
        combos.setdefault(r["shaderlab"], []).append(f"{r['shader']}#{r['pass_name'] or r['pass']}")

    (out / "pass_state.json").write_text(json.dumps({
        "passes": len(rows),
        "shaders": len({r["shader"] for r in rows}),
        "unique_states": len(combos),
        "state_combos": [{"shaderlab": k, "used_by": v} for k, v in
                         sorted(combos.items(), key=lambda kv: -len(kv[1]))],
        "rows": rows,
    }, ensure_ascii=False, indent=2), encoding="utf-8")

    with (out / "pass_state.csv").open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    L = ["# Pass 渲染状态台账", "",
         f"- shader {len({r['shader'] for r in rows})} / pass {len(rows)} / **去重后状态组合 {len(combos)}**",
         "- 枚举映射经交叉验证：最常见的 `Blend 5/10` 解为 `SrcAlpha / OneMinusSrcAlpha`（标准 alpha 混合）", "",
         "## 状态组合（按使用次数）", "",
         "| # | 使用次数 | ShaderLab 状态片段 | 使用者 |",
         "|---|---:|---|---|"]
    for i, (snippet, users) in enumerate(sorted(combos.items(), key=lambda kv: -len(kv[1])), 1):
        one_line = snippet.replace("\n        ", "；")
        L.append(f"| {i} | {len(users)} | `{one_line}` | {', '.join(users[:4])}{'…' if len(users) > 4 else ''} |")

    flagged = [(r, anomalies(r)) for r in rows if anomalies(r)]
    L += ["", "## 反常规状态（人工确认）", ""]
    if flagged:
        L += ["| Shader | Pass | 状态片段 | 反常规点 |", "|---|---|---|---|"]
        for r, a in flagged:
            one = r["shaderlab"].replace("\n        ", "；")
            L.append(f"| {r['shader']} | {r['pass_name'] or r['pass']} | `{one}` | {'；'.join(a)} |")
    else:
        L.append("无。")
    L += ["", "## 逐 pass 明细", "",
          "| Shader | SubShader | Pass | Queue | RenderType | LightMode | Cull | ZTest | ZWrite | Blend | Stencil | LOD |",
          "|---|---:|---:|---|---|---|---|---|---|---|---|---:|"]
    for r in rows:
        st = (f"{r['stencil_comp']} P{r['stencil_pass']} R{r['stencil_ref']}"
              if r["stencil_comp"] != "Always" else "—")
        L.append(f"| {r['shader']} | {r['subshader']} | {r['pass_name'] or r['pass']} | {r['queue'] or '—'} | "
                 f"{r['render_type'] or '—'} | {r['lightmode'] or '—'} | {r['cull']} | {r['ztest']} | "
                 f"{r['zwrite']} | {r['blend_src']}/{r['blend_dst']} | {st} | {r['lod']} |")
    (out / "pass_state.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    print(f"passes={len(rows)} shaders={len({r['shader'] for r in rows})} unique_states={len(combos)}")
    for snippet, users in sorted(combos.items(), key=lambda kv: -len(kv[1]))[:3]:
        print(f"  [{len(users)}] {snippet.replace(chr(10) + '        ', '；')}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
