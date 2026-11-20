#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Shader / ComputeShader blob 提取脚本 (保真链第①步: ShaderRipper 前置)

从 .assets 中导出每个 Shader 的序列化 blob 与元数据, 作为
ShaderRipper -> 3Dmigoto HLSLDecompiler -> spirv-cross 的输入。
只读源包, 不反编译、不美化、不重命名变量。

用法:
  python3 extract_shader_blobs.py --data <dir1,dir2> --out <输出目录>

产出:
  <out>/blobs/<sanitized-name>.blob   原始序列化 blob
  <out>/shader_ledger.json            机器可读台账
  <out>/shader_ledger.md               人工复核台账
"""
import argparse, os, re, json, datetime, collections

try:
    import UnityPy
except ImportError:
    raise SystemExit("[FATAL] 需要 UnityPy: pip install UnityPy")


def find_assets(root):
    out = []
    for dp, _, fns in os.walk(root):
        for fn in fns:
            if fn.endswith(".assets"):
                out.append(os.path.join(dp, fn))
    return sorted(out)


def sanitize(name):
    s = re.sub(r"[^A-Za-z0-9_./-]", "_", name)
    return s.replace("/", "__")


# 游戏自研/改编 shader 名称前缀或全名 (保真链对象); 其余归引擎内置/后处理/UI
GAME_PREFIXES = ("Custom/", "Sprites/", "Transition/")
GAME_EXACT = {"Unlit/CardopediaBackgroundShader", "Postprocess/SokpopIntro"}


def classify(name):
    if name.startswith("Custom/"):
        return "Custom"
    if name.startswith(GAME_PREFIXES) or name in GAME_EXACT:
        return "Game"
    return "Builtin/Other"


def props_of(pf):
    try:
        return [str(p.m_Name) for p in pf.m_PropInfo.m_Props]
    except Exception:
        return []


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True, help=".assets 目录, 逗号分隔")
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    files = []
    for r in args.data.split(","):
        files += find_assets(r)
    files = sorted(set(files))

    blob_dir = os.path.join(args.out, "blobs")
    os.makedirs(blob_dir, exist_ok=True)

    shaders = []
    computes = []
    seen = set()

    for fp in files:
        env = UnityPy.load(fp)
        for o in env.objects:
            try:
                d = o.read()
            except Exception:
                continue

            if o.type.name == "Shader":
                pf = getattr(d, "m_ParsedForm", None)
                name = getattr(pf, "m_Name", "") or ""
                if not name:
                    name = f"<unnamed_{o.path_id}>"
                key = (name, o.path_id)
                if key in seen:
                    continue
                seen.add(key)

                blob = getattr(d, "compressedBlob", None)
                blob_bytes = bytes(blob) if blob else b""
                blob_name = sanitize(name) + ".blob"
                if blob_bytes:
                    with open(os.path.join(blob_dir, blob_name), "wb") as f:
                        f.write(blob_bytes)

                entry = {
                    "name": name,
                    "source_file": os.path.basename(fp),
                    "path_id": o.path_id,
                    "category": classify(name),
                    "blob_file": f"blobs/{blob_name}" if blob_bytes else None,
                    "blob_size": len(blob_bytes),
                    "fallback": getattr(pf, "m_FallbackName", "") or "",
                    "keywords": [str(k) for k in (getattr(pf, "m_KeywordNames", []) or [])],
                    "subshader_count": len(getattr(pf, "m_SubShaders", []) or []),
                    "properties": props_of(pf),
                    "dependencies": [str(x) for x in (getattr(pf, "m_Dependencies", []) or [])],
                    "non_modifiable_textures": str(getattr(d, "m_NonModifiableTextures", "")),
                    "platforms": [int(x) for x in (getattr(d, "platforms", []) or [])],
                }
                shaders.append(entry)

            elif o.type.name == "ComputeShader":
                kernels = getattr(d, "kernels", []) or []
                variants = getattr(d, "variants", []) or []
                computes.append({
                    "name": getattr(d, "m_Name", ""),
                    "source_file": os.path.basename(fp),
                    "path_id": o.path_id,
                    "kernel_count": len(kernels),
                    "variant_count": len(variants),
                    "constant_buffers": len(getattr(d, "constantBuffers", []) or []),
                })

    ledger = {
        "scanned_at": datetime.datetime.now().isoformat(timespec="seconds"),
        "asset_files": [os.path.basename(p) for p in files],
        "shader_count": len(shaders),
        "compute_shader_count": len(computes),
        "custom_shaders": [s["name"] for s in shaders if s["category"] == "Custom"],
        "game_shaders": [s["name"] for s in shaders if s["category"] in ("Custom", "Game")],
        "shaders": shaders,
        "compute_shaders": computes,
    }

    with open(os.path.join(args.out, "shader_ledger.json"), "w", encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    # Markdown 台账
    L = ["# Shader / ComputeShader 台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         f"- Shader: {len(shaders)}（游戏自研/改编 {len(ledger['game_shaders'])}，其中 Custom/ {len(ledger['custom_shaders'])}）",
         f"- ComputeShader: {len(computes)}\n"]
    L.append("## 自研/改编 Shader（保真链重点）\n")
    L.append("| Shader | 分类 | blob | 大小(B) | SubShader | 属性 | 关键字数 |")
    L.append("|---|---|---|---:|---:|---|---:|")
    for s in shaders:
        if s["category"] not in ("Custom", "Game"):
            continue
        L.append(f"| {s['name']} | {s['category']} | {s['blob_file'] or '—'} | {s['blob_size']} | "
                 f"{s['subshader_count']} | {', '.join(s['properties'])} | {len(s['keywords'])} |")
    L.append("\n## 其他 Shader（引擎内置 / 后处理 / UI）\n")
    L.append("| Shader | blob | 大小(B) |")
    L.append("|---|---|---:|")
    for s in shaders:
        if s["category"] in ("Custom", "Game"):
            continue
        L.append(f"| {s['name']} | {s['blob_file'] or '—'} | {s['blob_size']} |")
    L.append("\n## ComputeShader（后处理栈）\n")
    L.append("| Name | Kernels | Variants | CBuffer |")
    L.append("|---|---:|---:|---:|")
    for c in computes:
        L.append(f"| {c['name']} | {c['kernel_count']} | {c['variant_count']} | {c['constant_buffers']} |")

    with open(os.path.join(args.out, "shader_ledger.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    print(f"[OK] Shader {len(shaders)} (自研/改编 {len(ledger['game_shaders'])}, "
          f"Custom {len(ledger['custom_shaders'])}), ComputeShader {len(computes)} -> {args.out}")
    print(f"[OK] 台账: shader_ledger.md / shader_ledger.json")


if __name__ == "__main__":
    main()
