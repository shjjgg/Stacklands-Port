#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
反编译 C# 源码 · IL2CPP 风险 API 静态扫描 (P2 阶段使用)

在 AssetRipper 反编译源码落地后, 扫描 .cs 文件中 IL2CPP/AOT 高风险 API,
输出命中表, 供裁剪保留与桩接决策。只读, 不修改源码。

用法:
  python3 scan_il2cpp_risks.py --src <反编译源码根目录> --out il2cpp_risks.md
"""
import argparse, os, re, collections, datetime

# 规则: 标签 -> 正则 (大小写敏感, 匹配调用/类型引用)
RULES = {
    "Reflection.Emit / DynamicMethod": [
        r"Reflection\.Emit", r"DynamicMethod", r"DynamicAssembly",
        r"DefineMethod", r"ILGenerator",
    ],
    "动态编译 (Roslyn/CodeAnalysis)": [
        r"Microsoft\.CodeAnalysis", r"CSharpCompilation", r"Roslyn",
    ],
    "反射按名取类型": [
        r"Type\.GetType", r"Assembly\.GetTypes", r"GetCustomAttributes",
    ],
    "泛型动态实例化": [
        r"MakeGenericType", r"MakeGenericMethod",
    ],
    "委托反射绑定": [
        r"Delegate\.CreateDelegate",
    ],
    "Harmony / MonoMod 补丁": [
        r"HarmonyLib", r"0Harmony", r"MonoMod", r"RuntimeDetour",
        r"RuntimePatch", r"Detour\(",
    ],
    "原生互操作": [
        r"DllImport", r"NativeLibrary", r"\[DllImport",
    ],
    "序列化反射": [
        r"JsonConvert", r"JObject", r"ISerializationCallbackReceiver",
    ],
}

COMPILED = {tag: [re.compile(p) for p in pats] for tag, pats in RULES.items()}


def scan(src):
    hits = collections.defaultdict(list)
    cs_files = []
    for dp, _, fns in os.walk(src):
        for fn in fns:
            if fn.endswith(".cs"):
                cs_files.append(os.path.join(dp, fn))

    for fp in cs_files:
        try:
            lines = open(fp, encoding="utf-8", errors="ignore").read().splitlines()
        except Exception:
            continue
        for i, line in enumerate(lines, 1):
            for tag, regs in COMPILED.items():
                if any(rx.search(line) for rx in regs):
                    hits[tag].append((os.path.relpath(fp, src), i, line.strip()))
    return cs_files, hits


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--src", required=True)
    ap.add_argument("--out", default="il2cpp_risks.md")
    args = ap.parse_args()

    files, hits = scan(args.src)
    L = ["# IL2CPP 风险 API 扫描报告\n",
         f"- 扫描时间: {datetime.datetime.now().isoformat(timespec='seconds')}",
         f"- C# 文件数: {len(files)}\n"]
    for tag, items in hits.items():
        L.append(f"## {tag} ({len(items)})\n")
        for fp, ln, line in items[:200]:
            L.append(f"- `{fp}:{ln}` {line}")
        if len(items) > 200:
            L.append(f"- … 其余 {len(items)-200} 条略")
        L.append("")
    if not hits:
        L.append("未命中规则。")

    open(args.out, "w", encoding="utf-8").write("\n".join(L))
    print(f"[OK] 扫描 {len(files)} 个 .cs, 命中 {sum(len(v) for v in hits.values())} 条 -> {args.out}")
    for tag, items in hits.items():
        print(f"  {tag}: {len(items)}")


if __name__ == "__main__":
    main()
