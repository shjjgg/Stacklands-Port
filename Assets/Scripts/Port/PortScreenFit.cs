using System.Collections;
using UnityEngine;

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
                    // 纵向不变、横向要装下设计宽度的做法: 按比例放大纵向 FOV
                    float tanHalf = Mathf.Tan(Mathf.Deg2Rad * _baseFov * 0.5f) * (DesignAspect / aspect);
                    fov = Mathf.Rad2Deg * 2f * Mathf.Atan(tanHalf);
                }
                cam.fieldOfView = Mathf.Clamp(fov, 20f, 120f);
                PortLog.Write(Tag + "cam fov " + _baseFov.ToString("F1") + " -> " + cam.fieldOfView.ToString("F1")
                    + " aspect=" + aspect.ToString("F3") + " " + _w + "x" + _h);
            }

            void ApplySafeArea()
            {
                try
                {
                    var canvas = GameObject.Find("PortQuickMenuCanvas");
                    if (canvas == null) return;
                    var root = canvas.GetComponent<RectTransform>();
                    if (root == null) return;
                    var sa = Screen.safeArea;
                    if (Screen.width <= 0 || Screen.height <= 0) return;
                    root.anchorMin = new Vector2(sa.xMin / Screen.width, sa.yMin / Screen.height);
                    root.anchorMax = new Vector2(sa.xMax / Screen.width, sa.yMax / Screen.height);
                    root.offsetMin = Vector2.zero;
                    root.offsetMax = Vector2.zero;
                }
                catch { }
            }
        }
    }
}
