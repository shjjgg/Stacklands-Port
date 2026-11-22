using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 启动画面(Sokpop 工作室标)出现时震一下, 纯体验增强, 不影响玩法。
    /// Android 走 Vibrator 指定时长(80ms), 其它平台退回 Handheld.Vibrate。
    /// </summary>
    public static class PortHaptics
    {
        const string Tag = "[PortHaptics] ";
        static bool _done;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            if (_done) return;
            _done = true;
            var go = new GameObject("[PortHaptics]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        internal sealed class Runner : MonoBehaviour
        {
            IEnumerator Start()
            {
                // 工作室标是启动后第一屏, 稍等一点点让 UI 先画出来再震动, 手感更"点在标志上"
                yield return new WaitForSecondsRealtime(0.55f);
                Pulse(80);
                PortLog.Write(Tag + "logo pulse 80ms");
            }
        }

        static void Pulse(int ms)
        {
#if UNITY_ANDROID && !UNITY_EDITOR
            try
            {
                using (var player = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
                using (var activity = player.GetStatic<AndroidJavaObject>("currentActivity"))
                using (var vibrator = activity.Call<AndroidJavaObject>("getSystemService", "vibrator"))
                {
                    if (vibrator != null)
                    {
                        vibrator.Call("vibrate", (long)ms);
                        return;
                    }
                }
            }
            catch (System.Exception e)
            {
                PortLog.Write(Tag + "vibrator 失败, 退回 Handheld.Vibrate: " + e.Message);
            }
#endif
            Handheld.Vibrate();
        }
    }
}
