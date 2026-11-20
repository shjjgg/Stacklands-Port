# GameCI 构建方法：完整机制拆解（针对 Stacklands Android IL2CPP）

本文是"GameCI 到底怎么构建"的工程级说明，包含组件边界、许可证机制、Android 参数链路、
资源/缓存模型、自托管 runner 形态，以及本工程（Unity 2022.3.4f1 / IL2CPP / arm64-v8a）的
可执行配置。所有结论以 GameCI 官方文档（builder、activation、docker-images，v4 与 v6）为准。

---

## 1. 一次构建到底发生了什么

`game-ci/unity-builder` 是一个 **GitHub Action 外壳 + 若干容器内脚本**，不是"Unity 自己会构建"。
它在 Linux runner 上的执行顺序固定为 7 段：

| 阶段 | 做什么 | 关键输入 | 失败表现 |
|---|---|---|---|
| 1 选择镜像 | 按 `unityVersion` + `targetPlatform` 拼镜像名 | `unityVersion`(默认 auto→`ProjectVersion.txt`)、`containerRegistryRepository`(默认 `unityci/editor`)、`containerRegistryImageVersion`(默认 `3`) | `Unable to find image ...` |
| 2 起容器 | `docker run` 挂载仓库 + `$HOME`，设置 CPU/内存/shm | `dockerCpuLimit`、`dockerMemoryLimit`(默认 95% 内存)、`dockerShmSize`(默认 `1025m`) | `Insufficient shared memory` |
| 3 激活 | 把 `UNITY_LICENSE` 写盘并用账号在线重激活 | `UNITY_LICENSE` + `UNITY_EMAIL` + `UNITY_PASSWORD` | `No ULF license found` / `Token not found in cache` |
| 4 导入工程 | `-batchmode -nographics` 打开工程，跑 AssetDatabase 导入 | 工程 `Library`（可缓存） | 导入错误、`-quit` 前崩溃 |
| 5 构建 | 调默认构建脚本或你的 `buildMethod` | `targetPlatform`、`customParameters`、`buildPath` | `BuildFailedException` |
| 6 收集 | 产物落到 `buildsPath/<platform>`（默认 `build/`） | `buildsPath`、`buildName` | 空目录 |
| 7 上传 | **不是** builder 做的，由 `actions/upload-artifact` 完成 | `path: build` | 产物丢失 |

要点：**builder 只负责 1–6，产物可见性必须自己接 `upload-artifact`**；`engineExitCode` 输出可以区分
"激活阶段失败"和"构建阶段失败"，这是排查许可证问题最快的信号。

---

## 2. 镜像与模块：IL2CPP 能不能跑取决于镜像，不取决于输入参数

镜像命名 `<repo>:<unityVersion>-<module>-<imageVersion>`，例如
`unityci/editor:2022.3.4f1-android-3`。`module` 来自 `targetPlatform`，Android → `android`。

- `-base` 镜像不含任何 Build Support 模块，只能跑纯编辑器操作；Android 构建必须 `-android`。
- Android 镜像里预置 JDK / Android SDK / NDK，因此 **不需要** 在 workflow 里手动装 SDK；
  但工程的 SDK/NDK/JDK 路径要么用镜像默认，要么在 `PortBuild` 里显式指定（否则会在
  "Gradle 构建阶段"报 `Android SDK not found`）。
- `Mono vs IL2CPP` **没有** 对应的 action 输入，唯一来源是工程的
  `ProjectSettings/ProjectSettings.asset` 里的 `scriptingBackend.Android = 1`。
  这一点常被误解成"builder 有个 il2cpp 开关"。没有。
- 官方限制：MacOS 的 IL2CPP 不在 docker 镜像支持范围；Android 2019.2 及更低版本需自建镜像。
  本项目是 Android + 2022.3，Linux 镜像即可。

镜像体积与资源：`unityci/editor:*-android-3` 解包后约 7–8 GB，冷启动拉取耗时 3–6 分钟。
本机已有一份 `~/unityci/rootfs`（7.6 GB），即该镜像的解包内容，可直接当"无 docker 版镜像"用。

---

## 3. 许可证：GameCI 唯一真正的门槛

GameCI 支持三种授权形态，**没有第四种**：

### 3.1 Personal（免费版）
官方流程是两步：
1. 在 **Unity Hub GUI** 里 `Preferences > Licenses > Add > Get a free personal license`，
   强制生成 `Unity_lic.ulf`（Windows `C:\ProgramData\Unity\Unity_lic.ulf`，
   Linux `~/.local/share/unity3d/Unity/Unity_lic.ulf`）。
2. 把 `.ulf` 全文存为 `UNITY_LICENSE`，**同时** 保存 `UNITY_EMAIL`、`UNITY_PASSWORD`。

为什么还要邮箱密码？因为 builder 每次跑都会用
`Unity.Licensing.Client` **在线重激活**（日志关键字 `--update-license`、
`Successfully updated license file`）。`.ulf` 只是"种子"，真人授权绑定在账号上；
容器每次是新的机器指纹，必须靠账号把 license 重新落到这台容器。

推论（本项目踩过的坑都落在这里）：
- `license.unity3d.com/manual` 页面已写明 **"Unity no longer supports manual activation of Personal licenses"**，
  所以 `.alf → .ulf` 这条纯离线路径对 Personal 已经关闭。
- 只有 `.alf` 没有 `.ulf`，容器里 Editor 会报 `No ULF license found / Pro License: NO`。
- 容器 `EnvironmentHostname / DeviceName` 每次不同，手工在 A 机器激活的 `.ulf` 到 B 机器
  必须靠 email+password 重激活，否则 `Token not found in cache`。

### 3.2 Professional（Plus/Pro）
`UNITY_SERIAL + UNITY_EMAIL + UNITY_PASSWORD`，不需要 `.ulf`。
这是**唯一**可以"不给文件、只给序列号"的方式；序列号本身是可撤销的授权凭证。
并发席位：Linux 一个平台占 1 席，Windows / macOS 各再占 1 席（与目标数量无关）。

### 3.3 License Server（浮动授权）
`unityLicensingServer: <url>`，构建前后 acquire / return lease。需自建 FlexLM 类服务，
同样属于 Plus/Pro 能力。

**结论**：三种方式都要么需要一份授权文件、要么需要一个序列号，要么需要账号凭证。
"完全没有凭证"的构建在 GameCI 架构里不存在——它本质是把本地编辑器搬进容器，而编辑器必须有 license。

---

## 4. Android 专属参数链路

| 输入 | 作用 | 本项目取值建议 |
|---|---|---|
| `targetPlatform` | 选镜像 module + Unity `BuildTarget` | `Android` |
| `androidExportType` | `androidPackage`(apk) / `androidAppBundle`(aab) / `androidStudioProject` | `androidPackage` |
| `androidVersionCode` | 覆盖 versionCode；缺省时按 `major*1e6+minor*1e3+patch` 生成 | 显式给，避免 versioning 策略影响 |
| `androidTargetSdkVersion` | 覆盖 target API level | 留空走工程 `AndroidTargetSdkVersion` |
| `androidKeystoreName` / `...Base64` / `...Pass` / `androidKeyaliasName` / `...Pass` | 自定义签名 | 首次可省（Unity 用 debug keystore），发布前必须配 |
| `androidSymbolType` | `none/public/debugging`，导出符号 | `public`（崩溃栈回查需要） |
| `versioning` | `Semantic`(默认推荐) / `Tag` / `Custom` / `None` | `Semantic`，但本项目固定 versionCode=1 时不冲突 |

注意：keystore 选项只有在工程 Player Settings 勾了 **Custom Keystore** 才会生效；
默认构建脚本会用上述输入覆盖工程内的 keystore 配置。

---

## 5. `buildMethod` 契约（本项目 `PortBuild.StrictBuild` 属于这一类）

四条硬规则：
1. 必须是 `public static` 方法。
2. 方法所在类必须在 `Assets/Editor` 下或 Editor Assembly 内（否则打包时被剔除，报方法找不到）。
3. workflow 里写成完整 `Namespace.Class.Method`。
4. **workflow 的 `env:` 不会进入 Unity 进程**。要传参只有两条路：
   - 老版本：`customParameters: -foo bar -baz`，在方法里解析 `Environment.GetCommandLineArgs()`；
   - v6：`GAME_CI_DOCKER_ENV`（容器环境变量）+ `unitySettings`（反射改 Editor/Player 设置）。
   本项目用前者，`StrictBuild` 自带严格门（shader 数量、场景完整性、IL2CPP/ARM64 断言）。

`customParameters` 也可以直接传 Unity 自己的构建选项（如 `-standaloneBuildSubtarget Server`），
不经过你的方法。

---

## 6. 缓存与资源模型（决定"第一次 3 分钟 / 之后 40 秒"）

- **Library 缓存**：`actions/cache` 缓存 `path/<project>/Library`，key 用
  `hashFiles('Assets/**','Packages/**','ProjectSettings/**')` + 平台名。
  官方口径：可提速 50%+。key 不可变，所以 hash 必须变，否则永远命中旧缓存。
- **IL2CPP 增量缓存（bee）**：v4/v5 在容器内 `${{ runner.temp }}/_github_home/.cache/unity3d/bee`；
  **v6 改成 runner 自己的 `~/.cache/unity3d/bee`**。缓存它可复用 `libil2cpp` 中间产物，
  IL2CPP 工程第二次构建能从 20 分钟降到 5 分钟量级。
- **shm**：Unity 6.6+ 需要 1 GiB `/dev/shm`，GameCI 默认传 `1025m`。
  2022.3 用默认值即可，不要传 `0`。
- **内存**：默认 95% 宿主机内存。3 GB 机器上必须显式 `dockerMemoryLimit: 2g`，
  否则 Gradle/IL2CPP 双进程会把 OOM killer 引来。

---

## 7. 自托管 runner 形态

Linux 自托管 runner 与 GitHub 托管 runner 的差别只有三处：
1. 必须有 docker（builder 仍然起容器）；
2. 建议 `runAsHostUser: true` + `chownFilesTo`，否则产物属主是容器 root，runner 收不了；
3. `skipActivation` **只对 macOS 自托管有意义**（Unity 跑在宿主机上，激活会与并行 job 冲突）。
   Linux 自托管仍然每次激活，所以许可证问题一样存在。
   若宿主机已长期激活（`Unity_lic.ulf` 常驻），可设 `skipActivation: true` 跳过——这也是
   "无 ULF 上传" 场景下唯一可行的 CI 形态：**许可证活在机器上，而不是活在 secret 里**。

---

## 8. 本项目的现实约束（实测）

| 约束 | 证据 | 影响 |
|---|---|---|
| 无 docker | `docker: command not found` | 本机只能"rootfs 仿真"，不能真跑 builder |
| 内存 3 GB / 2 vCPU | `free -g` | IL2CPP + Gradle 必须限内存，且耗时会很长 |
| Unity 云构建不可用 | Cloud 页面："此服务对您的组织不可用…大中华区运营的组织将无法继续使用此服务" | 云端 Build Automation 这条路关闭 |
| Personal 手动激活下线 | `license.unity3d.com/manual` 原文 | `.alf→.ulf` 已被封 |
| Tuanjie 许可客户端 | `--activate-ulf` 提示 "should be used with --accessToken or --username and --password" | 换引擎也躲不过凭证 |
| GitHub 托管 runner 无凭证 | 仓库 Secrets 仅有 EMAIL/PASSWORD，无 LICENSE/SERIAL | 构建 job 会在激活阶段失败 |

---

## 9. 本地等价执行（无 docker 的 GameCI 仿真）

`tools/gameci_local.sh` 用 `~/unityci/rootfs` 复刻 builder 的第 3–6 段：

```
bash tools/gameci_local.sh --rootfs ~/unityci/rootfs --project . --out builds/android
```

它做四件事：写 license → `-batchmode -nographics -executeMethod PortBuild.StrictBuild`
→ 校验 `builds/android/*.apk` → 打印激活/构建两段日志尾部。
没有许可证时它会在第 3 段就停，并给出明确原因（与云端行为一致，便于本地先验证工程侧）。

---

## 10. 拿到许可证后的最小 workflow（可直接替换现有文件）

```yaml
name: android-il2cpp
on: [workflow_dispatch]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/cache@v4
        with:
          path: Library
          key: Library-Stacklands-Android-${{ hashFiles('Assets/**','Packages/**','ProjectSettings/**') }}
          restore-keys: Library-Stacklands-Android-
      - uses: game-ci/unity-builder@v4
        env:
          UNITY_LICENSE: ${{ secrets.UNITY_LICENSE }}   # 或改用 UNITY_SERIAL
          UNITY_EMAIL: ${{ secrets.UNITY_EMAIL }}
          UNITY_PASSWORD: ${{ secrets.UNITY_PASSWORD }}
        with:
          targetPlatform: Android
          unityVersion: 2022.3.4f1
          buildMethod: PortBuild.StrictBuild
          androidExportType: androidPackage
          androidSymbolType: public
          buildsPath: builds
          buildName: android
          dockerMemoryLimit: 6g
      - uses: actions/upload-artifact@v4
        with:
          name: Stacklands-android
          path: builds/android
```

若走自托管 + 机器常驻许可：`runs-on: [self-hosted, linux]`、`skipActivation: true`、
`runAsHostUser: true`，此时可完全不给任何 license secret。

---

## 11. 排错对照表

| 日志 | 含义 | 处置 |
|---|---|---|
| `No ULF license found` | 容器里没写 license 文件 | 检查 `UNITY_LICENSE` 是否为空/被截断 |
| `Token not found in cache` + `Unable to update licenses` | 在线重激活失败：账号密码错、或该 license 已在别处占席 | 校验 EMAIL/PASSWORD；回退本地席位 |
| `Found 0 entitlement groups` | 账号下没有可用授权 | 确认是 Personal 免费版还是漏了 SERIAL |
| `Insufficient shared memory available` | `/dev/shm` 太小 | `dockerShmSize: 2g` |
| `Gradle build failed` / `Android SDK not found` | SDK/NDK/JDK 路径或镜像 module 不对 | 用 `-android` 镜像；`PortBuild` 里显式设路径 |
| `Build target was not installed` | 镜像缺模块 | 换 `-android-3` 或自建镜像 |
| 产物为空 | 没接 `upload-artifact` 或 `buildName` 与目录不一致 | 对齐 `buildsPath/buildName` |

---

## 12. 结论（一句话）

GameCI = "镜像选择 + 容器激活 + batchmode 导入 + buildMethod 构建 + 产物收集"，
**唯一不可绕过的前置是许可证**；而许可证在 Personal 形态下必须由"已登录的 Unity Hub + 账号凭证"
产生，`UNITY_LICENSE` 只是一份可被在线重激活的种子。因此本工程的收口只有两种形态：
**(a) 拿到任意一种凭证跑云端 builder；(b) 许可证常驻某台机器 + 自托管 runner/本地脚本。**
除此之外没有第三条路——这也是为什么在凭证补齐之前，任何"配置层"的改动都不会产出 APK。

---

## 13. GitHub 上构建 Unity 的四条路线对比（2026-11 核查）

| 路线 | 代表 | 许可证要求 | 结论 |
|---|---|---|---|
| A. GameCI v4/v6 | `game-ci/unity-builder` | Personal: `ULF + 邮箱密码`；Pro: `SERIAL + 邮箱密码`；或 license server | 官方文档明确 `.ulf` 必须来自 Unity Hub 图形激活 |
| B. Buildalon v3 | `buildalon/unity-setup` + `buildalon/activate-unity-license` + `buildalon/unity-action` | **Personal 只需 `username + password`**，文档原文 "Unity Hub is no longer required"，激活先走官方 Unity CLI、再走 Licensing Client | 唯一"不需要 ULF"的托管 CI 路线 |
| C. 自托管 runner | `runs-on: [self-hosted]` + `skipActivation: true` | 许可证常驻机器（Hub 登录一次） | 托管与本地都可，零 secret |
| D. Unity 官方 Build Automation | `cloud.unity.com` | 平台内置 | 实测本组织被区域政策关闭 |

### 13.1 关于 Personal 能否"只给账号密码"

Unity 官方手册（ManagingYourUnityLicense，2026 版）写的是：命令行激活只适用于 Pro，
"To activate a license for Unity Personal, log in to the Unity Hub"。
但实测说明底层能力仍在，限制在"官方没有为 Personal 暴露 CLI 流程"：

- `Unity.Licensing.Client --update-license --username <x> --password <y>` **确实会发起账号认证**，
  用错误密码时返回 `Status: 401 / "message": "Invalid Credential", "code": "143.002"`。
  也就是说这条通道是活的，只是缺少有效凭证时会 401。
- Editor CLI `-quit -batchmode -serial -username <x> -password <y>`（serial 为空 = 具名用户）
  会依次尝试两条：`Failed to activate entitlement license` → `Failed to activate ULF license`。
  说明 2022.3 的引擎本身接受 entitlement（账号授权）模型。
- Buildalon v3 正是基于这两条通道把 Personal 做成"仅账号密码"。

因此对本仓库：**不需要 `.ulf`，需要的是 `UNITY_USERNAME`(邮箱) + `UNITY_PASSWORD` 两个 secret**。
这条路线已在 `.github/workflows/unity-android-buildalon.yml` 里按最小实现落地。

### 13.2 托管 runner 上 Personal 的一个副作用（Buildalon 文档明写）

GitHub 托管的 macOS / Linux runner **共享同一个机器身份**，所以 Personal 许可证在 job 结束时
"不归还"（归还会把其它人/其它仓库在该身份上的许可证一起吊销）。含义：
- 同一仓库短时间内反复重跑，可能撞上"该身份已激活"的状态，表现为激活偶发失败；
- Windows runner 是独立身份，会正常归还；
- 自托管 runner 正常归还。

对应到 Buildalon 参数：`return-license: auto`（默认）即上述行为。
