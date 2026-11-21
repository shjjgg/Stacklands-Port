#!/usr/bin/env python3
"""把 bundleVersion 设成「原版版本号 + 移植修改次数」。
原版 PC 的 bundleVersion = 1.5.0.21(从 globalgamemanagers 里读出来的),
修改次数 = 本仓库的 commit 数, 所以最终形如 1.5.0.108。
用法: python3 tools/bump_version.py [--dry]
"""
import re, subprocess, sys, pathlib

ROOT = pathlib.Path(__file__).resolve().parents[1]
ORIGINAL = "1.5.0"          # 原版 1.5.0.21 取前三段

def main():
    rev = subprocess.check_output(["git", "-C", str(ROOT), "rev-list", "--count", "HEAD"]).decode().strip()
    version = f"{ORIGINAL}.{rev}"
    p = ROOT / "ProjectSettings" / "ProjectSettings.asset"
    s = p.read_text(encoding="utf-8")
    new = re.sub(r"bundleVersion: [0-9.]+", "bundleVersion: " + version, s, count=1)
    if "--dry" not in sys.argv:
        p.write_text(new, encoding="utf-8")
    print(version)
    return 0

if __name__ == "__main__":
    sys.exit(main())
