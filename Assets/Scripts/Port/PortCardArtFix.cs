using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 卡面美术层的两个定点修正 (v0.40):
    ///
    /// 1) 图案倒立: 卡面美术是 GameCard/CardIcon 上的 SpriteRenderer(内置 Sprites/Default),
    ///    卡框(Shapes Rect)与卡名(TMP)都正常, 只有精灵图上下镜像。
    ///    检查 sprite 的 UV 象限与 rect 是否自洽: 正常时四边形"底边" uv.y ≈ rect.y/texH,
    ///    "顶边" uv.y ≈ (rect.y+rect.h)/texH; 若反过来, 直接把 renderer.flipY 打开抵消。
    ///
    /// 2) 卡面美术: 贴图本身是「白色实心剪影 + 黑描边」的遮罩图(实测不透明区均值 173~188 灰,
    ///    2~3 成是暗描边), 内置 Sprites/Default 直接采样就画成了一坨白块。
    ///    原版是「白描边 + 卡底色透出」, 所以给 CardIcon 换 Port/CardArtOutline(按亮度取反算遮罩,
    ///    白填充透明、黑描边转白), 其它 sprite 不受影响。
    /// </summary>
    public static class PortCardArtFix
    {
        const string Tag = "[PortCardArtFix] ";
        static Material _invertMat;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortCardArtFix]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        internal sealed class Runner : MonoBehaviour
        {
            readonly HashSet<int> _checked = new HashSet<int>();
            bool _loggedInvert;

            IEnumerator Start()
            {
                yield return new WaitForSecondsRealtime(8f);   // 等第一局棋盘把卡生成出来
                for (int i = 0; i < 8; i++)
                {
                    Scan(i == 7);
                    yield return new WaitForSecondsRealtime(2f);
                }
            }

            void Scan(bool verbose)
            {
                int sampled = 0, flippedFixed = 0, matSwapped = 0;
                foreach (var sr in Object.FindObjectsOfType<SpriteRenderer>())
                {
                    if (sr == null || sr.sprite == null) continue;
                    if (sr.gameObject.name != "CardIcon") continue;
                    int id = sr.GetInstanceID();
                    if (_checked.Contains(id)) continue;

                    var sp = sr.sprite;
                    var uv = sp.uv;
                    var tex = sp.texture;
                    if (uv == null || uv.Length < 4 || tex == null) { _checked.Add(id); continue; }

                    float texH = tex.height;
                    float yBottom = sp.rect.y / texH;
                    float yTop = (sp.rect.y + sp.rect.height) / texH;
                    float uvMin = float.MaxValue, uvMax = float.MinValue;
                    for (int k = 0; k < uv.Length; k++)
                    {
                        uvMin = Mathf.Min(uvMin, uv[k].y);
                        uvMax = Mathf.Max(uvMax, uv[k].y);
                    }
                    bool flipped = Mathf.Abs(uvMin - yTop) < 0.003f && Mathf.Abs(uvMax - yBottom) < 0.003f;

                    if (verbose || flipped)
                        PortLog.Write(Tag + "check " + sp.name + " tex=" + tex.name + " " + tex.width + "x" + tex.height +
                                      " rect=" + sp.rect + " uvY=[" + uvMin.ToString("F3") + "," + uvMax.ToString("F3") + "]" +
                                      " expect=[" + yBottom.ToString("F3") + "," + yTop.ToString("F3") + "]" +
                                      " flipped=" + flipped + " flipY=" + sr.flipY);

                    if (flipped)
                    {
                        sr.flipY = !sr.flipY;
                        flippedFixed++;
                    }

                    if (_invertMat == null)
                    {
                        var sh = Shader.Find("Port/CardArtOutline");
                        if (sh != null) _invertMat = new Material(sh);
                        else if (!_loggedInvert) { _loggedInvert = true; PortLog.Write(Tag + "找不到 Port/CardArtOutline"); }
                    }
                    if (_invertMat != null && sr.sharedMaterial != _invertMat)
                    {
                        sr.sharedMaterial = _invertMat;
                        matSwapped++;
                    }

                    _checked.Add(id);
                    sampled++;
                }
                if (sampled > 0 || verbose)
                    PortLog.Write(Tag + "scan sampled=" + sampled + " flippedFixed=" + flippedFixed +
                                  " matSwapped=" + matSwapped + " checked=" + _checked.Count);
            }
        }
    }
}
