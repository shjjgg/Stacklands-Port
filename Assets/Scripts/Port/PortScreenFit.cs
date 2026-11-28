using System.Collections;
using UnityEngine;
using UnityEngine.UI;

namespace StacklandsPort
{
    /// <summary>
    /// 手机屏幕适配 (v0.36):
    /// 1) 相机按 16:9 设计比例做「不裁切」适配: 比 16:9 更宽(20:9 等) 原样显示更多两侧内容;
    ///    比 16:9 更窄(4:3 / 16:10) 时扩大 FOV, 保证原来横向可见范围不被裁掉。
    /// 2) 把刘海/挖孔屏的 safeArea 应用到移植版自建的快捷菜单 Canvas, 按钮不再被摄像头挖孔压住。
    /// 3) 分辨率/旋转变化时重新计算。
    /// 原版玩法逻辑与美术尺寸完全不动, 只调相机视锥与自建 UI。
    /// </summary>
    public static class PortScreenFit
    {
        const string Tag = "[PortScreenFit] ";
        const float DesignAspect = 16f / 9f;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortScreenFit]");
            Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        internal sealed class Runner : MonoBehaviour
        {
            Camera _cam;
            float _baseFov = -1f;
            int _w, _h;

            IEnumerator Start()
            {
                yield return new WaitForSecondsRealtime(0.2f);
                ApplyCamera();
                while (true)
                {
                    if (Screen.width != _w || Screen.height != _h) ApplyCamera();
                    ApplySafeArea();
                    yield return new WaitForSecondsRealtime(0.5f);
                }
            }

            void ApplyCamera()
            {
                _w = Screen.width;
                _h = Screen.height;
                Camera cam = null;
                try { cam = Camera.main; } catch { }
                if (cam == null) return;
                if (cam != _cam || _baseFov <= 0f)
                {
                    _cam = cam;
                    _baseFov = cam.fieldOfView > 0f ? cam.fieldOfView : 60f;
                }
                float aspect = _h > 0 ? (float)_w / _h : DesignAspect;
                float fov = _baseFov;
                if (aspect < DesignAspect)
                {
                    // 比 16:9 窄(4:3 / 16:10): 放大纵向 FOV, 原版可见宽度不被裁
                    float tanHalf = Mathf.Tan(Mathf.Deg2Rad * _baseFov * 0.5f) * (DesignAspect / aspect);
                    fov = Mathf.Rad2Deg * 2f * Mathf.Atan(tanHalf);
                }
                else if (aspect > DesignAspect)
                {
                    // 比 16:9 宽(20:9 长屏): 原版两侧会多出一大片空草地、棋盘显小。
                    // 折中放大一半的差距(最多 15%), 让棋盘更"占满"屏幕又不明显裁切上下。
                    float zoom = Mathf.Min(1f + (aspect / DesignAspect - 1f) * 0.5f, 1.15f);
                    float tanHalf = Mathf.Tan(Mathf.Deg2Rad * _baseFov * 0.5f) / zoom;
                    fov = Mathf.Rad2Deg * 2f * Mathf.Atan(tanHalf);
                }
                // UI: 游戏内所有 ScreenSpace 画布改成「按高度匹配」, 20:9 上 HUD 不再被放大 25%
                int scalers = 0;
                foreach (var sc in Resources.FindObjectsOfTypeAll<CanvasScaler>())
                {
                    if (sc == null || sc.gameObject == null) continue;
                    var c = sc.GetComponent<Canvas>();
                    if (c == null || (c.renderMode != RenderMode.ScreenSpaceOverlay &&
                                      c.renderMode != RenderMode.ScreenSpaceCamera)) continue;
                    if (sc.gameObject.name == "PortQuickMenuCanvas") continue;
                    if (sc.screenMatchMode == CanvasScaler.ScreenMatchMode.MatchWidthOrHeight &&
                        Mathf.Abs(sc.matchWidthOrHeight - 1f) < 0.01f) { scalers++; continue; }
                    sc.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight;
                    sc.matchWidthOrHeight = 1f;
                    scalers++;
                }
                cam.fieldOfView = Mathf.Clamp(fov, 20f, 120f);
                PortLog.Write(Tag + "cam fov " + _baseFov.ToString("F1") + " -> " + cam.fieldOfView.ToString("F1")
                    + " aspect=" + aspect.ToString("F3") + " " + _w + "x" + _h + " uiScalers=" + scalers);
            }

            Vector4 _lastSafe;
            bool _safeLogged;
            int _safeCanvases;

            /// <summary>
            /// 刘海/挖孔避让 (v0.70): 构建期已关掉「渲染到安全区外」(androidRenderOutsideSafeArea=0),
            /// 窗口本身就不再压到挖孔; 个别 ROM 不按安全区缩窗口时, 这里再把满屏画布收进 Screen.safeArea。
            /// 满屏画布=anchors(0,0)-(1,1)+零偏移, 只动这种, 避免动到原版自算位置的子面板。
            /// </summary>
            void ApplySafeArea()
            {
                try
                {
                    if (Screen.width <= 0 || Screen.height <= 0) return;
                    var sa = Screen.safeArea;
                    float sx = Screen.width, sy = Screen.height;
                    var cur = new Vector4(sa.xMin / sx, sa.yMin / sy, sa.xMax / sx, sa.yMax / sy);
                    bool inset = cur.x > 0.001f || cur.y > 0.001f || cur.z < 0.999f || cur.w < 0.999f;

                    if (!_safeLogged || cur != _lastSafe)
                    {
                        _lastSafe = cur;
                        _safeLogged = true;
                        PortLog.Write(Tag + "safeArea " + Mathf.RoundToInt(sa.xMin) + "," + Mathf.RoundToInt(sa.yMin)
                            + " " + Mathf.RoundToInt(sa.width) + "x" + Mathf.RoundToInt(sa.height)
                            + " / screen " + (int)sx + "x" + (int)sy + (inset ? " -> 已内收" : " -> 满屏, 无需内收"));
                    }
                    if (!inset) return;   // 窗口已经是安全区, 画布保持满屏, 避免二次内收

                    int done = 0;
                    foreach (var canvas in Resources.FindObjectsOfTypeAll<Canvas>())
                    {
                        if (canvas == null || canvas.gameObject == null) continue;
                        if (canvas.renderMode != RenderMode.ScreenSpaceOverlay &&
                            canvas.renderMode != RenderMode.ScreenSpaceCamera) continue;
                        if (canvas.name == "PortQuickMenuCanvas") continue;
                        if (canvas.transform.parent != null) continue;      // 只处理顶级画布
                        var root = canvas.GetComponent<RectTransform>();
                        if (root == null) continue;
                        if (!IsFullScreenRect(root)) continue;
                        root.anchorMin = new Vector2(cur.x, cur.y);
                        root.anchorMax = new Vector2(cur.z, cur.w);
                        root.offsetMin = Vector2.zero;
                        root.offsetMax = Vector2.zero;
                        done++;
                    }
                    var qm = GameObject.Find("PortQuickMenuCanvas");
                    if (qm != null)
                    {
                        var qr = qm.GetComponent<RectTransform>();
                        if (qr != null)
                        {
                            qr.anchorMin = new Vector2(cur.x, cur.y);
                            qr.anchorMax = new Vector2(cur.z, cur.w);
                            qr.offsetMin = Vector2.zero;
                            qr.offsetMax = Vector2.zero;
                            done++;
                        }
                    }
                    if (done != _safeCanvases)
                    {
                        _safeCanvases = done;
                        PortLog.Write(Tag + "safeArea 内收画布 " + done + " 个");
                    }
                }
                catch (System.Exception e) { PortLog.Write(Tag + "safeArea 失败 " + e.GetType().Name); }
            }

            static bool IsFullScreenRect(RectTransform rt)
            {
                if (rt.anchorMin.x > 0.01f || rt.anchorMin.y > 0.01f) return false;
                if (rt.anchorMax.x < 0.99f || rt.anchorMax.y < 0.99f) return false;
                return Mathf.Abs(rt.offsetMin.x) < 2f && Mathf.Abs(rt.offsetMin.y) < 2f
                    && Mathf.Abs(rt.offsetMax.x) < 2f && Mathf.Abs(rt.offsetMax.y) < 2f;
            }
        }
    }
}
