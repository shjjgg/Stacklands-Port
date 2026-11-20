#!/usr/bin/env python3
"""阶段语义自证: 用 DXBC 输出签名反推"这条程序到底是 VS 还是 PS", 与文件名标注互证。

为什么需要: `extract_dxbc_programs.py` 判阶段靠 SHDR 版本 token 的高 16 位, 而文件名就是从
判定结果写出来的 —— 等于自己验自己, 一旦 token 解析错, 504 个文件名会一起错且"自洽"。

这里换一个**完全独立**的判据: 图形管线里阶段与输出语义是绑死的
  - VS 的 OSGN 必须向光栅化器写 `SV_Position`, 且**不会**写 `SV_Target*`;
  - PS 的 OSGN 必须写 `SV_Target0..7`(或 `SV_Depth/SV_DepthGreater/Less`), 且**不写** `SV_Position`;
  - 两者都必须有 ISGN(PS 的 ISGN 是插值输入, 某些纯色 PS 允许为空, 故只对 VS 强制)。
这四条与 SHDR token 无关, 可以独立证伪。

用法:
  python3 tools/verify_stage_semantics.py --dxbc shader_extract/dxbc --out shader_extract
"""
from __future__ import annotations

import argparse
import csv
import json
import struct
from pathlib import Path

STAGE_TOKEN = {0: "PS", 1: "VS", 2: "GS", 3: "HS", 4: "DS", 5: "CS"}


def chunks(data: bytes) -> dict[str, tuple[int, int]]:
    count = struct.unpack_from("<I", data, 28)[0]
    offs = struct.unpack_from(f"<{count}I", data, 32)
    out = {}
    for o in offs:
        out[data[o:o + 4].decode("latin1")] = (o + 8, struct.unpack_from("<I", data, o + 4)[0])
    return out


def parse_signature(data: bytes, payload_off: int, size: int) -> list[dict]:
    p = data[payload_off:payload_off + size]
    # 布局(与 extract_signatures.py 同源, 已实测): 头 8 字节 + 每元素 24B(6 dword),
    # 语义名偏移是**相对 payload 起点**的绝对偏移, 不是相对字符表
    count = struct.unpack_from("<I", p, 0)[0]
    out = []
    for i in range(count):
        name_off, index, _sysval, _comp, reg, _mask = struct.unpack_from("<6I", p, 8 + i * 24)
        name = p[name_off:].split(b"\x00")[0].decode("latin1", "ignore") if name_off < len(p) else ""
        out.append({"name": name, "index": index, "register": reg})
    return out


def token_stage(data: bytes, c: dict) -> str | None:
    if "SHDR" not in c:
        return None
    off, _size = c["SHDR"]
    tok = struct.unpack_from("<I", data, off)[0]
    return STAGE_TOKEN.get((tok >> 16) & 0xFFFF)


TARGET_NAMES = {"SV_TARGET", "SV_DEPTH", "SV_DEPTHGREATER", "SV_DEPTHLESS",
                "SV_COVERAGE", "SV_STENCILREF"}
POSITION = "SV_POSITION"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dxbc", default="shader_extract/dxbc")
    ap.add_argument("--out", default="shader_extract")
    args = ap.parse_args()

    files = sorted(Path(args.dxbc).glob("*.dxbc"))
    if not files:
        print(f"::error::{args.dxbc} 下没有 .dxbc, 先跑 extract_dxbc_programs.py")
        return 1

    rows, fails = [], []
    for f in files:
        data = f.read_bytes()
        c = chunks(data)
        name = f.stem.split("__")
        shader = f"{name[0]}/{name[1]}" if len(name) >= 3 else f.stem
        label_stage = name[-1].split("_")[-1]
        tok_stage = token_stage(data, c)
        osgn = parse_signature(data, *c["OSGN"]) if "OSGN" in c else []
        has_isgn = "ISGN" in c
        out_names = [e["name"].upper() for e in osgn]

        problems = []
        if tok_stage != label_stage:
            problems.append(f"SHDR token={tok_stage} 与文件名={label_stage} 不符")
        if label_stage == "VS":
            if POSITION not in out_names:
                problems.append("VS 的 OSGN 缺 SV_Position")
            if any(n in TARGET_NAMES for n in out_names):
                problems.append(f"VS 写了像素输出 {sorted(set(out_names) & TARGET_NAMES)}")
            if not has_isgn:
                problems.append("VS 缺 ISGN")
        elif label_stage == "PS":
            if not any(n in TARGET_NAMES for n in out_names):
                problems.append("PS 的 OSGN 无任何 SV_Target/SV_Depth")
            if POSITION in out_names:
                problems.append("PS 写了 SV_Position")
        else:
            problems.append(f"阶段 {label_stage} 不在本管线预期内")

        rows.append({"file": f.name, "shader": shader, "stage": label_stage,
                     "token_stage": tok_stage, "osgn": " | ".join(out_names),
                     "outputs": len(out_names),
                     "has_isgn": has_isgn,
                     "ok": not problems,
                     "problems": " | ".join(problems)})
        if problems:
            fails.append(rows[-1])

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    (out / "stage_semantics.json").write_text(json.dumps({
        "programs": len(rows), "ok": len(rows) - len(fails), "failed": fails,
    }, ensure_ascii=False, indent=2), encoding="utf-8")
    with (out / "stage_semantics.csv").open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    by_stage = {}
    for r in rows:
        by_stage[r["stage"]] = by_stage.get(r["stage"], 0) + 1
    L = ["# 阶段语义自证（DXBC 输出签名 ↔ 阶段标注）", "",
         f"- 程序 {len(rows)}，通过 {len(rows) - len(fails)}，失败 {len(fails)}",
         f"- 阶段分布: {' / '.join(f'{k} {v}' for k, v in sorted(by_stage.items()))}",
         "",
         "> 判据（与 SHDR token 无关，独立证伪）：",
         "> VS 必须写 `SV_Position` 且不写像素输出；PS 必须写 `SV_Target*`/`SV_Depth` 且不写 `SV_Position`；VS 必须有 ISGN。",
         "",
         "| 文件 | 阶段 | 输出语义 | ok |", "|---|---|---|---|"]
    for r in rows:
        L.append(f"| {r['file']} | {r['stage']} | {r['osgn']} | {'✓' if r['ok'] else '✗ ' + r['problems']} |")
    (out / "stage_semantics.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    print(f"programs={len(rows)} ok={len(rows) - len(fails)} failed={len(fails)}")
    if fails:
        for r in fails[:10]:
            print(f"  {r['file']}: {r['problems']}")
        print("::error::阶段语义自证失败")
        return 1
    print("阶段语义自证: 全通过")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
