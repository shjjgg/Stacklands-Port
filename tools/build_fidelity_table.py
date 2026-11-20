#!/usr/bin/env python3
"""汇总 shader 保真总表: 一个 shader 一行, 把六张台账压成可验收的一列一列。

为什么需要: 现在数据散在 dxbc / signature / pass_state / variant / keyword / worklist 六张表,
验收时没人会逐张翻。总表给出"这个 shader 重建完要满足什么"的最小闭包:
  - 程序: 段数 VS/PS、阶段语义是否自证通过;
  - 顶点布局: 顶点输入数、插值通道数、VS↔PS 链接是否干净;
  - 渲染: pass 数、去重状态组合编号;
  - 关键字: 个数、平台强制项;
  - 归属: 变体族(F编号)、风险标记。

任何一列为空/异常都直接标红, 作为"这个 shader 不能开工"的硬信号。
"""
from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path


def load(p: Path) -> dict:
    return json.loads(p.read_text(encoding="utf-8")) if p.exists() else {}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--ledger", default="shader_extract")
    ap.add_argument("--out", default="shader_extract")
    args = ap.parse_args()

    L = Path(args.ledger)
    dxbc = load(L / "dxbc_ledger.json")
    sig = load(L / "signature_ledger.json")
    ps = load(L / "pass_state.json")
    kw = load(L / "keyword_matrix.json")
    var = load(L / "variant_ledger.json")
    sem = load(L / "stage_semantics.json")
    wl = load(L / "shader_worklist.json")

    dxbc_by = {r["name"]: r for r in dxbc.get("shaders", [])}
    sig_by = {r["shader"]: r for r in sig.get("rows", [])}
    kw_by = {r["shader"]: r for r in kw.get("rows", [])}
    var_by = {r["shader"]: r for r in var.get("checks", [])}

    passes_by: dict[str, list[dict]] = {}
    for r in ps.get("rows", []):
        passes_by.setdefault(r["shader"], []).append(r)

    # 状态组合编号: 用 pass_state 的去重顺序
    combo_index = {}
    for i, c in enumerate(ps.get("state_combos", []), 1):
        combo_index[c["shaderlab"]] = i

    # 阶段语义: 按 shader 汇总失败数
    sem_fail: dict[str, int] = {}
    for r in sem.get("failed", []):
        sem_fail[r["shader"]] = sem_fail.get(r["shader"], 0) + 1

    # 变体族
    fam = {}
    for g in wl.get("families", []):
        for s in (g.get("members") or g.get("shaders") or []):
            fam[s] = g.get("id")

    shaders = sorted(set(dxbc_by) | set(passes_by))
    rows = []
    for name in shaders:
        d = dxbc_by.get(name, {})
        s = sig_by.get(name, {})
        k = kw_by.get(name, {})
        v = var_by.get(name, {})
        plist = sorted(passes_by.get(name, []), key=lambda r: (r["subshader"], r["pass"]))
        combos = []
        for p in plist:
            cid = combo_index.get(p["shaderlab"])
            tag = f"{p['shader']}#{p['pass']}"
            combos.append(f"C{cid}" if cid else "?")
        problems = []
        if not d:
            problems.append("无 DXBC 数据")
        if not plist:
            problems.append("无 pass 状态")
        if sem_fail.get(name):
            problems.append(f"阶段语义失败 {sem_fail[name]} 条")
        if v and v.get("consistent") is False:
            problems.append("变体数与段数不一致")
        if s and (s.get("only_vs") or s.get("only_ps")):
            problems.append("VS↔PS 链接不干净")
        rows.append({
            "shader": name,
            "family": fam.get(name, "—"),
            "vs": d.get("stages", {}).get("VS"),
            "ps": d.get("stages", {}).get("PS"),
            "programs": d.get("programs"),
            "instancing": s.get("instancing_variant"),
            "vertex_inputs": s.get("vertex_input_count"),
            "interp_channels": s.get("interp_channels"),
            "link": "clean" if s and not (s.get("only_vs") or s.get("only_ps")) else "broken",
            "passes": len(plist),
            "state_combos": " ".join(combos),
            "keywords": k.get("keywords"),
            "platform_forced": k.get("platform_forced") or "—",
            "worklist_status": next((g.get("status") or g.get("risk") or "—"
                                     for g in wl.get("families", [])
                                     if g.get("id") == fam.get(name)), "—"),
            "risk": " | ".join(problems) if problems else "",
        })

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    (out / "fidelity_table.json").write_text(json.dumps({
        "shaders": len(rows),
        "with_risk": [r["shader"] for r in rows if r["risk"]],
        "rows": rows,
    }, ensure_ascii=False, indent=2), encoding="utf-8")
    with (out / "fidelity_table.csv").open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    total_vs = sum(r["vs"] or 0 for r in rows)
    total_ps = sum(r["ps"] or 0 for r in rows)
    L1 = ["# Shader 保真总表（一个 shader 一行的验收闭包）", "",
          f"- shader {len(rows)} / 程序 {total_vs + total_ps}（VS {total_vs} / PS {total_ps}）",
          f"- 有风险标记: {len([r for r in rows if r['risk']])} 个", "",
          "> 每一列都是重建时必须对上的硬指标。`risk` 非空的 shader 不允许开工。",
          "",
          "| Shader | 族 | VS/PS | 顶点输入 | 插值 | 链接 | pass | 状态组合 | 关键字 | 平台强制 | 风险 |",
          "|---|---|---:|---:|---:|---|---:|---|---:|---|---|"]
    for r in rows:
        L1.append(f"| {r['shader']} | {r['family']} | {r['vs']}/{r['ps']} | {r['vertex_inputs']} | "
                  f"{r['interp_channels']} | {r['link']} | {r['passes']} | {r['state_combos']} | "
                  f"{r['keywords']} | {r['platform_forced']} | {r['risk'] or '—'} |")
    (out / "fidelity_table.md").write_text("\n".join(L1) + "\n", encoding="utf-8")

    print(f"shaders={len(rows)} programs={total_vs + total_ps} risk={len([r for r in rows if r['risk']])}")
    for r in rows[:5]:
        print(f"  {r['shader']}: {r['vs']}/{r['ps']} pass={r['passes']} kw={r['keywords']} risk={r['risk'] or '-'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
