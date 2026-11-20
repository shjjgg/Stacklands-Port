#!/usr/bin/env python3
"""严格审计脚本自测: 用合成包证明 verify_apk / strict_log_audit 的判定是对的。

为什么要这个: 构建 job 在工程未落地时会被跳过, 如果审计脚本本身写错(比如 ABI 解析恒为空),
CI 永远绿、永远发现不了 —— 那就等于没有审计。这里构造"合格包/坏包/AAB/干净日志/脏日志"
五个固定样本, 断言退出码与关键字, 把审计逻辑本身纳入 CI。

用法: python3 tools/selftest_strict.py
"""
from __future__ import annotations

import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent
BUNDLE = "com.sokpop.stacklands.port"


def make_pkg(path: Path, aab: bool, good: bool) -> None:
    pre = "base/" if aab else ""
    with zipfile.ZipFile(path, "w", zipfile.ZIP_DEFLATED) as z:
        z.writestr(pre + ("manifest/AndroidManifest.xml" if aab else "AndroidManifest.xml"),
                   b"\x00" * 2000 + BUNDLE.encode("utf-8"))
        if good:
            z.writestr(pre + "lib/arm64-v8a/libil2cpp.so", b"\x00" * (4 << 20))
            z.writestr(pre + "assets/bin/Data/global-metadata.dat", b"\x00" * (2 << 20))
        else:
            # 典型错误产物: 只出了 v7a + Mono 运行库 + 没有元数据
            z.writestr(pre + "lib/armeabi-v7a/libil2cpp.so", b"\x00" * (4 << 20))
            z.writestr(pre + "lib/arm64-v8a/libmonobdwgc-2.0.so", b"\x00" * (2 << 20))
        z.writestr(pre + "assets/bin/Data/globalgamemanagers", b"\x00" * 4096)
        z.writestr(pre + "assets/bin/Data/sharedassets0.assets", b"\x00" * 8192)
        z.writestr(pre + "assets/bin/Data/sharedassets1.assets", b"\x00" * 8192)
        z.writestr(pre + ("dex/classes.dex" if aab else "classes.dex"), b"\x00" * 4096)
        if not aab:
            z.writestr("META-INF/CERT.RSA", b"\x00" * 1024)


CASES: list[tuple[str, list[str], int, list[str], list[str]]] = []


def run(cmd: list[str]) -> tuple[int, str]:
    p = subprocess.run(cmd, capture_output=True, text=True)
    return p.returncode, p.stdout + p.stderr


def main() -> int:
    ok = True
    with tempfile.TemporaryDirectory() as td:
        d = Path(td)
        good_apk, bad_apk, good_aab = d / "good.apk", d / "bad.apk", d / "good.aab"
        make_pkg(good_apk, aab=False, good=True)
        make_pkg(bad_apk, aab=False, good=False)
        make_pkg(good_aab, aab=True, good=True)

        clean_log, dirty_log = d / "clean.log", d / "dirty.log"
        clean_log.write_text("Licensing ok\nBuilding player...\nBuild completed\n", encoding="utf-8")
        dirty_log.write_text(
            "Shader error in 'Custom/Card': unexpected token\n"
            "error CS0103: The name 'Foo' does not exist\n"
            "Build completed with a result of 'Failed'\n", encoding="utf-8")

        checks = [
            ("合格 APK 判 PASS", [sys.executable, str(ROOT / "verify_apk.py"), str(good_apk),
                                  "--expect-bundle", BUNDLE, "--min-size-mb", "1"], 0,
             ["结论: 产物通过严格检查", "ABI 集合 = ['arm64-v8a']"]),
            ("坏 APK 判 FAIL", [sys.executable, str(ROOT / "verify_apk.py"), str(bad_apk),
                                "--min-size-mb", "1"], 1,
             ["混入非目标 ABI", "Mono 运行库残留", "global-metadata"]),
            ("合格 AAB 判 PASS", [sys.executable, str(ROOT / "verify_apk.py"), str(good_aab),
                                  "--expect-bundle", BUNDLE, "--min-size-mb", "1"], 0,
             ["type=AAB", "结论: 产物通过严格检查"]),
            ("干净日志判 PASS", [sys.executable, str(ROOT / "strict_log_audit.py"), str(clean_log)], 0,
             ["结论: PASS"]),
            ("脏日志判 FAIL", [sys.executable, str(ROOT / "strict_log_audit.py"), str(dirty_log)], 1,
             ["shader 编译错误", "C# 编译错误", "构建结果为 Failed"]),
            ("--allow-warnings 不能放过 error",
             [sys.executable, str(ROOT / "strict_log_audit.py"), str(dirty_log), "--allow-warnings"], 1,
             ["结论: FAIL"]),
        ]

        for name, cmd, want_code, want_tokens in checks:
            code, out = run(cmd)
            passed = code == want_code and all(t in out for t in want_tokens)
            print(f"[{'OK ' if passed else 'BAD'}] {name}: exit={code} 期望={want_code}")
            if not passed:
                ok = False
                print(out)
                for t in want_tokens:
                    if t not in out:
                        print(f"       缺关键字: {t}")

    print("自测结论:", "全通过" if ok else "存在失败项")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
