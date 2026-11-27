// PortRenderFix.cs — 把运行期 RenderSettings 归位到原版场景数据 (SampleScene.unity)
//
// 背景: v0.50 真机日志 [ColorPipe] 显示 ambientMode=Skybox / skybox=Default-Skybox / reflectionIntensity=1,
// 而原版 Assets/Scenes/SampleScene.unity 是 m_AmbientMode: 3 (Flat) + m_AmbientSkyColor (0,0,0)
// + m_ReflectionIntensity: 0。原因是构建里 IntroScene(Skybox 环境) 先加载且一直存活,
// RenderSettings 是全局的, 于是整块卡场被"深蓝天光环境"染蓝并压暗。
// 本脚本在 SampleScene 加载后把这几项写回原版数值 —— 属于还原原版数据, 不是自创观感。
#if UNITY_EDITOR || UNITY_ANDROID
using System.Collections;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.SceneManagement;
using StacklandsPort;

public class PortRenderFix : MonoBehaviour
{
    static PortRenderFix _inst;
    bool _logged;

    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
    static void Boot()
    {
        if (_inst != null) return;
        var go = new GameObject("PortRenderFix");
        DontDestroyOnLoad(go);
        _inst = go.AddComponent<PortRenderFix>();
    }

    IEnumerator Start()
    {
        for (int i = 0; i < 240; i++)   // 盯 120s: 场景异步加载, 一次判断不可靠
        {
            yield return new WaitForSeconds(0.5f);
            var sc = SceneManager.GetSceneByName("SampleScene");
            if (!sc.IsValid() || !sc.isLoaded) continue;

            bool restored = false;
            if (RenderSettings.ambientMode != AmbientMode.Flat)
            {
                RenderSettings.ambientMode = AmbientMode.Flat;
                restored = true;
            }
            var want = Color.black;
            var cur = RenderSettings.ambientLight;
            if (Mathf.Abs(cur.r) + Mathf.Abs(cur.g) + Mathf.Abs(cur.b) > 0.002f)
            {
                RenderSettings.ambientLight = want;
                restored = true;
            }
            if (!Mathf.Approximately(RenderSettings.ambientIntensity, 1f)) RenderSettings.ambientIntensity = 1f;
            if (!Mathf.Approximately(RenderSettings.reflectionIntensity, 0f))
            {
                RenderSettings.reflectionIntensity = 0f;
                restored = true;
            }

            if (!_logged)
            {
                _logged = true;
                var sun = RenderSettings.sun;
                if (sun == null)
                {
                    var ls = FindObjectsOfType<Light>();
                    foreach (var l in ls) if (l.type == LightType.Directional) { sun = l; break; }
                }
                PortLog.Write("[RenderFix] SampleScene loaded, ambient restored=" + restored +
                              " mode=" + RenderSettings.ambientMode +
                              " light=" + ColorUtility.ToHtmlStringRGB(RenderSettings.ambientLight) +
                              " refl=" + RenderSettings.reflectionIntensity.ToString("F2") +
                              (sun != null
                                  ? (" | sun=" + sun.name + " int=" + sun.intensity.ToString("F2") +
                                     " col=" + ColorUtility.ToHtmlStringRGB(sun.color) +
                                     " shadow=" + sun.shadows + " strength=" + sun.shadowStrength.ToString("F2") +
                                     " bias=" + sun.shadowBias.ToString("F3") + " normalBias=" + sun.shadowNormalBias.ToString("F3") +
                                     " res=" + sun.shadowResolution + " dist=" + QualitySettings.shadowDistance.ToString("F0"))
                                  : " | sun=NULL"));
            }
        }
    }
}
#endif
