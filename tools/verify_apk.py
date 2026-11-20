#!/usr/bin/env python3
"""严格产物检查: 直接拆 APK/AAB 的 zip 结构, 验证"真的按 IL2CPP 单 ABI 出了包"。

不依赖 Unity、不依赖 aapt, 只看 zip 里有什么 —— 因为构建"成功"和产物"合格"是两件事:
  - Unity 退出码 0 只代表打包流程走完, 不保证 native 库/元数据/ABI 是对的;
  - shader 错误、Managed 残留、多 ABI 混装都不会让退出码非 0。

用法:
  python3 tools/verify_apk.py builds/android/Stacklands-Port.apk
  python3 tools/verify_apk.py app.aab --expect-bundle com.sokpop.stacklands.port --fail-on-warning

退出码: 0 全过 / 1 有 FAIL
"""
from __future__ import annotations

import argparse
import json
import sys
import zipfile
from pathlib import Path

FAILS: list[str] = []
PASSES: list[str] = []
WARNS: list[str] = []


def ok(msg: str) -> None:
    PASSES.append(msg)


def fail(msg: str) -> None:
    FAILS.append(msg)


def warn(msg: str) -> None:
    WARNS.append(msg)


def is_aab(names: list[str], path: Path) -> bool:
    if path.suffix.lower() == ".aab":
        return True
    return any(n.startswith("base/") for n in names[:50])


def find(names: list[str], exact: str) -> list[str]:
    return [n for n in names if n == exact]


def abi_dirs(names: list[str], prefix: str) -> set[str]:
    """取 <prefix>lib/<abi>/... 里的 abi 名。APK 是 lib/x/, AAB 是 base/lib/x/。"""
    out = set()
    for n in names:
        if not n.startswith(prefix + "lib/"):
            continue
        rest = n[len(prefix + "lib/"):]
        seg = rest.split("/")
        if len(seg) >= 2 and seg[0]:
            out.add(seg[0])
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("artifact")
    ap.add_argument("--expect-bundle", default=None, help="期望的包名(在二进制清单里按 UTF-8/UTF-16 找)")
    ap.add_argument("--expect-min-sdk", type=int, default=None)
    ap.add_argument("--min-size-mb", type=float, default=10.0)
    ap.add_argument("--fail-on-warning", action="store_true")
    ap.add_argument("--json-out", default=None)
    args = ap.parse_args()

    path = Path(args.artifact)
    if not path.exists():
        print(f"::error::产物不存在: {path}")
        return 1

    disk_mb = path.stat().st_size / 1024 / 1024

    try:
        zf = zipfile.ZipFile(path)
    except zipfile.BadZipFile:
        fail("不是合法 zip(损坏或未打完)")
        return report(args, disk_mb, 0.0)

    names = zf.namelist()
    aab = is_aab(names, path)
    prefix = "base/" if aab else ""
    infos = {i.filename: i for i in zf.infolist()}

    def size_of(name: str) -> int:
        i = infos.get(name)
        return i.file_size if i else -1

    uncompressed_mb = sum(i.file_size for i in zf.infolist()) / 1024 / 1024
    print(f"artifact={path} type={'AAB' if aab else 'APK'} entries={len(names)} "
          f"disk={disk_mb:.1f} MB uncompressed={uncompressed_mb:.1f} MB")
    # 内容量用解压后总量: APK 里 dex/资源压缩率很高, 压缩后体积会误判"空包"。
    if uncompressed_mb < args.min_size_mb:
        fail(f"内容量 {uncompressed_mb:.1f} MB < 下限 {args.min_size_mb} MB (空包/资源未落地嫌疑)")
    else:
        ok(f"内容量 {uncompressed_mb:.1f} MB >= {args.min_size_mb} MB (磁盘 {disk_mb:.1f} MB)")

    # 1. 清单
    manifest = prefix + ("manifest/AndroidManifest.xml" if aab else "AndroidManifest.xml")
    if size_of(manifest) > 0:
        ok(f"清单存在 {manifest} ({size_of(manifest)} B)")
    else:
        fail(f"缺清单 {manifest} —— 装不上")

    # 2. IL2CPP native 库 + ABI
    so = prefix + "lib/arm64-v8a/libil2cpp.so"
    so_size = size_of(so)
    if so_size > 512 * 1024:
        ok(f"libil2cpp.so 存在 {so} ({so_size / 1024 / 1024:.1f} MB)")
    elif so_size > 0:
        fail(f"libil2cpp.so 过小 ({so_size} B), 二进制被截断/裁剪过度")
    else:
        fail(f"缺 {so} —— 不是 IL2CPP 包或 ABI 不是 arm64-v8a")

    lib_dirs = sorted(abi_dirs(names, prefix))
    foreign = [d for d in lib_dirs if d not in ("arm64-v8a",)]
    if foreign:
        fail(f"混入非目标 ABI: {foreign} (基线只出 arm64-v8a, 混装会掩盖未适配的 .so)")
    else:
        ok(f"ABI 集合 = {lib_dirs or ['(none)']} (仅 arm64-v8a)")

    # 3. global-metadata.dat (IL2CPP 灵魂)
    gm = prefix + "assets/bin/Data/global-metadata.dat"
    gm_size = size_of(gm)
    if gm_size > 100 * 1024:
        ok(f"global-metadata.dat 存在 ({gm_size / 1024 / 1024:.1f} MB)")
    elif gm_size > 0:
        fail(f"global-metadata.dat 过小 ({gm_size} B)")
    else:
        fail(f"缺 {gm} —— 运行期会直接崩在 il2cpp::vm::MetadataCache")

    # 4. 不能有 Mono 残留
    mono = [n for n in names if "/libmono" in n or Path(n).name.startswith("libmono")]
    if mono:
        fail(f"存在 Mono 运行库残留 {mono[:3]} —— 说明实际没走 IL2CPP")
    else:
        ok("无 libmono* 残留")

    # 5. 不能有托管程序集随包 (IL2CPP 下 Managed/*.dll 只说明裁剪/打包路径错)
    managed = [n for n in names
               if n.startswith(prefix + "assets/bin/Data/Managed/") and n.endswith(".dll")]
    if managed:
        fail(f"assets/bin/Data/Managed 下有 {len(managed)} 个托管 dll 随包 (IL2CPP 不应有)")
    else:
        ok("无 Managed/*.dll 随包")

    # 6. 场景/资源 blob
    data_prefix = prefix + "assets/bin/Data/"
    blobs = [n for n in names if n.startswith(data_prefix) and n.endswith(".assets")]
    ggm = [n for n in names if n.startswith(data_prefix) and Path(n).name in
           ("globalgamemanagers", "globalgamemanagers.assets")]
    if len(blobs) >= 2:
        ok(f"资源 blob {len(blobs)} 个")
    else:
        fail(f"资源 blob 只有 {len(blobs)} 个, 场景资源没打进去")
    if ggm:
        ok(f"globalgamemanagers 存在: {ggm[0]}")
    else:
        fail("缺 globalgamemanagers —— PlayerSettings/启动流程数据丢失")

    # 7. dex
    dex = [n for n in names if Path(n).name.startswith("classes") and n.endswith(".dex")]
    if dex:
        ok(f"dex {len(dex)} 个")
    else:
        fail("缺 classes*.dex")

    # 8. 包名(二进制清单里按两种编码找)
    if args.expect_bundle:
        raw = zf.read(manifest) if size_of(manifest) > 0 else b""
        encs = [args.expect_bundle.encode("utf-8"), args.expect_bundle.encode("utf-16-le")]
        if any(e in raw for e in encs):
            ok(f"包名命中 {args.expect_bundle}")
        else:
            fail(f"清单里找不到包名 {args.expect_bundle} (AXML 字符串池未命中)")

    # 9. 签名文件
    sig = [n for n in names if n.startswith("META-INF/") and n.upper().endswith((".RSA", ".DSA", ".EC"))]
    if sig:
        ok(f"签名块 {sig[0]}")
    elif not aab:
        fail("APK 未签名(无 META-INF/*.RSA|DSA|EC)")
    else:
        warn("AAB 未签名(由 Play 或 bundletool 签名, 可接受)")

    # 10. minSdk 提示(需要解析 AXML resource map, 这里只报需求不硬判)
    if args.expect_min_sdk:
        warn(f"minSdk 期望 {args.expect_min_sdk}: 需 aapt2 dump badging 复核, 本脚本不解析 AXML 资源表")

    return report(args, disk_mb, uncompressed_mb, len(names))


def report(args, disk_mb: float, uncompressed_mb: float, entries: int = 0) -> int:
    print("\n=== 严格产物检查 ===")
    for p in PASSES:
        print(f"  PASS  {p}")
    for w in WARNS:
        print(f"  WARN  {w}")
    for f in FAILS:
        print(f"  FAIL  {f}")

    payload = {
        "artifact": args.artifact,
        "disk_mb": round(disk_mb, 2),
        "uncompressed_mb": round(uncompressed_mb, 2),
        "entries": entries,
        "pass": len(PASSES),
        "warn": len(WARNS),
        "fail": len(FAILS),
        "failures": FAILS,
    }
    if args.json_out:
        Path(args.json_out).write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")

    if FAILS:
        for f in FAILS:
            print(f"::error::{f}")
        return 1
    if args.fail_on_warning and WARNS:
        print("::error::存在 WARN 且要求零警告")
        return 1
    print("结论: 产物通过严格检查")
    return 0


if __name__ == "__main__":
    sys.exit(main())
