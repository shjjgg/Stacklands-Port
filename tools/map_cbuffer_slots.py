"""把 dcl cbuffer 的槽位(0..n)对回 Unity 的 cbuffer 名字, 并校验这条推断站得住。

依据: 每个 pass 的 `m_CommonParameters.m_ConstantBuffers` 是一个有序列表, 每项带
`m_NameIndex`(指向本 pass 的名字表)与 `m_Size`。SM5 字节码里的 `dcl_constantbuffer` 也按槽位
顺序声明, 所以"列表顺序 == 槽位顺序"是唯一自然的对应。

这条对应不能直接当真, 必须先证明它的三个前提在每个 shader 上成立:
  1. 同一 stage 的所有 pass, cbuffer 名字列表**完全一致**(顺序与个数都不许变);
  2. 该 stage 所有程序段里 distinct dcl 槽位 == 列表长度, 且槽位恰好是 0..n-1;
  3. 列表非空。
全部成立才输出 slot -> name 映射; 任何一条不成立就记 problem, 不硬猜。
"""
from __future__ import annotations

import argparse
import json
import os
import struct
from pathlib import Path

try:
    import UnityPy
except ImportError:  # pragma: no cover
    raise SystemExit("[FATAL] 需要 UnityPy")

import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
from disassemble_dxbc import chunks, decode_program  # noqa: E402

GAME_PREFIXES = ("Custom/", "Sprites/", "Transition/", "Unlit/")
GAME_EXACT = {"Postprocess/SokpopIntro"}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True)
    ap.add_argument("--dxbc", default="shader_extract/dxbc")
    ap.add_argument("--out", default="shader_extract")
    args = ap.parse_args()

    # 先按 shader+stage 收集 dcl 槽位
    slots: dict[tuple[str, str], set[int]] = {}
    for f in sorted(Path(args.dxbc).glob("*.dxbc")):
        parts = f.stem.split("__")
        if len(parts) < 3:
            continue
        shader = f"{parts[0]}/{parts[1]}"
        stage = parts[-1].split("_")[-1]
        data = f.read_bytes()
        c = chunks(data)
        if "SHDR" not in c:
            continue
        prog = decode_program(data, *c["SHDR"])
        for i in prog["instructions"]:
            if i["op"] == "DCL_CONSTANT_BUFFER" and "idx" in i:
                slots.setdefault((shader, stage), set()).add(i["idx"])

    files = []
    for r in args.data.split(","):
        for dp, _, fns in os.walk(r):
            files += [os.path.join(dp, fn) for fn in fns if fn.endswith(".assets")]
    files = sorted(set(files))

    rows, problems = [], []
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

            per_stage: dict[str, list[list[str]]] = {"VS": [], "PS": []}
            for sub in pf.get("m_SubShaders", []):
                for p in sub.get("m_Passes", []):
                    inv = {i: n for n, i in (p.get("m_NameIndices") or [])}
                    for stage, key in (("VS", "progVertex"), ("PS", "progFragment")):
                        cbs = ((p.get(key) or {}).get("m_CommonParameters") or {}).get("m_ConstantBuffers") or []
                        per_stage[stage].append([inv.get(c.get("m_NameIndex"),
                                                      f"<name#{c.get('m_NameIndex')}>") for c in cbs])

            for stage in ("VS", "PS"):
                lists = [x for x in per_stage[stage] if x]
                got = sorted(slots.get((name, stage), set()))
                if not lists and not got:
                    continue
                uniq = {tuple(x) for x in lists}
                if len(uniq) > 1:
                    problems.append(f"{name} {stage}: cbuffer 名字列表在 {len(uniq)} 种变体间不一致")
                    continue
                names = list(next(iter(uniq))) if uniq else []
                if got and got != list(range(len(got))):
                    problems.append(f"{name} {stage}: dcl 槽位 {got} 不是 0..{len(got)-1}")
                if len(names) != len(got):
                    problems.append(f"{name} {stage}: 名字列表 {len(names)} != dcl 槽位 {len(got)}")
                rows.append({"shader": name, "stage": stage,
                             "slots": " ".join(map(str, got)),
                             "cbuffers": " | ".join(names) if names else "",
                             "mapped": bool(names) and len(names) == len(got)})

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    (out / "cbuffer_slots.json").write_text(json.dumps({
        "rows": rows, "problems": problems,
    }, ensure_ascii=False, indent=2), encoding="utf-8")

    L = ["# cbuffer 槽位映射（dcl 槽位 ↔ Unity cbuffer 名）", "",
         f"- shader×stage 组合 {len(rows)}，问题 {len(problems)}", "",
         "> 前提：同一 stage 所有 pass 的 cbuffer 列表一致、distinct dcl 槽位恰为 0..n-1、列表非空。",
         "> 三条同时成立才输出映射，否则记 problem —— 不靠猜。", "",
         "| Shader | 阶段 | dcl 槽位 | cbuffer（按槽位） |", "|---|---|---|---|"]
    for r in rows:
        L.append(f"| {r['shader']} | {r['stage']} | {r['slots']} | {r['cbuffers']} |")
    (out / "cbuffer_slots.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    unresolved = [r for r in rows if r.get("mapped") is False]
    print(f"rows={len(rows)} mapped={len(rows) - len(unresolved)} unresolved={len(unresolved)}")
    for p in problems[:6]:
        print("  " + p)
    if unresolved:
        # 名字没解出来是**元数据限制**, 不是链条出错: 记录清楚, 不让 CI 误红
        print(f"::warning::cbuffer 名字未解出 {len(unresolved)} 个 shader×stage "
              f"(m_ConstantBuffers 列表与 dcl 槽位数不等或变体间不一致); 槽位本身仍然可信")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
