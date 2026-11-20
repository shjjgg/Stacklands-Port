// PlatformBootstrap.cs
// 平台能力引导: 替代原版 SteamManager.InitOnPlayMode 这个 RuntimeInitializeOnLoad 入口。
//
// 接入方式(反编译源码落地后执行):
//  1. 摘掉 GameScripts.SteamManager 上的 [RuntimeInitializeOnLoadMethod] 注册;
//  2. 在启动链路最早期调用 PlatformBootstrap.Initialize();
//  3. 游戏逻辑通过 PlatformBootstrap.Current 访问平台能力, 不再直接 new SteamAPI / 调原生。
//
// 编译宏: 原版 PC 通路可保留 #if !UNITY_ANDROID 走原 SteamManager; Android 一律走桩。
using UnityEngine;

namespace PortPlatform
{
    public static class PlatformBootstrap
    {
        private static IPlatformServices _current;

        public static IPlatformServices Current => _current ??= CreateDefault();

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        private static void Initialize()
        {
            var services = CreateDefault();
            services.Initialize();
            _current = services;

            // 调试覆盖层默认禁用; 不加载 cimgui 原生库。
            ImGuiOverlayStub.Initialize();

            Debug.Log($"[PortPlatform] Initialized. SteamAvailable={services.IsSteamAvailable}, " +
                      $"CloudSave={services.IsCloudSaveEnabled}, ModsDir={services.GetModsDirectory()}");
        }

        private static IPlatformServices CreateDefault()
        {
#if UNITY_ANDROID
            // Android: 离线桩, 无 Steam / 无云存档 / 无 Workshop 上传。
            return new SteamPlatformStub();
#else
            // 编辑器 / 其他平台: 首版同样先返回桩; 待原版 SteamManager 通路确认后,
            // 在此切换到包装原 SteamAPI 的实现, 不改动游戏逻辑层。
            return new SteamPlatformStub();
#endif
        }
    }
}
