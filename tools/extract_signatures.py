#!/usr/bin/env python3
"""解析 DXBC 的 ISGN/OSGN 签名块: 拿到原版每条程序的输入/输出语义与寄存器布局。

用途(保真链最容易翻车的地方):
  - **顶点输入布局**: 原版 VS 到底吃哪些属性(POSITION/NORMAL/TANGENT/TEXCOORDn/COLOR)、
    放在哪些寄存器、各分量掩码是什么。重建的 HLSL 必须一字不差地声明同样的 struct,
    否则 mesh 数据流错位 → 顶点乱飞/全黑, 而这种错不会报编译错误。
  - **VS 输出 ↔ PS 输入 链接**: 两边 (语义, 索引, 寄存器) 必须对得上。这里做对称差检查,
    原版应当零差异; 重建时任何新增/丢失通道都会表现为插值错乱或粉色。

字节码里没有 RDEF(Unity 剥了反射), 所以拿不到资源名; 但签名块是完整保留的, 可以精确解析。

用法:
  python3 tools/extract_signatures.py --dxbc shader_extract/dxbc --out shader_extract
"""
from __future__ import annotations

import argparse
import csv
import json
import struct
from pathlib import Path

COMPONENT = {0: "unknown", 1: "uint", 2: "sint", 3: "float"}
STAGE_TOKEN = {0: "PS", 1: "VS", 2: "GS", 3: "HS", 4: "DS", 5: "CS"}


def chunks(data: bytes) -> dict[str, tuple[int, int]]:
    count = struct.unpack_from("<I", data, 28)[0]
    offs = struct.unpack_from(f"<{count}I", data, 32)
    out: dict[str, tuple[int, int]] = {}
    for o in offs:
        out[data[o:o + 4].decode("latin1")] = (o + 8, struct.unpack_from("<I", data, o + 4)[0])
    return out


def parse_signature(data: bytes, payload_off: int, size: int) -> list[dict]:
    """ISGN/OSGN: count(4) + strtab_off(4 在 +8) + 每元素 24B(6 dword); name 偏移是 payload 内绝对偏移。"""
    p = data[payload_off:payload_off + size]
    count = struct.unpack_from("<I", p, 0)[0]
    elements = []
    for i in range(count):
        no, sem_idx, sysval, comp, reg, mask = struct.unpack_from("<6I", p, 8 + i * 24)
        name = p[no:].split(b"\x00")[0].decode("latin1", "ignore") if no < len(p) else ""
        elements.append({
            "name": name,
            "index": sem_idx,
            "sysval": sysval,
            "component": COMPONENT.get(comp, str(comp)),
            "register": reg,
            "mask": mask & 0xFF,
            "rw_mask": (mask >> 8) & 0xFF,
        })
    return elements


def label(el: dict) -> str:
    return f"{el['name']}{el['index'] if el['index'] else ''}@r{el['register']}"


def key(el: dict) -> tuple:
    return (el["name"], el["index"], el["register"])


def stage_of(path: Path) -> str:
    parts = path.stem.split("__")
    return parts[-1].split("_")[-1] if parts else "?"


def shader_of(path: Path) -> str:
    """Custom__ArrowSdfShader__00_VS → Custom/ArrowSdfShader

    文件名是 sanitize(name) 的结果(把 '/' 换成 '__'), 后面再拼 '__<idx>_<stage>',
    所以前两段才是 shader 名, 末段是序号+阶段。只取第 0 段会把整族混成一个 "Custom"。
    """
    parts = path.stem.split("__")
    if len(parts) >= 3:
        return parts[0] + "/" + parts[1]
    return path.stem


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dxbc", default="shader_extract/dxbc")
    ap.add_argument("--out", default="shader_extract")
    args = ap.parse_args()

    files = sorted(Path(args.dxbc).glob("*.dxbc"))
    if not files:
        print(f"::error::{args.dxbc} 下没有 .dxbc, 先跑 extract_dxbc_programs.py")
        return 1

    shaders: dict[str, dict] = {}
    for f in files:
        data = f.read_bytes()
        if data[:4] != b"DXBC":
            print(f"::warning::跳过非法文件 {f.name}")
            continue
        st = stage_of(f)
        name = shader_of(f)
        c = chunks(data)
        rec = shaders.setdefault(name, {"name": name, "programs": [], "vs_inputs": [],
                                        "vs_outputs": [], "ps_inputs": [], "ps_outputs": [],
                                        "problems": []})
        rec["programs"].append({"file": f.name, "stage": st,
                                "has_isgn": "ISGN" in c, "has_osgn": "OSGN" in c})
        if "ISGN" in c:
            sig_in = parse_signature(data, *c["ISGN"])
            rec["vs_inputs" if st == "VS" else "ps_inputs"].append(sig_in)
        if "OSGN" in c:
            sig_out = parse_signature(data, *c["OSGN"])
            rec["vs_outputs" if st == "VS" else "ps_outputs"].append(sig_out)

    rows = []
    for name, rec in sorted(shaders.items()):
        # 顶点输入: 取所有 VS 程序里的并集(变体之间输入布局应当一致)
        vin_union: dict[tuple, dict] = {}
        for sig in rec["vs_inputs"]:
            for el in sig:
                vin_union[key(el)] = el
        vin = sorted(vin_union.values(), key=lambda e: (e["register"], e["index"]))

        # VS 输出 / PS 输入: 取并集, 再做对称差(应当为空)
        vs_out = {key(e): e for sig in rec["vs_outputs"] for e in sig}
        ps_in = {key(e): e for sig in rec["ps_inputs"] for e in sig}
        only_vs = sorted(set(vs_out) - set(ps_in))
        only_ps = sorted(set(ps_in) - set(vs_out))

        # 同一 shader 内 VS 输入布局应当一致。SV_InstanceID / SV_VertexID 会按变体增减(实例化变体),
        # 属合法差异, 比较时排除; 排除后仍不一致才是真的 vertex struct 混用。
        layouts = {tuple(sorted((e["name"], e["index"], e["register"], e["mask"])
                                for e in sig if not e["name"].startswith("SV_")))
                   for sig in rec["vs_inputs"]}
        has_sv = any(e["name"].startswith("SV_") for sig in rec["vs_inputs"] for e in sig)
        if has_sv:
            rec["instancing_variant"] = True
        if len(layouts) > 1:
            rec["problems"].append(f"VS 输入布局在 {len(layouts)} 种变体间不一致(SV_* 已排除)")

        mask_mismatch = []
        for k in set(vs_out) & set(ps_in):
            if vs_out[k]["mask"] != ps_in[k]["mask"]:
                mask_mismatch.append(f"{label(vs_out[k])} VS写{vs_out[k]['mask']:x}/PS读{ps_in[k]['mask']:x}")

        rows.append({
            "shader": name,
            "programs": len(rec["programs"]),
            "vs": sum(1 for p in rec["programs"] if p["stage"] == "VS"),
            "ps": sum(1 for p in rec["programs"] if p["stage"] == "PS"),
            "vertex_inputs": " | ".join(label(e) + f":{e['component']}" for e in vin),
            "vertex_input_count": len(vin),
            "interp_channels": len(vs_out),
            "instancing_variant": "yes" if rec.get("instancing_variant") else "no",
            "only_vs": " | ".join(label(vs_out[k]) for k in only_vs),
            "only_ps": " | ".join(label(ps_in[k]) for k in only_ps),
            "mask_mismatch": " | ".join(mask_mismatch),
            "problems": " | ".join(rec["problems"]),
        })

    out = Path(args.out)
    led = {"shaders": len(rows),
           "linkage_clean": sum(1 for r in rows if not r["only_vs"] and not r["only_ps"]),
           "with_problems": [r["shader"] for r in rows if r["problems"] or r["mask_mismatch"] or r["only_ps"] or r["only_vs"]],
           "rows": rows}
    (out / "signature_ledger.json").write_text(json.dumps(led, ensure_ascii=False, indent=2), encoding="utf-8")
    with (out / "signature_ledger.csv").open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0].keys()))
        w.writeheader()
        w.writerows(rows)

    L = ["# Shader 输入/输出签名台账", "",
         f"- shader: {led['shaders']}，VS↔PS 链接干净: {led['linkage_clean']}",
         f"- 存在问题: {', '.join(led['with_problems']) or '无'}", "",
         "| Shader | 程序 | VS | PS | 顶点输入(寄存器:类型) | 插值通道 | 实例化变体 | 仅VS | 仅PS | 掩码不一致 | 问题 |",
         "|---|---:|---:|---:|---|---:|---|---|---|---|---|"]
    for r in rows:
        cell = lambda v: (v or "—").replace(" | ", "、")
        L.append(f"| {r['shader']} | {r['programs']} | {r['vs']} | {r['ps']} | {cell(r['vertex_inputs'])} | "
                 f"{r['interp_channels']} | {r['instancing_variant']} | {cell(r['only_vs'])} | {cell(r['only_ps'])} | "
                 f"{cell(r['mask_mismatch'])} | {cell(r['problems'])} |")
    L.append("")
    L.append("> 重建判据：`vertex_inputs` 必须与重建 shader 的 `struct appdata` 完全一致（语义/索引/寄存器/掩码）；")
    L.append("> `仅VS`/`仅PS` 非空即链接断裂（原版应为空），重建后出现同类问题就是插值错乱或粉色块的根因。")
    (out / "signature_ledger.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    print(f"shaders={led['shaders']} linkage_clean={led['linkage_clean']} "
          f"problems={len(led['with_problems'])}")
    for r in rows[:6]:
        print(f"  {r['shader']}: vin={r['vertex_input_count']} {r['vertex_inputs']} interp={r['interp_channels']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
