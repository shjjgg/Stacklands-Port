#!/usr/bin/env python3
"""去掉 Unity 在 Android 13 主题图标上留下的单色层(Unity 默认方块 logo)。

Unity 2022.3 会为启动图标自动生成 adaptive-icon, 其中 monochrome 层固定用 Unity 自己的
logo —— 这就是桌面上那个白立方体的来源。原版 PC 没有这个东西, 移植里也不该有。

做法: 找出 res/ 下的单色层 PNG(Luminance+Alpha 模式), 换成同尺寸全透明图, 然后
zipalign + apksigner 重新签名(用 tools/port_signing.keystore, 保证后续版本签名一致)。

用法: python3 tools/patch_launcher_icon.py <apk> [--keystore path]
"""
import io
import os
import shutil
import subprocess
import sys
import tempfile
import zipfile

from PIL import Image

def _build_tools():
    env = os.environ.get("ANDROID_BUILD_TOOLS")
    if env and os.path.isdir(env):
        return env
    local = "/home/user/unityci/rootfs/opt/unity/Editor/Data/PlaybackEngines/AndroidPlayer/SDK/build-tools/34.0.0"
    if os.path.isdir(local):
        return local
    home = os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT") or ""
    if home:
        root = os.path.join(home, "build-tools")
        if os.path.isdir(root):
            for d in sorted(os.listdir(root), reverse=True):
                return os.path.join(root, d)
    return ""


SDK_BUILD_TOOLS = _build_tools()


def monochrome_like(data):
    """单色层特征: LA/灰度 PNG, Unity 生成的是灰度+alpha。"""
    try:
        im = Image.open(io.BytesIO(data))
    except Exception:
        return None
    if im.mode in ("LA", "L"):
        return im.size
    return None


def patch(apk, keystore):
    work = tempfile.mkdtemp(prefix="iconpatch_")
    unsigned = os.path.join(work, "unsigned.apk")
    aligned = os.path.join(work, "aligned.apk")
    signed = os.path.join(work, "signed.apk")

    replaced = []
    with zipfile.ZipFile(apk) as src, zipfile.ZipFile(unsigned, "w", zipfile.ZIP_DEFLATED) as dst:
        for item in src.infolist():
            data = src.read(item.filename)
            if item.filename.startswith("res/") and item.filename.endswith(".png"):
                size = monochrome_like(data)
                if size:
                    blank = Image.new("LA", size, (0, 0))
                    buf = io.BytesIO()
                    blank.save(buf, format="PNG")
                    data = buf.getvalue()
                    replaced.append(item.filename)
            dst.writestr(item, data)

    if not replaced:
        print("[icon] 没找到单色层 PNG, 跳过", file=sys.stderr)
        shutil.rmtree(work, ignore_errors=True)
        return 0

    zipalign = os.path.join(SDK_BUILD_TOOLS, "zipalign")
    apksigner = os.path.join(SDK_BUILD_TOOLS, "apksigner")
    subprocess.run([zipalign, "-f", "-p", "4", unsigned, aligned], check=True)
    subprocess.run([
        apksigner, "sign",
        "--ks", keystore, "--ks-pass", "pass:stacklands",
        "--key-pass", "pass:stacklands", "--ks-key-alias", "port",
        "--v1-signing-enabled", "true", "--v2-signing-enabled", "true",
        "--v3-signing-enabled", "true",
        "--out", signed, aligned,
    ], check=True)
    subprocess.run([apksigner, "verify", signed], check=True)

    shutil.move(signed, apk)
    shutil.rmtree(work, ignore_errors=True)
    print("[icon] 已清掉 Unity 单色层并重新签名: " + ", ".join(replaced))
    return len(replaced)


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    apk = sys.argv[1]
    keystore = os.path.join(os.path.dirname(os.path.abspath(__file__)), "port_signing.keystore")
    if "--keystore" in sys.argv:
        keystore = sys.argv[sys.argv.index("--keystore") + 1]
    n = patch(apk, keystore)
    return 0 if n >= 0 else 1


if __name__ == "__main__":
    sys.exit(main())
