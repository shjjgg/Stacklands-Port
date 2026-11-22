using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 卡面图案倒立的定点修正 (v0.39)。
    ///
    /// 现场证据: 卡面美术是 GameCard/CardIcon 上的 SpriteRenderer(内置 Sprites/Default),
    /// 卡框(Shapes Rect)与卡名(TMP)都正常, 只有这张精灵图上下镜像。
    /// 因此不再猜 shader, 而是直接检查 sprite 的 UV 象限与它的 rect 是否自洽:
    /// 正常时, 四边形"底边"的 uv.y 应该 ≈ rect.y/texH < "顶边"的 uv.y ≈ (rect.y+rect.h)/texH;
    /// 若反过来(底边取到了 rect 顶边), 说明这张精灵的 UV 是上下翻的, 直接把 renderer.flipY 打开抵消。
    ///
    /// 只作用于名字为 CardIcon 的渲染器, 不碰背景/树/UI。
    /// </summary>
    public static class PortCardArtFix
    {
        const string Tag = "[PortCardArtFix] ";

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

            IEnumerator Start()
            {
                yield return new WaitForSecondsRealtime(8f);   // 等第一局棋盘把卡生成出来
                for (int i = 0; i < 7; i++)
                {
                    Scan(i == 6);
                    yield return new WaitForSecondsRealtime(2f);
                }
            }

            void Scan(bool verbose)
            {
                int fixedCount = 0, sampled = 0;
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

                    _checked.Add(id);
                    sampled++;
                    if (flipped)
                    {
                        sr.flipY = !sr.flipY;
                        fixedCount++;
                    }
                }
                if (sampled > 0 || verbose)
                    PortLog.Write(Tag + "scan sampled=" + sampled + " flippedFixed=" + fixedCount + " checked=" + _checked.Count);
            }
        }
    }
}
