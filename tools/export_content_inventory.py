#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
配置 / 本地化 / DLC / 音频 链路盘点脚本

提取:
  - TextAsset 名称/大小/内容预览 (存档模板、字符集、换行规则、村民名、代码引用卡牌)
  - DLC UnityFS bundle 内部对象类型统计与样例名称
  - AudioMixer 控制器 / 分组 / 快照

用法:
  python3 export_content_inventory.py --data <assets目录,逗号分隔> \
      --bundles <bundle文件,逗号分隔> --out <输出目录>
"""
import argparse, os, re, json, datetime, collections

try:
    import UnityPy
except ImportError:
    raise SystemExit("[FATAL] 需要 UnityPy: pip install UnityPy")


def find_assets(root):
    out = []
    for dp, _, fns in os.walk(root):
        for fn in fns:
            if fn.endswith(".assets"):
                out.append(os.path.join(dp, fn))
    return sorted(out)


def text_body(d):
    b = getattr(d, "m_Script", None) or getattr(d, "text", None) or b""
    if isinstance(b, str):
        b = b.encode("utf-8", "ignore")
    return bytes(b)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", default="")
    ap.add_argument("--bundles", default="")
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    assets = []
    for r in filter(None, args.data.split(",")):
        assets += find_assets(r)
    bundles = [b for b in filter(None, args.bundles.split(","))]

    text_assets = []
    mixers = []
    for fp in sorted(set(assets)):
        env = UnityPy.load(fp)
        for o in env.objects:
            try:
                d = o.read()
            except Exception:
                continue
            if o.type.name == "TextAsset":
                body = text_body(d)
                text_assets.append({
                    "name": getattr(d, "m_Name", ""),
                    "source": os.path.basename(fp),
                    "size": len(body),
                    "preview": body[:160].decode("utf-8", "replace").replace("\n", " "),
                })
            elif o.type.name in ("AudioMixerController", "AudioMixerGroupController",
                                 "AudioMixerSnapshotController"):
                mixers.append({
                    "type": o.type.name,
                    "name": getattr(d, "m_Name", ""),
                    "source": os.path.basename(fp),
                })

    dlc = []
    for bp in bundles:
        env = UnityPy.load(bp)
        agg = collections.Counter()
        samples = collections.defaultdict(list)
        for o in env.objects:
            agg[o.type.name] += 1
            if len(samples[o.type.name]) < 8:
                try:
                    d = o.read(); n = getattr(d, "m_Name", "")
                    if n: samples[o.type.name].append(str(n))
                except Exception:
                    pass
        dlc.append({
            "bundle": os.path.basename(bp),
            "type_counts": dict(agg.most_common()),
            "samples": {k: v for k, v in samples.items()},
        })

    report = {
        "scanned_at": datetime.datetime.now().isoformat(timespec="seconds"),
        "text_assets": sorted(text_assets, key=lambda x: x["name"]),
        "mixers": mixers,
        "dlc_bundles": dlc,
    }
    os.makedirs(args.out, exist_ok=True)
    with open(os.path.join(args.out, "content_inventory.json"), "w", encoding="utf-8") as f:
        json.dump(report, f, ensure_ascii=False, indent=2)

    L = ["# 配置 / 本地化 / DLC / 音频 盘点\n",
         f"- 扫描时间: {report['scanned_at']}\n"]

    L.append("## TextAsset\n")
    L.append("| 名称 | 大小(B) | 来源 | 预览 |")
    L.append("|---|---:|---|---|")
    for t in report["text_assets"]:
        pv = t["preview"].replace("|", "/")[:80]
        L.append(f"| {t['name']} | {t['size']} | {t['source']} | {pv} |")

    L.append("\n## 音频混音器\n")
    for m in mixers:
        L.append(f"- {m['type']}: `{m['name']}`")

    L.append("\n## DLC Bundle\n")
    for b in dlc:
        L.append(f"### {b['bundle']}")
        L.append("| 类型 | 数量 |")
        L.append("|---|---:|")
        for t, c in b["type_counts"].items():
            L.append(f"| {t} | {c} |")
        for t, ss in b["samples"].items():
            L.append(f"- {t} 样例: {', '.join(ss[:6])}")
        L.append("")

    with open(os.path.join(args.out, "content_inventory.md"), "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    print(f"[OK] TextAsset {len(text_assets)}, Mixer {len(mixers)}, DLC {len(dlc)} -> {args.out}")


if __name__ == "__main__":
    main()
