#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
源包还原 / 归位自动化脚本 (AssetRipper 前置)

把上传的 8 个压缩包(原 .txt 后缀)还原成一个完整、可被 AssetRipper / AssetStudio
读取的 Stacklands_Data 目录, 并做版本与完整性校验。只读原始上传件, 不修改源文件。

用法:
  python3 reconstruct_source.py --in <上传件目录> --out <还原输出目录>

输入件命名(与本次上传一致, .txt 后缀可选):
  Stacklands.zip[.txt]
  resources.assets.resS.zip[.txt]
  sharedassets0.assets.resS.zip[.txt]
  sharedassets1.assets.resS.zip[.txt]
  sharedassets1.assets.zip[.txt]
  sharedassets1.resource.z01[.txt]
  sharedassets1.resource.z02[.txt]
  sharedassets1.resource.zip[.txt]
"""
import argparse, os, re, shutil, subprocess, sys, zipfile, json, datetime

EXPECTED_VERSION = "2022.3.4f1"

# 还原后应存在的侧车/元数据文件 (相对 Stacklands_Data)
REQUIRED_DATA = [
    "globalgamemanagers", "globalgamemanagers.assets", "globalgamemanagers.assets.resS",
    "level0", "level0.resS", "level1",
    "resources.assets", "resources.assets.resS", "resources.resource",
    "sharedassets0.assets", "sharedassets0.assets.resS", "sharedassets0.resource",
    "sharedassets1.assets", "sharedassets1.assets.resS", "sharedassets1.resource",
]

# 已知大小(字节), 用于完整性核对; 不一致仅告警, 不阻断
EXPECTED_SIZES = {
    "resources.assets.resS": 276599264,
    "sharedassets0.assets.resS": 4614304,
    "sharedassets1.assets.resS": 94071184,
    "sharedassets1.assets": 51159288,
    "sharedassets1.resource": 131903232,
}


def find(in_dir, stem):
    """按文件名主干查找(容忍 .txt 后缀与多种压缩后缀)。"""
    for f in os.listdir(in_dir):
        base = f
        if base.endswith(".txt"):
            base = base[:-4]
        if base == stem or base.startswith(stem):
            return os.path.join(in_dir, f)
    return None


def unzip(zip_path, dest):
    os.makedirs(dest, exist_ok=True)
    with zipfile.ZipFile(zip_path) as z:
        z.extractall(dest)


def read_version(assets_path):
    """从 .assets 头前 256 字节提取 Unity 版本字符串。"""
    with open(assets_path, "rb") as f:
        head = f.read(256)
    m = re.search(rb"20\d\d\.\d+\.\d+f\d+", head)
    return m.group(0).decode() if m else None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--in", dest="in_dir", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    in_dir = args.in_dir
    out = args.out
    data_dir = os.path.join(out, "Stacklands_Data")
    os.makedirs(data_dir, exist_ok=True)
    report = {"time": datetime.datetime.now().isoformat(timespec="seconds"), "steps": [], "warnings": []}

    def log(msg):
        report["steps"].append(msg)
        print(f"[..] {msg}")

    # 1. 主包: 含 Stacklands_Data 树 + DLC
    main_zip = find(in_dir, "Stacklands.zip")
    if not main_zip:
        print("[FATAL] 缺少 Stacklands.zip", file=sys.stderr); sys.exit(2)
    log(f"解压主包 {os.path.basename(main_zip)}")
    unzip(main_zip, out)

    # 2. 单个侧车 zip -> 取出 .resS/.assets 放入 Stacklands_Data
    sidecars = {
        "resources.assets.resS.zip": "resources.assets.resS",
        "sharedassets0.assets.resS.zip": "sharedassets0.assets.resS",
        "sharedassets1.assets.resS.zip": "sharedassets1.assets.resS",
        "sharedassets1.assets.zip": "sharedassets1.assets",
    }
    tmp = os.path.join(out, "_tmp_sidecar")
    for zip_stem, target in sidecars.items():
        zp = find(in_dir, zip_stem)
        if not zp:
            report["warnings"].append(f"缺少 {zip_stem}")
            continue
        log(f"归位 {target}")
        if os.path.exists(tmp): shutil.rmtree(tmp)
        unzip(zp, tmp)
        # 找到解压出的目标文件
        for dp, _, fns in os.walk(tmp):
            for fn in fns:
                if fn == target:
                    shutil.copy2(os.path.join(dp, fn), os.path.join(data_dir, target))
        if not os.path.exists(os.path.join(data_dir, target)):
            report["warnings"].append(f"{target} 未在压缩包内找到")

    # 3. 分卷 resource: z01 -> z02 -> zip 拼接后解压
    z01 = find(in_dir, "sharedassets1.resource.z01")
    z02 = find(in_dir, "sharedassets1.resource.z02")
    zc = find(in_dir, "sharedassets1.resource.zip")
    if z01 and z02 and zc:
        log("拼接 sharedassets1.resource 分卷")
        combined = os.path.join(out, "_resource_all.zip")
        with open(combined, "wb") as w:
            for part in (z01, z02, zc):
                with open(part, "rb") as r:
                    shutil.copyfileobj(r, w)
        if os.path.exists(tmp): shutil.rmtree(tmp)
        # 分卷拼接后用 unzip(zipfile 对多卷支持有限); 多卷告警会使 unzip 返回非 0,
        # 这里不做 check, 以目标文件是否落地为准。
        subprocess.run(["unzip", "-o", combined, "-d", tmp])
        for dp, _, fns in os.walk(tmp):
            for fn in fns:
                if fn == "sharedassets1.resource":
                    shutil.copy2(os.path.join(dp, fn), os.path.join(data_dir, fn))
        os.remove(combined)
    else:
        report["warnings"].append("sharedassets1.resource 分卷不完整")

    if os.path.exists(tmp): shutil.rmtree(tmp)

    # 4. 校验必需文件
    log("校验必需文件与版本")
    missing = [f for f in REQUIRED_DATA if not os.path.exists(os.path.join(data_dir, f))]
    if missing:
        report["warnings"].append(f"缺失文件: {missing}")

    # 5. 版本与大小核对
    versions = {}
    for f in os.listdir(data_dir):
        if f.endswith(".assets"):
            v = read_version(os.path.join(data_dir, f))
            versions[f] = v
            if v and v != EXPECTED_VERSION:
                report["warnings"].append(f"{f} 版本 {v} != {EXPECTED_VERSION}")
    report["versions"] = versions

    sizes = {}
    for f, exp in EXPECTED_SIZES.items():
        p = os.path.join(data_dir, f)
        if os.path.exists(p):
            actual = os.path.getsize(p)
            sizes[f] = actual
            if actual != exp:
                report["warnings"].append(f"{f} 大小 {actual} != 预期 {exp}")
    report["sizes"] = sizes

    report["data_dir"] = data_dir
    report["missing"] = missing
    report["ready"] = not missing and not any("版本" in w for w in report["warnings"])

    with open(os.path.join(out, "reconstruct_report.json"), "w", encoding="utf-8") as f:
        json.dump(report, f, ensure_ascii=False, indent=2)

    print("\n=== 还原结果 ===")
    print(f"数据目录: {data_dir}")
    print(f"版本: {versions}")
    print(f"缺失: {missing}")
    for w in report["warnings"]:
        print(f"  [WARN] {w}")
    print(f"[OK] 可交付 AssetRipper: {report['ready']}")
    if not report["ready"]:
        sys.exit(1)


if __name__ == "__main__":
    main()
