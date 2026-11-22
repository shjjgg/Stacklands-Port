using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

namespace StacklandsPort
{
    /// <summary>
    /// 真机可视诊断 HUD (v0.42)。
    /// 目的: 拿不到 adb / 不方便拖 files 日志时, 让屏幕自己把关键事实报出来, 并给两个可点的 A/B 开关:
    ///   [后处理 ON/OFF]  -> 校正整体亮度
    ///   [卡面 描边/原样] -> 校正卡面美术
    /// 想彻底关掉这块 HUD: 在 files 目录放一个空文件 hud_off。
    /// </summary>
    public static class PortDiag
    {
        public static bool PostFxOn;
        static bool _hidden;
        static float _hideAt;
        static readonly List<string> _lines = new List<string>();
        static string _lum = "?";
        static float _nextLum;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortDiag]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        static int CountEnabled(PostProcessLayer[] l)
        {
            int n = 0;
            foreach (var x in l) if (x != null && x.enabled) n++;
            return n;
        }

        internal sealed class Runner : MonoBehaviour
        {
            float _next;

            IEnumerator Start()
            {
                yield return new WaitForSecondsRealtime(4f);
                var layers = Object.FindObjectsOfType<PostProcessLayer>();
                PostFxOn = CountEnabled(layers) > 0;
                LogBackgroundTints();
                LogBoardMaterials();
                DumpScreenUiSprites();
                try
                {
                    var bf = System.IO.Path.Combine(Application.persistentDataPath, "bench_on");
                    if (System.IO.File.Exists(bf)) PortShaderBench.Run();
                }
                catch { }
                PortLog.Write("[PortDiag] gfx=" + SystemInfo.graphicsDeviceType +
                              " colorSpace=" + QualitySettings.activeColorSpace +
                              " screen=" + Screen.width + "x" + Screen.height +
                              " postfxLayers=" + layers.Length + " enabled=" + CountEnabled(layers));
            }

            void Update()
            {
                if (Time.unscaledTime < _next) return;
                _next = Time.unscaledTime + 2f;
                Refresh();

                try
                {
                    var f = System.IO.Path.Combine(Application.persistentDataPath, "hud_off");
                    if (System.IO.File.Exists(f) && !_hidden) Hide();
                }
                catch { }
            }

            static void LogBackgroundTints()
            {
                int n = 0;
                foreach (var sr in Object.FindObjectsOfType<SpriteRenderer>())
                {
                    if (sr == null || sr.sharedMaterial == null) continue;
                    var sh = sr.sharedMaterial.shader;
                    if (sh == null || sh.name != "Sprites/BackgroundShader") continue;
                    if (n++ >= 6) break;
                    Color mc = Color.white;
                    if (sr.sharedMaterial.HasProperty("_Color")) mc = sr.sharedMaterial.GetColor("_Color");
                    PortLog.Write("[PortDiag] bg " + sr.gameObject.name +
                                  " sprite=" + (sr.sprite != null ? sr.sprite.name : "-") +
                                  " srColor=" + sr.color + " matColor=" + mc +
                                  " tex=" + (sr.sprite != null && sr.sprite.texture != null ? sr.sprite.texture.name : "-"));
                }
                PortLog.Write("[PortDiag] bg 取样条数=" + n);
            }

            /// 屏幕右上角 HUD 图标 / 右下角按钮图标的取证: 名字、贴图、sprite.rect、缩放、颜色、shader。
            /// 目的是判断 UI 小图标的"图案显示不对"是 sprite rect(图集子区域) 取错, 还是缩放/PPU 错。
            static void DumpScreenUiSprites()
            {
                int n = 0;
                foreach (var sr in Object.FindObjectsOfType<SpriteRenderer>())
                {
                    if (sr == null || sr.sprite == null) continue;
                    var cam = Camera.main;
                    if (cam == null) break;
                    Vector3 vp = cam.WorldToViewportPoint(sr.transform.position);
                    bool topRight = vp.y > 0.80f && vp.x > 0.60f;
                    bool botRight = vp.y < 0.25f && vp.x > 0.80f;
                    if (!topRight && !botRight) continue;
                    if (n++ >= 24) break;
                    var rc = sr.sprite.rect;
                    var tex = sr.sprite.texture;
                    var mat = sr.sharedMaterial;
                    PortLog.Write("[PortDiag] ui " + (topRight ? "TR" : "BR") + " obj=" + sr.gameObject.name +
                                  " sprite=" + sr.sprite.name +
                                  " rect=(" + rc.x + "," + rc.y + "," + rc.width + "x" + rc.height + ")" +
                                  " tex=" + (tex != null ? tex.name + " " + tex.width + "x" + tex.height : "-") +
                                  " scale=" + sr.transform.lossyScale +
                                  " sort=" + sr.sortingOrder +
                                  " color=" + sr.color +
                                  " shader=" + (mat != null && mat.shader != null ? mat.shader.name : "-"));
                }
                PortLog.Write("[PortDiag] ui 取样条数=" + n);
            }

            static void LogBoardMaterials()
            {
                var names = new[] { "Custom/FloorShader", "Custom/FloorShaderIsland", "Custom/FloorShaderForest", "Custom/GridShader", "Custom/CardShaderTest" };
                foreach (var r in Object.FindObjectsOfType<Renderer>())
                {
                    if (r == null || r.sharedMaterial == null || r.sharedMaterial.shader == null) continue;
                    string sn = r.sharedMaterial.shader.name;
                    bool hit = false;
                    foreach (var n in names) if (sn == n) { hit = true; break; }
                    if (!hit) continue;
                    var m = r.sharedMaterial;
                    var mbp = new MaterialPropertyBlock();
                    r.GetPropertyBlock(mbp);
                    string props = "";
                    foreach (var pn in new[] { "_Color", "_Color2", "_StoneColor", "_StoneEdge", "_EdgeColor", "_IconColor" })
                    {
                        if (!m.HasProperty(pn)) continue;
                        Color c = m.GetColor(pn);
                        if (!mbp.isEmpty) { try { c = mbp.GetColor(pn); } catch { } }
                        props += " " + pn + "=" + ColorUtility.ToHtmlStringRGB(c);
                    }
                    PortLog.Write("[PortDiag] mat " + sn + " renderer=" + r.name + props);
                }
            }

            static void Refresh()
            {
                _lines.Clear();
                _lines.Add("gfx=" + SystemInfo.graphicsDeviceType + "  colorSpace=" + QualitySettings.activeColorSpace);

                Camera main = null;
                var cams = Object.FindObjectsOfType<Camera>();
                foreach (var c in cams) if (c != null && c.isActiveAndEnabled && (main == null || c.depth > main.depth)) main = c;
                if (main != null)
                    _lines.Add("cam " + main.name + " bg=" + ColorUtility.ToHtmlStringRGB(main.backgroundColor) +
                               " clear=" + main.clearFlags + " hdr=" + main.allowHDR);
                _lines.Add("cameras=" + cams.Length + " renderers=" + Object.FindObjectsOfType<Renderer>().Length);

                var layers = Object.FindObjectsOfType<PostProcessLayer>();
                _lines.Add("postfx layers=" + layers.Length + " enabled=" + CountEnabled(layers));

                var vols = Object.FindObjectsOfType<PostProcessVolume>();
                for (int i = 0; i < vols.Length && i < 4; i++)
                {
                    var v = vols[i];
                    if (v == null) continue;
                    string prof = "null";
                    try { if (v.sharedProfile != null) prof = v.sharedProfile.name; } catch { }
                    _lines.Add("vol " + v.name + " w=" + v.weight.ToString("F2") + " " + prof);
                }

                _lines.Add("cardart shader=" + (PortCardArtFix.ShaderFound ? "ok" : "missing") +
                           " matched=" + PortCardArtFix.Matched + " swapped=" + PortCardArtFix.Swapped +
                           " flip=" + PortCardArtFix.FlipFixed);
            }

            static void Hide()
            {
                _hidden = true;
                PortLog.Write("[PortDiag] 用户隐藏了 HUD");
            }

            void OnGUI()
            {
                try { DrawHud(); } catch (System.Exception e) { PortLog.Write("[PortDiag] HUD 异常: " + e.Message); _hidden = true; }
            }

            void DrawHud()
            {
                if (_hidden) return;
                if (_hideAt == 0f) _hideAt = Time.unscaledTime + 120f;
                if (Time.unscaledTime > _hideAt) return;
                if (_lines.Count == 0) Refresh();

                int fs = Mathf.RoundToInt(Screen.height * 0.020f);
                var st = new GUIStyle(GUI.skin.label) { fontSize = fs, wordWrap = false };
                st.normal.textColor = Color.white;

                float w = Screen.width * 0.60f;
                float h = fs * 1.25f * (_lines.Count + 0.8f);
                GUI.color = new Color(0f, 0f, 0f, 0.6f);
                GUI.DrawTexture(new Rect(6, 6, w, h), Texture2D.whiteTexture);
                GUI.color = Color.white;

                float y = 10;
                for (int i = 0; i < _lines.Count; i++)
                {
                    GUI.Label(new Rect(14, y, w - 20, fs * 1.25f), _lines[i], st);
                    y += fs * 1.25f;
                }

                var btn = new GUIStyle(GUI.skin.button) { fontSize = fs };
                float bw = Screen.width * 0.175f, bh = fs * 2.1f;

                if (GUI.Button(new Rect(6, h + 14, bw, bh), PostFxOn ? "后处理 ON" : "后处理 OFF", btn))
                {
                    PostFxOn = !PostFxOn;
                    foreach (var l in Object.FindObjectsOfType<PostProcessLayer>())
                        if (l != null) l.enabled = PostFxOn;
                    PortLog.Write("[PortDiag] postfx -> " + PostFxOn);
                    _hideAt = Time.unscaledTime + 120f;
                }
                if (GUI.Button(new Rect(6 + bw + 10, h + 14, bw, bh), "背景 tint↺", btn))
                {
                    int n = 0;
                    foreach (var sr in Object.FindObjectsOfType<SpriteRenderer>())
                    {
                        if (sr == null || sr.sharedMaterial == null || sr.sharedMaterial.shader == null) continue;
                        if (sr.sharedMaterial.shader.name != "Sprites/BackgroundShader") continue;
                        sr.color = Color.white;
                        n++;
                    }
                    PortLog.Write("[PortDiag] 背景 tint 复位 n=" + n);
                    _hideAt = Time.unscaledTime + 120f;
                }
                if (GUI.Button(new Rect(6 + (bw + 10) * 2, h + 14, bw * 0.7f, bh),
                               PortCardArtFix.FlipOn ? "图案 翻" : "图案 正", btn))
                {
                    PortCardArtFix.SetFlip(!PortCardArtFix.FlipOn);
                    _hideAt = Time.unscaledTime + 120f;
                }
                if (GUI.Button(new Rect(6 + (bw + 10) * 2 + bw * 0.7f + 14, h + 14, bw, bh),
                               "图标缩放 " + PortCardArtFix.Zoom.ToString("F2"), btn))
                {
                    float z = PortCardArtFix.Zoom;
                    z = (z < 1.9f) ? 2f : (z < 2.1f ? 2.25f : 1.75f);
                    PortCardArtFix.SetZoom(z);
                    _hideAt = Time.unscaledTime + 120f;
                }
                if (GUI.Button(new Rect(6 + (bw + 10) * 2 + bw * 0.7f + 14 + bw + 10, h + 14, bw * 0.6f, bh), "隐藏", btn))
                    Hide();
                if (GUI.Button(new Rect(6, h + 14 + bh + 8, bw * 2f, bh), "靶场(shader 逐一出图)", btn))
                {
                    PortShaderBench.Run();
                    _hideAt = Time.unscaledTime + 120f;
                }
            }
        }
    }
}
