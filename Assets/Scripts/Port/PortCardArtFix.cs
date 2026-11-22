using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 卡面图标修正 (v0.43)。
    ///
    /// 取证(反编译 GameCard.cs + 预制体结构):
    ///   卡面不是 SpriteRenderer 画的 —— GameCard.prefab 里 IconRenderer 的 m_Enabled = 0;
    ///   正面由 CardRenderer(MeshRenderer) 3 号槽材质 CardFront(Custom/CardShaderTest) 合成,
    ///   SetColors() 用 MaterialPropertyBlock 下发 _Color/_Color2/_IconColor/_IconTex。
    ///   所以之前"给 sprite 换材质"的对象是个隐藏渲染器, 日志 scan cardRenderers=0 就是这个原因。
    ///
    /// 真正的合成算法修在 shader 里(白填充→卡底色、黑描边→_IconColor)。这里只剩两件事:
    ///   1) 卡面材质的 _FlipIcon 开关(图案上下翻, 由 D3D/GL 贴图取向差异造成);
    ///   2) 把状态报给 PortDiag / 日志。
    /// </summary>
    public static class PortCardArtFix
    {
        const string Tag = "[PortCardArtFix] ";
        public static bool ShaderFound = true;
        public static int Matched;
        public static int Swapped;
        public static int FlipFixed;
        public static bool Enabled = true;
        public static bool FlipOn = false;
        public static Material OutlineMat;

        static readonly Dictionary<int, Material> _cardFronts = new Dictionary<int, Material>();

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortCardArtFix]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        static void CollectFronts()
        {
            _cardFronts.Clear();
            foreach (var r in Object.FindObjectsOfType<MeshRenderer>())
            {
                if (r == null) continue;
                var mats = r.sharedMaterials;
                for (int i = 0; i < mats.Length && i < 4; i++)
                {
                    var m = mats[i];
                    if (m == null || m.shader == null) continue;
                    if (m.shader.name != "Custom/CardShaderTest") continue;
                    _cardFronts[m.GetInstanceID()] = m;
                }
            }
        }

        public static void SetEnabled(bool on)
        {
            Enabled = on;
            PortLog.Write(Tag + "SetEnabled " + on);
        }

        public static void SetFlip(bool on)
        {
            FlipOn = on;
            CollectFronts();
            foreach (var m in _cardFronts.Values)
                if (m.HasProperty("_FlipIcon")) m.SetFloat("_FlipIcon", on ? 1f : 0f);
            Matched = _cardFronts.Count;
            PortLog.Write(Tag + "SetFlip " + on + " cardFrontMats=" + _cardFronts.Count);
        }

        public static float Zoom = 1f;

        public static void SetZoom(float z)
        {
            Zoom = z;
            CollectFronts();
            foreach (var m in _cardFronts.Values)
                if (m.HasProperty("_IconZoom")) m.SetFloat("_IconZoom", z);
            PortLog.Write(Tag + "SetZoom " + z + " cardFrontMats=" + _cardFronts.Count);
        }

        public static void Scan()
        {
            CollectFronts();
            Matched = _cardFronts.Count;
            PortLog.Write(Tag + "scan cardFrontMats=" + Matched + " flip=" + FlipOn);
        }

        internal sealed class Runner : MonoBehaviour
        {
            IEnumerator Start()
            {
                yield return new WaitForSecondsRealtime(8f);
                for (int i = 0; i < 3; i++)
                {
                    Scan();
                    yield return new WaitForSecondsRealtime(3f);
                }
            }
        }
    }
}
