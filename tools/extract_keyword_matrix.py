#!/usr/bin/env python3
"""关键字矩阵: 每个 shader 的关键字全集、互斥组、理论变体上界, 与原版实际段数对账。

为什么需要: "变体够了"不能靠感觉。重建时若把某个 keyword 漏掉, 运行时该状态下就会
落到别的分支(粉色/错色/无阴影), 而编译器不会报错。这里给出三道数:
  1. 关键字全集 `m_KeywordNames` —— 重建的 HLSL 必须一字不差地支持这些名字
     (名字拼错等于 keyword 永远不生效, 是最隐蔽的失真);
  2. 理论上界: 按互斥组(雾模式/光类型/阴影类型...)展开后的组合数;
  3. 原版实际段数(来自 dxbc_ledger): 实际 << 上界, 说明 Unity 在构建时按平台/变体剥离过,
     重建时**不需要**也**不应**去凑上界, 但互斥组的每个分支至少要各有一条可编译程序。
"""
from __future__ import annotations

import argparse
import csv
import json
import os
from pathlib import Path

try:
    import UnityPy
except ImportError:  # pragma: no cover
    raise SystemExit("[FATAL] 需要 UnityPy")

GAME_PREFIXES = ("Custom/", "Sprites/", "Transition/", "Unlit/")
GAME_EXACT = {"Postprocess/SokpopIntro"}

# Unity 内置互斥组(同一时刻最多命中一个)
EXCLUSIVE = {
    "雾模式": ["FOG_LINEAR", "FOG_EXP", "FOG_EXP2"],
    "主光类型": ["DIRECTIONAL", "POINT", "SPOT", "POINT_COOKIE", "DIRECTIONAL_COOKIE"],
    "阴影类型": ["SHADOWS_SCREEN", "SHADOWS_DEPTH", "SHADOWS_CUBE"],
    "立体渲染": ["STEREO_INSTANCING_ON", "UNITY_SINGLE_PASS_STEREO",
                "STEREO_MULTIVIEW_ON", "STEREO_CUBEMAP_RENDER_ON"],
    "光照贴图": ["LIGHTMAP_ON", "DYNAMICLIGHTMAP_ON", "LIGHTMAP_SHADOW_MIXING",
                "DIRLIGHTMAP_COMBINED"],
    "阴影质量": ["SHADOWS_SOFT", "SHADOWS_SHADOWMASK"],
}
PLATFORM_FORCED = {"STEREO_INSTANCING_ON", "UNITY_SINGLE_PASS_STEREO",
                   "STEREO_MULTIVIEW_ON", "STEREO_CUBEMAP_RENDER_ON", "INSTANCING_ON"}


def upper_bound(keywords: list[str]) -> tuple[int, dict[str, int]]:
    """互斥组各取 (成员数+1) 种状态, 其余每个开关 2 种, 相乘。"""
    groups, singles = {}, []
    for g, members in EXCLUSIVE.items():
        present = [m for m in members if m in keywords]
        if present:
            groups[g] = len(present) + 1
    covered = {m for ms in EXCLUSIVE.values() for m in ms}
    singles = [k for k in keywords if k not in covered]
    bound = 1
    for v in groups.values():
        bound *= v
    bound *= 2 ** len(singles)
    return bound, {"groups": groups, "singles": len(singles)}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True)
    ap.add_argument("--dxbc-ledger", default="shader_extract/dxbc_ledger.json")
    ap.add_argument("--out", default="shader_extract")
    args = ap.parse_args()

    files = []
    for r in args.data.split(","):
        for dp, _, fns in os.walk(r):
            files += [os.path.join(dp, fn) for fn in fns if fn.endswith(".assets")]
    files = sorted(set(files))

    dxbc = {}
    dp = Path(args.dxbc_ledger)
    if dp.exists():
        for r in json.loads(dp.read_text(encoding="utf-8")).get("shaders", []):
            dxbc[r["name"]] = r

    rows, seen = [], set()
    for fp in files:
        env = UnityPy.load(fp)
        for o in env.objects:
            if o.type.name != "Shader":
                continue
            try:
                tt = o.read_typetree()
            except Exception:  # noqa: BLE001
                continue
            pf = tt.get("m_ParsedForm") or {}
            name = pf.get("m_Name") or ""
            if not name or (name, o.path_id) in seen:
                continue
            seen.add((name, o.path_id))
            if not (name.startswith(GAME_PREFIXES) or name in GAME_EXACT):
                continue
            kws = pf.get("m_KeywordNames") or []
            bound, info = upper_bound(kws)
            programs = dxbc.get(name, {}).get("programs")
            rows.append({
                "shader": name,
                "keywords": len(kws),
                "keyword_list": " ".join(kws),
                "platform_forced": " ".join(k for k in kws if k in PLATFORM_FORCED),
                "exclusive_groups": json.dumps(info["groups"], ensure_ascii=False),
                "single_switches": info["singles"],
                "upper_bound": bound,
                "dxbc_programs": programs,
                "cover_ratio": (round(programs / bound, 6) if programs and bound else None),
            })

    rows.sort(key=lambda r: (-r["keywords"], r["shader"]))
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    (out / "keyword_matrix.json").write_text(json.dumps({
        "shaders": len(rows),
        "max_keywords": max((r["keywords"] for r in rows), default=0),
        "rows": rows,
    }, ensure_ascii=False, indent=2), encoding="utf-8")
    with (out / "keyword_matrix.csv").open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    L = ["# 关键字矩阵（关键字全集 / 互斥组 / 理论上界 ↔ 实际段数）", "",
         f"- shader {len(rows)}，最多关键字 {max((r['keywords'] for r in rows), default=0)} 个",
         "",
         "> 读法：`理论上界` 是按互斥组展开的**可能**状态数，`实际段数` 是原版构建后真正编出来的程序数。",
         "> 两者相差很多是正常的（Unity 按平台裁剪）；关键要求是：重建支持的 keyword 名字集合不得少于",
         "> 本表的 `关键字`，且互斥组的每个分支都必须能编译出一条程序。",
         "",
         "| Shader | 关键字 | 平台强制 | 单开关 | 理论上界 | 实际段数 | 覆盖率 |",
         "|---|---:|---|---:|---:|---:|---:|"]
    for r in rows:
        L.append(f"| {r['shader']} | {r['keywords']} | {r['platform_forced'] or '—'} | "
                 f"{r['single_switches']} | {r['upper_bound']:,} | {r['dxbc_programs']} | "
                 f"{r['cover_ratio']} |")
    L += ["", "## 互斥组明细", "", "| Shader | 互斥组 |", "|---|---|"]
    for r in rows:
        if r["exclusive_groups"] != "{}":
            L.append(f"| {r['shader']} | {r['exclusive_groups']} |")
    (out / "keyword_matrix.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    print(f"shaders={len(rows)}")
    for r in rows[:5]:
        print(f"  {r['shader']}: kw={r['keywords']} bound={r['upper_bound']} program={r['dxbc_programs']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
