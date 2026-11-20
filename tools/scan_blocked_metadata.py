#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
托管程序集 · IL2CPP 阻断子系统 / 原生互操作 元数据级预扫描

在无反编译器、无 .NET 工具链的静态环境下, 用 dnfile 读取已投递托管 DLL 的
程序集引用 / 类型引用 / 成员引用 / PInvoke(ImplMap) 表, 并对原始字节做关键字
字符串扫描, 预定位 IL2CPP/AOT 阻断项与原生依赖。

局限: 本脚本只观测元数据与字符串, 不解码 IL 方法体; 某类型是否在启动链路被
真正调用, 仍需反编译源码后由 scan_il2cpp_risks.py + 编辑器复核。

用法:
  python3 scan_blocked_metadata.py --managed <Managed 目录> --out <输出目录>

产出:
  <out>/blocked_metadata.md     人工台账
  <out>/blocked_metadata.json   机器可读台账
"""
import argparse, os, re, json, datetime, collections

try:
    import dnfile
except ImportError:
    raise SystemExit("[FATAL] 需要 dnfile: pip install dnfile")


# 阻断子系统规则: 标签 -> 匹配程序集名 / 命名空间 / 类型名 / 成员名 / 字符串
BLOCK_RULES = {
    "Harmony 补丁": {
        "assemblies": ["0Harmony", "HarmonyLib"],
        "types": ["HarmonyLib", "Harmony"],
        "members": ["PatchAll", "CreateProcessor", "AddPatch", "Unpatch"],
        "strings": ["HarmonyLib", "0Harmony"],
    },
    "MonoMod 运行时 Detour": {
        "assemblies": ["MonoMod.RuntimeDetour", "MonoMod.Utils"],
        "types": ["MonoMod", "RuntimeDetour", "Detour"],
        "members": ["Detour", "ILHook", "NativeDetour", "HookGen"],
        "strings": ["MonoMod", "RuntimeDetour"],
    },
    "Mono.Cecil 元数据改写": {
        "assemblies": ["Mono.Cecil"],
        "types": ["Mono.Cecil", "Cecil"],
        "members": [],
        "strings": ["Mono.Cecil", "Cecil"],
    },
    "Reflection.Emit 动态生成": {
        "assemblies": ["System.Reflection.Emit", "System.Reflection.Emit.ILGeneration",
                       "System.Reflection.Emit.Lightweight"],
        "types": ["System.Reflection.Emit", "DynamicMethod", "DynamicAssembly",
                  "ILGenerator"],
        "members": ["DynamicMethod", "DynamicAssembly", "ILGenerator", "DefineMethod"],
        "strings": ["DynamicMethod", "Reflection.Emit", "ILGenerator"],
    },
    "Roslyn / 动态编译": {
        "assemblies": ["Microsoft.CodeAnalysis", "Microsoft.CSharp"],
        "types": ["Microsoft.CodeAnalysis", "CSharpCompilation", "Roslyn"],
        "members": ["CSharpCompilation"],
        "strings": ["Microsoft.CodeAnalysis", "CSharpCompilation", "Roslyn"],
    },
}

# 引擎 / 系统基线程序集(仅记录, 不视为游戏自研阻断项)
ENGINE_PREFIX = ("UnityEngine", "Unity.", "mscorlib", "netstandard", "System.",
                 "Microsoft.Win32", "Microsoft.CSharp")

STRING_RE = re.compile(rb"[ -~]{4,}")


def classify_dll(name):
    n = name.lower()
    if n.startswith("unityengine") or n.startswith("unity."):
        return "engine"
    if n in ("mscorlib.dll", "netstandard.dll") or n.startswith("system."):
        return "system"
    return "game-or-thirdparty"


def scan_dll(path):
    name = os.path.basename(path)
    info = {
        "dll": name,
        "kind": classify_dll(name),
        "assembly_refs": [],
        "blocked_assembly_refs": {},
        "blocked_type_refs": {},
        "blocked_member_refs": {},
        "blocked_string_hits": {},
        "pinvoke": {},
    }
    try:
        pe = dnfile.dnPE(path)
    except Exception as e:
        info["error"] = f"dnfile 解析失败: {e}"
        return info

    # 程序集引用
    arefs = []
    if pe.net.mdtables.AssemblyRef:
        for r in pe.net.mdtables.AssemblyRef.rows:
            arefs.append(str(r.Name))
    info["assembly_refs"] = arefs

    # 类型引用
    typedefs = []
    if pe.net.mdtables.TypeRef:
        for r in pe.net.mdtables.TypeRef.rows:
            ns = str(r.TypeNamespace) if r.TypeNamespace else ""
            tn = str(r.TypeName)
            typedefs.append((ns, tn))

    # 成员引用
    members = []
    if pe.net.mdtables.MemberRef:
        for r in pe.net.mdtables.MemberRef.rows:
            try:
                row = r.Class.row
                parent = str(getattr(row, "TypeName", None) or getattr(row, "Name", None) or "")
            except Exception:
                parent = ""
            members.append((parent, str(r.Name)))

    # PInvoke (ImplMap)
    if pe.net.mdtables.ImplMap:
        for r in pe.net.mdtables.ImplMap.rows:
            try:
                lib = str(r.ImportScope.row.Name)
            except Exception:
                lib = "<unknown>"
            info["pinvoke"].setdefault(lib, []).append(str(r.ImportName))

    # 阻断规则命中
    for tag, rule in BLOCK_RULES.items():
        a = [x for x in arefs if any(k.lower() in x.lower() for k in rule["assemblies"])]
        t = [f"{ns}::{tn}" for ns, tn in typedefs
             if any(k in f"{ns} {tn}" for k in rule["types"])]
        m = [f"{p}::{x}" for p, x in members
             if any(re.search(rf"\b{re.escape(k)}\b", x) for k in rule["members"])]
        if a:
            info["blocked_assembly_refs"][tag] = sorted(set(a))
        if t:
            info["blocked_type_refs"][tag] = sorted(set(t))
        if m:
            info["blocked_member_refs"][tag] = sorted(set(m))

    # 原始字符串扫描
    raw = open(path, "rb").read()
    strings = [s.decode("latin1") for s in STRING_RE.findall(raw)]
    for tag, rule in BLOCK_RULES.items():
        hits = sorted({x for x in strings
                        if any(k in x for k in rule["strings"])})
        if hits:
            info["blocked_string_hits"][tag] = hits[:30]

    return info


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--managed", required=True, help="Stacklands_Data/Managed 目录")
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    dlls = sorted(f for f in os.listdir(args.managed) if f.lower().endswith(".dll"))
    results = [scan_dll(os.path.join(args.managed, f)) for f in dlls]

    # 汇总: 游戏/第三方侧命中阻断子系统的程序集
    blocked_summary = collections.defaultdict(list)
    # 被禁子系统自身(内部自引用, 整体禁用, 不计入游戏侧风险)
    BLOCKED_SELF = {"0harmony.dll", "monomod.runtimedetour.dll", "monomod.utils.dll",
                    "mono.cecil.dll"}
    pinvoke_game = {}
    pinvoke_bcl = {}
    for r in results:
        is_self = r["dll"].lower() in BLOCKED_SELF
        if r["kind"] == "game-or-thirdparty" and not is_self:
            for tag in r["blocked_assembly_refs"]:
                blocked_summary[tag].append(r["dll"])
        for lib, entries in r["pinvoke"].items():
            bucket = pinvoke_bcl if r["kind"] in ("engine", "system") or is_self else pinvoke_game
            bucket.setdefault(lib, {"caller": set(), "count": 0})
            bucket[lib]["caller"].add(r["dll"])
            bucket[lib]["count"] += len(entries)

    def pinvoke_dict(bucket):
        return {k: {"caller": sorted(v["caller"]), "entry_count": v["count"]}
                for k, v in sorted(bucket.items())}

    ledger = {
        "scanned_at": datetime.datetime.now().isoformat(timespec="seconds"),
        "managed_dir": os.path.abspath(args.managed),
        "dll_count": len(results),
        "blocked_summary": {k: sorted(set(v)) for k, v in blocked_summary.items()},
        "pinvoke_game_native": pinvoke_dict(pinvoke_game),
        "pinvoke_bcl_native": pinvoke_dict(pinvoke_bcl),
        "dlls": results,
    }

    os.makedirs(args.out, exist_ok=True)
    jpath = os.path.join(args.out, "blocked_metadata.json")
    with open(jpath, "w", encoding="utf-8") as f:
        json.dump(ledger, f, ensure_ascii=False, indent=2)

    L = ["# IL2CPP 阻断子系统 / 原生互操作 元数据预扫描台账\n",
         f"- 扫描时间: {ledger['scanned_at']}",
         f"- 托管 DLL 数: {len(results)}",
         "- 局限: 仅元数据 + 字符串观测, 未解码 IL 方法体; 调用链是否触达需反编译后复核。\n",
         "## 1. 阻断子系统命中（游戏/第三方程序集直接引用）\n",
         "> 被禁子系统自身程序集（0Harmony / MonoMod.* / Mono.Cecil / Reflection.Emit）的内部自引用不计入本表；"
         "它们作为整体在 IL2CPP 下禁用，明细见 §3。\n"]
    if blocked_summary:
        for tag, dlls_hit in blocked_summary.items():
            L.append(f"### {tag}\n")
            for d in sorted(set(dlls_hit)):
                r = next(x for x in results if x["dll"] == d)
                refs = r["blocked_assembly_refs"].get(tag, [])
                tres = r["blocked_type_refs"].get(tag, [])
                L.append(f"- `{d}` 引用程序集: {', '.join(refs) or '—'}")
                if tres:
                    L.append(f"  - 类型: {', '.join(tres)}")
            L.append("")
    else:
        L.append("未命中。\n")

    L.append("## 2. 原生互操作 (PInvoke) 依赖\n")
    L.append("### 2.1 游戏 / 第三方侧原生依赖（Android 需桩接或替换）\n")
    L.append("| 原生库 | 调用方托管程序集 | 入口数 | Android 处置 |")
    L.append("|---|---|---:|---|")
    for lib, meta in ledger["pinvoke_game_native"].items():
        处置 = "Windows 原生, 不搬运; 托管包装保留签名并在入口守卫走桩接"
        L.append(f"| {lib} | {', '.join(meta['caller'])} | {meta['entry_count']} | {处置} |")
    if not ledger["pinvoke_game_native"]:
        L.append("| — | — | 0 | — |")

    L.append("\n### 2.2 Mono 运行时 / 系统 BCL 原生调用（不随 IL2CPP 工程搬运）\n")
    L.append("> 来自 mscorlib / System.* / System.Drawing / System.Data / 被禁子系统内部，"
             "属 Mono 运行时与禁用栈自身；IL2CPP 使用对应 .NET 运行时与引擎模块，不复制这些 PInvoke。\n")
    L.append("| 原生库 | 调用方 | 入口数 |")
    L.append("|---|---|---:|")
    for lib, meta in ledger["pinvoke_bcl_native"].items():
        L.append(f"| {lib} | {', '.join(meta['caller'])} | {meta['entry_count']} |")

    L.append("\n## 3. 各程序集明细（仅列有命中/PInvoke 的游戏/第三方 DLL）\n")
    for r in results:
        if r["kind"] == "engine" or r["kind"] == "system":
            continue
        if not (r["blocked_assembly_refs"] or r["blocked_type_refs"]
                or r["blocked_member_refs"] or r["pinvoke"] or r["blocked_string_hits"]):
            continue
        L.append(f"### {r['dll']}\n")
        if r["dll"].lower() in BLOCKED_SELF:
            L.append("> 被禁子系统自身程序集，IL2CPP 下整体禁用，以下为其内部自引用明细。\n")
        if r.get("error"):
            L.append(f"- 解析: {r['error']}")
        tags = set(r["blocked_assembly_refs"]) | set(r["blocked_type_refs"]) | \
               set(r["blocked_member_refs"]) | set(r["blocked_string_hits"])
        for tag in sorted(tags):
            refs = r["blocked_assembly_refs"].get(tag, [])
            tres = r["blocked_type_refs"].get(tag, [])
            mems = r["blocked_member_refs"].get(tag, [])
            strs = r["blocked_string_hits"].get(tag, [])
            if refs or tres or mems:
                L.append(f"- **{tag}** 程序集引用: {', '.join(refs) or '—'}")
                if tres:
                    L.append(f"  - 类型: {', '.join(tres)}")
                if mems:
                    L.append(f"  - 成员: {', '.join(mems)}")
                if strs:
                    L.append(f"  - 字符串: {', '.join(strs[:8])}")
            elif strs:
                L.append(f"- **{tag}** 仅字符串出现（无程序集/类型/成员元数据引用，反编译阶段确认是否未使用残留）: "
                         f"{', '.join(strs[:8])}")
        if r["pinvoke"]:
            for lib, entries in r["pinvoke"].items():
                L.append(f"- PInvoke `{lib}`: {len(entries)} 入口（示例: {', '.join(entries[:5])}）")
        L.append("")

    mpath = os.path.join(args.out, "blocked_metadata.md")
    with open(mpath, "w", encoding="utf-8") as f:
        f.write("\n".join(L) + "\n")

    print(f"[OK] 扫描 {len(results)} 个 DLL -> {args.out}")
    for tag, d in blocked_summary.items():
        print(f"  {tag}: {sorted(set(d))}")
    print(f"  PInvoke 游戏侧原生库: {list(pinvoke_game.keys())}")


if __name__ == "__main__":
    main()
