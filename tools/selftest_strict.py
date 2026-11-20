#!/usr/bin/env python3
"""严格审计脚本自测: 用合成包证明 verify_apk / strict_log_audit 的判定是对的。

为什么要这个: 构建 job 在工程未落地时会被跳过, 如果审计脚本本身写错(比如 ABI 解析恒为空),
CI 永远绿、永远发现不了 —— 那就等于没有审计。这里构造"合格包/坏包/AAB/干净日志/脏日志"
五个固定样本, 断言退出码与关键字, 把审计逻辑本身纳入 CI。

用法: python3 tools/selftest_strict.py
"""
from __future__ import annotations

import os
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

        # ---- C# 静态门的变异样本: 故意注入真实发生过的三类错误 ----
        real_src = (ROOT.parent / "Assets" / "Editor" / "PortBuild.cs").read_text(encoding="utf-8")
        mut_no_using = d / "no_using.cs"
        mut_no_using.write_text(real_src.replace("using UnityEngine.Rendering;\n", ""), encoding="utf-8")
        mut_wrong_member = d / "wrong_member.cs"
        mut_wrong_member.write_text(
            real_src.replace("PlayerSettings.Android.keystorePass =", "PlayerSettings.Android.keystorePassword ="),
            encoding="utf-8")
        mut_unbalanced = d / "unbalanced.cs"
        mut_unbalanced.write_text(real_src.replace("        return true;\n    }\n}", "        return true;\n    }\n", 1),
                                  encoding="utf-8")

        # ---- 前置检查脚本的自测: 造一个"该过就过"的工程树 ----
        proj = d / "proj"
        (proj / "ProjectSettings").mkdir(parents=True)
        (proj / "Packages").mkdir()
        (proj / "Assets" / "Editor").mkdir(parents=True)
        (proj / "Assets" / "Plugins").mkdir(parents=True)
        (proj / "Assets" / "Shaders" / "Custom").mkdir(parents=True)
        (proj / "Assets" / "Scripts").mkdir(parents=True)
        for sc in ("Assets/SokpopIntro/IntroScene.unity", "Assets/Scenes/SampleScene.unity"):
            (proj / sc).parent.mkdir(parents=True, exist_ok=True)
            (proj / sc).write_text("%YAML 1.1\n", encoding="utf-8")
        (proj / "ProjectSettings" / "ProjectVersion.txt").write_text(
            "m_EditorVersion: 2022.3.4f1\n", encoding="utf-8")
        (proj / "ProjectSettings" / "EditorBuildSettings.asset").write_text(
            "  m_Scenes:\n  - enabled: 1\n    path: Assets/SokpopIntro/IntroScene.unity\n"
            "  - enabled: 1\n    path: Assets/Scenes/SampleScene.unity\n", encoding="utf-8")
        (proj / "Packages" / "manifest.json").write_text('{"dependencies":{}}', encoding="utf-8")
        (proj / "Assets" / "Editor" / "PortBuild.cs").write_text(
            "StrictBuild BuildOptions.StrictMode GetGraphicsAPIs totalSize\n", encoding="utf-8")
        asm = "".join(f'<assembly fullname="Asm{i}" preserve="all" />' for i in range(21))
        (proj / "Assets" / "Plugins" / "link.xml").write_text(
            f"<linker>{asm}</linker>", encoding="utf-8")
        for i in range(22):
            (proj / "Assets" / "Shaders" / "Custom" / f"S{i}.shader").write_text("Shader{}", encoding="utf-8")
        for i in range(11):
            (proj / "Assets" / "Scripts" / f"C{i}.cs").write_text("class X{}", encoding="utf-8")

        # 子进程继承本进程 env: 给出密钥, 让前置检查只差 keystore(advisory)
        os.environ.setdefault("UNITY_EMAIL", "a@b.c")
        os.environ.setdefault("UNITY_PASSWORD", "x")
        (d / "empty").mkdir()
        broken = d / "broken"
        broken.mkdir()
        (broken / "Assets" / "Plugins").mkdir(parents=True)
        (broken / "Assets" / "Plugins" / "link.xml").write_text("<linker><assembly", encoding="utf-8")

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
            ("前置检查: 合格工程树判 READY", [sys.executable, str(ROOT / "preflight_project.py"),
                                          "--root", str(proj), "--strict"], 0,
             ["READY_WITH_WARNINGS", "link.xml", "21 个程序集全部 preserve=all"]),
            ("前置检查: 坏 link.xml 判 XML 非法",
             [sys.executable, str(ROOT / "preflight_project.py"), "--root", str(broken), "--strict"], 1,
             ["XML 非法"]),
            ("前置检查: 空仓库判 NOT_READY",
             [sys.executable, str(ROOT / "preflight_project.py"), "--root", str(d / "empty"), "--strict"], 1,
             ["NOT_READY", "工程未落地"]),
            ("静态门: 真文件判 PASS", [sys.executable, str(ROOT / "lint_unity_api_usage.py"),
                                      "--file", str(ROOT.parent / "Assets" / "Editor" / "PortBuild.cs"),
                                      "--whitelist", str(ROOT.parent / "docs" / "api_verified.json")], 0,
             ["结论: PASS"]),
            ("静态门: 括号不配对判 FAIL", [sys.executable, str(ROOT / "lint_unity_api_usage.py"),
                                        "--file", str(mut_unbalanced),
                                        "--whitelist", str(ROOT.parent / "docs" / "api_verified.json")], 1,
             ["未闭合"]),
            ("静态门: 缺 using 判 FAIL", [sys.executable, str(ROOT / "lint_unity_api_usage.py"),
                                        "--file", str(mut_no_using),
                                        "--whitelist", str(ROOT.parent / "docs" / "api_verified.json")], 1,
             ["需要 `using UnityEngine.Rendering;`"]),
            ("静态门: 未登记 API 判 FAIL", [sys.executable, str(ROOT / "lint_unity_api_usage.py"),
                                          "--file", str(mut_wrong_member),
                                          "--whitelist", str(ROOT.parent / "docs" / "api_verified.json")], 1,
             ["未登记 API: PlayerSettings.Android.keystorePassword"]),
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
