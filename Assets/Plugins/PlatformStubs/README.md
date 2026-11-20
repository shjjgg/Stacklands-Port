# PlatformStubs 平台桩接层

## 目的

把 Steam、在线排行榜/远程表、ImGui 调试覆盖层、云存档、Workshop 等平台差异收敛到本目录；
游戏逻辑只依赖 `IPlatformServices`，Android 走桩实现，不改玩法代码。

## 文件

| 文件 | 职责 |
|---|---|
| `IPlatformServices.cs` | 平台能力抽象接口（初始化/DLC/成就/Mod 目录/外链/云存档/在线提交） |
| `SteamPlatformStub.cs` | Android 离线桩；DLC 改本地 bundle 存在性判定；成就本地记录；Workshop 上传禁用 |
| `ImGuiOverlayStub.cs` | 调试覆盖层禁用标记；不加载原生 cimgui |
| `PlatformBootstrap.cs` | 启动引导，替代原版 `SteamManager.InitOnPlayMode` 入口；暴露 `Current` |

## 与原版的对接（反编译源码落地后完成）

1. **摘掉原入口**：移除 `GameScripts.SteamManager` 的 `[RuntimeInitializeOnLoadMethod]`，改由 `PlatformBootstrap` 初始化。
2. **映射真实成员**：对照反编译的 `SteamManager` / `AchievementHelper` / `ModManager` / `SaveManager`，把接口方法与原版属性/事件一一对应；当前接口为能力归纳，签名以原版为准。
3. **DLC 映射核对**：`Cities` / `Spirits` bundle 与 AppID（2446110 Cursed Worlds、2867570 2000）的对应关系，按 `DLC.txt` 与反编译配置补全。
4. **原 SteamManager 通路**：PC/编辑器如需保留原版 Steam 行为，在 `CreateDefault()` 切到包装原 `SteamAPI` 的实现；Android 始终返回桩。

## 关键决策记录

- **ImGui**：保留托管 `ImGui.NET.dll` / `UImGui.dll` 作为编译引用；其原生 `cimgui` DllImport 仅在被调用时解析，覆盖层入口禁用后运行时不会触达。不在首版移植 Dear ImGui Android 后端。
- **Steamworks.NET**：保留托管包装程序集以维持编译签名；原生 `steam_api64.dll` 不进包，调用面经桩接降级。
- **Google Sheets**：在线提交/拉取走 `IPlatformServices` 离线降级；不打包 OAuth 客户端密钥。
- **云存档**：关闭 Steam Cloud，存档统一走 `Application.persistentDataPath`。

## 元数据覆盖对照（GameScripts 44 个 Steam 成员 / SokLoc Google 成员）

> 基线来自 `tools/scan_platform_refs.py` → `platform_refs/platform_refs.md/.json`。接口为能力归纳，精确签名以反编译为准。

| 原版成员 | 接口方法 | 覆盖状态 |
|---|---|---|
| `SteamAPI.Init` / `RestartAppIfNecessary` | `Initialize()` | ✅ 已覆盖 |
| `SteamAPI.RunCallbacks` | `TickCallbacks()` | ✅ 已补（桩空轮询） |
| `SteamAPI.Shutdown` | `Shutdown()` | ✅ 已覆盖 |
| `SteamApps.BIsDlcInstalled` | `IsDlcInstalled(appId)` | ✅ 已覆盖 |
| `SteamApps.GetCurrentBetaName` | `GetCurrentBetaName()` | ✅ 已补（桩返回空串） |
| `SteamUserStats.SetAchievement` | `UnlockAchievement(id)` | ✅ 已覆盖 |
| `SteamUserStats.StoreStats` | `FlushAchievements()` | ✅ 已补（桩空转） |
| `SteamFriends.ActivateGameOverlayToWebPage` | `OpenOverlayUrl(url)` | ✅ 已覆盖 |
| `SteamUser.GetSteamID` | — | ⚠️ 占位 CSteamID 内部使用，未上提接口；反编译确认是否需要 |
| UGC 查询/订阅/安装（7 成员） | `GetModsDirectory()` / `GetWorkshopModPaths()` | ◑ 目录路径覆盖；查询句柄/结果结构体整块离线禁用，不暴露 |
| UGC 上传/发布（8 成员） | `CreateWorkshopItem(...)` | ◑ 创建入口覆盖；更新/提交/预览/标签整块禁用 |
| `SteamClient.SetWarningMessageHook` / `DllCheck.Test` / `Packsize.Test` | — | ◑ 启动校验/钩子，桩在 `PlatformBootstrap` 阶段跳过，无独立接口 |
| Google Sheets 读取 `SpreadsheetsResource.get_Values` / `ValueRange` | `FetchRemoteTable(key)` | ◑ 读取覆盖；在线追加（`AppendValuesResponse`/`set_Values`）离线不暴露 |

## 待反编译后补全的清单

- [ ] `SteamManager` 全部 public 成员/事件 → 接口方法映射表
- [ ] **直接静态 SteamAPI 调用守卫**：`SteamAPI/SteamUserStats/SteamUGC/SteamApps/SteamUser/SteamFriends/SteamClient` 及 Workshop 套件，逐方法确认是否在启动链路被调用；Android 下用 `IsSteamAvailable` 短路，避免触达原生 `steam_api`
- [ ] 成就 ID 列表与本地持久化策略
- [ ] DLC AppID ↔ bundle 文件名 ↔ 卡牌/地块入口对照
- [ ] Mod 清单加载路径与 `ModManifest` 字段在本地目录的读取规则
- [ ] 在线排行榜提交字段与远程表 key 清单
