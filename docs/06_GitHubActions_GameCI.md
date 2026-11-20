# 06 · GitHub Actions + GameCI 工作流

## 1. 流水线概览

工作流文件：[`../ci/unity-android-il2cpp.yml`](../ci/unity-android-il2cpp.yml)

```
push / PR / manual
   ├─ job: static-analysis  还原源包(可选) → 元数据扫描 + 阻断/PInvoke 预扫描 + 平台引用核对 + shader blob/台账 + 内容盘点
   │                         + IL2CPP 风险扫描(反编译源码落地后) → 上传报告/blob
   └─ job: build-android    GameCI 激活授权 → 缓存 Library → IL2CPP 出包 → 归档产物/符号/日志
```

- 引擎版本：`2022.3.4f1`（与源包锁定一致，`env.UNITY_VERSION`）。
- 后端：IL2CPP；架构：arm64-v8a（首版）；目标：Android。
- 静态分析作为独立 job 先跑；源数据（原版版权二进制）**不入库**，通过 CI artifact 或受保护目录注入（`SOURCE_DATA` / `SOURCE_RAW` / `DECOMPILED_SRC`），对应目录为空时该步自动跳过。
- 扫描告警默认非阻断；版本/大小不一致（`tools/reconstruct_source.py` 退出码）为硬阻断。构建 job `needs: static-analysis`。

## 2. 仓库 Secrets 配置

| Secret | 用途 | 备注 |
|---|---|---|
| `UNITY_SERIAL` | Unity 序列号 | 个人/组织授权；GameCI 激活用 |
| `UNITY_EMAIL` | Unity 账号邮箱 | |
| `UNITY_PASSWORD` | Unity 账号密码 | 或改用 license file 方式，避免密码入库 |
| `KEYSTORE_NAME` | 签名 keystore 文件名 | Release 签名 |
| `KEYSTORE_PASSWORD` | keystore 密码 | |
| `KEYALIAS_NAME` | 别名 | |
| `KEYALIAS_PASSWORD` | 别名密码 | |

> keystore 文件本身通过 secrets 注入或在加密存储中管理，不提交明文。Debug 包可用 Unity 调试签名先出 APK 冒烟。

## 3. 构建入口（Editor 脚本）

`buildMethod: PortBuild.PerformAndroidBuild` 对应一个放在 `Assets/Editor/PortBuild.cs` 的静态方法，职责：

1. 切换 `EditorUserBuildSettings.activeBuildTarget = Android`。
2. 配置 PlayerSettings：IL2CPP、arm64-v8a、图形 API（Vulkan 优先 + GLES3 兼容）、包名/版本、屏幕方向、最低 API。
3. 场景列表取自原版 `EditorBuildSettings`（IntroScene → SampleScene）。
4. 执行 `BuildPipeline.BuildPlayer`，输出到 `builds/android`。
5. 输出构建摘要（场景、变体、被裁程序集）到日志，供 CI 解析。

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
