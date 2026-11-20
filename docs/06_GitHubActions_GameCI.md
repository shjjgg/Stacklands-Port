# 06 · GitHub Actions + GameCI 工作流

## 1. 流水线概览

工作流文件：[`../.github/workflows/unity-android-il2cpp.yml`](../.github/workflows/unity-android-il2cpp.yml)

```
push / PR / manual
   ├─ job: static-analysis  还原源包(可选) → 元数据扫描 + 阻断/PInvoke 预扫描 + 平台引用核对 + shader blob/台账 + 内容盘点
   │                         + IL2CPP 风险扫描(反编译源码落地后) → 上传报告/blob
   └─ job: build-android    Personal 授权在线激活 → 缓存 Library → IL2CPP 出包 → 归档产物/符号/日志
                           （工程未落地或缺账号密钥时自动跳过，不产生无意义失败）
```

- 引擎版本：`2022.3.4f1`（与源包锁定一致，`env.UNITY_VERSION`）。
- 后端：IL2CPP；架构：arm64-v8a（首版）；目标：Android。
- 静态分析作为独立 job 先跑；源数据（原版版权二进制）**不入库**，通过 CI artifact 或受保护目录注入（`SOURCE_DATA` / `SOURCE_RAW` / `DECOMPILED_SRC`），对应目录为空时该步自动跳过。
- 扫描告警默认非阻断；版本/大小不一致（`tools/reconstruct_source.py` 退出码）为硬阻断。构建 job `needs: static-analysis`。

## 2. 仓库 Secrets 配置

| Secret | 用途 | 备注 |
|---|---|---|
| `UNITY_EMAIL` | Unity 账号邮箱 | **必需**（Unity Personal 在线激活） |
| `UNITY_PASSWORD` | Unity 账号密码 | **必需**；不入库，只走 GitHub Secrets |
| `UNITY_SERIAL` | Unity 序列号 | 仅 Plus/Pro 需要；**Personal 版无效，无需配置** |
| `KEYSTORE_NAME` | 签名 keystore 文件名 | Release 签名 |
| `KEYSTORE_PASSWORD` | keystore 密码 | |
| `KEYALIAS_NAME` | 别名 | |
| `KEYALIAS_PASSWORD` | 别名密码 | |

> keystore 文件本身通过 secrets 注入或在加密存储中管理，不提交明文。Debug 包可用 Unity 调试签名先出 APK 冒烟。

### 2.1 授权方式（已按 Personal 版实测校正）

`game-ci/unity-activate` 只认 `UNITY_LICENSE`（.ulf 文件）或 `UNITY_SERIAL` + 账号三件套，**Unity Personal 没有序列号**，直接用该 action 会报
`License activation strategy could not be determined`。当前工作流改为在
`unityci/editor:ubuntu-2022.3.4f1-android-3` 容器内直接调用授权客户端：

```bash
Unity.Licensing.Client --activate-all --include-personal \
  --username "$UNITY_EMAIL" --password "$UNITY_PASSWORD"
```

随后 `Unity -batchmode -nographics -quit -executeMethod PortBuild.PerformAndroidBuild` 出包。
该路径与本仓库此前个人版构建流程一致，只需 `UNITY_EMAIL` / `UNITY_PASSWORD` 两个密钥。

### 2.2 构建前置守卫

`static-analysis` 先探测两个条件并输出给 `build-android`：

| 输出 | 判定 | 作用 |
|---|---|---|
| `project_ready` | 存在 `ProjectSettings/ProjectVersion.txt` | 工程未落地（AssetRipper 未导出）则跳过构建 |
| `license_ready` | `UNITY_EMAIL`、`UNITY_PASSWORD` 均非空 | 缺密钥则跳过构建 |

手动 `workflow_dispatch` 触发时跳过上述门禁，但首步 `Preflight guard` 会**显式报错**并给出原因：
工程缺失、缺 `Assets/Editor/PortBuild.cs`、引擎版本与基线 `2022.3.4f1` 不一致（禁止跨大版本）、密钥缺失。

## 3. 构建入口（Editor 脚本）

`-executeMethod PortBuild.PerformAndroidBuild` 对应 `Assets/Editor/PortBuild.cs` 的静态方法，职责：

1. 场景：优先取 `EditorBuildSettings.scenes`（启用项），不足两个时回落到原版固定列表
   `Assets/SokpopIntro/IntroScene.unity` → `Assets/Scenes/SampleScene.unity`；
   **任一场景文件不存在直接 `Exit(2)`**，不出"装得上但进不去游戏"的包。
2. PlayerSettings：IL2CPP + ARM64、`SetUseDefaultGraphicsAPIs(false)` 后再设 Vulkan/GLES3、
   Linear 色彩空间、`SetMobileMTRendering(true)`、Unity splash 开启、包名/版本/版本号。
3. 裁剪：`ManagedStrippingLevel.Low` + `stripEngineCode = false`（反射/Harmony 路径，见 docs/04）。
4. IL2CPP 编译配置 Release（`BUILD_TYPE=Debug` 时转 Debug 并加 `BuildOptions.Development`）。
5. 签名：`KEYSTORE_NAME` 存在才启用 `useCustomKeystore`，否则调试签名并告警（仅内部冒烟）。
6. `BuildPipeline.BuildPlayer` 输出 `builds/android/Stacklands-Port.apk|aab`，
   摘要含 result/size/errors/warnings 与全部生效配置，失败 `Exit(1)`、成功 `Exit(0)`。

可覆盖的运行参数（不改工作流，走仓库 Variables / 环境变量）：

| 变量 | 默认 | 作用 |
|---|---|---|
| `BUNDLE_IDENTIFIER` | `com.sokpop.stacklands.port` | 包名；用默认值时会告警（原版包名未解出） |
| `SCREEN_ORIENTATION` | `LandscapeLeft` | `Portrait`/`PortraitUpsideDown`/`LandscapeRight`/`AutoRotation` |
| `MIN_SDK` | `26` | 低于/非法值回落默认 |
| `TARGET_SDK` | `auto` | `auto` 跟随 Unity 默认；否则按数值，非法枚举回落 33 |
| `BUILD_TYPE` | `Release` | `Debug` 出开发版 |
| `BUNDLE_VERSION_CODE` | `github.run_number` | 版本号，随 CI 递增 |

> 该脚本是移植工程的构建胶水，不改玩法逻辑；首版可先 `exportAndroidProject` 出工程再本地打包验证，稳定后直接出 AAB/APK。

## 4. 缓存与性能

- 缓存 `Library/` 与 `builds/`，key 按 `Assets/**`、`ProjectSettings/**` 哈希；引擎版本变更时自动失效。
- GameCI 镜像已带对应版本 Unity；Android SDK/NDK/JDK 由引擎模块提供，无需在 runner 手动装。
- 首次冷构建较慢（IL2CPP 编译 + 符号生成），后续走缓存；超时阈值 120 分钟，必要时上调。

## 5. 产物归档

| 产物 | 内容 | 保留期 |
|---|---|---|
| `android-<type>-<sha>` | APK/AAB | 14 天 |
| `il2cpp-symbols-<sha>` | `symbols.zip`、`global-metadata.dat` | 30 天，用于崩溃堆栈还原 |
| `editor-log-<sha>` | 构建失败时 Editor/IL2CPP 日志 | 按需 |
| `scan-report` | 静态扫描 md+json | 长期 |

## 6. 矩阵与后续扩展

- 首版单架构 arm64-v8a；如需覆盖老设备，再加 `armeabi-v7a` matrix。
- 图形 API 不在 CI 构建期区分；Vulkan/GLES3 差异在设备冒烟阶段抓帧校验（见 07）。
- 可追加：单元测试 job（Unity Test Runner，但剔除原版 110 个测试脚本中不兼容部分）、资源大小报告、shader 变体收集 job。

## 7. 授权与合规注意

- GameCI 激活需要有效 Unity 授权；CI 环境并发受授权档位限制。
- 本工程为个人逆向移植研究用途；上架/分发需自行确认版权与授权，不包含任何官方渠道 SDK 配置。
