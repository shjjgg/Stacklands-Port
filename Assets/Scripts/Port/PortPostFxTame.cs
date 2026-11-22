using System.Collections;
using System.IO;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

namespace StacklandsPort
{
    /// <summary>
    /// 后处理亮度治理 (v0.40)。
    /// 现场: 原版画面是亮薄荷绿, 移植版整体压暗一大截, 而日志里 FocusVolume weight=1 一直在生效
    /// (EnergyVolume/SpiritVolume 都是 0)。这套 PostProcess 资源是 AssetRipper 导出的空壳 + 我们重建的,
    /// ColorGrading / Vignette 很容易把画面整体压暗。
    /// 默认关掉 PostProcessLayer, 恢复原版亮度与对比; 想再开时在 files 目录放一个空文件 postfx_on。
    /// </summary>
    public static class PortPostFxTame
    {
        const string Tag = "[PortPostFxTame] ";

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
                yield return new WaitForSecondsRealtime(3f);
                LogVolumes();
                bool wanted = File.Exists(Path.Combine(Application.persistentDataPath, "postfx_on"));
                var layers = Object.FindObjectsOfType<PostProcessLayer>();
                PortLog.Write(Tag + "PostProcessLayer 数量=" + layers.Length + " keepPostFx=" + wanted);
                if (wanted) yield break;
                for (int i = 0; i < layers.Length; i++)
                {
                    if (layers[i] == null || !layers[i].enabled) continue;
                    layers[i].enabled = false;
                    PortLog.Write(Tag + "已关闭 PostProcessLayer@" + layers[i].name);
                }
            }

            static void LogVolumes()
            {
                var vols = Object.FindObjectsOfType<PostProcessVolume>();
                for (int i = 0; i < vols.Length; i++)
                {
                    var v = vols[i];
                    if (v == null) continue;
                    string prof = "null";
                    try { prof = v.sharedProfile != null ? v.sharedProfile.name : (v.profile != null ? v.profile.name : "null"); }
                    catch { }
                    PortLog.Write(Tag + "volume " + v.name + " global=" + v.isGlobal + " weight=" + v.weight + " profile=" + prof);
                }
            }
        }
    }
}
