#!/usr/bin/env python3
"""严格日志审计: 构建日志里出现 error 就失败, 出现 warning 按开关失败。

为什么需要: Unity 的退出码不反映内容错误。
  - Shader 编译失败 → 白块/粉块, 退出码仍为 0;
  - C# 编译 error → 有时 executeMethod 根本没跑, 日志里却只有一行;
  - IL2CPP 链接错误 / 缺 ABI → 可能只打一堆 warning。
所以把日志当成验收对象, 按模式分级统计。

用法:
  python3 tools/strict_log_audit.py build.log --allow-warnings
  python3 tools/strict_log_audit.py build.log --json-out out/log_audit.json
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ERROR_PATTERNS = [
    (r"Shader error in", "shader 编译错误"),
    (r"Shader warning in", "shader 编译警告"),
    (r"error CS\d+", "C# 编译错误"),
    (r"Build completed with a result of 'Failed'", "构建结果为 Failed"),
    (r"Unable to resolve action", "CI action 解析失败"),
    (r"Exception: ", "托管异常"),
    (r"il2cpp[^\n]*error", "IL2CPP 编译/链接错误"),
    (r"Failed to compile resources", "资源编译失败"),
    (r"--executeMethod .* (failed|returned non-zero)", "executeMethod 失败"),
    (r"Aborting batchmode due to failure", "batchmode 中止"),
    (r"Unloading broken assembly", "程序集损坏"),
    (r"Scripts have compiler errors", "脚本有编译错误"),
]

WARN_PATTERNS = [
    (r"warning CS\d+", "C# 编译警告"),
    (r"Shader warning in", "shader 警告"),
    (r"deprecated", "API 弃用告警"),
]

# 允许已知无害的告警(白名单需要显式, 不做正则通配放行)
# 已知无害告警(需显式登记, 不做正则通配放行)。
# 这些是 GitHub runner / GameCI 容器自身的噪音, 与工程代码无关:
ALLOWLIST = [
    r"Packages/manifest\.json.*com\.unity\.",
    r"\(node:\d+\)",                      # npm/node 运行时提示 (punycode 等)
    r"Node\.js \d+ is deprecated",           # actions 运行时升级提示
    r"Warning: Failed to find package",        # GameCI 探测 android-0 占位包
]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("log")
    ap.add_argument("--allow-warnings", action="store_true")
    # 警告基线: 原版脚本自带 CS0169/CS0649 等不可消除项已登记, 允许存在但不允许超出。
    ap.add_argument("--max-warnings", type=int, default=0)
    ap.add_argument("--json-out", default=None)
    ap.add_argument("--max-samples", type=int, default=10)
    args = ap.parse_args()

    p = Path(args.log)
    if not p.exists():
        print(f"::error::日志不存在: {p}")
        return 1

    text = p.read_text(encoding="utf-8", errors="ignore")
    lines = text.splitlines()

    errors: list[dict] = []
    for pat, label in ERROR_PATTERNS:
        for m in re.finditer(pat, text):
            idx = text[: m.start()].count("\n")
            errors.append({"kind": label, "line": idx + 1,
                           "text": lines[idx][:240] if idx < len(lines) else ""})

    warnings: list[dict] = []
    for pat, label in WARN_PATTERNS:
        for m in re.finditer(pat, text):
            idx = text[: m.start()].count("\n")
            line = lines[idx] if idx < len(lines) else ""
            if any(re.search(a, line) for a in ALLOWLIST):
                continue
            warnings.append({"kind": label, "line": idx + 1, "text": line[:240]})

    print(f"log={p} lines={len(lines)} errors={len(errors)} warnings={len(warnings)}")

    for e in errors[: args.max_samples]:
        print(f"  ERROR[{e['kind']}] L{e['line']}: {e['text']}")
    for w in warnings[: args.max_samples]:
        print(f"  WARN [{w['kind']}] L{w['line']}: {w['text']}")

    payload = {"log": str(p), "lines": len(lines),
               "errors": len(errors), "warnings": len(warnings),
               "error_samples": errors[:50], "warning_samples": warnings[:50]}
    if args.json_out:
        Path(args.json_out).write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")

    if errors:
        for e in errors[: args.max_samples]:
            print(f"::error::日志出现错误[{e['kind']}] L{e['line']}")
        print(f"结论: FAIL, {len(errors)} 处错误")
        return 1
    if warnings and not args.allow_warnings and len(warnings) > args.max_warnings:
        for w in warnings[: args.max_samples]:
            print(f"::error::严格模式不允许警告[{w['kind']}] L{w['line']}")
        print(f"结论: FAIL, {len(warnings)} 处警告")
        return 1

    print("结论: PASS, 日志无错误"
          + ("" if warnings else ", 无警告"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
