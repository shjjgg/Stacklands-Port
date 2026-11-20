# 09 · Steam / UGC 方法级调用清单与守卫表

> 来源：`GameScripts.dll` CLR 元数据（MemberRef/TypeRef）实测，共 **25 个 Steamworks 类型、44 个成员引用**（18 个类型有成员调用，7 个仅签名/字段引用）。机器可读台账：`platform_refs/platform_refs.md/.json`（工具 `tools/scan_platform_refs.py`）。
> 用途：桩接守卫与反编译核对基线。调用方类名为按能力推断，**精确调用方需反编译 IL 后确认**。

## 1. 初始化 / 生命周期（启动链路，最高优先级守卫）

| Steam 成员 | 推断调用方 | Android 桩行为 | 守卫要求 |
|---|---|---|---|
| `SteamAPI.Init` | SteamManager | 返回 true，不加载原生库 | 启动入口必须走 `PlatformBootstrap`，不得直调 |
| `SteamAPI.RestartAppIfNecessary` | SteamManager | 返回 false（不重启拉起 Steam） | 启动早期短路 |
| `SteamAPI.RunCallbacks` | SteamManager 轮询 | 空实现 | 不注册原生回调 |
| `SteamAPI.Shutdown` | SteamManager | 空实现 | 退出路径安全 |
| `SteamClient.SetWarningMessageHook` | SteamManager | 不设置钩子 | — |
| `DllCheck.Test` | SteamManager | 跳过原生 DLL 校验 | 不触发“缺少 steam_api”报错 |
| `Packsize.Test` | SteamManager | 跳过 ABI 校验 | — |

## 2. DLC / 版本

| Steam 成员 | 推断调用方 | Android 桩行为 |
|---|---|---|
| `SteamApps.BIsDlcInstalled(appId)` | SteamManager / DLC 入口 | 改本地 bundle 存在性判定（见 `SteamPlatformStub.IsDlcInstalled`） |
| `SteamApps.GetCurrentBetaName` | 启动/版本判定 | 返回空串/正式版标记 |

## 3. 用户 / 覆盖层

| Steam 成员 | 推断调用方 | Android 桩行为 |
|---|---|---|
| `SteamUser.GetSteamID` | SteamManager / 成就 / UGC | 返回占位 CSteamID（无效 ID） |
| `CSteamID.op_Explicit` | 同上 | 占位 ID 转换 |
| `SteamFriends.ActivateGameOverlayToWebPage` | 外链按钮 | 交系统浏览器 `Application.OpenURL` 或隐藏按钮 |

## 4. 成就 / 统计

| Steam 成员 | 推断调用方 | Android 桩行为 |
|---|---|---|
| `SteamUserStats.SetAchievement` | AchievementHelper | 本地记录，不上报 |
| `SteamUserStats.StoreStats` | AchievementHelper | 空转 |

## 5. Workshop / Mod（UGC，整块离线禁用）

### 5.1 查询 / 订阅

| Steam 成员 | 桩行为 |
|---|---|
| `SteamUGC.GetNumSubscribedItems` | 返回 0 |
| `SteamUGC.GetSubscribedItems` | 返回空列表（Mod 目录改本地 `persistentDataPath/Mods`） |
| `SteamUGC.GetItemInstallInfo` | 按本地目录文件判定 |
| `SteamUGC.CreateQueryUGCDetailsRequest` | 返回无效查询句柄 |
| `SteamUGC.SendQueryUGCRequest` | 空转 |
| `SteamUGC.GetQueryUGCResult` | 返回空详情 |
| `SteamUGC.ReleaseQueryUGCRequest` | 空转 |

### 5.2 上传 / 发布（Android 禁用）

| Steam 成员 | 桩行为 |
|---|---|
| `SteamUGC.CreateItem` | 返回失败结果，不创建 Workshop 物品 |
| `SteamUGC.StartItemUpdate` | 返回无效更新句柄 |
| `SteamUGC.SetItemTitle / SetItemTags` | 空转 |
| `SteamUGC.SetItemContent` | 空转 |
| `SteamUGC.SetItemPreview` | 空转 |
| `SteamUGC.SetItemTags` | 空转 |
| `SteamUGC.SubmitItemUpdate` | 返回失败 |
| `SteamUGC.GetItemUpdateProgress` | 返回 0/失败 |

### 5.3 结果结构体（只读字段，桩填充默认值）

| 结构体 | 字段 | 桩默认 |
|---|---|---|
| `CreateItemResult_t` | `m_eResult`、`m_nPublishedFileId`、`m_bUserNeedsToAcceptWorkshopLegalAgreement` | 失败 / 无效 ID / false |
| `SubmitItemUpdateResult_t` | `m_eResult`、`m_nPublishedFileId` | 失败 / 无效 ID |
| `SteamUGCQueryCompleted_t` | `m_eResult` | 失败 |
| `SteamUGCDetails_t` | `m_ulSteamIDOwner` | 0 |

## 6. 句柄 / 值类型 / 枚举占位

| 类型 | 成员 / 用途 | 桩处理 |
|---|---|---|
| `AppId_t` | `.ctor`、`Invalid` | 保留类型，无效 AppId |
| `PublishedFileId_t` | `.ctor`、`op_Explicit` | 无效 ID |
| `UGCUpdateHandle_t` | `Invalid`、`op_Equality`、`op_Inequality` | 无效句柄 |
| `UGCQueryHandle_t` | 仅签名引用（查询句柄） | 无效句柄占位 |
| `SteamAPICall_t` | 仅签名引用（异步调用句柄） | 无效句柄占位 |
| `SteamAPIWarningMessageHook_t` | `.ctor` | 空委托 |
| `CallResult<T>` | 泛型回调包装，仅签名引用 | Android 不实例化原生回调 |
| `EResult` / `EItemUpdateStatus` / `EWorkshopFileType` / `EActivateGameOverlayToWebPageMode` | 返回值/参数枚举 | 填失败/默认枚举值 |

## 7. 守卫落地要求

1. **编译期**：保留 `com.rlabrecque.steamworks.net` 程序集（link.xml `preserve="all"`），上述类型/签名可解析。
2. **运行期**：所有 `SteamAPI.* / SteamUserStats.* / SteamUGC.* / SteamApps.* / SteamFriends.* / SteamUser.* / SteamClient.*` 直调点，在 Android 下必须先判断 `PlatformBootstrap.Current.IsSteamAvailable`；false 时走桩返回，不进入原生调用。
3. **启动链路排查**：反编译后优先确认 `SteamAPI.Init / RestartAppIfNecessary / RunCallbacks / SetAchievement / BIsDlcInstalled` 是否在 `Awake/Start/RuntimeInitializeOnLoad` 被调用；这些若在启动路径，必须先于一切 Steam 调用完成桩接替换。
4. **回调**：`CallResult<T>`、`Callback` 注册在 Android 不实例化原生回调；成就/UGC 回调走空实现。

## 8. 待反编译补全

- [ ] 每个 Steam 成员的具体调用方类/方法（IL 级）
- [ ] 成就 ID 全集（`SetAchievement` 入参）
- [ ] UGC 订阅 Mod 与本地 `ModManager` 目录的对接字段
- [ ] `GetCurrentBetaName` 在版本/分支判定中的用途
