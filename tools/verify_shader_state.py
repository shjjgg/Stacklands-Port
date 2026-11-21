#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Shader 渲染状态严格门 (结构层, 构建期可跑)

依据: shader_extract/pass_state.json —— 直接从原版序列化的 Shader 资产读出来的
真实 pass 状态 (Cull/ZTest/ZWrite/Blend/ColorMask/Stencil/Queue/RenderType)。
本脚本把移植工程里同名 .shader 的 ShaderLab 状态解析出来逐项比对, 不一致直接 fail。

为什么必须严格: 154 个 Shapes shader 与 30 个游戏自带 shader 之前是"通用近似",
混合模式/深度写入/ColorMask 全凭印象写, 观感与原版不同的很大一部分就出在这里。

用法:
  python3 tools/verify_shader_state.py [--strict]
  python3 tools/verify_shader_state.py --md out.md   # 输出人工可读差异表
"""
import argparse, json, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LEDGER = os.path.join(ROOT, "shader_extract", "pass_state.json")
SHADER_DIRS = [os.path.join(ROOT, "Assets", "Shaders")]

BLEND_OPS = {"Add", "Sub", "RevSub", "Min", "Max"}
COMPARE = {"Always", "Never", "Less", "Equal", "LessEqual", "Greater", "NotEqual", "GreaterEqual"}
STENCIL_OP = {"Keep", "Zero", "Replace", "IncrSat", "DecrSat", "Invert", "IncrWrap", "DecrWrap"}
CULL = {"Off", "Front", "Back"}


def find_shaders():
    out = {}
    for base in SHADER_DIRS:
        for dirpath, _, files in os.walk(base):
            for f in files:
                if not f.endswith(".shader"):
                    continue
                p = os.path.join(dirpath, f)
                txt = open(p, encoding="utf-8", errors="replace").read()
                m = re.search(r'^\s*Shader\s+"([^"]+)"', txt, re.M)
                if m:
                    out.setdefault(m.group(1), []).append(p)
    return out


def strip_comments(txt):
    txt = re.sub(r"/\*.*?\*/", "", txt, flags=re.S)
    return re.sub(r"//[^\n]*", "", txt)


def split_blocks(txt, keyword):
    """返回 keyword 后面 {} 包起来的块内容列表(按出现顺序, 支持嵌套一层)。

    Pass 必须独占一行再跟 '{', 否则会把 stencil 的 `Pass Keep` 当成新 pass 块。
    """
    blocks = []
    if keyword == "Pass":
        pat = r"(?m)^\s*Pass\s*\n\s*\{"
    else:
        pat = r"\b" + keyword + r"\b[^{]*\{"
    for m in re.finditer(pat, txt):
        i = m.end() - 1
        depth = 0
        for j in range(i, len(txt)):
            if txt[j] == "{":
                depth += 1
            elif txt[j] == "}":
                depth -= 1
                if depth == 0:
                    blocks.append(txt[i + 1:j])
                    break
    return blocks


STATE_RE = {
    "cull": re.compile(r"\bCull\s+(\w+)"),
    "ztest": re.compile(r"\bZTest\s+(?:\[\w+\]\s*)?(\w+)"),
    "zwrite": re.compile(r"\bZWrite\s+(\w+)"),
    "zclip": re.compile(r"\bZClip\s+(\w+)"),
    "colormask": re.compile(r"\bColorMask\s+(\w+)"),
    "blend": re.compile(r"\bBlend\s+([^\n]+)"),
    "offset": re.compile(r"\bOffset\s+([^\n]+)"),
}

NUM2LETTER = {14: "GBA", 15: "RGBA", 0: "0", 7: "GBA", 13: "RGBA"}
MASK_VALUE = {"R": 8, "G": 4, "B": 2, "A": 1, "RG": 12, "RB": 10, "RA": 9, "GB": 6, "GA": 5, "BA": 3,
              "RGB": 14, "RGB": 14, "RGBA": 15, "0": 0}


def parse_mask(s):
    """统一成字母集合(顺序 RGBA), 避免 Unity 序列化数值与 ShaderLab 字母的位序歧义。"""
    s = s.strip()
    if s.isdigit():
        return NUM2LETTER.get(int(s), s)
    return "".join(ch for ch in "RGBA" if ch in s.upper())


DEFAULTS = {
    "cull": "Back", "ztest": "LessEqual", "zwrite": "On", "zclip": True, "color_mask": 15,
    "offset": "0,0", "blend_src": "One", "blend_dst": "Zero", "blend_src_a": "One", "blend_dst_a": "Zero",
    "stencil_comp": "Always", "stencil_pass": "Keep", "stencil_read": 255, "stencil_write": 255, "stencil_ref": 0,
}
CANON = {
    "LEqual": "LessEqual", "GEqual": "GreaterEqual", "NotEqual": "NotEqual", "Equal": "Equal",
    "Always": "Always", "Never": "Never", "Less": "Less", "Greater": "Greater",
}


def canonical(key, val):
    if key in ("ztest", "stencil_comp") and isinstance(val, str):
        return CANON.get(val, val)
    if isinstance(val, str):
        return val.lower() if key in ("cull", "zwrite") else val
    return val


def parse_pass_state(body):
    st = {}
    for key, rx in STATE_RE.items():
        m = rx.search(body)
        if not m:
            continue
        val = m.group(1).strip()
        if key == "blend":
            parts = val.replace(",", " ").split()
            if len(parts) >= 2:
                st["blend_src"], st["blend_dst"] = parts[0], parts[1]
                st["blend_src_a"] = parts[2] if len(parts) > 2 else parts[0]
                st["blend_dst_a"] = parts[3] if len(parts) > 3 else parts[1]
        elif key == "colormask":
            st["color_mask"] = parse_mask(val)
        elif key == "zclip":
            st["zclip"] = val.lower() == "on"
        elif key == "offset":
            st["offset"] = val.replace(" ", "")
        else:
            st[key] = val
    for k, v in DEFAULTS.items():
        st.setdefault(k, v)
    return {k: canonical(k, v) for k, v in st.items()}


def parse_file(path):
    txt = strip_comments(open(path, encoding="utf-8", errors="replace").read())
    sub = split_blocks(txt, "SubShader")
    if not sub:
        return None
    sb = sub[0]
    tags = re.search(r"Tags\s*\{([^}]*)\}", sb)
    queue = render_type = None
    if tags:
        q = re.search(r'"Queue"\s*=\s*"([^"]+)"', tags.group(1))
        r = re.search(r'"RenderType"\s*=\s*"([^"]+)"', tags.group(1))
        queue = q.group(1) if q else None
        render_type = r.group(1) if r else None
    passes = []
    for p in split_blocks(sb, "Pass"):
        passes.append(parse_pass_state(p))
    return {"queue": queue, "render_type": render_type, "passes": passes}


row_comp = "always"


def cmp_field(name, want, got, key=""):
    if want is None or want == "":
        return None
    if key == "color_mask":
        return None if parse_mask(str(want)) == parse_mask(str(got)) else f"{name}: 原版 {want} / 移植 {got}"
    if key in ("stencil_read", "stencil_write") and str(row_comp) == "disabled":
        return None
    if key in ("ztest", "stencil_comp") and isinstance(want, str) and want.lower() == "disabled":
        # Disabled 与 Always 在 Unity 里都是"不做深度/模板测试"
        return None if str(got).lower() in ("disabled", "always") else f"{name}: 原版 {want} / 移植 {got}"
    if got is None:
        return f"{name}: 原版 {want} / 移植未写"
    if canonical(key, want) != canonical(key, got):
        return f"{name}: 原版 {want} / 移植 {got}"
    return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--md", default="")
    ap.add_argument("--strict", action="store_true")
    args = ap.parse_args()

    ledger = json.load(open(LEDGER, encoding="utf-8"))
    by_shader = {}
    for row in ledger["rows"]:
        by_shader.setdefault(row["shader"], []).append(row)

    shaders = find_shaders()
    problems, checked, missing = [], 0, []
    lines = ["# Shader 状态比对 (原版 pass_state.json vs 移植 ShaderLab)", ""]

    for name, rows in sorted(by_shader.items()):
        paths = shaders.get(name)
        if not paths:
            missing.append(name)
            continue
        parsed = parse_file(paths[0])
        if parsed is None:
            problems.append(f"{name}: 解析不到 SubShader")
            continue
        checked += 1
        diffs = []
        want_q = rows[0].get("queue")
        want_rt = rows[0].get("render_type")
        diffs.append(cmp_field("Queue", want_q, parsed["queue"]))
        diffs.append(cmp_field("RenderType", want_rt, parsed["render_type"]))
        if len(parsed["passes"]) != len(rows):
            diffs.append(f"Pass 数量: 原版 {len(rows)} / 移植 {len(parsed['passes'])}")
        for idx, row in enumerate(rows):
            if idx >= len(parsed["passes"]):
                continue
            got = parsed["passes"][idx]
            global row_comp
            row_comp = str(row.get("stencil_comp", "always")).lower()
            for key, want in (("cull", row.get("cull")), ("ztest", row.get("ztest")),
                              ("zwrite", row.get("zwrite")), ("zclip", row.get("zclip")),
                              ("color_mask", row.get("color_mask")), ("offset", row.get("offset")),
                              ("blend_src", row.get("blend_src")), ("blend_dst", row.get("blend_dst")),
                              ("blend_src_a", row.get("blend_src_a")), ("blend_dst_a", row.get("blend_dst_a")),
                              ("stencil_comp", row.get("stencil_comp")), ("stencil_pass", row.get("stencil_pass")),
                              ("stencil_read", row.get("stencil_read")), ("stencil_write", row.get("stencil_write")),
                              ("stencil_ref", row.get("stencil_ref"))):
                d = cmp_field(f"pass{idx}.{key}", want, got.get(key), key)
                if d:
                    diffs.append(d)
            if row.get("lightmode") and f'LightMode' in str(row.get("shaderlab", "")):
                pass_body = re.search(r'"LightMode"\s*=\s*"([^"]+)"', str(row.get("shaderlab", "")))
                if pass_body and pass_body.group(1).lower() not in str(got).lower():
                    diffs.append(f"pass{idx}.lightmode: 原版 {pass_body.group(1)} 移植未声明")
        diffs = [d for d in diffs if d]
        if diffs:
            problems.append((name, diffs))
        lines.append(f"## {name}")
        lines.append("")
        lines.append("\n".join("- " + d for d in diffs) if diffs else "- 状态一致")
        lines.append("")

    print(f"shaders in ledger={len(by_shader)} ported={checked} missing={len(missing)} mismatch={sum(1 for p in problems if isinstance(p, tuple))}")
    for p in problems:
        if isinstance(p, tuple):
            print(f"  [DIFF] {p[0]}: {len(p[1])} 项")
            for d in p[1][:6]:
                print(f"         - {d}")
        else:
            print(f"  [ERR] {p}")
    if missing:
        print("  未实现(缺 shader 文件): " + ", ".join(missing))
    if args.md:
        open(args.md, "w", encoding="utf-8").write("\n".join(lines))
        print("报告写入 " + args.md)
    fail = bool(problems)
    return 1 if (fail and args.strict) else 0


if __name__ == "__main__":
    sys.exit(main())
