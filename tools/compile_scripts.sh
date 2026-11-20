#!/usr/bin/env bash
# 用 Roslyn 真实编译 Assets/Scripts(不是文档核对): 引用原版 Managed 里的 UnityEngine 模块
# 与 Assets/Plugins/Precompiled 的插件 DLL, 目标 netstandard2.1 / C# 9(与 Unity 2022.3 一致)。
set -euo pipefail
PORT="$(cd "$(dirname "$0")/.." && pwd)"
MANAGED="${1:?用法: compile_scripts.sh <原版 Managed 目录> [工作目录]}"
WORK="${2:-/tmp/stacklands_compilecheck}"
mkdir -p "$WORK"
python3 - "$PORT" "$MANAGED" "$WORK" <<'PY'
import glob,os,sys
port,managed,work=sys.argv[1:4]
refs=[f for f in sorted(glob.glob(os.path.join(managed,"*.dll")))
      if os.path.basename(f).startswith(("UnityEngine","Unity."))]
refs+=sorted(glob.glob(os.path.join(port,"Assets/Plugins/Precompiled/*.dll")))
lines="\n".join(f'    <Reference Include="{r}" />' for r in refs)
proj=f"""<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>netstandard2.1</TargetFramework>
    <LangVersion>9.0</LangVersion>
    <EnableDefaultCompileItems>false</EnableDefaultCompileItems>
    <AssemblyName>CompileCheck</AssemblyName>
    <GenerateAssemblyInfo>false</GenerateAssemblyInfo>
    <NoWarn>CS0618;CS0649;CS0169;CS0414;CS0108;CS0114;CS0162;CS0219;CS0168;CS0165;CS0436;CS0660;CS0661;CS0102;CS0111;CS0105;CS0164;CS0200;CS0252;CS0253;CS0693;CS0708;CS0737;CS0542;CS0535;CS0104;CS0117;CS0121;CS0136;CS0151;CS0029;CS0266;CS1503;CS1729;CS7036;CS0019;CS0020;CS0021;CS0119;CS0118;CS0123</NoWarn>
  </PropertyGroup>
  <ItemGroup>
    <Compile Include="{port}/Assets/Scripts/**/*.cs" />
  </ItemGroup>
  <ItemGroup>
{lines}
  </ItemGroup>
</Project>
"""
open(os.path.join(work,"check.csproj"),"w").write(proj)
print(f"refs={len(refs)}")
PY
export DOTNET_ROOT="${DOTNET_ROOT:-$HOME/.dotnet}"
export PATH="$DOTNET_ROOT:$PATH"
dotnet build "$WORK/check.csproj" -v q 2>&1 | tail -5
