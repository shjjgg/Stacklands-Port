using System;
using System.Collections;
using System.Reflection;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

namespace StacklandsPort
{
    /// <summary>
    /// 进游戏后补一个"设置"按钮(安卓没有 Esc)。样式照原版: 纸张框 sketchy_box_2 + 世界字体,
    /// 点击 = WorldManager.TogglePause() 再自动点暂停面板里的 Options, 直接进原版设置页。
    /// </summary>
    public static class PortQuickMenu
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortQuickMenu]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        internal sealed class Runner : MonoBehaviour
        {
            Button _btn;
            bool _built;
            GameObject _root;
            float _nextCheck;

            void Update()
            {
                if (_built)
                {
                    TryAssignChineseFont();
                    // 主菜单没有 GameScreen, 按钮应当隐藏(原版也没有这个按钮)
                    if (Time.realtimeSinceStartup >= _nextCheck)
                    {
                        _nextCheck = Time.realtimeSinceStartup + 1f;
                        var gs = GameObject.Find("GameScreen");
                        bool inGame = gs != null && gs.activeInHierarchy;
                        if (_root != null && _root.activeSelf != inGame) _root.SetActive(inGame);
                    }
                    return;
                }
                if (SceneManager.GetActiveScene().name != "SampleScene") return;
                if (Time.realtimeSinceStartup < 2f) return;
                _built = true;
                try { Build(); }
                catch (Exception e) { PortLog.Write("[PortQuickMenu] build failed: " + e); }
            }

            void Build()
            {
                var root = new GameObject("PortQuickMenuCanvas");
                _root = root;
                root.transform.SetParent(transform, false);
                var canvas = root.AddComponent<Canvas>();
                canvas.renderMode = RenderMode.ScreenSpaceOverlay;
                canvas.sortingOrder = 4000;
                var scaler = root.AddComponent<CanvasScaler>();
                scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
                scaler.referenceResolution = new Vector2(1920f, 1080f);
                scaler.matchWidthOrHeight = 0f;
                root.AddComponent<GraphicRaycaster>();

                var btnGo = new GameObject("PortSettingsButton");
                btnGo.transform.SetParent(root.transform, false);
                var rt = btnGo.AddComponent<RectTransform>();
                rt.anchorMin = new Vector2(1f, 0.5f);
                rt.anchorMax = new Vector2(1f, 0.5f);
                rt.pivot = new Vector2(1f, 0.5f);
                rt.sizeDelta = new Vector2(150f, 110f);
                rt.anchoredPosition = new Vector2(-30f, -110f);

                // 原版暂停面板里的按钮就是「纸色矩形 + 文字」, 没有贴图; 这里照抄同一做法
                var img = btnGo.AddComponent<Image>();
                img.sprite = null;
                img.color = new Color(1f, 0.98f, 0.91f, 1f);
                img.raycastTarget = true;
                var paper = (Sprite)null;

                _btn = btnGo.AddComponent<Button>();
                _btn.targetGraphic = img;
                _btn.onClick.AddListener(OnClick);

                var labelGo = new GameObject("Label");
                labelGo.transform.SetParent(btnGo.transform, false);
                var lrt = labelGo.AddComponent<RectTransform>();
                lrt.anchorMin = Vector2.zero;
                lrt.anchorMax = Vector2.one;
                lrt.offsetMin = new Vector2(6f, 4f);
                lrt.offsetMax = new Vector2(-6f, -4f);

                var txt = labelGo.AddComponent<TMPro.TextMeshProUGUI>();
                var font = FindAnySceneFont();
                if (font != null) txt.font = font;
                txt.text = "设置";
                txt.fontSize = 44f;
                txt.color = new Color(0.10f, 0.09f, 0.07f, 1f);
                txt.alignment = TMPro.TextAlignmentOptions.Center;
                txt.raycastTarget = false;
                _label = txt;
                _fontFrames = 0;

                PortLog.Marker("quickmenu built paper=" + (paper != null));
            }

            static TMPro.TMP_FontAsset FindAnySceneFont()
            {
                var texts = UnityEngine.Object.FindObjectsOfType<TMPro.TMP_Text>(true);
                for (int i = 0; i < texts.Length; i++)
                {
                    if (texts[i] != null && texts[i].font != null) return texts[i].font;
                }
                return null;
            }

            TMPro.TMP_Text _label;
            int _fontFrames;

            /// <summary>
            /// 建按钮时游戏 UI 可能还没把世界字体挂上, 拿到的是 LiberationSans SDF(无中文) → 显示 □。
            /// 所以建完后连续几帧找自带『设』字的字体再赋值。
            /// </summary>
            void TryAssignChineseFont()
            {
                if (_label == null || _label.font != null && _label.font.HasCharacter('设')) return;
                if (_fontFrames++ > 240) return;
                var texts = UnityEngine.Object.FindObjectsOfType<TMPro.TMP_Text>(true);
                for (int i = 0; i < texts.Length; i++)
                {
                    var f = texts[i] != null ? texts[i].font : null;
                    if (f != null && f.HasCharacter('设') && f.HasCharacter('置'))
                    {
                        _label.font = f;
                        PortLog.Write("[PortQuickMenu] 使用字体 " + f.name);
                        return;
                    }
                }
            }

            void OnClick()
            {
                PortLog.Marker("quickmenu click");
                if (!InvokePause())
                {
                    PortLog.Write("[PortQuickMenu] WorldManager.TogglePause 未找到");
                    return;
                }
                StartCoroutine(OpenOptionsNextFrame());
            }

            static bool InvokePause()
            {
                try
                {
                    var all = UnityEngine.Object.FindObjectsOfType<MonoBehaviour>(true);
                    for (int i = 0; i < all.Length; i++)
                    {
                        var mb = all[i];
                        if (mb == null || mb.GetType().Name != "WorldManager") continue;
                        var m = mb.GetType().GetMethod("TogglePause",
                            BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance,
                            null, Type.EmptyTypes, null);
                        if (m == null) continue;
                        m.Invoke(mb, null);
                        return true;
                    }
                }
                catch (Exception e)
                {
                    PortLog.Write("[PortQuickMenu] TogglePause 调用失败: " + e);
                }
                return false;
            }

            IEnumerator OpenOptionsNextFrame()
            {
                yield return null;
                yield return null;
                var clicked = TryClickOptions();
                if (!clicked)
                {
                    // 有的版本暂停面板要一帧动画后才可点, 再等一帧
                    yield return new WaitForSecondsRealtime(0.2f);
                    clicked = TryClickOptions();
                }
                if (clicked) PortLog.Marker("quickmenu opened options screen");
                else PortLog.Write("[PortQuickMenu] 暂停面板里的 Options 按钮没找到: " + DumpButtonNames());
            }

            static bool TryClickOptions()
            {
                var buttons = UnityEngine.Object.FindObjectsOfType<Button>(true);
                for (int i = 0; i < buttons.Length; i++)
                {
                    var b = buttons[i];
                    if (b == null || !b.gameObject.activeInHierarchy) continue;
                    var n = b.gameObject.name;
                    if (n != "Options" && n != "OptionsButton" && !n.StartsWith("Options ")) continue;
                    b.onClick.Invoke();
                    return true;
                }
                return false;
            }

            static string DumpButtonNames()
            {
                var sb = new System.Text.StringBuilder();
                var buttons = UnityEngine.Object.FindObjectsOfType<Button>(true);
                for (int i = 0; i < buttons.Length && i < 40; i++)
                {
                    if (buttons[i] == null) continue;
                    sb.Append(buttons[i].gameObject.name)
                      .Append(buttons[i].gameObject.activeInHierarchy ? "(on) " : "(off) ");
                }
                return sb.ToString();
            }
        }
    }
}
