#!/usr/bin/env bash
# 从原版 Managed 目录反编译出 Assets/Scripts 的全部 C# 源码(可复现)。
# 依赖: dotnet(任意 SDK 10 可用) + ilspycmd(需 .NET 6 运行时, 本机通过 dotnet-install 装在 ~/.dotnet)
# 关键坑: 每个程序集都会生成一个 UnitySourceGeneratedAssemblyMonoScriptTypes_v1.cs,
#        这是 Unity 自动生成物, 必须删除, 否则多程序集合并时会重复定义类型。
set -euo pipefail
MANAGED="${1:?用法: decompile_assemblies.sh <Managed目录> <输出目录>}"
OUT="${2:?}"
TOOL="${ILSPYCMD:-$HOME/.dotnet/tools/ilspycmd}"
declare -A MAP=( [GameScripts]=GameScripts [Assembly-CSharp-firstpass]=Firstpass [csS]=csS [SokLoc]=SokLoc [Assembly-CSharp]=AssemblyCSharp )
for asm in "${!MAP[@]}"; do
  dst="$OUT/${MAP[$asm]}"
  rm -rf "$dst"; mkdir -p "$dst"
  "$TOOL" -p -o "$dst" -r "$MANAGED" "$MANAGED/$asm.dll" >/dev/null
  find "$dst" -name "UnitySourceGeneratedAssemblyMonoScriptTypes_v1.cs" -delete
  rm -f "$dst"/*.csproj
  echo "$asm -> $(find "$dst" -name '*.cs' | wc -l) files"
done
