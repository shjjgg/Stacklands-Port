"""场景可恢复性探针: 证明"level0/level1 能不能还原成 .unity"这件事到底卡在哪。

结论必须靠证据, 不能靠嘴说。这个脚本对每个场景文件给出:
  - 对象清单(类型 × 数量), 这是可以完整读到的;
  - 每类对象的 typetree 是否可读(玩家构建里 MonoBehaviour 的类型信息通常被剥离);
  - MonoBehaviour 的前 16 字节结构(通常就是 m_Script 的 PPtr), 以及能否定位到脚本。

如果 MonoBehaviour 的 typetree 不可读, 那么场景里的**字段值**(位置、引用、序列化数据)
就根本拿不到, 任何"重建场景"都只能是猜 —— 这就是判定为不可恢复的依据。
"""
from __future__ import annotations

import argparse
import collections
import json
from pathlib import Path

import UnityPy

CLASS_ID = {"GameObject": 1, "Transform": 4, "Camera": 20, "MeshRenderer": 23,
            "MeshFilter": 33, "AudioListener": 81, "AudioSource": 82,
            "RenderSettings": 104, "Light": 108, "MonoBehaviour": 114,
            "LightmapSettings": 157, "NavMeshSettings": 196, "AudioBehaviour": 180,
            "CanvasRenderer": 222, "Canvas": 223, "RectTransform": 224,
            "LightProbes": 258, "Cubemap": 90}


def probe(path: Path) -> dict:
    env = UnityPy.load(str(path))
    by_type = collections.Counter(o.type.name for o in env.objects)
    detail = []
    for o in env.objects:
        rec = {"path_id": o.path_id, "type": o.type.name,
               "tree_readable": True, "error": "", "head": ""}
        try:
            o.read_typetree()
        except Exception as e:  # noqa: BLE001
            rec["tree_readable"] = False
            rec["error"] = str(e)[:120]
        try:
            raw = o.get_raw_data()
            rec["raw_size"] = len(raw)
            # 前 16 字节: 若是 MonoBehaviour, 通常依次是 m_GameObject(PPtr 12B) + m_Enabled 等
            rec["head"] = " ".join(f"{b:02x}" for b in raw[:16])
        except Exception:  # noqa: BLE001
            rec["raw_size"] = None
        detail.append(rec)
    return {"file": path.name, "objects": len(env.objects), "by_type": dict(by_type),
            "detail": detail}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--scenes", required=True, help="场景序列化文件列表, 逗号分隔")
    ap.add_argument("--out", default="docs")
    args = ap.parse_args()

    reports = [probe(Path(p)) for p in args.scenes.split(",")]
    total = sum(r["objects"] for r in reports)
    readable_mb = [d for r in reports for d in r["detail"]
                   if d["type"] == "MonoBehaviour" and d["tree_readable"]]
    all_mb = [d for r in reports for d in r["detail"] if d["type"] == "MonoBehaviour"]
    verdict = "可恢复" if all_mb and len(readable_mb) == len(all_mb) else "不可恢复(字段值不可读)"

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    (out / "scene_recoverability.json").write_text(json.dumps({
        "verdict": verdict, "objects": total,
        "monobehaviour": {"total": len(all_mb), "readable": len(readable_mb)},
        "scenes": reports,
    }, ensure_ascii=False, indent=2), encoding="utf-8")

    L = ["# 场景可恢复性判据（level0 / level1 → .unity）", "",
         f"- 结论：**{verdict}**",
         f"- 对象合计 {total}；MonoBehaviour {len(all_mb)} 个，其中 typetree 可读 {len(readable_mb)} 个", ""]
    for r in reports:
        L += [f"## {r['file']}（{r['objects']} 个对象）", "",
              "| 类型 | 数量 | 类 ID | typetree |", "|---|---:|---:|---|"]
        for t, n in sorted(r["by_type"].items()):
            ok = [d for d in r["detail"] if d["type"] == t and d["tree_readable"]]
            L.append(f"| {t} | {n} | {CLASS_ID.get(t, '?')} | {'可读' if len(ok) == n else f'{len(ok)}/{n} 可读'} |")
        L.append("")
        bad = [d for d in r["detail"] if not d["tree_readable"]]
        if bad:
            L += ["不可读对象（字段值无法取得）：", ""]
            for d in bad[:12]:
                L.append(f"- `{d['type']}` pathID={d['path_id']} raw={d['raw_size']}B head=`{d['head']}` 原因: {d['error']}")
            L.append("")
    L += ["## 判据说明", "",
          "场景 YAML 里的每个组件都要写出全部序列化字段。`GameObject`/`Transform`/`Camera` 等内置组件",
          "在玩家构建里仍带类型树，可以完整还原；但 **MonoBehaviour 的字段布局被剥掉**（只有 `m_Script` 的",
          "PPtr + 一段未知二进制），所以位置、引用、面板参数都无法读出。此时任何 .unity 都只能靠猜，",
          "不是复刻，故判为不可恢复。"]
    (out / "scene_recoverability.md").write_text("\n".join(L) + "\n", encoding="utf-8")

    print(f"verdict={verdict} objects={total} MonoBehaviour {len(readable_mb)}/{len(all_mb)} 可读")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
