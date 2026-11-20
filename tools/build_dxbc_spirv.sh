#!/usr/bin/env bash
# 构建权威 DXBC 反汇编器(dxbc-spirv / doitsujin), 产出 tools/bin/dxbc_disasm
set -euo pipefail
SRC=${1:-/tmp/dxbc-spirv}
[ -d "$SRC" ] || git clone --depth 1 https://github.com/doitsujin/dxbc-spirv.git "$SRC"
cd "$SRC" && git submodule update --init --recursive
meson setup builddir -Denable_tools=true >/dev/null
ninja -C builddir
cp builddir/tools/dxbc_disasm "$(dirname "$0")/bin/dxbc_disasm"
echo OK
