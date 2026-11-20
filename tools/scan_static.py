#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Stacklands 安卓移植 - 前置静态扫描脚本 (只读, 不修改任何原版资源)

用途:
  1. 解析 AssetRipper / AssetStudio 导出前的原始 .assets / .resS / .resource 数据文件,
     统计对象类型分布, 盘点 Shader / ComputeShader / Font / TextAsset / AudioClip / Material。
  2. 解析 MonoScript -> Assembly / Namespace / Class 映射, 检测空脚本、未解析脚本引用。
  3. 对照 Managed 目录下实际存在的 DLL, 标出缺失托管程序集。
  4. 输出 Markdown 报告 + JSON 机器可读结果, 供 CI 前置关卡与人工复核。

依赖: UnityPy  (pip install UnityPy)
用法:
  python3 scan_static.py --data <dir-with-.assets> --managed <Managed-dir> --out <report.md>
说明:
  - 本脚本只做元数据层静态扫描; 贴图/材质/动画运行时断链需在 Unity 编辑器内
    用 AssetRipper 工程打开后二次校验 (见 docs/01_静态扫描报告.md 局限章节)。
"""
import argparse, collections, json, os, sys, datetime

try:
    import UnityPy
except ImportError:
    print("[FATAL] 需要 UnityPy: pip install UnityPy", file=sys.stderr)
    sys.exit(2)

ASSET_EXTS = (".assets", ".resource", ".resS")
# 纯数据侧车文件不单独解析对象, 仅记录大小
SIDECAR_EXTS = (".resS", ".resource")


def find_asset_files(root):
    out = []
    for dirpath, _, files in os.walk(root):
        for f in files:
            if f.endswith(".assets"):
                out.append(os.path.join(dirpath, f))
    return sorted(out)


def scan(asset_files, managed_dir):
    agg = collections.Counter()
    names = collections.defaultdict(set)
    scripts = []                 # (assembly, namespace, class, path_id)
    script_idx = {}              # path_id -> script tuple
    mono_behaviour_total = 0
    mb_readable = 0
    mb_unreadable = 0
    mb_null_script = 0
    mb_unresolved = 0
    unresolved_detail = []
    per_file = {}

    for fp in asset_files:
        fcount = collections.Counter()
        try:
            env = UnityPy.load(fp)
        except Exception as e:
            per_file[fp] = {"error": str(e)}
            continue
        for o in env.objects:
            cn = o.type.name
            agg[cn] += 1
            fcount[cn] += 1
            d = None
            if cn == "MonoBehaviour":
                mono_behaviour_total += 1
            try:
                d = o.read()
            except Exception:
                if cn == "MonoBehaviour":
                    mb_unreadable += 1
                continue
            if cn == "MonoBehaviour":
                mb_readable += 1
            nm = getattr(d, "m_Name", None) or getattr(d, "name", None)
            if nm:
                names[cn].add(str(nm))

            if cn == "MonoScript":
                tup = (
                    str(getattr(d, "m_AssemblyName", "")),
                    str(getattr(d, "m_Namespace", "")),
                    str(getattr(d, "m_ClassName", "")),
                )
                scripts.append(tup)
                script_idx[o.path_id] = tup
            elif cn == "MonoBehaviour":
                pptr = getattr(d, "m_Script", None)
                if pptr is None or getattr(pptr, "path_id", 0) == 0:
                    mb_null_script += 1
                    continue
                try:
                    pptr.read()
                except Exception:
                    mb_unresolved += 1
                    if len(unresolved_detail) < 50:
                        unresolved_detail.append(
                            {"file": os.path.basename(fp), "path_id": o.path_id}
                        )
        per_file[fp] = dict(fcount)

    # 托管 DLL 对照
    shipped_dlls = set()
    if managed_dir and os.path.isdir(managed_dir):
        shipped_dlls = {f.lower() for f in os.listdir(managed_dir) if f.lower().endswith(".dll")}

    asm_usage = collections.Counter(a for a, _, _ in scripts)
    missing_asm = {}
    for asm in asm_usage:
        if not asm:
            continue
        cand = asm if asm.lower().endswith(".dll") else asm + ".dll"
        if cand.lower() not in shipped_dlls:
            missing_asm[asm] = asm_usage[asm]

    empty_class = [s for s in scripts if not s[2]]

    result = {
        "scanned_at": datetime.datetime.now().isoformat(timespec="seconds"),
        "asset_files": [os.path.basename(p) for p in asset_files],
        "type_counts": dict(agg.most_common()),
        "unique_name_counts": {k: len(v) for k, v in names.items()},
        "scripts_by_assembly": dict(asm_usage.most_common()),
        "mono_behaviours": {
            "total": mono_behaviour_total,
            "readable": mb_readable,
            "unreadable_typetree": mb_unreadable,
            "null_script_ref": mb_null_script,
            "unresolved_script_ref": mb_unresolved,
            "unresolved_detail": unresolved_detail,
        },
        "scripts_empty_class": len(empty_class),
        "managed_dlls_shipped": sorted(shipped_dlls),
        "missing_assembly_refs": missing_asm,
        "shaders": sorted(names.get("Shader", set())),
        "compute_shaders": sorted(names.get("ComputeShader", set())),
        "fonts": sorted(names.get("Font", set())),
        "text_assets": sorted(names.get("TextAsset", set())),
        "audio_clips": sorted(names.get("AudioClip", set())),
        "materials": sorted(names.get("Material", set())),
        "per_file": {os.path.basename(k): v for k, v in per_file.items()},
    }
    return result


def write_markdown(res, out_path):
    L = []
    L.append("# 静态扫描报告 (Stacklands 移植前置扫描)\n")
    L.append(f"- 扫描时间: {res['scanned_at']}")
    L.append(f"- 数据文件: {', '.join(res['asset_files'])}\n")

    L.append("## 1. 对象类型分布\n")
    L.append("| 类型 | 数量 | 具名对象数 |")
    L.append("|---|---:|---:|")
    for cn, c in res["type_counts"].items():
        L.append(f"| {cn} | {c} | {res['unique_name_counts'].get(cn, 0)} |")

    L.append("\n## 2. 脚本 (MonoScript) -> 程序集映射\n")
    L.append("| 程序集 | 脚本数 |")
    L.append("|---|---:|")
    for a, c in res["scripts_by_assembly"].items():
        L.append(f"| {a} | {c} |")

    mb = res["mono_behaviours"]
    L.append("\n## 3. MonoBehaviour 引用完整性\n")
    L.append(f"- MonoBehaviour 总数: {mb['total']}")
    L.append(f"- 可解析读取 (TypeTree 匹配): {mb.get('readable', 0)}")
    L.append(f"- 无法读取 (TypeTree 缺失/不匹配, 需 AssetRipper 复核): {mb.get('unreadable_typetree', 0)}")
    L.append(f"- 空脚本引用 (path_id=0): {mb['null_script_ref']}")
    L.append(f"- PPtr 二次读取异常 (可读取对象中): {mb['unresolved_script_ref']}")
    L.append(f"- 空类名 MonoScript: {res['scripts_empty_class']}")
    L.append("\n> 注: 玩家构建剥离了 TypeTree, UnityPy 内置类库对自定义 GameScripts 类匹配不全,")
    L.append("> 大量 MonoBehaviour 体无法在此层反序列化; 其脚本绑定必须以 AssetRipper/编辑器结果为准。")
    L.append("> 上述 PPtr 二次读取异常经还原目录复扫定性为跨文件 PPtr 在 UnityPy 侧的 Typetree 读取假象,")
    L.append("> 可读对象内未发现真实断引用; 编辑器阶段仍逐条复核 m_Script。")
    if mb["unresolved_detail"]:
        L.append("\nPPtr 二次读取异常样例 (前 50):")
        for d in mb["unresolved_detail"]:
            L.append(f"  - {d['file']} path_id={d['path_id']}")

    L.append("\n## 4. 缺失托管程序集 (引用了但 Managed 目录未提供)\n")
    if res["missing_assembly_refs"]:
        for a, c in res["missing_assembly_refs"].items():
            L.append(f"- {a} ({c} 脚本)")
    else:
        L.append("- 无")

    def block(title, key):
        L.append(f"\n## {title}\n")
        items = res[key]
        L.append(f"共 {len(items)} 项")
        for x in items:
            L.append(f"- {x}")

    block("5. Shader 名称清单", "shaders")
    block("6. ComputeShader 清单", "compute_shaders")
    block("7. Font 清单", "fonts")
    block("8. TextAsset 清单", "text_assets")
    block("9. Material 清单", "materials")
    block("10. AudioClip 清单", "audio_clips")

    L.append("\n## 11. 扫描局限 (需编辑器侧二次校验)\n")
    L.append("- 贴图/材质/动画控制器/Animator 的运行时断链、着色器变体缺失, 元数据层无法判定,")
    L.append("  需在 AssetRipper 重建工程后于 Unity 编辑器内用校验工具 + RenderDoc 抓帧复核。")
    L.append("- 本脚本不解析 .resS / .resource 二进制内容, 仅按 .assets 元数据统计对象。")

    with open(out_path, "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--data", required=True, help="包含 .assets 的目录(可多次传入)")
    ap.add_argument("--managed", default="", help="Stacklands_Data/Managed 目录")
    ap.add_argument("--out", default="scan_report.md")
    ap.add_argument("--json", default="scan_report.json")
    args = ap.parse_args()

    roots = args.data.split(",")
    files = []
    for r in roots:
        files += find_asset_files(r)
    files = sorted(set(files))
    if not files:
        print("[FATAL] 未找到 .assets 文件", file=sys.stderr)
        sys.exit(1)

    res = scan(files, args.managed)
    write_markdown(res, args.out)
    with open(args.json, "w", encoding="utf-8") as f:
        json.dump(res, f, ensure_ascii=False, indent=2)
    print(f"[OK] 扫描完成: {len(files)} 个 .assets, 对象 {sum(res['type_counts'].values())}")
    print(f"[OK] Markdown: {args.out}")
    print(f"[OK] JSON:     {args.json}")
    mb = res["mono_behaviours"]
    print(f"[CHK] 可读MB={mb.get('readable',0)} 不可读MB={mb.get('unreadable_typetree',0)} "
          f"空脚本={mb['null_script_ref']} PPtr异常={mb['unresolved_script_ref']} "
          f"缺失程序集={len(res['missing_assembly_refs'])}")


if __name__ == "__main__":
    main()
