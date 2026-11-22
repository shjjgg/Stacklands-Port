using System.Collections;
using System.IO;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

namespace StacklandsPort
{
    /// <summary>
    /// 后处理亮度治理 (v0.42)。
    ///
    /// 现场取证(真机日志 14:47:53 vs 14:48:05):
    ///   v0.41 的关闭动作发生在 "PostProcessLayer 数量=0" 的时刻 —— 相机与 Volume 还没实例化,
    ///   等它 12 秒后出现时 (RenderAudit: PostProcessLayer enabled=True, FocusVolume weight=1) 已经没人管了,
    ///   所以亮度一点没变。焦点体积里挂的是 Vignette, 一直 weight=1 生效。
    ///
    /// 修法: 起 60 秒, 每 0.5 秒扫一次, 逮到就关, 直到不再出现新的已启用层。
    /// 想保留后处理: 在 files 目录放空文件 postfx_on。
    /// </summary>
    public static class PortPostFxTame
    {
        const string Tag = "[PortPostFxTame] ";
        public static bool DisableAll = true;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortPostFxTame]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        internal sealed class Runner : MonoBehaviour
        {
            IEnumerator Start()
            {
                bool wanted = false;
                try { wanted = File.Exists(Path.Combine(Application.persistentDataPath, "postfx_on")); } catch { }
                DisableAll = !wanted;
                PortLog.Write(Tag + "keepPostFx=" + wanted);

                // 60 秒内持续盯: 相机/体积是异步实例化的, 只在启动时扫一次会全部漏掉。
                for (int i = 0; i < 120; i++)
                {
                    if (DisableAll) Kill();
                    if (i % 4 == 0) LogVolumes();
                    yield return new WaitForSecondsRealtime(0.5f);
                }
                PortLog.Write(Tag + "盯梢结束, 最后状态 enabled=" + CountEnabled());
            }

            static int CountEnabled()
            {
                int n = 0;
                foreach (var l in Object.FindObjectsOfType<PostProcessLayer>())
                    if (l != null && l.enabled) n++;
                return n;
            }

            static void Kill()
            {
                foreach (var l in Object.FindObjectsOfType<PostProcessLayer>())
                {
                    if (l == null || !l.enabled) continue;
                    l.enabled = false;
                    PortLog.Write(Tag + "关闭 PostProcessLayer@" + l.name + " (相机 " + (l.GetComponent<Camera>() != null ? l.GetComponent<Camera>().name : "?") + ")");
                }
            }

            static void LogVolumes()
            {
                foreach (var v in Object.FindObjectsOfType<PostProcessVolume>())
                {
                    if (v == null) continue;
                    string prof = "null";
                    try { if (v.sharedProfile != null) prof = v.sharedProfile.name; } catch { }
                    PortLog.Write(Tag + "volume " + v.name + " weight=" + v.weight + " " + prof);
                }
            }
        }
    }
}
