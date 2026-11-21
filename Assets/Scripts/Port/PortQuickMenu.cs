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
                var font = FindSceneFont();
                if (font != null) txt.font = font;
                txt.text = "设置";
                txt.fontSize = 44f;
                txt.color = new Color(0.10f, 0.09f, 0.07f, 1f);
                txt.alignment = TMPro.TextAlignmentOptions.Center;
                txt.raycastTarget = false;

                PortLog.Marker("quickmenu built paper=" + (paper != null));
            }

            static TMPro.TMP_FontAsset FindSceneFont()
            {
                var texts = UnityEngine.Object.FindObjectsOfType<TMPro.TMP_Text>(true);
                for (int i = 0; i < texts.Length; i++)
                {
                    if (texts[i] != null && texts[i].font != null) return texts[i].font;
                }
                return null;
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
                var buttons = UnityEngine.Object.FindObjectsOfType<Button>(true);
                for (int i = 0; i < buttons.Length; i++)
                {
                    var b = buttons[i];
                    if (b == null || b.gameObject.name != "Options") continue;
                    if (b == _btn) continue;
                    var t = b.transform.parent;
                    bool inPause = false;
                    for (int d = 0; d < 4 && t != null; d++, t = t.parent)
                    {
                        if (t.name == "PauseScreen") { inPause = true; break; }
                    }
                    if (!inPause || !b.gameObject.activeInHierarchy) continue;
                    b.onClick.Invoke();
                    PortLog.Marker("quickmenu opened options screen");
                    yield break;
                }
                PortLog.Write("[PortQuickMenu] 暂停面板里的 Options 按钮没找到");
            }
        }
    }
}
