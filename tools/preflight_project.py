#!/usr/bin/env python3
"""首跑前置检查: 把"工程能不能真的构建"拆成可点的清单, 而不是等 Unity 报错。

为什么需要: 构建 job 在工程未落地时是跳过的, 于是"绿"并不代表能出包。
这个脚本把 PortBuild.cs 五道门需要的静态前提逐条检查一遍, 输出:
  - 结论: READY / NOT_READY / READY_WITH_WARNINGS
  - 每项: 需要什么、当前状态、挡住哪道门、怎么补
  - project_ready=true|false 供工作流 output 使用
  - GitHub Step Summary 表格(在 CI 里直接看得到缺什么)

用法:
  python3 tools/preflight_project.py --root .
  python3 tools/preflight_project.py --root . --strict        # 有 blocking 项时退出 1
  python3 tools/preflight_project.py --root . --json-out out/preflight.json
"""
from __future__ import annotations

import argparse
import json
import os
import re
import sys
from pathlib import Path

BASELINE = "2022.3.4f1"
REQUIRED_SCENES = [
    "Assets/SokpopIntro/IntroScene.unity",
    "Assets/Scenes/SampleScene.unity",
]

BLOCKING: list[dict] = []
ADVISORY: list[dict] = []


def add(level: str, item: str, gate: str, status: str, detail: str, fix: str) -> None:
    row = {"item": item, "gate": gate, "status": status, "detail": detail, "fix": fix}
    (BLOCKING if level == "blocking" else ADVISORY).append(row)


def read_text(p: Path) -> str:
    try:
        return p.read_text(encoding="utf-8", errors="ignore")
    except OSError:
        return ""


def check_engine(root: Path) -> None:
    pv = root / "ProjectSettings" / "ProjectVersion.txt"
    if not pv.exists():
        add("blocking", "ProjectSettings/ProjectVersion.txt", "1 前置",
            "缺失", "工程未落地(还没有 Unity 导出)", "按 docs/15 T1 用匹配版 AssetRipper 导出工程")
        return
    m = re.search(r"m_EditorVersion:\s*(\S+)", read_text(pv))
    ver = m.group(1) if m else ""
    if ver == BASELINE:
        add("blocking", "引擎版本", "1 前置", "OK", ver, "-")
    else:
        add("blocking", "引擎版本", "1 前置", "漂移", f"实际 {ver or '(未解析)'}, 基线 {BASELINE}",
            "换回 2022.3.4f1 或整条工具链重新校准(禁止跨大版本)")


def check_scenes(root: Path) -> None:
    missing = [s for s in REQUIRED_SCENES if not (root / s).exists()]
    if not missing:
        add("blocking", "必需场景", "1 前置", "OK", "两个场景文件均在", "-")
        return
    add("blocking", "必需场景", "1 前置", "缺失",
        f"缺 {len(missing)} 个: {', '.join(missing)}",
        "T1 导出场景; 严格模式不会回落到固定列表, 缺一个就退出码 2")


def check_build_settings_scenes(root: Path) -> None:
    f = root / "ProjectSettings" / "EditorBuildSettings.asset"
    if not f.exists():
        add("blocking", "EditorBuildSettings 场景列表", "1 前置", "缺失",
            "没有 EditorBuildSettings.asset",
            "编辑器里把 IntroScene 放第一位、SampleScene 第二位并勾选启用")
        return
    text = read_text(f)
    enabled = re.findall(r"path:\s*(\S+\.unity)", text)
    has_intro = REQUIRED_SCENES[0] in text
    has_sample = REQUIRED_SCENES[1] in text
    disabled = re.findall(r"enabled:\s*0", text)
    if has_intro and has_sample and not disabled:
        order_ok = text.find(REQUIRED_SCENES[0]) <= text.find(REQUIRED_SCENES[1])
        add("blocking", "EditorBuildSettings 场景列表", "1 前置",
            "OK" if order_ok else "顺序错",
            f"含两个场景, 启用 {len(enabled)} 项",
            "-" if order_ok else "把 IntroScene 提到首位(否则进游戏先看到空场景)")
    else:
        add("blocking", "EditorBuildSettings 场景列表", "1 前置", "未就绪",
            f"intro={has_intro} sample={has_sample} 未启用项={len(disabled)}",
            "两个场景都要勾选启用")


def check_link_xml(root: Path) -> None:
    """link.xml 是 IL2CPP 裁剪白名单: 本作按程序集整体 preserve="all", 不是逐 type 列。
    这里校验 1) 文件在 2) XML 合法(坏 XML 会被 Unity 忽略, 等于没有白名单) 3) assembly 条目数量。"""
    p = root / "Assets" / "Plugins" / "link.xml"
    if not p.exists():
        add("blocking", "Assets/Plugins/link.xml", "1 前置", "缺失",
            "无 IL2CPP 裁剪白名单", "从 PORT 模板复制, 并按 T16 扫描结果补条目")
        return
    try:
        import xml.etree.ElementTree as ET
        tree = ET.parse(p)
    except Exception as e:  # noqa: BLE001
        add("blocking", "Assets/Plugins/link.xml", "1 前置", "XML 非法",
            f"{type(e).__name__}: {e}", "修好 XML; 非法 link.xml 会被 Unity 忽略 = 没有白名单")
        return
    asm = [a for a in tree.getroot().iter() if a.tag.endswith("assembly")]
    named = [a for a in asm if (a.get("fullname") or "").strip()]
    preserve_all = [a for a in named if (a.get("preserve") or "").lower() == "all"]
    if len(named) >= 15 and len(preserve_all) == len(named):
        add("blocking", "Assets/Plugins/link.xml", "1 前置", "OK",
            f"{len(named)} 个程序集全部 preserve=all", "-")
    else:
        add("blocking", "Assets/Plugins/link.xml", "1 前置", "覆盖不足",
            f"assembly {len(named)} 条 / preserve=all {len(preserve_all)} 条",
            "反射与序列化目标需整体保留; 缺一条就是运行期 MissingMethod")


def check_manifest(root: Path) -> None:
    p = root / "Packages" / "manifest.json"
    if p.exists() and read_text(p).strip():
        add("blocking", "Packages/manifest.json", "1 前置", "OK", "存在且非空", "-")
    else:
        add("blocking", "Packages/manifest.json", "1 前置", "缺失/空",
            "依赖不可复现", "由 Unity 打开工程时生成, 并锁定 docs/12 的版本")


def check_portbuild(root: Path) -> None:
    p = root / "Assets" / "Editor" / "PortBuild.cs"
    if not p.exists():
        add("blocking", "Assets/Editor/PortBuild.cs", "-", "缺失",
            "-executeMethod 会直接失败", "从 PORT 仓库复制")
        return
    text = read_text(p)
    need = ["StrictBuild", "BuildOptions.StrictMode", "GetGraphicsAPIs", "totalSize"]
    missing = [k for k in need if k not in text]
    add("blocking", "Assets/Editor/PortBuild.cs", "-",
        "OK" if not missing else "版本旧", f"缺标记: {missing or '无'}",
        "-" if not missing else "用仓库版覆盖(旧版无严格门且 totalSizeBytes 编不过)")


def check_shaders(root: Path) -> None:
    shader_dir = root / "Assets" / "Shaders"
    files = list(shader_dir.rglob("*.shader")) if shader_dir.exists() else []
    custom = [f for f in files if f.name.startswith("Custom") or f.parent.name == "Custom"]
    if len(files) >= 20:
        add("blocking", "自研 Shader 落地", "3 回读", "OK",
            f"{len(files)} 个 .shader (Custom 目录 {len(custom)})", "-")
    else:
        add("blocking", "自研 Shader 落地", "3 回读", "不足",
            f"仅 {len(files)} 个 .shader, 基线 30(其中 Custom/ 20)",
            "T14 走 ShaderRipper→3DLDecompiler→spirv-cross 保真链; 严格模式 <20 直接退出码 3")


def check_scripts(root: Path) -> None:
    d = root / "Assets" / "Scripts"
    cs = list(d.rglob("*.cs")) if d.exists() else []
    if len(cs) >= 10:
        add("blocking", "玩法脚本回填", "-", "OK", f"Assets/Scripts 下 {len(cs)} 个 .cs", "-")
    else:
        add("blocking", "玩法脚本回填", "-", "不足", f"仅 {len(cs)} 个 .cs",
            "T2 反编译回填 GameScripts/firstpass/Assembly-CSharp")


def check_platform_stubs(root: Path) -> None:
    d = root / "Assets" / "Plugins" / "PlatformStubs"
    if d.exists() and any(d.glob("*.cs")):
        add("advisory", "平台桩接骨架", "-", "OK", str(len(list(d.glob("*.cs")))) + " 个桩文件", "-")
    else:
        add("advisory", "平台桩接骨架", "-", "缺失",
            "Steam/ImGui/SokLoc 调用无兜底, 可能运行期卡死", "复制 Assets/Plugins/PlatformStubs/")


def check_license() -> None:
    lic = os.environ.get("UNITY_LICENSE", "")
    ser = os.environ.get("UNITY_SERIAL", "")
    e = os.environ.get("UNITY_EMAIL", "")
    p = os.environ.get("UNITY_PASSWORD", "")
    if lic:
        ok = "ULF" in lic or "<" in lic
        add("blocking", "Unity 许可证 (GameCI)", "-",
            "OK" if ok else "格式异常",
            "UNITY_LICENSE(.ulf 全文) 已配置" if ok else "UNITY_LICENSE 不是 .ulf XML 文本",
            "-" if ok else "Personal 版只能用自己的 .ulf; 从 Unity Hub 导出 Unity_lic.ulf 全文")
    elif ser and e and p:
        add("blocking", "Unity 许可证 (GameCI)", "-", "OK",
            "UNITY_SERIAL + 邮箱密码 已配置 (Plus/Pro)", "-")
    else:
        add("blocking", "Unity 许可证 (GameCI)", "-", "缺失",
            "缺 UNITY_LICENSE(ulf) 或 UNITY_SERIAL(Plus/Pro)",
            "Personal: 从 Unity Hub 导出 .ulf 全文存 UNITY_LICENSE; "
            "Plus/Pro: 配 UNITY_SERIAL + UNITY_EMAIL + UNITY_PASSWORD")


def check_keystore() -> None:
    ks = os.environ.get("KEYSTORE_NAME", "")
    if ks:
        add("advisory", "Release 签名", "5 结果", "OK", f"KEYSTORE_NAME={ks}", "-")
    else:
        add("advisory", "Release 签名", "5 结果", "调试签名",
            "严格模式 Release 未配 keystore 会退出码 4",
            "配 KEYSTORE_NAME/KEYSTORE_PASSWORD/KEYALIAS_NAME/KEYALIAS_PASSWORD 四件套")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", default=".")
    ap.add_argument("--strict", action="store_true", help="有 blocking 未就绪项时退出 1")
    ap.add_argument("--json-out", default=None)
    ap.add_argument("--md-out", default=None)
    args = ap.parse_args()

    root = Path(args.root).resolve()

    check_engine(root)
    check_scenes(root)
    check_build_settings_scenes(root)
    check_link_xml(root)
    check_manifest(root)
    check_portbuild(root)
    check_shaders(root)
    check_scripts(root)
    check_platform_stubs(root)
    check_license()
    check_keystore()

    blockers = [r for r in BLOCKING if r["status"] not in ("OK",)]
    ready = not blockers
    verdict = "READY" if ready else "NOT_READY"
    if ready and [r for r in ADVISORY if r["status"] != "OK"]:
        verdict = "READY_WITH_WARNINGS"

    print(f"root={root}")
    print(f"结论: {verdict}  blocking_unmet={len(blockers)} advisory={len([r for r in ADVISORY if r['status'] != 'OK'])}")
    for r in BLOCKING + ADVISORY:
        mark = "OK  " if r["status"] == "OK" else "TODO"
        print(f"  [{mark}] {r['item']} <门 {r['gate']}> {r['status']}: {r['detail']}")

    payload = {"root": str(root), "verdict": verdict, "ready": ready,
               "project_ready": "true" if (root / "ProjectSettings" / "ProjectVersion.txt").exists() else "false",
               "blocking": BLOCKING, "advisory": ADVISORY}
    if args.json_out:
        Path(args.json_out).write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")

    md = [f"### 首跑前置检查: **{verdict}**", "", "| 级别 | 项 | 门 | 状态 | 现状 | 补法 |", "|---|---|---|---|---|---|"]
    for r in blockers + [r for r in ADVISORY if r["status"] != "OK"]:
        md.append(f"| blocking | {r['item']} | {r['gate']} | {r['status']} | {r['detail']} | {r['fix']} |")
    if not blockers:
        md.append("| - | 全部 blocking 项已满足 | - | OK | - | 可以构建 |")
    md.append("")
    md.append(f"<sub>{len([r for r in BLOCKING if r['status'] == 'OK'])} 项 blocking 已满足, "
              f"{len(blockers)} 项待补</sub>")
    mdtext = "\n".join(md)
    if args.md_out:
        Path(args.md_out).write_text(mdtext, encoding="utf-8")
    summary = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary:
        try:
            with open(summary, "a", encoding="utf-8") as fh:
                fh.write(mdtext + "\n")
        except OSError:
            pass

    if args.strict and blockers:
        print(f"::error::{len(blockers)} 项构建前置未满足, 见上表")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
