#!/usr/bin/env python3
"""导出每个 shader 基础 pass 实际读到的 cb0 行/分量证据, 生成 docs/18_shader_uniform_slots.md。

说明: 本项目自写 ShaderLab 全部按名字声明 uniform, Unity 自行完成 cbuffer 打包与绑定,
所以"属性值送错槽"在结构上不可能发生 —— 本工具只输出**语义核对证据**,
用于确认 glsl_exact 里 cb0._mN 的语义解释(色 / 起点终点 / 标量组)是否合理。
"""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ASM = ROOT / "shader_extract" / "asm_fxc"
SPEC = ROOT / "shader_extract" / "spec"
OUT = ROOT / "docs" / "18_shader_uniform_slots.md"

CB_RE = re.compile(r"cb0\[(\d+)\]\.([xyzw]+)")


def pick(name):
    stem = name.replace("/", "__")
    files = sorted(ASM.glob(f"{stem}__*_PS.txt"))
    best = None
    for f in files:
        txt = f.read_text(encoding="utf-8", errors="ignore")
        acc = {}
        for m in CB_RE.finditer(txt):
            acc.setdefault(int(m.group(1)), set()).update(m.group(2))
        if not acc:
            continue
        if best is None or len(acc) > len(best[1]):
            best = (f.name, acc)
    return best


def main():
    lines = []
    for sp in sorted(SPEC.glob("*.json")):
        d = json.loads(sp.read_text(encoding="utf-8"))
        name = d.get("shader") or d.get("name") or sp.stem
        b = pick(name)
        if not b:
            lines.append((name, "(无汇编)", "", ""))
            continue
        fname, acc = b
        table = " ".join(f"{r}:{''.join(sorted(acc[r]))}" for r in sorted(acc))
        full = sum(1 for r in acc if acc[r] == set("xyzw"))
        lines.append((name, fname, f"{len(acc)} 行; 全 xyzw {full} 行", table))

    out = [
        "# 18 · Shader 材质常量槽位证据表",
        "",
        "> 由 `tools/uniform_slot_evidence.py` 从 DXBC 汇编(`cb0[R].mask`)导出，"
        "记录每个 shader 基础 pass 实际读到的 cb0 行与分量。",
        "",
        "| Shader | 代表 PS 片段 | cb0 行数 / 全 xyzw 行 | 行:分量 |",
        "|---|---|---|---|",
    ]
    for r in lines:
        out.append("| " + " | ".join(r) + " |")
    out += [
        "",
        "## 结论（槽位风险的处理方式）",
        "",
        "1. 本项目自写 ShaderLab 一律**按名字声明 uniform**，Unity 的着色器编译器自行完成 cbuffer 打包与绑定，",
        '   因此"属性值送错槽"在结构上不可能发生，无需复刻原版的槽位编号。',
        "2. 上表只作为**语义核对证据**：原版每行读到的分量形态（纯 xyzw / 尾部标量 …）用于确认",
        "   我们对 `glsl_exact` 里 `cb0._mN` 的语义解释（哪个是色、哪个是起点终点、哪个是标量组）是否合理。",
        "3. 残余风险：语义命名（例：`_m4/_m5` 谁是描边色、谁是内色）只能靠行为推断，离线阶段无法证明，",
        "   只能在 CI 真编译 + 真机画面比对时定案。",
        "",
    ]
    OUT.write_text("\n".join(out), encoding="utf-8")
    print(f"写出 {OUT}  ({len(lines)} 条)")


if __name__ == "__main__":
    main()
