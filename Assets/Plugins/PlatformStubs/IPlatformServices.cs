// IPlatformServices.cs
// 平台能力抽象层 —— 把 Steam / 在线服务 / 调试覆盖层 / 云存档等平台差异收敛到此接口。
// 游戏逻辑只依赖本接口; Android 由 *Stub 空实现/降级实现, PC 原版可保留原 SteamManager 通路。
//
// 说明: 本接口方法名依据 GameScripts 内已识别的平台能力归纳; 反编译源码落地后,
// 需对照 SteamManager / AchievementHelper / ModManager / SaveManager 的真实成员
// 补齐精确签名与返回类型, 不在此臆造原版逻辑。
using System.Collections.Generic;

namespace PortPlatform
{
    /// <summary>平台可提供的 DLC 信息(离线判定以本地 bundle 存在为准)。</summary>
    public readonly struct DlcInfo
    {
        public readonly string AppId;
        public readonly bool Installed;
        public DlcInfo(string appId, bool installed) { AppId = appId; Installed = installed; }
    }

    public interface IPlatformServices
    {
        // ---- 初始化 / 生命周期 ----
        /// <summary>替代 SteamAPI_Init / RestartAppIfNecessary。返回是否“就绪”。</summary>
        bool Initialize();
        /// <summary>替代 SteamAPI.RunCallbacks，每帧/定时轮询回调；桩为空实现。</summary>
        void TickCallbacks();
        /// <summary>替代 SteamAPI_Shutdown。</summary>
        void Shutdown();
        /// <summary>是否运行在真实 Steam 环境(Android 桩返回 false)。</summary>
        bool IsSteamAvailable { get; }

        // ---- DLC ----
        /// <summary>替代 SteamApps.BIsDlcInstalled(appId); Android 以本地 bundle 是否存在判定。</summary>
        bool IsDlcInstalled(string appId);
        /// <summary>替代 SteamApps.GetCurrentBetaName; 桩返回空串(正式版)。</summary>
        string GetCurrentBetaName();
        /// <summary>已安装 DLC 清单(供 Cities/Spirits/CursedWorlds/2000 入口判定)。</summary>
        IReadOnlyList<DlcInfo> GetInstalledDlcs();

        // ---- 成就 ----
        /// <summary>解锁成就(桩: 仅本地记录或空转)。</summary>
        void UnlockAchievement(string achievementId);
        /// <summary>替代 SteamUserStats.StoreStats, 刷新区成就/统计; 桩空转。</summary>
        void FlushAchievements();
        /// <summary>查询成就是否已解锁(桩: 返回 false/本地记录)。</summary>
        bool IsAchievementUnlocked(string achievementId);

        // ---- Workshop / Mod ----
        /// <summary>本地 Mod 目录(Android: persistentDataPath/Mods)。</summary>
        string GetModsDirectory();
        /// <summary>订阅/创意工坊路径(桩: 本地目录, 不上传云端)。</summary>
        string GetWorkshopModPaths();
        /// <summary>上传 Workshop 物品(桩: 禁用, 返回 false)。</summary>
        bool CreateWorkshopItem(string contentFolder, string title);

        // ---- 覆盖层 / 外链 ----
        /// <summary>打开游戏内覆盖层网页(桩: 系统浏览器或隐藏)。</summary>
        void OpenOverlayUrl(string url);

        // ---- 云存档 ----
        /// <summary>是否启用云端存档(桩: false, 走本地 persistentDataPath)。</summary>
        bool IsCloudSaveEnabled { get; }

        // ---- 在线排行榜 / 远程表 ----
        /// <summary>提交分数(桩: 离线空转, 不抛异常)。</summary>
        void SubmitScore(string leaderboardId, long score);
        /// <summary>拉取远程配置表(桩: 返回 null, 调用方走本地默认)。</summary>
        string FetchRemoteTable(string tableKey);
    }
}
