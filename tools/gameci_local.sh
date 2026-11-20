#!/usr/bin/env bash
# gameci_local.sh — 在没有 docker 的机器上复刻 game-ci/unity-builder 的执行段
# 阶段: (3) 激活 -> (4) 导入 -> (5) 构建 -> (6) 收集校验
# 用法:
#   bash tools/gameci_local.sh --rootfs /home/user/unityci/rootfs \
#        --project . --out builds/android [--method PortBuild.StrictBuild]
# 说明: 若环境里没有许可证(UNITY_LICENSE / 常驻 ulf / 账号凭证), 会在阶段 3 明确失败,
#       与云端 builder 的行为一致 —— 便于先在工程侧验证, 再补凭证。
set -uo pipefail

ROOTFS="${HOME}/unityci/rootfs"
PROJECT="$(pwd)"
OUT="builds/android"
METHOD="PortBuild.StrictBuild"
LOG_DIR="${TMPDIR:-/tmp}/gameci-local"
mkdir -p "$LOG_DIR"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --rootfs) ROOTFS="$2"; shift 2;;
    --project) PROJECT="$2"; shift 2;;
    --out) OUT="$2"; shift 2;;
    --method) METHOD="$2"; shift 2;;
    *) echo "unknown arg: $1"; exit 2;;
  esac
done

UNITY_BIN="${ROOTFS}/opt/unity/Editor/Unity"
[[ -x "$UNITY_BIN" ]] || { echo "[FATAL] editor not found: $UNITY_BIN"; exit 3; }
echo "[1/5] editor: $("$UNITY_BIN" -version 2>/dev/null | tail -1)"

# ---------- 阶段 3: 激活 ----------
echo "[2/5] activation"
ULF="${UNITY_LICENSE_FILE:-$HOME/.local/share/unity3d/Unity/Unity_lic.ulf}"
if [[ -n "${UNITY_LICENSE:-}" ]]; then
  mkdir -p "$(dirname "$ULF")"
  printf '%s' "${UNITY_LICENSE}" > "$ULF"
  echo "  wrote ULF from UNITY_LICENSE ($(wc -c < "$ULF") bytes)"
fi

if [[ ! -s "$ULF" ]]; then
  echo "[FAIL] no license file at $ULF"
  echo "       GameCI Personal 需要: Unity Hub 图形界面 Add > Get a free personal license 生成的 ulf,"
  echo "       或 Pro 的 UNITY_SERIAL, 或常驻许可的自托管机器(skipActivation)."
  echo "       (manual activation for Personal 已被 Unity 官方下线, .alf 无法换 ulf)"
  exit 4
fi

# ---------- 阶段 4+5: 导入 + 构建 ----------
mkdir -p "$OUT"
BUILD_LOG="$LOG_DIR/build.log"
echo "[3/5] batchmode build -> $OUT"
"$UNITY_BIN" \
  -batchmode -nographics -quit \
  -projectPath "$PROJECT" \
  -buildTarget Android \
  -executeMethod "$METHOD" \
  -buildPath "$OUT" \
  -logFile "$BUILD_LOG"
RC=$?

# ---------- 阶段 6: 收集校验 ----------
echo "[4/5] verify artifacts"
shopt -s nullglob
APKS=("$OUT"/*.apk)
echo "  apk count: ${#APKS[@]}"
for a in "${APKS[@]}"; do echo "  - $a ($(du -h "$a" | cut -f1))"; done

# ---------- 诊断 ----------
echo "[5/5] diagnostics"
activate_hits=$(grep -cE "No ULF license|Token not found in cache|Unable to update licenses|licensing" "$BUILD_LOG" 2>/dev/null || true)
echo "  unity exit code: $RC   licensing-related lines: $activate_hits"
if [[ $RC -ne 0 || ${#APKS[@]} -eq 0 ]]; then
  echo "--- log tail ---"
  tail -n 60 "$BUILD_LOG"
  exit 5
fi
echo "OK: build produced ${#APKS[@]} apk(s)"
