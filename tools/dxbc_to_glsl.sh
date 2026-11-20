#!/usr/bin/env bash
# DXBC -> SPIR-V -> Vulkan GLSL: 数学等价的精确重建(非猜测)
# 依赖: dxbc-spirv 的 dxbc_compiler, SPIRV-Cross 的 spirv-cross
set -euo pipefail
DXC=${DXC:-/tmp/dxbc-spirv/builddir/tools/dxbc_compiler}
SC=${SC:-/tmp/SPIRV-Cross/build/spirv-cross}
IN=${1:-shader_extract/dxbc}; OUT=${2:-shader_extract/glsl_exact}
mkdir -p "$OUT"
ok=0; fail=0
for f in "$IN"/*.dxbc; do
  n=$(basename "$f" .dxbc)
  if "$DXC" --spv /tmp/_t.spv "$f" >/dev/null 2>&1 && \
     "$SC" /tmp/_t.spv --vulkan-semantics --version 450 > "$OUT/$n.glsl" 2>/dev/null; then
    ok=$((ok+1)); else fail=$((fail+1)); echo "FAIL $n"; fi
done
echo "ok=$ok fail=$fail"
