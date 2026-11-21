#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""APK 资产自检 (构建后, 真机前)

拦的是"构建期就能看见、但以前只能等真机崩"的那类问题:
  1. StreamingAssets 里的 DLC bundle 是否真的进包、是否 Android 可用格式(ASTC/ETC2)、有没有 DXT5 残留;
  2. bundle 里的 MonoBehaviour 脚本引用是否非空(空引用 = 运行时全变 Missing Script);
  3. 卡牌数量是否与原版一致(cities 201 / spirits 147);
  4. 关键 shader 是否在包内(避免 Shader.Find 拿不到)。

用法: python3 tools/verify_apk_assets.py <apk> --strict
"""
import argparse, collections, io, json, sys, zipfile

try:
    import UnityPy
except ImportError:
    raise SystemExit("[FATAL] 需要 UnityPy: pip install UnityPy")

EXPECT = {
    "cities_dlc": {"cards": 201, "textures": 124},
    "spirits_dlc": {"cards": 147, "textures": 98},
}
# TextureFormat: DXT1=10 DXT5=12; Android 侧可用: ETC2=45..47 / ASTC=48..54 / RGBA32=4 等
PC_ONLY = {10, 12, 1, 2, 3}
ASTC = set(range(48, 55))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("apk")
    ap.add_argument("--strict", action="store_true")
    args = ap.parse_args()

    errors, warns = [], []
    z = zipfile.ZipFile(args.apk)
    names = z.namelist()

    print(f"APK {args.apk}")
    for bundle, exp in EXPECT.items():
        entry = f"assets/dlc/{bundle}"
        if entry not in names:
            errors.append(f"缺 {entry}")
            continue
        data = z.read(entry)
        print(f"  {bundle}: {len(data)//1024//1024}MB")
        env = UnityPy.load(io.BytesIO(data))
        tex = collections.Counter()
        cards = 0
        empty_script = 0
        mono = 0
        for obj in env.objects:
            t = obj.type.name
            if t == "Texture2D":
                d = obj.read()
                tex[int(d.m_TextureFormat)] += 1
            elif t == "MonoBehaviour":
                mono += 1
                try:
                    tree = obj.read_typetree()
                except Exception:
                    continue
                s = tree.get("m_Script")
                if isinstance(s, dict) and s.get("m_PathID") == 0:
                    empty_script += 1
                if "Id" in tree:
                    cards += 1
        total_tex = sum(tex.values())
        print(f"    贴图 {total_tex} 格式 {dict((k,v) for k,v in tex.items())}")
        print(f"    MonoBehaviour {mono} 卡牌 {cards} 空脚本引用 {empty_script}")
        if total_tex != exp["textures"]:
            errors.append(f"{bundle} 贴图数 {total_tex} != 原版 {exp['textures']}")
        if cards != exp["cards"]:
            errors.append(f"{bundle} 卡牌数 {cards} != 原版 {exp['cards']}")
        if empty_script:
            errors.append(f"{bundle} 有 {empty_script} 个 MonoBehaviour 脚本引用为空(运行时会 Missing Script)")
        bad = {k: v for k, v in tex.items() if k in PC_ONLY}
        if bad:
            errors.append(f"{bundle} 仍有 PC-only 贴图格式(DXT): {bad}")
        non_astc = {k: v for k, v in tex.items() if k not in ASTC}
        if non_astc:
            warns.append(f"{bundle} 非 ASTC 贴图: {non_astc}")

    # 关键 shader 是否进包(Always Included / 被材质引用)
    gm = z.read("assets/bin/Data/globalgamemanagers")
    for key in (b"Shapes/Rect Transparent", b"Shapes/Rect Opaque", b"UI/Default Port"):
        if key in gm:
            print(f"  shader 名在包内: {key.decode()}")
        else:
            warns.append(f"player 数据里没见 shader 名 {key.decode()}")

    for w in warns:
        print(f"  [WARN] {w}")
    for e in errors:
        print(f"  [FAIL] {e}")
    if not errors:
        print("结论: APK 资产自检通过")
    return 1 if (errors and args.strict) else 0


if __name__ == "__main__":
    sys.exit(main())
