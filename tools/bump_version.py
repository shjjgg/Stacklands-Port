#!/usr/bin/env python3
"""版本号 = 原版版本号(1.5.0) + 移植修改次数。
PC 原版 bundleVersion = 1.5.0.21(读自 globalgamemanagers), 这里取前三段作基座。
「修改次数」用现有 ProjectSettings 里的第四段自增 —— CI 是浅克隆, git commit count 不可靠,
所以不依赖 git, 每次构建 +1。
用法: python3 tools/bump_version.py [--dry]
"""
import re, sys, pathlib

ROOT = pathlib.Path(__file__).resolve().parents[1]
BASE = "1.5.0"
P = ROOT / "ProjectSettings" / "ProjectSettings.asset"

def main():
    s = P.read_text(encoding="utf-8")
    m = re.search(r"bundleVersion: ([0-9.]+)", s)
    if not m:
        print("ERROR 找不到 bundleVersion", file=sys.stderr)
        return 1

    cur = m.group(1).split(".")
    rev = int(cur[3]) + 1 if len(cur) > 3 and cur[3].isdigit() else 1
    version = f"{BASE}.{rev}"

    if "--dry" not in sys.argv:
        s = s[:m.start(1)] + version + s[m.end(1):]
        P.write_text(s, encoding="utf-8")
    print(version)
    return 0

if __name__ == "__main__":
    sys.exit(main())
