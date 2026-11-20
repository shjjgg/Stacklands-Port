#!/usr/bin/env python3
"""导出每个 shader 的"重建规格书"(spec/<族>__<名>.json): 把散落的原始数据收成一份可执行的契约。

一份 spec 回答重建时必须逐字对上的问题:
  - Properties: 名字 / 显示名 / 类型 / 默认值 / 标志位(是否可被材质覆盖) —— 属性名拼错 = 素材拿不到参数;
  - Fallback / Dependencies / SubShader Tags(Queue, RenderType) —— 影响渲染顺序与降级路径;
  - 每个 Pass: 渲染状态(Cull/ZTest/ZWrite/Blend/ColorMask/Offset/Stencil) + LightMode + 程序段数量;
  - 顶点布局: VS 输入语义/寄存器/掩码, 插值通道(VS 输出 ↔ PS 输入);
  - 关键字全集与平台强制项。

这不是"生成 shader"的模板: HLSL 主体必须按原版反编译/重写, spec 只锁定外层与数据接口,
这样重建出来的 shader 才有资格进 Unity 编译。

用法:
  python3 tools/extract_shader_spec.py --data <assets目录> --out shader_extract
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path

try:
    import UnityPy
except ImportError:  # pragma: no cover
    raise SystemExit("[FATAL] 需要 UnityPy")

GAME_PREFIXES = ("Custom/", "Sprites/", "Transition/", "Unlit/")
GAME_EXACT = {"Postprocess/SokpopIntro"}

# PropertyType 枚举(按 Unity 序列化顺序; 未在此表内的一律原样输出数字, 不猜)
PROP_TYPE = {0: "Color", 1: "Vector", 2: "Float", 3: "Range", 4: "Texture",
             5: "Int", 6: "Constant", 7: "Matrix"}
TEX_DIM = {1: "2D", 2: "3D", 3: "Cube", 4: "2DArray", 5: "CubeArray", 6: "Any"}


def slug(name: str) -> str:
    return name.replace("/", "__").replace(" ", "_")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True)
    ap.add_argument("--ledger", default="shader_extract")
    ap.add_argument("--out", default="shader_extract")
    args = ap.parse_args()

    L = Path(args.ledger)
    sig = json.loads((L / "signature_ledger.json").read_text(encoding="utf-8")) if (L / "signature_ledger.json").exists() else {}
    pstate = json.loads((L / "pass_state.json").read_text(encoding="utf-8")) if (L / "pass_state.json").exists() else {}
    dxbc = json.loads((L / "dxbc_ledger.json").read_text(encoding="utf-8")) if (L / "dxbc_ledger.json").exists() else {}
    kwm = json.loads((L / "keyword_matrix.json").read_text(encoding="utf-8")) if (L / "keyword_matrix.json").exists() else {}

    sig_by = {r["shader"]: r for r in sig.get("rows", [])}
    ps_by: dict[str, list[dict]] = {}
    for r in pstate.get("rows", []):
        ps_by.setdefault(r["shader"], []).append(r)
    dx_by = {r["name"]: r for r in dxbc.get("shaders", [])}
    kw_by = {r["shader"]: r for r in kwm.get("rows", [])}

    files = []
    for r in args.data.split(","):
        for dp, _, fns in os.walk(r):
            files += [os.path.join(dp, fn) for fn in fns if fn.endswith(".assets")]
    files = sorted(set(files))

    out = Path(args.out) / "spec"
    out.mkdir(parents=True, exist_ok=True)
    index, seen = [], set()

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

            props = []
            for p in (pf.get("m_PropInfo") or {}).get("m_Props", []):
                typ = p.get("m_Type")
                val = [p.get(f"m_DefValue[{i}]") for i in range(4)]
                entry = {
                    "name": p.get("m_Name"),
                    "display": p.get("m_Description"),
                    "type": PROP_TYPE.get(typ, str(typ)),
                    "flags": p.get("m_Flags"),
                    "default": val if typ != 4 else None,
                }
                if typ == 4:
                    dt = p.get("m_DefTexture") or {}
                    entry["default_texture"] = {"name": dt.get("m_DefaultName"),
                                               "dim": TEX_DIM.get(dt.get("m_TexDim"), str(dt.get("m_TexDim")))}
                props.append(entry)

            subshaders = []
            for si, sub in enumerate(pf.get("m_SubShaders", [])):
                tags = {}
                for pair in (sub.get("m_Tags") or {}).get("tags", []) or []:
                    if isinstance(pair, (list, tuple)) and len(pair) == 2:
                        tags[pair[0]] = pair[1]
                subshaders.append({
                    "index": si,
                    "tags": tags,
                    "lod": sub.get("m_LOD"),
                    "passes": [p.get("m_Name") or "" for p in sub.get("m_Passes", [])],
                })

            sigrec = sig_by.get(name, {})
            spec = {
                "name": name,
                "source": {"file": os.path.basename(fp), "path_id": o.path_id},
                "fallback": pf.get("m_FallbackName") or "",
                "dependencies": pf.get("m_Dependencies") or [],
                "properties": props,
                "subshaders": subshaders,
                "keywords": (kw_by.get(name) or {}).get("keyword_list", "").split(),
                "platform_forced": (kw_by.get(name) or {}).get("platform_forced", "").split(),
                "programs": {
                    "total": (dx_by.get(name) or {}).get("programs"),
                    "vs": (dx_by.get(name) or {}).get("stages", {}).get("VS"),
                    "ps": (dx_by.get(name) or {}).get("stages", {}).get("PS"),
                },
                "vertex": {
                    "inputs": sigrec.get("vertex_inputs", ""),
                    "input_count": sigrec.get("vertex_input_count"),
                    "interp_channels": sigrec.get("interp_channels"),
                    "instancing_variant": sigrec.get("instancing_variant"),
                },
                "passes": [],
            }
            # pass 状态按 (subshader, pass) 顺序落进 spec
            for r in sorted(ps_by.get(name, []), key=lambda x: (x["subshader"], x["pass"])):
                spec["passes"].append({
                    "subshader": r["subshader"], "pass": r["pass"],
                    "lightmode": r["lightmode"],
                    "shaderlab": r["shaderlab"],
                    "queue": r["queue"], "render_type": r["render_type"],
                    "cull": r["cull"], "ztest": r["ztest"], "zwrite": r["zwrite"],
                    "blend": [r["blend_src"], r["blend_dst"], r["blend_src_a"], r["blend_dst_a"],
                              r["blend_op"]],
                    "color_mask": r["color_mask"],
                    "offset": r["offset"],
                })

            fn = out / f"{slug(name)}.json"
            fn.write_text(json.dumps(spec, ensure_ascii=False, indent=2), encoding="utf-8")
            index.append({"shader": name, "file": str(fn.relative_to(Path(args.out))),
                          "properties": len(props), "passes": len(spec["passes"])})

    (out.parent / "spec_index.json").write_text(json.dumps({"shaders": index}, ensure_ascii=False, indent=2),
                                                encoding="utf-8")
    print(f"spec 写出 {len(index)} 份 -> {out}")
    print(f"  properties 合计 {sum(i['properties'] for i in index)}, pass 合计 {sum(i['passes'] for i in index)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
