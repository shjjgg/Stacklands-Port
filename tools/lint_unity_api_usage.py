#!/usr/bin/env python3
"""C# 编辑器脚本静态门: 在没有编译器的环境里, 拦住三类"必编译不过"的错误。

起因: PortBuild.cs 里曾出现
  1) 漏 `using UnityEngine.Rendering` → `GraphicsDeviceType` 找不到, 整文件编不过;
  2) 写了不存在的 `BuildSummary.totalSizeBytes` / `PlayerSettings.Android.keystorePassword`
     → 同样编不过, 而这两处永远不会在静态台账阶段暴露。
所以本脚本做三件事:
  A. 语法骨架: 括号/引号配对、`#if UNITY_EDITOR` 与 `#endif` 配对、文件必须被 UNITY_EDITOR 包裹;
  B. 命名空间: 代码里出现的类型, 其命名空间必须在 using 列表里;
  C. API 白名单: 所有 `Type.Member` 必须在 docs/api_verified.json 里登记且 status=verified,
     未登记 = 失败(先去查文档再写), 登记了但代码没用到 = 警告(文档过期)。

用法:
  python3 tools/lint_unity_api_usage.py                       # 默认检 Assets/Editor/PortBuild.cs
  python3 tools/lint_unity_api_usage.py --file x.cs --strict-unused
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

# 类型 → 命名空间。只登记 PortBuild 用到的, 新增类型需同步补这里(否则 B 项会误判)。
TYPE_NAMESPACE = {
    "PlayerSettings": "UnityEditor",
    "PlayerSettings.Android": "UnityEditor",
    "PlayerSettings.SplashScreen": "UnityEditor",
    "BuildOptions": "UnityEditor",
    "BuildPipeline": "UnityEditor",
    "BuildPlayerOptions": "UnityEditor",
    "BuildResult": "UnityEditor.Build.Reporting",
    "BuildReport": "UnityEditor.Build.Reporting",
    "BuildSummary": "UnityEditor.Build.Reporting",
    "ShaderUtil": "UnityEditor",
    "ShaderMessage": "UnityEditor",
    "EditorApplication": "UnityEditor",
    "EditorBuildSettings": "UnityEditor",
    "AssetDatabase": "UnityEditor",
    "AndroidArchitecture": "UnityEditor",
    "AndroidSdkVersions": "UnityEditor",
    "ManagedStrippingLevel": "UnityEditor",
    "ScriptingImplementation": "UnityEditor",
    "Il2CppCompilerConfiguration": "UnityEditor",
    "EditorBuildSettingsScene": "UnityEditor",
    "UIOrientation": "UnityEngine",
    "ColorSpace": "UnityEngine",
    "Application": "UnityEngine",
    "Debug": "UnityEngine",
    "GraphicsDeviceType": "UnityEngine.Rendering",
}

# 参与白名单校验的静态前缀(其余三方类型如 File/Path 不做 API 校验)
API_PREFIXES = [
    "PlayerSettings", "BuildOptions", "BuildPipeline", "BuildResult", "BuildReport",
    "ShaderUtil", "EditorApplication", "EditorBuildSettings", "AssetDatabase",
    "Application", "AndroidArchitecture", "AndroidSdkVersions", "ManagedStrippingLevel",
    "ScriptingImplementation", "Il2CppCompilerConfiguration", "UIOrientation",
    "ColorSpace", "GraphicsDeviceType",
]

# 实例成员: 通过局部变量拿到已知类型, 再校验 `.member`。
# 覆盖不了全部 C# 类型推断, 只登记"本工程实际会用到的、且曾出过错"的那几类;
# 未覆盖的写法仍由 docs/api_verified.json 的 kind=member 条目人工维护。
INSTANCE_SOURCES = [
    (re.compile(r"\bvar\s+(\w+)\s*=\s*report\.summary"), "BuildSummary"),
    (re.compile(r"\b(\w+)\s*=\s*report\.summary"), "BuildSummary"),
]

SYMBOL_RE = re.compile(r"\b(" + "|".join(API_PREFIXES) + r")((?:\.[A-Za-z_][A-Za-z0-9_]*)+)")


def strip_literals(text: str) -> str:
    """去掉注释与字符串内容, 避免括号/引号统计被日志文本干扰(保留换行以维持行号)。"""
    out = []
    i, n = 0, len(text)
    while i < n:
        c = text[i]
        if c == "/" and i + 1 < n and text[i + 1] == "/":
            j = text.find("\n", i)
            if j < -1:
                j = n
            out.append(" " * (j - i))
            i = j if j > -1 else n
            continue
        if c == "/" and i + 1 < n and text[i + 1] == "*":
            j = text.find("*/", i + 2)
            j = n if j == -1 else j + 2
            out.append("".join("\n" if ch == "\n" else " " for ch in text[i:j]))
            i = j
            continue
        if c == "@" and i + 1 < n and text[i + 1] == '"':
            j = i + 2
            while j < n:
                if text[j] == '"':
                    if j + 1 < n and text[j + 1] == '"':
                        j += 2
                        continue
                    break
                j += 1
            out.append('""')
            i = j + 1
            continue
        if c == '"' or c == "'":
            quote = c
            j = i + 1
            while j < n:
                if text[j] == "\\":
                    j += 2
                    continue
                if text[j] == quote:
                    break
                j += 1
            out.append(quote + quote)
            i = j + 1
            continue
        out.append(c)
        i += 1
    return "".join(out)


def extract_interpolations(raw: str) -> str:
    """把 $"...{expr}..." 里的 expr 抠出来拼成一段代码, 供 API 扫描用。

    真实 Bug 就藏在这里: `$"size={summary.totalSizeBytes}B"` 的成员访问在插值表达式内,
    如果按普通字符串整段抹掉, 静态门就永远看不见它。
    """
    parts: list[str] = []
    i, n = 0, len(raw)
    while i < n:
        # 识别插值前缀: $"  $@"  @$"
        start = None
        if raw[i] == "$" and i + 1 < n and raw[i + 1] == '"':
            start = i + 2
        elif raw[i] == "$" and i + 2 < n and raw[i + 1] == "@" and raw[i + 2] == '"':
            start = i + 3
        elif raw[i] == "@" and i + 2 < n and raw[i + 1] == "$" and raw[i + 2] == '"':
            start = i + 3
        if start is None:
            i += 1
            continue
        j = start
        depth = 0
        buf: list[str] = []
        while j < n:
            c = raw[j]
            if c == '"' and depth == 0:
                # 结束(或 @"" 的双引号转义)
                if i is not None and "@" in raw[max(0, i):start] and j + 1 < n and raw[j + 1] == '"':
                    buf.append('"')
                    j += 2
                    continue
                break
            if c == "{" and depth == 0:
                if j + 1 < n and raw[j + 1] == "{":
                    j += 2
                    continue
                depth = 1
                j += 1
                continue
            if depth >= 1:
                if c == "{":
                    depth += 1
                elif c == "}":
                    depth -= 1
                    if depth == 0:
                        parts.append("".join(buf))
                        buf = []
                        j += 1
                        continue
                elif c == ":" and depth == 1:
                    # 格式说明符, 跳过到匹配的 }
                    while j < n and raw[j] != "}":
                        j += 1
                    continue
                buf.append(c)
            j += 1
        i = j + 1
    return "\n".join(parts)


def check_balance(code: str) -> list[str]:
    errs = []
    pairs = {")": "(", "]": "[", "}": "{"}
    stack: list[tuple[str, int]] = []
    line = 1
    for ch in code:
        if ch == "\n":
            line += 1
        elif ch in "([{":
            stack.append((ch, line))
        elif ch in ")]}":
            if not stack:
                errs.append(f"L{line}: 多余的 '{ch}'")
            else:
                top, tl = stack.pop()
                if top != pairs[ch]:
                    errs.append(f"L{line}: '{ch}' 与 L{tl} 的 '{top}' 不配对")
        elif ch == "#":
            pass
    for ch, tl in stack:
        errs.append(f"L{tl}: '{ch}' 未闭合")
    return errs


def check_guards(raw: str) -> list[str]:
    errs = []
    if "#if UNITY_EDITOR" not in raw:
        errs.append("缺少 `#if UNITY_EDITOR` 包裹: 编辑器脚本若在 Player 构建里参与编译会直接失败")
    n_if = len(re.findall(r"^#if", raw, re.M))
    n_endif = len(re.findall(r"^#endif", raw, re.M))
    if n_if != n_endif:
        errs.append(f"#if/#endif 不配对: #if={n_if} #endif={n_endif}")
    return errs


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--file", default="Assets/Editor/PortBuild.cs")
    ap.add_argument("--whitelist", default="docs/api_verified.json")
    ap.add_argument("--strict-unused", action="store_true")
    ap.add_argument("--json-out", default=None)
    args = ap.parse_args()

    f = Path(args.file)
    if not f.exists():
        print(f"::error::找不到文件 {f}")
        return 1
    raw = f.read_text(encoding="utf-8")
    code = strip_literals(raw)

    errors: list[str] = []
    warnings: list[str] = []

    # ---- A. 语法骨架 ----
    errors += check_balance(code)
    errors += check_guards(raw)
    dup = re.findall(r"public static \w+(?:<[^>]+>)?\s+(\w+)\s*\(", code)
    dupes = sorted({d for d in dup if dup.count(d) > 1})
    if dupes:
        errors.append(f"重复的 public static 方法名(Unity -executeMethod 会歧义): {dupes}")

    # ---- B. 命名空间 ----
    usings = set(re.findall(r"^using\s+([A-Za-z0-9_.]+);", raw, re.M))
    for t, ns in TYPE_NAMESPACE.items():
        head = t.split(".")[0]
        if not re.search(rf"\b{head}\b", code):
            continue
        if ns not in usings:
            errors.append(f"类型 {t} 需要 `using {ns};`(当前 usings: {sorted(usings)})")

    # ---- C. API 白名单 (含字符串插值内的表达式) ----
    code_api = code + "\n" + extract_interpolations(raw)
    wl_path = Path(args.whitelist)
    if not wl_path.exists():
        errors.append(f"白名单不存在: {wl_path}")
        entries = {}
    else:
        data = json.loads(wl_path.read_text(encoding="utf-8"))
        entries = {e["symbol"]: e for e in data.get("entries", [])}

    used: set[str] = set()
    for m in SYMBOL_RE.finditer(code_api):
        used.add(m.group(1) + m.group(2))

    # 前缀本身(如 PlayerSettings.Android)不算叶子, 归并到具体成员
    parents = {s.rsplit(".", 1)[0] for s in used if s.count(".") >= 2}
    leaves = {s for s in used if s not in parents}

    # 实例成员: 已知类型变量上的 .member 必须登记(kind=member)
    for src_re, type_name in INSTANCE_SOURCES:
        for m in src_re.finditer(code_api):
            var = m.group(1)
            for mm in re.finditer(rf"\b{re.escape(var)}\.([A-Za-z_][A-Za-z0-9_]*)", code_api):
                leaf = f"{type_name}.{mm.group(1)}"
                used.add(leaf)
                if leaf not in entries:
                    errors.append(f"实例成员未登记: {leaf} (变量 {var} 来自 {type_name}, "
                                  "请在 docs/api_verified.json 补 kind=member 条目)")
                elif entries[leaf].get("status") != "verified":
                    errors.append(f"实例成员未核实: {leaf}")

    unknown = sorted(s for s in leaves if s not in entries)
    unverified = sorted(s for s in leaves if s in entries and entries[s].get("status") != "verified")
    for s in unknown:
        errors.append(f"未登记 API: {s} —— 先在 docs/api_verified.json 登记并核对 2022.3 文档页, 再写代码")
    for s in unverified:
        errors.append(f"API 未核实: {s} (status={entries[s].get('status')})")

    if args.strict_unused:
        unused = sorted(s for s, e in entries.items()
                        if e.get("kind") not in ("member", "type") and s not in leaves)
        for s in unused:
            warnings.append(f"白名单里 {s} 代码已不再使用, 建议删除(文档过期)")

    dedup: list[str] = []
    for e in errors:
        if e not in dedup:
            dedup.append(e)
    errors = dedup

    print(f"lint {f}  symbols={len(leaves)} whitelist={len(entries)}")
    for e in errors:
        print(f"  ERROR {e}")
    for w in warnings:
        print(f"  WARN  {w}")

    payload = {"file": str(f), "symbols": sorted(leaves), "errors": errors, "warnings": warnings}
    if args.json_out:
        Path(args.json_out).write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")

    if errors:
        for e in errors[:10]:
            print(f"::error::{e}")
        print(f"结论: FAIL, {len(errors)} 项")
        return 1
    print("结论: PASS, 语法骨架/命名空间/API 白名单均通过")
    return 0


if __name__ == "__main__":
    sys.exit(main())
