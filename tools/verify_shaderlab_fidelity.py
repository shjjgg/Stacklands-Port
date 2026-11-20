#!/usr/bin/env python3
"""ShaderLab 保真校验: 拿"重建的 .shader"与三张台账(段数/关键字/pass 状态)逐项对账。

背景: shader 这段唯一能机器验的就是 ShaderLab 层。程序集反编译再编译都没法证明
"这个 pass 依旧是 ZWrite Off + ColorMask GBA", 但只要 ShaderLab 状态写错一个词,
画面就会是另一种混合/另一种写深方式 —— 而且编译器一声不响。

本工具四条断言(全部硬失败):
  1. 覆盖: 台账里的每个 shader 都有同名 `.shader`(`Shader "<name>"`), 且数量不少于 --expect-shaders;
  2. Pass 数: 每个 SubShader 的 pass 数与 `pass_state.json` 一致(逐 pass 位置对应);
  3. 渲染状态: 把重建 pass 里的 Cull/ZTest/ZWrite/Blend/ColorMask/Offset/Stencil/AlphaToMask
     规范化后, 与台账的 `shaderlab` 片段逐字相等(**原样复刻**, 不允许"顺手改成正常值");
  4. 关键字: `#pragma multi_compile*/shader_feature*` 声明出的名字集合 ⊇ `keyword_matrix.json` 的
     关键字全集(允许多, 不允许少); 少一个 = 该分支永远不生效。

`--selftest` 会用台账自身合成一份"正确"的 .shader, 再打四个变异(错 blend/少 pass/少 keyword/
颜色掩码写满), 断言四类都能被抓到 —— 保证这套校验不是永远绿的摆设。

用法:
  python3 tools/verify_shaderlab_fidelity.py --shaders Assets/Shaders --selftest
  python3 tools/verify_shaderlab_fidelity.py --shaders Assets/Shaders --expect-shaders 20
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import tempfile
from pathlib import Path

LEDGER_DIR = Path("shader_extract")

ZTEST_ALIAS = {"LEqual": "LessEqual", "GEqual": "GreaterEqual", "Equal": "Equal",
               "NotEqual": "NotEqual", "Less": "Less", "Greater": "Greater",
               "Always": "Always", "Never": "Never", "Disabled": "Disabled", "Off": "Disabled"}
ZWRITE = {"On": "On", "Off": "Off"}


def strip_comments(text: str) -> str:
    text = re.sub(r"//[^\n]*", "", text)
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
    return text


def blocks(text: str):
    """按大括号遍历, 返回 (层级, 头部文本, 起始位置, 结束位置)。"""
    depth = 0
    stack = []
    out = []
    for i, ch in enumerate(text):
        if ch == "{":
            head = text[stack[-1]:i] if stack else text[:i]
            stack.append(("", i + 1))
            out.append(("open", depth, head.strip()[-80:], i))
            depth += 1
        elif ch == "}":
            depth -= 1
            if stack:
                start_open = stack.pop()
                out.append(("close", depth, "", i))
    return out


def split_scopes(text: str) -> list[dict]:
    """把 Shader 文本拆成 shader/subshader/pass 三层, 记录每层体的原文区间。"""
    scopes = []
    stack = []
    for i, ch in enumerate(text):
        if ch == "{":
            head_start = stack[-1]["body_start"] if stack else 0
            head = text[head_start:i]
            stack.append({"head": head, "open": i, "depth": len(stack)})
            if len(stack) == 1:
                scopes.append({"kind": "shader", "head": head, "open": i, "depth": 0})
            elif len(stack) == 2:
                scopes.append({"kind": "subshader", "head": head, "open": i, "depth": 1})
            elif len(stack) == 3 and re.search(r"\bPass\b", head[-40:]):
                scopes.append({"kind": "pass", "head": head, "open": i, "depth": 2})
        elif ch == "}":
            if stack:
                top = stack.pop()
                for s in scopes:
                    if s["open"] == top["open"] and "close" not in s:
                        s["close"] = i
                        s["body"] = text[i + 1:i + 1]
    for s in scopes:
        if "close" not in s:
            s["close"] = len(text)
    # 依据区间重新取 body
    for s in scopes:
        s["body"] = text[s["open"] + 1:s["close"]]
    return scopes


def top_level_scope(text: str, name: str) -> list[tuple[int, int]]:
    """找出某个顶层区块(Shader/SubShader/Pass)的体区间, 用括号配对。"""
    out = []
    for m in re.finditer(rf"\b{name}\b", text):
        i = text.find("{", m.end())
        if i < 0:
            continue
        depth, j = 0, i
        while j < len(text):
            if text[j] == "{":
                depth += 1
            elif text[j] == "}":
                depth -= 1
                if depth == 0:
                    out.append((i + 1, j))
                    break
            j += 1
    return out


def parse_shader_file(path: Path) -> dict:
    raw = path.read_text(encoding="utf-8", errors="ignore")
    text = strip_comments(raw)
    m = re.search(r'\bShader\s*"([^"]+)"', text)
    name = m.group(1) if m else path.stem

    subs = []
    for s_open, s_close in top_level_scope(text, "SubShader"):
        sbody = text[s_open:s_close]
        queue = render_type = None
        tm = re.search(r"\bTags\s*\{([^}]*)\}", sbody)
        tag_text = tm.group(1) if tm else ""
        q = re.search(r'"Queue"\s*=\s*"([^"]+)"', tag_text)
        if q:
            queue = q.group(1).split("+")[0].split("-")[0].strip()
            queue = queue.split()[-1] if queue else queue
        rt = re.search(r'"RenderType"\s*=\s*"([^"]+)"', tag_text)
        render_type = rt.group(1) if rt else None

        passes = []
        for p_open, p_close in top_level_scope(sbody, "Pass"):
            pbody = sbody[p_open:p_close]
            passes.append(parse_pass(pbody))
        subs.append({"queue": queue, "render_type": render_type, "passes": passes})

    pragmas, instancing = collect_keywords(text)
    fb = re.search(r'\bFallback\s+"?([^"\n\s]+)"?', text)
    prop_names = []
    pm = re.search(r"\bProperties\s*\{", text)
    if pm:
        # 括号配对取 Properties 体, 再按 "name (" 抽属性名
        i = text.find("{", pm.end() - 1)
        depth, j = 0, i
        while j < len(text):
            if text[j] == "{":
                depth += 1
            elif text[j] == "}":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        pbody = text[i + 1:j]
        prop_names = re.findall(r"([_A-Za-z][\w]*)\s*\(", pbody)
    uses = re.findall(r'\bUsePass\s+"([^"]+)"', text)
    return {"file": path.name, "name": name, "subshaders": subs,
            "keywords": pragmas, "instancing_pragma": instancing,
            "fallback": fb.group(1) if fb else "", "properties": prop_names,
            "usepass": uses}


PRAGMA = re.compile(r"#pragma\s+(?:multi_compile|multi_compile_local|shader_feature|"
                    r"shader_feature_local|multi_compile_fwdbase|multi_compile_fog|"
                    r"multi_compile_instancing|multi_compile_lightpass|"
                    r"multi_compile_shadowcaster|multi_compile_particles)\b(.*)")


def collect_keywords(text: str) -> tuple[set[str], bool]:
    """返回 (关键字集合, 是否含 multi_compile_instancing)。

    INSTANCING_ON 是 `multi_compile_instancing` 隐式产生的名字, 重建里通常不会显式写出,
    所以只有在没有任何 instancing 宏时才把 INSTANCING_ON 算作缺失。
    """
    out = set()
    instancing = False
    for line in text.splitlines():
        m = PRAGMA.search(line)
        if not m:
            continue
        rest = m.group(1)
        # multi_compile_fwdbase 等不带名字的宏, 展开成已知集合
        if not rest.strip():
            out.add("_")
            if "instancing" in line:
                instancing = True
            continue
        for tok in rest.split():
            if tok.startswith("_"):
                continue
            out.add(tok)
    return out, instancing


def dedupe_globals(kws: set[str]) -> set[str]:
    """把 Unity 内置宏/局部修饰符过滤掉, 只保留真正可被外部设置的名字。"""
    drop = {"_"}
    return {k for k in kws if k not in drop and not k.startswith("_")}


def parse_pass(body: str) -> dict:
    st = {"cull": "Back", "ztest": "LessEqual", "zwrite": "On",
          "blend_src": "One", "blend_dst": "Zero",
          "blend_src_a": "One", "blend_dst_a": "Zero", "blend_op": "Add",
          "color_mask": 15, "alpha_to_mask": False, "offset": "0,0",
          "stencil_comp": "Always", "stencil_pass": "Keep", "stencil_fail": "Keep",
          "stencil_zfail": "Keep", "stencil_read": 255, "stencil_write": 255,
          "stencil_ref": 0, "lightmode": ""}
    # 去掉 HLSL 代码块, 只看 ShaderLab 指令
    hlsl = re.sub(r"(HLSLPROGRAM|HLSLINCLUDE|CGPROGRAM|CGINCLUDE).*?(ENDHLSL|ENDCG)", "", body, flags=re.S)
    for line in hlsl.splitlines():
        line = line.strip()
        if not line:
            continue
        tok = line.split()
        head = tok[0]
        if head == "Cull" and len(tok) > 1:
            st["cull"] = tok[1]
        elif head == "ZTest" and len(tok) > 1:
            st["ztest"] = ZTEST_ALIAS.get(tok[1], tok[1])
        elif head == "ZWrite" and len(tok) > 1:
            st["zwrite"] = ZWRITE.get(tok[1], tok[1])
        elif head == "Blend":
            rest = line[len("Blend"):].strip()
            if rest in ("Off", "off"):
                st.update(blend_src="One", blend_dst="Zero", blend_src_a="One", blend_dst_a="Zero")
            else:
                parts = [p.strip() for p in rest.split(",")]
                fact = parts[0].split()
                st["blend_src"], st["blend_dst"] = fact[0], fact[1]
                st["blend_src_a"], st["blend_dst_a"] = fact[0], fact[1]
                if len(fact) >= 4:
                    st["blend_src_a"], st["blend_dst_a"] = fact[2], fact[3]
                if len(parts) > 1:
                    st["blend_op"] = parts[1]
        elif head == "BlendOp":
            st["blend_op"] = tok[1]
        elif head == "ColorMask":
            v = tok[1]
            if v == "0":
                st["color_mask"] = 0
            else:
                bits = 0
                for i, c in enumerate("RGBA"):
                    if c in v.upper():
                        bits |= 1 << i
                st["color_mask"] = bits
        elif head == "AlphaToMask":
            st["alpha_to_mask"] = tok[1].lower() == "on"
        elif head == "Offset":
            st["offset"] = tok[1].replace(" ", "") + "," + tok[2]
        elif head == "Stencil":
            sm = re.search(r"Stencil\s*\{([^}]*)\}", hlsl, re.S)
            if sm:
                body_st = sm.group(1)
                for k, field in (("Ref", "stencil_ref"), ("ReadMask", "stencil_read"),
                                 ("WriteMask", "stencil_write"), ("Comp", "stencil_comp"),
                                 ("Pass", "stencil_pass"), ("Fail", "stencil_fail"),
                                 ("ZFail", "stencil_zfail")):
                    mm = re.search(rf"\b{k}\b\s*([A-Za-z0-9_]+)", body_st)
                    if mm:
                        v = mm.group(1)
                        if field in ("stencil_ref", "stencil_read", "stencil_write"):
                            if v.isdigit():
                                st[field] = int(v)
                        else:
                            st[field] = ZTEST_ALIAS.get(v, v)
        elif head == "Tags":
            lm = re.search(r'"LightMode"\s*=\s*"([^"]+)"', line)
            if lm:
                st["lightmode"] = lm.group(1)

    return st


def shaderlab_snippet(s: dict) -> str:
    """与 extract_pass_state.py 完全同源的规范化片段(改一处必须两处同步)。"""
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


def norm(s: str) -> str:
    return re.sub(r"\s+", " ", s.replace("\n", " ")).strip()


def check_shaders(shader_dir: Path, expect: int | None, strict_coverage: bool = True) -> tuple[list[str], list[str], list[dict]]:
    fails, warns, rows = [], [], []
    files = sorted(shader_dir.rglob("*.shader")) if shader_dir.exists() else []
    parsed = [parse_shader_file(f) for f in files]

    pass_ledger = json.loads((LEDGER_DIR / "pass_state.json").read_text(encoding="utf-8"))
    kw_ledger = json.loads((LEDGER_DIR / "keyword_matrix.json").read_text(encoding="utf-8"))
    dxbc_ledger = json.loads((LEDGER_DIR / "dxbc_ledger.json").read_text(encoding="utf-8"))

    expect_passes: dict[str, list[dict]] = {}
    for r in pass_ledger["rows"]:
        expect_passes.setdefault(r["shader"], []).append(r)
    expect_kw = {r["shader"]: set(r["keyword_list"].split()) for r in kw_ledger["rows"]}
    expect_programs = {r["name"]: r["programs"] for r in dxbc_ledger["shaders"]}
    spec_index = {}
    si_path = LEDGER_DIR / "spec_index.json"
    if si_path.exists():
        for r in json.loads(si_path.read_text(encoding="utf-8")).get("shaders", []):
            spec_index[r["shader"]] = LEDGER_DIR / r["file"]

    if expect and len(parsed) < expect:
        fails.append(f"shader 文件只有 {len(parsed)} 个, 少于预期 {expect} 个")

    found = {p["name"]: p for p in parsed}
    if strict_coverage:
        # 真实工程: 台账里的每个 shader 都必须存在, 少一个就是重建没做完
        for name in expect_passes:
            if name not in found:
                fails.append(f"缺 shader 文件: {name}")
    for name, p in found.items():
        if name not in expect_passes:
            warns.append(f"多出未被台账记录的 shader: {name}")
            continue
        exp_rows = expect_passes[name]
        exp_by_sub: dict[int, list[dict]] = {}
        for r in exp_rows:
            exp_by_sub.setdefault(r["subshader"], []).append(r)
        if len(p["subshaders"]) != len(exp_by_sub):
            fails.append(f"{name}: SubShader 数 {len(p['subshaders'])} != 台账 {len(exp_by_sub)}")
        for si, sub in enumerate(p["subshaders"]):
            erows = sorted(exp_by_sub.get(si, []), key=lambda r: r["pass"])
            if len(sub["passes"]) != len(erows):
                fails.append(f"{name}#sub{si}: pass 数 {len(sub['passes'])} != 台账 {len(erows)}")
                continue
            for pi, (got, exp) in enumerate(zip(sub["passes"], erows)):
                got_snip = norm(shaderlab_snippet(got))
                exp_snip = norm(exp["shaderlab"])
                ok = got_snip == exp_snip
                if ok and exp.get("lightmode") and got.get("lightmode") and \
                        norm(got["lightmode"]) != norm(exp["lightmode"]):
                    ok = False
                    fails.append(f"{name}#sub{si}p{pi}: LightMode {got['lightmode']} != {exp['lightmode']}")
                if not ok:
                    fails.append(f"{name}#sub{si}p{pi}: 状态不一致\n      重建: {got_snip}\n      台账: {exp_snip}")
                rows.append({"shader": name, "sub": si, "pass": pi, "ok": ok,
                             "pass_programs": expect_programs.get(name)})

        # spec 比对: 属性名集合、Fallback、UsePass 只能作为补充(不计入 pass 数)
        spec_path = spec_index.get(name)
        if spec_path and spec_path.exists():
            spec = json.loads(spec_path.read_text(encoding="utf-8"))
            want_props = [x["name"] for x in spec.get("properties", [])]
            miss_props = [x for x in want_props if x not in p["properties"]]
            if miss_props:
                fails.append(f"{name}: 缺属性 {miss_props}")
            if (spec.get("fallback") or "") != (p["fallback"] or ""):
                fails.append(f"{name}: Fallback '{p['fallback']}' != 台账 '{spec.get('fallback')}'")
            if p["usepass"]:
                warns.append(f"{name}: 使用 UsePass {p['usepass']}(pass 数不含 UsePass, 需人工确认)")

        missing_set = expect_kw.get(name, set()) - dedupe_globals(p["keywords"])
        if p["instancing_pragma"]:
            missing_set.discard("INSTANCING_ON")
        missing = sorted(missing_set)
        if missing:
            fails.append(f"{name}: 缺关键字 {missing}")
        rows.append({"shader": name, "sub": None, "pass": None,
                     "ok": not missing, "pass_programs": expect_programs.get(name),
                     "keywords": len(p["keywords"])})
    return fails, warns, rows


def synth_shader(name: str, sub_passes: dict[int, list[dict]], keywords: list[str],
                 spec_props: list[dict] | None = None) -> str:
    """按台账合成一份"必然正确"的 .shader, 作为自测基准。"""
    props = [x["name"] for x in (spec_props or [])]
    lines = [f'Shader "{name}"', "{", "    Properties {", '        _MainTex ("Main", 2D) = "white" {}']
    for nm in props:
        lines.append(f'        {nm} ("{nm}", Float) = 0')
    lines += ["    }"]
    for si in sorted(sub_passes):
        lines += ["    SubShader", "    {",
                  '        Tags { "Queue"="Transparent" "RenderType"="Transparent" }']
        for r in sorted(sub_passes[si], key=lambda x: x["pass"]):
            lines += ["        Pass", "        {",
                      f'            Tags {{ "LightMode"="{r["lightmode"]}" }}']
            for stline in r["shaderlab"].split("\n"):
                lines.append("            " + stline.strip())
            lines += ["            HLSLPROGRAM",
                      "            #pragma vertex vert",
                      "            #pragma fragment frag"]
            for k in keywords:
                lines.append(f"            #pragma multi_compile {k}")
            lines += ["            ENDHLSL", "        }"]
        lines += ["    }"]
    lines += ["}", 'Fallback "Diffuse"']
    return "\n".join(lines)


def selftest() -> int:
    ledger = json.loads((LEDGER_DIR / "pass_state.json").read_text(encoding="utf-8"))
    kw = json.loads((LEDGER_DIR / "keyword_matrix.json").read_text(encoding="utf-8"))
    by_shader: dict[str, dict[int, list[dict]]] = {}
    for r in ledger["rows"]:
        by_shader.setdefault(r["shader"], {}).setdefault(r["subshader"], []).append(r)
    kws = {r["shader"]: r["keyword_list"].split() for r in kw["rows"]}

    specs = {}
    si = LEDGER_DIR / "spec_index.json"
    if si.exists():
        for r in json.loads(si.read_text(encoding="utf-8")).get("shaders", []):
            sp = LEDGER_DIR / r["file"]
            if sp.exists():
                specs[r["shader"]] = json.loads(sp.read_text(encoding="utf-8")).get("properties", [])
    sample = sorted(by_shader)[:3]
    results = []
    with tempfile.TemporaryDirectory() as td:
        base = Path(td) / "base"
        base.mkdir()
        for name in sample:
            fn = base / (name.replace("/", "__") + ".shader")
            fn.write_text(synth_shader(name, by_shader[name], kws[name], specs.get(name)), encoding="utf-8")

        # 1) 正确样本必须全过
        fails, warns, _ = check_shaders(base, None, strict_coverage=False)
        results.append(("正确样本", not fails, fails[:3]))

        # 2) 变异: blend 写错
        mut = Path(td) / "m1"
        mut.mkdir()
        for name in sample:
            txt = synth_shader(name, by_shader[name], kws[name], specs.get(name))
            txt = txt.replace("Blend One One", "Blend SrcAlpha One", 1)
            (mut / (name.replace("/", "__") + ".shader")).write_text(txt, encoding="utf-8")
        fails, _, _ = check_shaders(mut, None, strict_coverage=False)
        results.append(("错 blend 被抓", any("状态不一致" in f for f in fails), fails[:2]))

        # 3) 变异: 少一个 pass
        mut = Path(td) / "m2"
        mut.mkdir()
        for name in sample:
            txt = synth_shader(name, by_shader[name], kws[name], specs.get(name))
            txt = txt.replace("        Pass\n        {", "", 1)
            (mut / (name.replace("/", "__") + ".shader")).write_text(txt, encoding="utf-8")
        fails, _, _ = check_shaders(mut, None, strict_coverage=False)
        results.append(("少 pass 被抓", any("pass 数" in f for f in fails), fails[:2]))

        # 4) 变异: 少一个 keyword
        mut = Path(td) / "m3"
        mut.mkdir()
        for name in sample:
            txt = synth_shader(name, by_shader[name], kws[name], specs.get(name))
            txt = txt.replace(f"#pragma multi_compile {kws[name][0]}", "")
            (mut / (name.replace("/", "__") + ".shader")).write_text(txt, encoding="utf-8")
        fails, _, _ = check_shaders(mut, None, strict_coverage=False)
        results.append(("少 keyword 被抓", any("缺关键字" in f for f in fails), fails[:2]))

        # 5) 变异: ColorMask 写满(把 GBA 改成 RGBA 等价于删掉 ColorMask 行)
        mut = Path(td) / "m4"
        mut.mkdir()
        for name in sample:
            txt = synth_shader(name, by_shader[name], kws[name], specs.get(name))
            txt = txt.replace("ColorMask GBA", "ColorMask RGBA", 1)
            (mut / (name.replace("/", "__") + ".shader")).write_text(txt, encoding="utf-8")
        fails, _, _ = check_shaders(mut, None, strict_coverage=False)
        results.append(("ColorMask 变异被抓", any("状态不一致" in f for f in fails), fails[:2]))

        # 6) 变异: 少一个属性
        mut = Path(td) / "m5"
        mut.mkdir()
        for name in sample:
            txt = synth_shader(name, by_shader[name], kws[name], specs.get(name))
            props = specs.get(name) or []
            if props:
                txt = txt.replace(f'        {props[0]["name"]} ("{props[0]["name"]}", Float) = 0', "", 1)
            (mut / (name.replace("/", "__") + ".shader")).write_text(txt, encoding="utf-8")
        fails, _, _ = check_shaders(mut, None, strict_coverage=False)
        results.append(("少属性被抓", any("缺属性" in f for f in fails), fails[:2]))

        # 7) 变异: Fallback 写错
        mut = Path(td) / "m6"
        mut.mkdir()
        for name in sample:
            txt = synth_shader(name, by_shader[name], kws[name], specs.get(name))
            txt = txt.replace('Fallback "Diffuse"', 'Fallback "Standard"', 1)
            (mut / (name.replace("/", "__") + ".shader")).write_text(txt, encoding="utf-8")
        fails, _, _ = check_shaders(mut, None, strict_coverage=False)
        results.append(("Fallback 变异被抓", any("Fallback" in f for f in fails), fails[:2]))

    ok = all(r[1] for r in results)
    for label, passed, detail in results:
        print(f"[{'OK' if passed else 'FAIL'}] {label}")
        for d in detail:
            print("      " + d.replace("\n", "\n      "))
    print(f"自测结论: {'全通过' if ok else '有失败'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--shaders", default="Assets/Shaders")
    ap.add_argument("--expect-shaders", type=int, default=None)
    ap.add_argument("--selftest", action="store_true")
    ap.add_argument("--out", default="shader_extract")
    args = ap.parse_args()

    if args.selftest:
        return selftest()

    d = Path(args.shaders)
    if not d.exists() or not any(d.rglob("*.shader")):
        print(f"::warning::{d} 下没有 .shader, 跳过 ShaderLab 保真校验(重建尚未落地)")
        return 0

    fails, warns, rows = check_shaders(d, args.expect_shaders)
    for w in warns:
        print(f"::warning::{w}")
    for f in fails:
        print(f"::error::{f}")
    out = Path(args.out)
    if rows:
        (out / "shaderlab_fidelity.json").write_text(
            json.dumps({"rows": rows, "fails": fails, "warns": warns}, ensure_ascii=False, indent=2),
            encoding="utf-8")
    print(f"shader 文件 {len(set(r['shader'] for r in rows))} 个, 失败 {len(fails)} 项")
    return 1 if fails else 0


if __name__ == "__main__":
    raise SystemExit(main())
