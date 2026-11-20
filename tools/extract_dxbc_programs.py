#!/usr/bin/env python3
"""Shader blob 解码 + D3D11(DXBC) 程序切片 —— 保真链真正的第①步输入。

⚠ 这里修的是上一版的一个实质缺陷:
  `shader_extract/blobs/*.blob` 存的是 **LZ4 压缩的容器**(例如 Custom/ArrowSdfShader 4889 B),
  解压后是 42628 B 的 Unity 程序容器, 里面装着 15 段 D3D11 字节码。
  直接把压缩容器喂给 ShaderRipper / HLSLDecompiler 是无效输入(它们要的是 DXBC)。
  所以本脚本按 typetree 的 offsets/compressedLengths/decompressedLengths 逐段解压,
  再把每段 DXBC 按标准头(chunk 表)切成独立文件, 并按 SHDR 版本 token 判阶段(VS/PS/GS/HS/DS/CS)。

注意: 这些 DXBC 里**没有 RDEF chunk**(Unity 剥掉了反射信息), 所以拿不到资源名/绑定点,
资源映射必须来自 Shader 资产的 m_ParsedForm(属性表) + name indices, 不能靠字节码猜。

用法:
  python3 tools/extract_dxbc_programs.py --data <assets目录,逗号分隔> --out shader_extract
  可选: --only-game 只处理自研/改编 30 个; --max-programs 安全上限(默认 64)
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import struct
from pathlib import Path

try:
    import UnityPy
    import lz4.block
except ImportError as e:  # pragma: no cover
    raise SystemExit(f"[FATAL] 需要 UnityPy 与 lz4: pip install UnityPy lz4 ({e})")

STAGE_NAMES = {0: "PS", 1: "VS", 2: "GS", 3: "HS", 4: "DS", 5: "CS"}

GAME_PREFIXES = ("Custom/", "Sprites/", "Transition/")
GAME_EXACT = {"Unlit/CardopediaBackgroundShader", "Postprocess/SokpopIntro"}


def is_game(name: str) -> bool:
    return name.startswith(GAME_PREFIXES) or name in GAME_EXACT


def sanitize(name: str) -> str:
    return re.sub(r"[^A-Za-z0-9_./-]", "_", name).replace("/", "__")


def decode_segments(tt: dict) -> tuple[bytes, dict]:
    """按 offsets/cLen/dLen 逐段解压, 返回拼接后的容器字节与统计。"""
    blob = bytes(tt.get("compressedBlob") or b"")
    offsets = tt.get("offsets") or []
    clen = tt.get("compressedLengths") or []
    dlen = tt.get("decompressedLengths") or []
    parts: list[bytes] = []
    seg_stats = {"segments": 0, "lz4": 0, "plain": 0, "failed": 0}
    for si, seg_offsets in enumerate(offsets):
        seg_clen = clen[si] if si < len(clen) else []
        seg_dlen = dlen[si] if si < len(dlen) else []
        for j, off in enumerate(seg_offsets):
            c = seg_clen[j] if j < len(seg_clen) else 0
            d = seg_dlen[j] if j < len(seg_dlen) else 0
            chunk = blob[off:off + c]
            seg_stats["segments"] += 1
            if c and d and c != d:
                try:
                    parts.append(lz4.block.decompress(chunk, uncompressed_size=d))
                    seg_stats["lz4"] += 1
                except Exception:  # noqa: BLE001
                    seg_stats["failed"] += 1
            else:
                parts.append(chunk)
                seg_stats["plain"] += 1
    return b"".join(parts), seg_stats


def split_dxbc(raw: bytes, max_programs: int = 64) -> tuple[list[dict], list[str]]:
    """扫描并校验 DXBC 程序: magic / chunkCount / totalSize / chunk 表范围, 全部通过才算合法。"""
    progs: list[dict] = []
    problems: list[str] = []
    pos = 0
    while len(progs) < max_programs:
        i = raw.find(b"DXBC", pos)
        if i < 0:
            break
        pos = i + 4
        if i + 32 > len(raw):
            problems.append(f"off {i}: 头被截断")
            continue
        _unknown, total, cnt = struct.unpack_from("<III", raw, i + 20)
        if not (1 <= cnt <= 32) or total < 64 or i + total > len(raw):
            problems.append(f"off {i}: 头非法(total={total} chunks={cnt} 余量={len(raw)-i})")
            continue
        offs = struct.unpack_from(f"<{cnt}I", raw, i + 32)
        tags = []
        stage = None
        invalid = False
        for o in offs:
            if o + 8 > total:
                invalid = True
                break
            tag = raw[i + o:i + o + 4].decode("latin1", "ignore")
            size = struct.unpack_from("<I", raw, i + o + 4)[0]
            if o + 8 + size > total:
                invalid = True
                break
            tags.append(tag)
            if tag == "SHDR":
                ver = struct.unpack_from("<I", raw, i + o + 8)[0]
                ptype = (ver >> 16) & 0xFFFF
                stage = STAGE_NAMES.get(ptype, f"T{ptype}")
        if invalid:
            problems.append(f"off {i}: chunk 表越界")
            continue
        body = raw[i:i + total]
        progs.append({
            "offset": i,
            "size": total,
            "chunks": tags,
            "stage": stage or "?",
            "sha1": hashlib.sha1(body).hexdigest(),
            "has_rdef": "RDEF" in tags,
            "data": body,
        })
        pos = i + total
    return progs, problems


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True, help=".assets 目录, 逗号分隔")
    ap.add_argument("--out", default="shader_extract")
    ap.add_argument("--only-game", action="store_true", default=True)
    ap.add_argument("--all", action="store_true", help="连引擎内置 shader 一起切片")
    ap.add_argument("--max-programs", type=int, default=64)
    args = ap.parse_args()

    files = []
    for r in args.data.split(","):
        for dp, _, fns in os.walk(r):
            files += [os.path.join(dp, fn) for fn in fns if fn.endswith(".assets")]
    files = sorted(set(files))
    if not files:
        print("::error::找不到 .assets")
        return 1

    out = Path(args.out)
    (out / "raw").mkdir(parents=True, exist_ok=True)
    (out / "dxbc").mkdir(parents=True, exist_ok=True)

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
            # 顶层 m_Name 在 2022.3 里是空的, 真名在 m_ParsedForm.m_Name
            pf = tt.get("m_ParsedForm") or {}
            name = pf.get("m_Name") or tt.get("m_Name") or f"<unnamed_{o.path_id}>"
            if (name, o.path_id) in seen:
                continue
            seen.add((name, o.path_id))
            if args.only_game and not args.all and not is_game(name):
                continue

            raw, seg = decode_segments(tt)
            progs, problems = split_dxbc(raw, args.max_programs)

            base = sanitize(name)
            raw_path = out / "raw" / f"{base}.bin"
            if raw:
                raw_path.write_bytes(raw)

            stages: dict[str, int] = {}
            written = 0
            for pi, p in enumerate(progs):
                stage = p["stage"]
                stages[stage] = stages.get(stage, 0) + 1
                fp_out = out / "dxbc" / f"{base}__{pi:02d}_{stage}.dxbc"
                fp_out.write_bytes(p["data"])
                written += 1

            rows.append({
                "name": name,
                "category": "Custom" if name.startswith("Custom/") else
                            ("Game" if is_game(name) else "Builtin/Other"),
                "source_file": os.path.basename(fp),
                "path_id": o.path_id,
                "compressed_bytes": len(tt.get("compressedBlob") or []),
                "decompressed_bytes": len(raw),
                "segments": seg,
                "programs": len(progs),
                "stages": stages,
                "has_rdef": any(p["has_rdef"] for p in progs),
                "chunks_union": sorted({c for p in progs for c in p["chunks"]}),
                "sha1_manifest": [p["sha1"] for p in progs],
                "problems": problems,
                "raw_file": str(raw_path.relative_to(out)) if raw else None,
            })
            print(f"  {name}: {len(tt.get('compressedBlob') or [])}B -> {len(raw)}B, "
                  f"{len(progs)} 程序 {stages}")

    # 统计
    zero = [r["name"] for r in rows if r["programs"] == 0]
    novs = [r["name"] for r in rows if r["programs"] and r["stages"].get("VS", 0) == 0]
    nops = [r["name"] for r in rows if r["programs"] and r["stages"].get("PS", 0) == 0]
    summary = {
        "shaders": len(rows),
        "programs_total": sum(r["programs"] for r in rows),
        "compressed_bytes_total": sum(r["compressed_bytes"] for r in rows),
        "decompressed_bytes_total": sum(r["decompressed_bytes"] for r in rows),
        "zero_program": zero,
        "no_vertex_stage": novs,
        "no_pixel_stage": nops,
        "has_rdef_any": any(r["has_rdef"] for r in rows),
        "chunks_union": sorted({c for r in rows for c in r["chunks_union"]}),
    }
    ledger = {"generated_at": __import__("datetime").datetime.now().isoformat(timespec="seconds"),
              "summary": summary, "shaders": rows}
    (out / "dxbc_ledger.json").write_text(json.dumps(ledger, ensure_ascii=False, indent=2), encoding="utf-8")

    L = ["# DXBC 程序切片台账", "",
         f"- shader: {summary['shaders']}，程序段 {summary['programs_total']}",
         f"- 压缩体积 {summary['compressed_bytes_total']/1024:.1f} KB → 解压后 {summary['decompressed_bytes_total']/1024:.1f} KB",
         f"- chunk 并集: {', '.join(summary['chunks_union'])}",
         f"- 含 RDEF(反射/资源名): {'是' if summary['has_rdef_any'] else '否 —— 资源名只能从 Shader 资产属性表取'}",
         "",
         "| Shader | 压缩(B) | 解压(B) | 段数 | 程序 | VS | PS | 其他 | 问题 |",
         "|---|---:|---:|---:|---:|---:|---:|---|---|"]
    for r in rows:
        other = {k: v for k, v in r["stages"].items() if k not in ("VS", "PS")}
        L.append(f"| {r['name']} | {r['compressed_bytes']} | {r['decompressed_bytes']} | "
                 f"{r['segments']['segments']} | {r['programs']} | {r['stages'].get('VS', 0)} | "
                 f"{r['stages'].get('PS', 0)} | {other or '—'} | {len(r['problems']) or '—'} |")
    (out / "dxbc_ledger.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    print(f"\nshaders={summary['shaders']} programs={summary['programs_total']} "
          f"zero={len(zero)} noVS={len(novs)} noPS={len(nops)}")
    if zero:
        print(f"::warning::以下 shader 解压后没有合法 DXBC: {zero[:5]}")
    print(f"写出 {out}/dxbc_ledger.json/.md 与 {out}/dxbc/*.dxbc")
    return 0 if summary["shaders"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
