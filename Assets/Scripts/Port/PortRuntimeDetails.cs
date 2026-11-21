using UnityEngine;

namespace StacklandsPort
{
    /// <summary>真机上必要的运行时细节: 不息屏、锁 60 帧、全屏沉浸。</summary>
    public static class PortRuntimeDetails
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
        static void Boot()
        {
            Screen.sleepTimeout = SleepTimeout.NeverSleep;
            QualitySettings.vSyncCount = 0;
            Application.targetFrameRate = 60;
            Screen.fullScreenMode = FullScreenMode.FullScreenWindow;
            PortLog.Marker("runtime: sleep=never fps=60 fullscreen=" + Screen.fullScreenMode);
        }
    }
}
