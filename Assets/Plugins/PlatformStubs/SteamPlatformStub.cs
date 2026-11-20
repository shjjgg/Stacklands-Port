// SteamPlatformStub.cs
// Android 离线桩实现: 不链接 steam_api 原生库, 所有 Steam 能力返回安全默认值。
// DLC 判定由“Steam 所有权”改为“本地 bundle 文件是否存在”。
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace PortPlatform
{
    public sealed class SteamPlatformStub : IPlatformServices
    {
        // 原版 AppID / DLC AppID (来自 steam_settings/DLC.txt 与 GameScripts 字符串)
        public const uint BaseAppId = 1948280;
        public const uint DlcCursedWorlds = 2446110;
        public const uint DlcStacklands2000 = 2867570;
        // Cities / Spirits 为随包 UnityFS bundle; AppID 映射在反编译后核对补全。
        private const string CitiesBundle = "cities_dlc";
        private const string SpiritsBundle = "spirits_dlc";

        private readonly HashSet<string> _unlockedAchievements = new HashSet<string>();
        private readonly string _modsDir;

        public SteamPlatformStub()
        {
            _modsDir = Path.Combine(Application.persistentDataPath, "Mods");
            Directory.CreateDirectory(_modsDir);
        }

        public bool IsSteamAvailable => false;
        public bool IsCloudSaveEnabled => false;

        public bool Initialize()
        {
            // 无 Steam 运行时: 直接视为就绪, 不拉起客户端, 不触发 RestartAppIfNecessary。
            return true;
        }

        public void Shutdown() { /* no-op */ }

        public void TickCallbacks() { /* 桩: 无原生回调轮询 */ }

        public bool IsDlcInstalled(string appId)
        {
            // 桩: 优先本地 bundle 存在性; 具体 appId→bundle 映射待反编译核对。
            if (appId == CitiesBundle) return BundleExists(CitiesBundle);
            if (appId == SpiritsBundle) return BundleExists(SpiritsBundle);
            return BundleExists(appId);
        }

        public string GetCurrentBetaName() => "";

        public IReadOnlyList<DlcInfo> GetInstalledDlcs()
        {
            var list = new List<DlcInfo>
            {
                new DlcInfo(DlcCursedWorlds.ToString(), BundleExists(DlcCursedWorlds.ToString())),
                new DlcInfo(DlcStacklands2000.ToString(), BundleExists(DlcStacklands2000.ToString())),
                new DlcInfo(CitiesBundle, BundleExists(CitiesBundle)),
                new DlcInfo(SpiritsBundle, BundleExists(SpiritsBundle)),
            };
            return list;
        }

        public void UnlockAchievement(string achievementId)
        {
            // 桩: 仅本地记录; 不向 Steam 上报。需要成就持久化时再写本地文件。
            if (!string.IsNullOrEmpty(achievementId)) _unlockedAchievements.Add(achievementId);
        }

        public bool IsAchievementUnlocked(string achievementId) =>
            achievementId != null && _unlockedAchievements.Contains(achievementId);

        public void FlushAchievements() { /* 桩: 无远端成就上报, 无需刷新区 */ }

        public string GetModsDirectory() => _modsDir;
        public string GetWorkshopModPaths() => _modsDir;

        public bool CreateWorkshopItem(string contentFolder, string title)
        {
            // Workshop 上传在 Android 禁用。
            return false;
        }

        public void OpenOverlayUrl(string url)
        {
            // 桩: 有外链时交系统浏览器; 无浏览器能力则忽略。
            if (!string.IsNullOrEmpty(url))
            {
                Application.OpenURL(url);
            }
        }

        public void SubmitScore(string leaderboardId, long score) { /* offline no-op */ }

        public string FetchRemoteTable(string tableKey) => null;

        private bool BundleExists(string bundleName)
        {
            if (string.IsNullOrEmpty(bundleName)) return false;
            // 先查 StreamingAssets(随包), 再查 persistentDataPath(下载/更新)。
            var inStreaming = Path.Combine(Application.streamingAssetsPath, bundleName);
            if (File.Exists(inStreaming)) return true;
            var inPersistent = Path.Combine(Application.persistentDataPath, bundleName);
            return File.Exists(inPersistent);
        }
    }
}
