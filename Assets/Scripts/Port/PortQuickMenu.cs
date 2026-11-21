using System;
using System.Collections;
using System.Reflection;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

namespace StacklandsPort
{
    /// <summary>
    /// 进游戏后补一个"设置"按钮: 安卓没有 Esc, 用它打开原版暂停面板并直接跳进 Options 页。
    /// 按钮外观直接克隆原版暂停面板里的按钮, 保证字体/贴图/风格一致;
    /// WorldManager.TogglePause 走反射, 不依赖 GameScripts 的编译期类型。
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
            Canvas _canvas;
            Button _btn;
            bool _built;

            void Update()
            {
                if (_built) return;
                if (SceneManager.GetActiveScene().name != "SampleScene") return;
                if (Time.realtimeSinceStartup < 2f) return;
                _built = true;
                try { Build(); }
                catch (Exception e) { PortLog.Write("[PortQuickMenu] build failed: " + e); }
            }

            void Build()
            {
                var root = new GameObject("PortQuickMenuCanvas");
                root.transform.SetParent(transform, false);
                _canvas = root.AddComponent<Canvas>();
                _canvas.renderMode = RenderMode.ScreenSpaceOverlay;
                _canvas.sortingOrder = 4000;
                var scaler = root.AddComponent<CanvasScaler>();
                scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
                scaler.referenceResolution = new Vector2(1920f, 1080f);
                scaler.matchWidthOrHeight = 0f;
                root.AddComponent<GraphicRaycaster>();

                var template = FindPauseButton();
                Button btn;
                if (template != null)
                {
                    var clone = Instantiate(template.gameObject);
                    clone.name = "PortSettingsButton";
                    clone.transform.SetParent(root.transform, false);
                    clone.SetActive(true);
                    var src = clone.GetComponent<Button>();
                    btn = src != null ? src : clone.AddComponent<Button>();
                    btn.onClick = new Button.ButtonClickedEvent();
                    SetLabel(clone, "设置");
                }
                else
                {
                    PortLog.Write("[PortQuickMenu] 未找到原版按钮模板, 退回纯色按钮");
                    var go = new GameObject("PortSettingsButton");
                    go.transform.SetParent(root.transform, false);
                    var img = go.AddComponent<Image>();
                    img.color = new Color(0.16f, 0.14f, 0.12f, 0.75f);
                    btn = go.AddComponent<Button>();
                    btn.targetGraphic = img;
                }

                var rt = btn.GetComponent<RectTransform>();
                if (rt == null) rt = btn.gameObject.AddComponent<RectTransform>();
                rt.anchorMin = new Vector2(1f, 0.5f);
                rt.anchorMax = new Vector2(1f, 0.5f);
                rt.pivot = new Vector2(1f, 0.5f);
                rt.sizeDelta = new Vector2(150f, 150f);
                rt.anchoredPosition = new Vector2(-32f, -300f);
                rt.localScale = Vector3.one;

                btn.onClick.AddListener(OnClick);
                _btn = btn;
                PortLog.Marker("quickmenu built from=" + (template != null ? template.gameObject.name : "fallback"));
            }

            static Button FindPauseButton()
            {
                var buttons = UnityEngine.Object.FindObjectsOfType<Button>(true);
                Button fallback = null;
                for (int i = 0; i < buttons.Length; i++)
                {
                    var b = buttons[i];
                    if (b == null) continue;
                    var t = b.transform;
                    bool inPause = false;
                    for (int d = 0; d < 5 && t != null; d++, t = t.parent)
                    {
                        if (t.name == "PauseScreen") { inPause = true; break; }
                    }
                    if (!inPause) continue;
                    if (b.gameObject.name == "Options") return b;
                    if (fallback == null) fallback = b;
                }
                return fallback;
            }

            static void SetLabel(GameObject go, string text)
            {
                var tmp = go.GetComponentInChildren<TMPro.TMP_Text>(true);
                if (tmp != null) { tmp.text = text; return; }
                var legacy = go.GetComponentInChildren<Text>(true);
                if (legacy != null) legacy.text = text;
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
                try
                {
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
                catch (Exception e)
                {
                    PortLog.Write("[PortQuickMenu] 打开设置页失败: " + e);
                }
            }
        }
    }
}
