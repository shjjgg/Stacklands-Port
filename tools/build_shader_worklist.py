#!/usr/bin/env python3
"""生成 Shader 保真链工作单: 把 30 个自研/改编 shader 按"可共用重建基座"分族, 给出每族必做的补全项。

目的: T14 要逐个走 ShaderRipper → 3Dmigoto HLSLDecompiler → spirv-cross 手工补全。
30 个 shader 逐个从零补是最贵的做法 —— 实际上 SDF 描边族/卡面族/过渡族内部高度同构,
共用一套 Pass/宏/贴图绑定基座, 只需补差集。这个脚本自动算族、算差集、算风险项。

判据全部来自已有台账(shader_ledger.json), 不引入任何猜测:
  - 族划分: 属性集合 Jaccard 相似度 >= 阈值(默认 0.55)且关键字签名相容
  - 差集: 族内"公共属性"与"某 shader 独有属性"
  - 风险: 关键字数(变体爆炸)、blob 过小(疑似被剥)、非可改贴图、依赖、SubShader 数

输出:
  shader_extract/shader_worklist.md    人读工作单
  shader_extract/shader_worklist.csv   可导入表格追踪进度
  shader_extract/shader_worklist.json  机器可读
"""
from __future__ import annotations

import argparse
import csv
import json
from itertools import combinations
from pathlib import Path


def jaccard(a: set, b: set) -> float:
    if not a and not b:
        return 1.0
    return len(a & b) / len(a | b)


def kw_signature(keywords: list[str]) -> set:
    """关键字归一到"宏族": 去掉平台/变体后缀, 只留语义部分, 避免 STEREO_* 干扰相似度。"""
    sig = set()
    for k in keywords:
        base = k.split("_ON")[0].split("_OFF")[0]
        if base.startswith(("STEREO", "UNITY_SINGLE_PASS", "UNITY_HARDWARE_TIER", "SHADER_API")):
            continue
        sig.add(base)
    return sig


def family_of(shaders: list[dict], threshold: float) -> list[list[int]]:
    """并查集: 属性相似且关键字签名相通则合族。"""
    n = len(shaders)
    parent = list(range(n))

    def find(x: int) -> int:
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    def union(a: int, b: int) -> None:
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[rb] = ra

    for i, j in combinations(range(n), 2):
        pi = set(shaders[i]["properties"])
        pj = set(shaders[j]["properties"])
        ki = kw_signature(shaders[i]["keywords"])
        kj = kw_signature(shaders[j]["keywords"])
        sim = jaccard(pi, pj)
        if sim >= threshold and (not ki or not kj or jaccard(ki, kj) >= 0.5):
            union(i, j)

    groups: dict[int, list[int]] = {}
    for i in range(n):
        groups.setdefault(find(i), []).append(i)
    return sorted(groups.values(), key=lambda g: (-len(g), g))


def risk_flags(s: dict) -> list[str]:
    flags = []
    if s["blob_size"] < 1500:
        flags.append("blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)")
    if len(s["keywords"]) >= 20:
        flags.append(f"关键字 {len(s['keywords'])} 条(变体爆炸, 需按需剔除无用 multi_compile)")
    if s.get("subshader_count", 1) > 1:
        flags.append(f"SubShader {s['subshader_count']} 个(需逐个重建)")
    if s.get("non_modifiable_textures"):
        flags.append(f"非可改贴图 {len(s['non_modifiable_textures'])} 个")
    if s.get("dependencies"):
        flags.append(f"依赖 {len(s['dependencies'])} 项")
    if s.get("fallback") not in (None, "", "NoSubshaders", "VertexLit") and s["fallback"]:
        flags.append(f"fallback={s['fallback']}(需决定是否保留)")
    return flags


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--ledger", default="shader_extract/shader_ledger.json")
    ap.add_argument("--out", default="shader_extract")
    ap.add_argument("--threshold", type=float, default=0.55)
    args = ap.parse_args()

    data = json.loads(Path(args.ledger).read_text(encoding="utf-8"))
    by_name = {s["name"]: s for s in data["shaders"]}
    targets = [by_name[n] for n in data["game_shaders"] if n in by_name]
    if not targets:
        print("::error::台账里找不到 game_shaders 列表")
        return 1

    groups = family_of(targets, args.threshold)
    outdir = Path(args.out)
    outdir.mkdir(parents=True, exist_ok=True)

    rows = []
    md = ["# Shader 保真链工作单", "",
          f"- 来源: `{args.ledger}`（扫描时间 {data.get('scanned_at')}）",
          f"- 目标 shader: {len(targets)} 个（自研/改编 30 = Custom/ 20 + Sprites/Transition/Unlit 等 10）",
          f"- 分族阈值: 属性 Jaccard ≥ {args.threshold} 且关键字签名相容", ""]

    for gi, g in enumerate(groups, 1):
        members = [targets[i] for i in g]
        names = [m["name"] for m in members]
        props = [set(m["properties"]) for m in members]
        common = set.intersection(*props) if props else set()
        union_props = set.union(*props) if props else set()
        kws = sorted(set.union(*[set(m["keywords"]) for m in members])) if members else []
        md.append(f"## 族 F{gi}: {', '.join(names)}")
        md.append("")
        md.append(f"- 成员 {len(members)} 个；公共属性 {len(common)} 个：{', '.join(sorted(common)) or '(无)'}")
        if union_props - common:
            md.append(f"- 族内差集属性 {len(union_props - common)} 个：{', '.join(sorted(union_props - common))}")
        md.append(f"- 关键字并集 {len(kws)} 条")
        md.append("")
        md.append("| Shader | 分类 | blob(B) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |")
        md.append("|---|---|---:|---:|---:|---:|---|---|")
        for m in members:
            own = sorted(set(m["properties"]) - common)
            flags = risk_flags(m)
            md.append(f"| {m['name']} | {m['category']} | {m['blob_size']} | {len(m['properties'])} | "
                      f"{len(m['keywords'])} | {m.get('subshader_count', 1)} | "
                      f"{', '.join(own) if own else '—'} | {'；'.join(flags) if flags else '—'} |")
            rows.append({
                "family": f"F{gi}",
                "shader": m["name"],
                "category": m["category"],
                "blob_file": m["blob_file"],
                "blob_size": m["blob_size"],
                "properties": "|".join(m["properties"]),
                "own_properties": "|".join(own),
                "keywords": "|".join(m["keywords"]),
                "subshaders": m.get("subshader_count", 1),
                "fallback": m.get("fallback", ""),
                "risks": "；".join(flags),
                "chain_steps": "ripper→HLSLDecompiler→spirv-cross→手工补 Pass/Tags/宏/绑定",
                "status": "pending",
                "acceptance": "真机抓帧对比原版；Vulkan 与 GLES3 双 API 无粉块/白块；无占位 shader",
            })
        md.append("")

    md.append("## 执行顺序建议")
    md.append("")
    md.append("1. 先做**人口径最大**的族（成员数多、公共属性多）——一套基座覆盖多个 shader，收益最高。")
    md.append("2. 族内先做 blob 最大、关键字最多的那个（信息最全，反编译成功率最高），再往下做小变体。")
    md.append("3. `blob<1.5KB` 的条目先确认是否为真实空壳；若是，按原版视觉重建而不是硬还原字节。")
    md.append("4. 每完成一个 shader，把 `shader_worklist.csv` 的 `status` 从 `pending` 改 `done` 并记抓帧结论。")
    md.append("")

    (outdir / "shader_worklist.md").write_text("\n".join(md), encoding="utf-8")
    (outdir / "shader_worklist.json").write_text(
        json.dumps({"scanned_at": data.get("scanned_at"), "threshold": args.threshold,
                    "targets": len(targets), "families": [
                        {"id": f"F{i+1}", "members": [targets[j]["name"] for j in g]}
                        for i, g in enumerate(groups)],
                    "rows": rows}, ensure_ascii=False, indent=2), encoding="utf-8")

    with (outdir / "shader_worklist.csv").open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    print(f"targets={len(targets)} families={len(groups)} sizes={[len(g) for g in groups]}")
    for i, g in enumerate(groups, 1):
        print(f"  F{i}: {len(g)} 个 -> {[targets[j]['name'] for j in g][:4]}{'...' if len(g)>4 else ''}")
    print(f"写出 {outdir}/shader_worklist.{{md,csv,json}}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
