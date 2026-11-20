#!/usr/bin/env python3
"""导出每个 pass 的变体预算, 并与 DXBC 切片结果互相校验。

为什么需要: 重建时最容易"看起来对"但其实少东西的地方是**变体数量**。
原版 pass 的 `m_PlayerSubPrograms` 记录了该 pass 每个阶段的变体清单(按 blob index);
如果重建后关键字组合产生的变体数少于原版, 说明有 keyword 被吃掉, 运行时就会"某个状态下渲染错/粉色"。

这个脚本做两件事:
  1. 从 Shader 的 typetree 精确统计: 每个 pass 的 VS/PS 变体数、blob index、program mask、是否实例化变体;
  2. 与 `dxbc_ledger.json`(实际切出来的 DXBC 程序数)对账 —— 逐 shader 比较总和,
     相等才说明切片没丢程序; 不等就是链条有洞, 必须查。

用法:
  python3 tools/extract_variants.py --data <assets目录> --dxbc-ledger shader_extract/dxbc_ledger.json --out shader_extract
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
    raise SystemExit("[FATAL] 需要 UnityPy: pip install UnityPy")

STAGE_KEYS = [("VS", "progVertex"), ("PS", "progFragment"), ("GS", "progGeometry"),
              ("HS", "progHull"), ("DS", "progDomain")]
GAME_PREFIXES = ("Custom/", "Sprites/", "Transition/", "Unlit/")
GAME_EXACT = {"Postprocess/SokpopIntro"}


def variant_indices(prog: dict) -> list[int]:
    """m_PlayerSubPrograms 是 [平台级][变体级][...]; 取出该阶段所有 blob index。"""
    out = []
    for level in prog.get("m_PlayerSubPrograms") or []:
        for entry in level or []:
            if isinstance(entry, dict) and "m_BlobIndex" in entry:
                out.append(entry["m_BlobIndex"])
    return out


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

    rows = []
    per_shader: dict[str, dict[str, int]] = {}
    per_shader_passes: dict[str, dict[str, int]] = {}
    seen = set()

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

            counts = per_shader.setdefault(name, {"VS": 0, "PS": 0, "passes": 0})
            pstats = per_shader_passes.setdefault(name, {"passes": 0, "instancing_passes": 0})
            for sub in pf.get("m_SubShaders", []):
                for pass_data in sub.get("m_Passes", []):
                    counts["passes"] += 1
                    pstats["passes"] += 1
                    instancing = bool(pass_data.get("m_HasInstancingVariant"))
                    if instancing:
                        pstats["instancing_passes"] += 1
                    stage_counts = {}
                    for label, key in STAGE_KEYS:
                        idx = variant_indices(pass_data.get(key) or {})
                        if idx:
                            stage_counts[label] = len(idx)
                    for label in ("VS", "PS"):
                        counts[label] += stage_counts.get(label, 0)
                    rows.append({
                        "shader": name,
                        "pass": pass_data.get("m_Name") or "",
                        "program_mask": pass_data.get("m_ProgramMask"),
                        "instancing_variant": instancing,
                        "vs_variants": stage_counts.get("VS", 0),
                        "ps_variants": stage_counts.get("PS", 0),
                        "other_stages": json.dumps({k: v for k, v in stage_counts.items()
                                                    if k not in ("VS", "PS")}),
                    })

    # 与 DXBC 切片对账：切片出来多少段, typetree 说应该有多少段
    dxbc = {}
    dp = Path(args.dxbc_ledger)
    if dp.exists():
        for r in json.loads(dp.read_text(encoding="utf-8")).get("shaders", []):
            dxbc[r["name"]] = r

    checks = []
    for name, c in sorted(per_shader.items()):
        d = dxbc.get(name)
        rec = {"shader": name, "passes": c["passes"],
               "vs_variants": c["VS"], "ps_variants": c["PS"],
               "dxbc_programs": d["programs"] if d else None,
               "dxbc_vs": (d["stages"].get("VS", 0) if d else None),
               "dxbc_ps": (d["stages"].get("PS", 0) if d else None),
               "instancing_passes": per_shader_passes[name]["instancing_passes"],
               "consistent": (d is not None and c["VS"] == d["stages"].get("VS", 0)
                              and c["PS"] == d["stages"].get("PS", 0))}
        checks.append(rec)

    mismatch = [c["shader"] for c in checks if c["dxbc_programs"] is not None and not c["consistent"]]
    missing_dxbc = [c["shader"] for c in checks if c["dxbc_programs"] is None]

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    (out / "variant_ledger.json").write_text(json.dumps({
        "shaders": len(checks),
        "passes": len(rows),
        "consistent": sum(1 for c in checks if c["consistent"]),
        "mismatch": mismatch,
        "missing_dxbc": missing_dxbc,
        "checks": checks,
        "passes_detail": rows,
    }, ensure_ascii=False, indent=2), encoding="utf-8")

    with (out / "variant_ledger.csv").open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    L = ["# 变体预算台账（typetree ↔ DXBC 对账）", "",
         f"- shader {len(checks)} / pass {len(rows)}",
         f"- 对账一致: {sum(1 for c in checks if c['consistent'])}/{len(checks)}",
         f"- 不一致: {', '.join(mismatch) or '无'}；缺 DXBC: {', '.join(missing_dxbc) or '无'}",
         "",
         "> 判据：`typetree 变体数 == DXBC 切出的程序数`。相等说明切片没丢程序；",
         "> 不等说明链条有洞（切片漏段或 typetree 读错），必须先查清再谈重建。",
         "",
         "| Shader | pass | VS 变体 | PS 变体 | DXBC 段(VS/PS) | 实例化 pass | 对账 |",
         "|---|---|---:|---:|---:|---:|---|"]
    for c in checks:
        L.append(f"| {c['shader']} | {c['passes']} | {c['vs_variants']} | {c['ps_variants']} | "
                 f"{c['dxbc_programs']} ({c['dxbc_vs']}/{c['dxbc_ps']}) | {c['instancing_passes']} | "
                 f"{'一致' if c['consistent'] else ('缺 DXBC' if c['dxbc_programs'] is None else '不一致')} |")
    L += ["", "## 逐 pass 变体明细", "",
          "| Shader | Pass | ProgramMask | VS | PS | 其他阶段 | 实例化 |",
          "|---|---|---:|---:|---:|---|---|"]
    for r in rows:
        L.append(f"| {r['shader']} | {r['pass'] or '—'} | {r['program_mask']} | {r['vs_variants']} | "
                 f"{r['ps_variants']} | {r['other_stages']} | {r['instancing_variant']} |")
    (out / "variant_ledger.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    print(f"shaders={len(checks)} passes={len(rows)} consistent={sum(1 for c in checks if c['consistent'])}")
    for c in checks[:6]:
        print(f"  {c['shader']}: typetree VS/PS={c['vs_variants']}/{c['ps_variants']} "
              f"dxbc={c['dxbc_vs']}/{c['dxbc_ps']} -> {'一致' if c['consistent'] else '不一致'}")
    if mismatch:
        print(f"::warning::变体数与 DXBC 段数不一致: {mismatch}")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
