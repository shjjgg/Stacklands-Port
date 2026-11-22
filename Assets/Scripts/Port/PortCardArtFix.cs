using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 卡面美术层修正 (v0.42)。
    ///
    /// 实测事实(逐像素统计, 不是猜):
    ///   Assets/Texture2D/Bush/Tree/Rock/Villager.png 都是 1024×1024 「白色实心剪影 + 黑手绘描边」遮罩图:
    ///   中心 (255,255,255,255) 不透明白填充, 外沿 alpha=0, 不透明区 RGB 均值 173~188 灰, 22%~28% 是暗描边。
    ///
    /// 原版呈现(对照 PC 实录): 白填充区域直接露出卡底色, 眼睛只看得见线条; 线条颜色 = 卡底色的互补色
    /// (深色卡→白线, 浅色卡→深线)。移植里降级成内置 Sprites/Default 直接采样, 白剪影整块糊在卡上。
    ///
    /// 修法:
    ///   1) 卡面精灵改用 Resources/PortCardArtOutline。
    ///      注意: 只靠 Shader.Find 取的自研 shader 不会进构建(会被裁), 必须 Resources.Load。
    ///   2) 从卡框(Shapes Rect)的 MaterialPropertyBlock 读卡底色, 取反后作为 _InkColor 写进精灵的 MPB。
    ///   3) 图案上下翻: UV/rect 自洽(日志 flipped=False), 说明翻转来自贴图取向差异, 由 FlipOn 统一处理。
    ///
    /// 判定不靠物件名: 祖先里有 GameCard 的 SpriteRenderer。
    /// </summary>
    public static class PortCardArtFix
    {
        const string Tag = "[PortCardArtFix] ";

        public static bool ShaderFound;
        public static int Matched;
        public static int Swapped;
        public static int FlipFixed;
        public static bool Enabled = true;
        public static bool FlipOn = true;
        public static Material OutlineMat;

        static readonly Dictionary<int, bool> _done = new Dictionary<int, bool>();
        static readonly HashSet<string> _logged = new HashSet<string>();

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortCardArtFix]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        static Transform CardRoot(Transform t)
        {
            int depth = 0;
            while (t != null && depth++ < 8)
            {
                if (t.name.StartsWith("GameCard")) return t;
                t = t.parent;
            }
            return null;
        }

        /// <summary>卡底色: 取 GameCard 下 Shapes 渲染器上的 _Color(卡框填色)。</summary>
        static bool TryCardColor(SpriteRenderer sr, out Color color)
        {
            color = Color.white;
            var root = CardRoot(sr.transform);
            if (root == null) return false;
            foreach (var r in root.GetComponentsInChildren<Renderer>(true))
            {
                if (r is SpriteRenderer || r.sharedMaterial == null) continue;
                var sh = r.sharedMaterial.shader;
                if (sh == null || !sh.name.StartsWith("Shapes")) continue;

                var mbp = new MaterialPropertyBlock();
                r.GetPropertyBlock(mbp);
                if (!mbp.isEmpty)
                {
                    color = mbp.GetColor("_Color");
                    return true;
                }
                if (r.sharedMaterial.HasProperty("_Color"))
                {
                    color = r.sharedMaterial.GetColor("_Color");
                    return true;
                }
            }
            return false;
        }

        public static void SetEnabled(bool on)
        {
            Enabled = on;
            Apply();
            PortLog.Write(Tag + "SetEnabled " + on);
        }

        public static void SetFlip(bool on)
        {
            FlipOn = on;
            var all = Object.FindObjectsOfType<SpriteRenderer>();
            foreach (var sr in all)
            {
                if (sr == null || sr.sprite == null || CardRoot(sr.transform) == null) continue;
                sr.flipY = on;
            }
            PortLog.Write(Tag + "SetFlip " + on);
        }

        static void Apply()
        {
            var all = Object.FindObjectsOfType<SpriteRenderer>();
            foreach (var sr in all)
            {
                if (sr == null || sr.sprite == null || CardRoot(sr.transform) == null) continue;
                var target = sr.sprite.texture;
                if (Enabled && OutlineMat != null)
                {
                    sr.sharedMaterial = OutlineMat;
                    Color paper;
                    bool ok = TryCardColor(sr, out paper);
                    Color ink = ok ? new Color(1f - paper.r, 1f - paper.g, 1f - paper.b, 1f) : Color.white;
                    var mbp = new MaterialPropertyBlock();
                    sr.GetPropertyBlock(mbp);
                    mbp.SetColor("_InkColor", ink);
                    sr.SetPropertyBlock(mbp);
                    if (!_logged.Contains(sr.gameObject.name) && _logged.Count < 6)
                    {
                        _logged.Add(sr.gameObject.name);
                        PortLog.Write(Tag + "ink " + sr.gameObject.name + " paper=" + paper + " ok=" + ok + " ink=" + ink);
                    }
                }
                else
                {
                    var sh = Shader.Find("Sprites/Default");
                    if (sh != null) sr.sharedMaterial = new Material(sh) { mainTexture = target };
                }
                sr.flipY = FlipOn;
            }
        }

        internal sealed class Runner : MonoBehaviour
        {
            IEnumerator Start()
            {
                yield return new WaitForSecondsRealtime(4f);
                Scan();
                for (int i = 0; i < 40; i++)
                {
                    if (Enabled) Apply();
                    yield return new WaitForSecondsRealtime(1.5f);
                }
            }
        }

        public static void Scan()
        {
            if (!Enabled) return;
            if (OutlineMat == null)
            {
                var sh = Resources.Load<Shader>("PortCardArtOutline");
                if (sh == null) sh = Shader.Find("Port/CardArtOutline");
                if (sh != null)
                {
                    OutlineMat = new Material(sh);
                    ShaderFound = true;
                    PortLog.Write(Tag + "shader 就位: " + sh.name + " supported=" + sh.isSupported);
                }
                else
                {
                    PortLog.Write(Tag + "ERROR 取不到 Port/CardArtOutline (Resources 未打进包?)");
                    return;
                }
            }
            Apply();
            Matched = 0;
            foreach (var sr in Object.FindObjectsOfType<SpriteRenderer>())
                if (sr != null && sr.sprite != null && CardRoot(sr.transform) != null) Matched++;
            PortLog.Write(Tag + "scan cardRenderers=" + Matched + " mat=" + (OutlineMat != null ? OutlineMat.shader.name : "null") +
                          " flip=" + FlipOn + " supported=" + (OutlineMat != null && OutlineMat.shader.isSupported));
        }
    }
}
