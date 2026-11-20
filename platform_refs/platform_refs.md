# 平台服务引用台账（Steamworks / Google.Apis · 元数据实测）

- 扫描时间: 2026-11-20T20:07:17
- 仅元数据 TypeRef/MemberRef；调用方类/方法与入参需反编译 IL 确认。

## 1. Steamworks.NET 引用

### GameScripts.dll — 25 类型 / 44 成员

| 父类型 | 成员 |
|---|---|
| `AppId_t` | .ctor, Invalid |
| `CSteamID` | op_Explicit |
| `CallResult`1`（仅签名/字段引用，无成员调用） | — |
| `CreateItemResult_t` | m_bUserNeedsToAcceptWorkshopLegalAgreement, m_eResult, m_nPublishedFileId |
| `DllCheck` | Test |
| `EActivateGameOverlayToWebPageMode`（仅签名/字段引用，无成员调用） | — |
| `EItemUpdateStatus`（仅签名/字段引用，无成员调用） | — |
| `EResult`（仅签名/字段引用，无成员调用） | — |
| `EWorkshopFileType`（仅签名/字段引用，无成员调用） | — |
| `Packsize` | Test |
| `PublishedFileId_t` | .ctor, op_Explicit |
| `SteamAPI` | Init, RestartAppIfNecessary, RunCallbacks, Shutdown |
| `SteamAPICall_t`（仅签名/字段引用，无成员调用） | — |
| `SteamAPIWarningMessageHook_t` | .ctor |
| `SteamApps` | BIsDlcInstalled, GetCurrentBetaName |
| `SteamClient` | SetWarningMessageHook |
| `SteamFriends` | ActivateGameOverlayToWebPage |
| `SteamUGC` | CreateItem, CreateQueryUGCDetailsRequest, GetItemInstallInfo, GetItemUpdateProgress, GetNumSubscribedItems, GetQueryUGCResult, GetSubscribedItems, ReleaseQueryUGCRequest, SendQueryUGCRequest, SetItemContent, SetItemPreview, SetItemTags, SetItemTitle, StartItemUpdate, SubmitItemUpdate |
| `SteamUGCDetails_t` | m_ulSteamIDOwner |
| `SteamUGCQueryCompleted_t` | m_eResult |
| `SteamUser` | GetSteamID |
| `SteamUserStats` | SetAchievement, StoreStats |
| `SubmitItemUpdateResult_t` | m_eResult, m_nPublishedFileId |
| `UGCQueryHandle_t`（仅签名/字段引用，无成员调用） | — |
| `UGCUpdateHandle_t` | Invalid, op_Equality, op_Inequality |

## 2. Google.Apis 引用

### SokLoc.dll — 8 类型 / 7 成员

| 父类型 | 成员 |
|---|---|
| `Google.Apis.Auth.OAuth2.GoogleCredential` | CreateScoped, FromStream |
| `Google.Apis.Http.IConfigurableHttpClientInitializer`（仅签名/字段引用） | — |
| `Google.Apis.Requests.ClientServiceRequest`1`（仅签名/字段引用） | — |
| `Google.Apis.Services.BaseClientService`（仅签名/字段引用） | — |
| `Google.Apis.Sheets.v4.SheetsService` | .ctor, get_Spreadsheets |
| `Google.Apis.Sheets.v4.SpreadsheetsResource` | get_Values |
| `Google.Apis.Sheets.v4.Data.AppendValuesResponse`（仅签名/字段引用） | — |
| `Google.Apis.Sheets.v4.Data.ValueRange` | .ctor, set_Values |

