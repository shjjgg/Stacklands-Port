#!/usr/bin/env python3
"""DXBC 指令级反汇编(结构层): 把每段 SHDR 程序拆成指令流, 统计 opcode 与声明。

为什么必须做: Unity 把 shader 的 HLSL 源码剥掉了, RDEF 反射也剥掉了, 只剩下 SM5 字节码。
要 1:1 重写 HLSL, 唯一的真实依据就是这段字节码里"用了哪些 opcode、绑了哪些 cbuffer/sampler/
texture、声明了什么输入输出"。凭印象写 HLSL 就是占位 shader, 这里给出的才是可核对的语义骨架。

编码依据(已固化到 docs/dxbc_opcodes.json):
  - opcode token: opcode = bit0-7; 长度 = bit24-28(dword 数, 不含 opcode token); 长度字段为 0 时
    紧随一个 dword 给出总长度(含该长度 dword);
  - 操作数 token: register type = bit12-19, order/寻址 = bit20-23;
  - opcode 名称表来自 wine-6.0 `dlls/wined3d/shader_sm4.c`(106 条, 与 SM5 一一对应)。

产物:
  - shader_extract/asm_profile.json: 每段程序的指令数、opcode 直方图、cbuffer/sampler/texture 索引;
  - shader_extract/asm_profile.md: 按 shader 汇总(阶段 × opcode top、绑定资源、指令数);
  - 可选 --asm <shader>: 把该 shader 的每段程序写成人类可读的指令清单(.asm)。

硬校验: 消费的 dword 数必须正好等于 SHDR 长度; 不允许出现未登记 opcode。
"""
from __future__ import annotations

import argparse
import json
import struct
from collections import Counter
from pathlib import Path

OPCODES = json.loads((Path(__file__).resolve().parent.parent / "docs" / "dxbc_opcodes.json")
                     .read_text(encoding="utf-8"))
OP_NAMES = {int(k): v for k, v in OPCODES["opcodes"].items()}

RT = {0: "TEMP", 1: "INPUT", 2: "OUTPUT", 3: "IDXTEMP", 4: "IMMCONST", 6: "SAMPLER",
      7: "RESOURCE", 8: "CONSTBUFFER", 9: "IMMCONSTBUFFER", 11: "PRIMID", 12: "DEPTHOUT",
      13: "NULL", 14: "RASTERIZER", 15: "OMASK", 16: "STREAM", 17: "FUNCTION_BODY"}

# 需要提取绑定的声明类 opcode
DECL_OP = {"DCL_CONSTANT_BUFFER": "cbuffer", "DCL_RESOURCE": "texture",
           "DCL_SAMPLER": "sampler", "DCL_INPUT": "input", "DCL_OUTPUT": "output",
           "DCL_INPUT_SGV": "input_sgv", "DCL_INPUT_PS_SGV": "input_ps_sgv",
           "DCL_OUTPUT_SIV": "output_siv", "DCL_INPUT_PS": "input_ps"}


def chunks(data: bytes) -> dict[str, tuple[int, int]]:
    count = struct.unpack_from("<I", data, 28)[0]
    offs = struct.unpack_from(f"<{count}I", data, 32)
    out = {}
    for o in offs:
        out[data[o:o + 4].decode("latin1")] = (o + 8, struct.unpack_from("<I", data, o + 4)[0])
    return out


def decode_program(data: bytes, off: int, size: int) -> dict:
    words = struct.unpack_from(f"<{size // 4}I", data, off)
    version = words[0]
    # SHDR 头: version(4) + length(4), 之后是指令流
    body = words[2:]
    pos, ins, unknown = 0, [], 0
    while pos < len(body):
        tok = body[pos]
        op = tok & 0xFF
        ln = (tok >> 24) & 0x1F
        # 长度语义(对齐 wine 实现): 字段值 = 整条指令占用的 dword 数(含 opcode token);
        # 字段为 0 时, 紧随的 dword 给出同样含义的总长度
        if ln == 0:
            if pos + 1 >= len(body):
                break
            total = body[pos + 1]
        else:
            total = ln
        if total < 1:
            break
        start = pos + 1
        pos = pos + total
        body_dwords = total - 1
        name = OP_NAMES.get(op)
        if name is None:
            unknown += 1
            name = f"OP_{op:02x}"
        ops = body[start:pos]
        rec = {"op": name, "len": body_dwords, "operands": len(ops)}
        if name == "DCL_CONSTANT_BUFFER" and ops:
            t = ops[0]
            rec["reg"] = RT.get((t >> 12) & 0xFF, str((t >> 12) & 0xFF))
            # 索引 token: 实测 dcl 序列为 0,1,2,3..., 低 4 位是标志位, 其余是索引
            if len(ops) >= 2:
                rec["idx"] = ops[1] & 0xFFF
        elif name in ("DCL_RESOURCE", "DCL_SAMPLER", "DCL_INPUT", "DCL_OUTPUT",
                      "DCL_INPUT_PS", "DCL_INPUT_SGV", "DCL_INPUT_PS_SGV",
                      "DCL_OUTPUT_SIV") and ops:
            t = ops[0]
            rec["reg"] = RT.get((t >> 12) & 0xFF, str((t >> 12) & 0xFF))
            if len(ops) >= 2:
                rec["idx"] = ops[1] & 0xFFF
        ins.append(rec)
    return {"version": version, "stage_token": (version >> 16) & 0xFFFF,
            "declared_dwords": struct.unpack_from("<I", data, off + 4)[0],
            "consumed_dwords": pos, "instructions": ins,
            "instruction_count": len(ins), "unknown_opcodes": unknown,
            "opcode_hist": dict(Counter(i["op"] for i in ins))}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dxbc", default="shader_extract/dxbc")
    ap.add_argument("--out", default="shader_extract")
    ap.add_argument("--asm", default=None, help="只给该 shader 写 .asm 清单")
    args = ap.parse_args()

    files = sorted(Path(args.dxbc).glob("*.dxbc"))
    if not files:
        print(f"::error::{args.dxbc} 下没有 .dxbc")
        return 1

    asm_dir = Path(args.out) / "asm"
    rows, problems = [], []
    summary: dict[str, dict] = {}

    for f in files:
        parts = f.stem.split("__")
        shader = f"{parts[0]}/{parts[1]}" if len(parts) >= 3 else f.stem
        stage = parts[-1].split("_")[-1]
        data = f.read_bytes()
        c = chunks(data)
        if "SHDR" not in c:
            problems.append(f"{f.name}: 无 SHDR")
            continue
        prog = decode_program(data, *c["SHDR"])
        # SHDR 的 length 字段包含 version + length 两个 dword, 指令流只覆盖其余部分
        expect_dwords = prog["declared_dwords"] - 2
        if prog["consumed_dwords"] != expect_dwords:
            problems.append(f"{f.name}: 指令流消费 {prog['consumed_dwords']} dwords != 指令区 "
                            f"{expect_dwords}(length 字段 {prog['declared_dwords']})")
        if prog["unknown_opcodes"]:
            problems.append(f"{f.name}: 出现 {prog['unknown_opcodes']} 条未登记 opcode")

        bind = {"cbuffer": set(), "texture": set(), "sampler": set(),
                "input": set(), "output": set()}
        for i in prog["instructions"]:
            cls = DECL_OP.get(i["op"])
            if cls and "idx" in i:
                if cls in bind:
                    bind[cls].add(i["idx"])
                elif cls.startswith("input"):
                    bind["input"].add(f"{i['reg']}{i['idx']}")
                elif cls.startswith("output"):
                    bind["output"].add(f"{i['reg']}{i['idx']}")

        rows.append({"file": f.name, "shader": shader, "stage": stage,
                     "instructions": prog["instruction_count"],
                     "opcodes": len(prog["opcode_hist"]),
                     "top_opcodes": " ".join(f"{k}:{v}" for k, v in
                                             Counter(prog["opcode_hist"]).most_common(8)),
                     "cbuffers": " ".join(map(str, sorted(bind["cbuffer"]))),
                     "textures": " ".join(map(str, sorted(bind["texture"]))),
                     "samplers": " ".join(map(str, sorted(bind["sampler"]))),
                     "inputs": " ".join(sorted(map(str, bind["input"]))),
                     "outputs": " ".join(sorted(map(str, bind["output"])))})

        s = summary.setdefault(shader, {"instructions": 0, "hist": Counter(), "unique_opcodes": set(),
                                        "cbuffer": set(), "texture": set(), "sampler": set()})
        s["instructions"] += prog["instruction_count"]
        s["hist"].update(prog["opcode_hist"])
        s["unique_opcodes"] |= set(prog["opcode_hist"])
        s["cbuffer"] |= bind["cbuffer"]
        s["texture"] |= bind["texture"]
        s["sampler"] |= bind["sampler"]

        if args.asm and args.asm == shader:
            asm_dir.mkdir(parents=True, exist_ok=True)
            lines = [f"; {f.name}", f"; version=0x{prog['version']:08x} stage=0x{prog['stage_token']:04x}",
                     f"; instructions={prog['instruction_count']}"]
            for n, i in enumerate(prog["instructions"]):
                extra = ""
                if "idx" in i:
                    extra = f"  [{i.get('reg')}#{i['idx']}]"
                lines.append(f"{n:4d}  {i['op']:<24s} len={i['len']}{extra}")
            (asm_dir / (f.stem + ".asm")).write_text("\n".join(lines) + "\n", encoding="utf-8")

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    summary_out = {}
    for k, v in summary.items():
        summary_out[k] = {
            "instructions": v["instructions"],
            "unique_opcodes": len(v["unique_opcodes"]),
            "top_opcodes": dict(v["hist"].most_common(12)),
            "cbuffers": sorted(v["cbuffer"]),
            "textures": sorted(v["texture"]),
            "samplers": sorted(v["sampler"]),
        }
    (out / "asm_profile.json").write_text(json.dumps({
        "programs": len(rows), "problems": problems,
        "shaders": summary_out, "rows": rows,
    }, ensure_ascii=False, indent=2), encoding="utf-8")

    L = ["# DXBC 指令级剖面（结构层）", "",
         f"- 程序 {len(rows)}，指令合计 {sum(r['instructions'] for r in rows):,}",
         f"- 未登记 opcode: {sum(1 for p in problems if '未登记' in p)} 条；长度不符: "
         f"{sum(1 for p in problems if 'dwords' in p)} 条", "",
         "> `cbuffers/textures/samplers` 是 dcl 声明里真正绑定的索引, 重建的 HLSL 必须绑同一组;",
         "> `top_opcodes` 是该 shader 全部程序段的 opcode 频次, 用于判断数学/采样/流程控制的结构。",
         "",
         "| Shader | 指令数 | 不同 opcode | Top opcodes | cbuffer | texture | sampler |",
         "|---|---:|---:|---|---:|---:|---:|"]
    for name, v in sorted(summary_out.items(), key=lambda kv: -kv[1]["instructions"]):
        top = " ".join(f"{k}:{n}" for k, n in list(v["top_opcodes"].items())[:6])
        L.append(f"| {name} | {v['instructions']:,} | {v['unique_opcodes']} | {top} | "
                 f"{' '.join(map(str, v['cbuffers']))} | {' '.join(map(str, v['textures']))} | "
                 f"{' '.join(map(str, v['samplers']))} |")
    (out / "asm_profile.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    print(f"programs={len(rows)} instructions={sum(r['instructions'] for r in rows)} problems={len(problems)}")
    for p in problems[:8]:
        print("  " + p)
    if problems:
        print("::error::DXBC 指令流解析存在问题")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
