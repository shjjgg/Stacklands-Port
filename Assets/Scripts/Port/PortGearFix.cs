// PortGearFix.cs — 把卡场右下角"设置"纸按钮上的占位图形换成手绘齿轮
//
// 现状: 该按钮是一块米色纸(Image) + 两个小方框图形(子 Graphic), 原版图标(齿轮字形)在本工程里
// 没有对应字形/贴图, 所以显示成两个方框。这里不改 prefab, 只在运行时:
//   1) 按屏幕几何定位这个按钮(右侧边缘、竖直中下、纸块尺寸量级);
//   2) 关掉它内部的小方块图形;
//   3) 在按钮内叠一张手绘墨线齿轮(Resources/PortGearIcon.png), raycastTarget=false 以便点击照旧穿透给父级 Button。
#if UNITY_EDITOR || UNITY_ANDROID
using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using StacklandsPort;

public class PortGearFix : MonoBehaviour
{
    static PortGearFix _inst;
    bool _done;

    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
    static void Boot()
    {
        if (_inst != null) return;
        var go = new GameObject("PortGearFix");
        DontDestroyOnLoad(go);
        _inst = go.AddComponent<PortGearFix>();
    }

    IEnumerator Start()
    {
        var tex = Resources.Load<Texture2D>("PortGearIcon");
        if (tex == null)
        {
            PortLog.Write("[Gear] Resources/PortGearIcon.png 缺失, 跳过");
            yield break;
        }
        var sp = Sprite.Create(tex, new Rect(0, 0, tex.width, tex.height), new Vector2(0.5f, 0.5f), 100f);

        for (int i = 0; i < 120 && !_done; i++)
        {
            yield return new WaitForSeconds(0.5f);
            try { _done = TryPatch(sp); }
            catch (System.Exception e) { PortLog.Write("[Gear] 异常 " + e.GetType().Name + " " + e.Message); }
        }
        if (!_done) PortLog.Write("[Gear] 未找到目标按钮(几何匹配失败)");
    }

    bool TryPatch(Sprite sp)
    {
        var btns = FindObjectsOfType<Button>(true);
        float W = Screen.width, H = Screen.height;
        Button best = null; float bestD = float.MaxValue; Rect bestRect = new Rect();
        foreach (var b in btns)
        {
            var rt = b.transform as RectTransform;
            if (rt == null || !rt.gameObject.activeInHierarchy) continue;
            var corners = new Vector3[4];
            rt.GetWorldCorners(corners);
            // 世界坐标 -> 屏幕坐标
            var p0 = RectTransformUtility.WorldToScreenPoint(null, corners[0]);
            var p2 = RectTransformUtility.WorldToScreenPoint(null, corners[2]);
            var r = RectTransformUtility.WorldToScreenPoint(null, rt.TransformPoint(rt.rect.center));
            var center = r;
            float w = Mathf.Abs(p2.x - p0.x), h = Mathf.Abs(p2.y - p0.y);
            if (w < 60 || w > 400 || h < 40 || h > 300) continue;
            float aspect = w / Mathf.Max(h, 1f);
            if (aspect < 0.9f || aspect > 2.4f) continue;
            if (center.x < W * 0.88f) continue;            // 必须贴右边缘
            if (center.y < H * 0.22f || center.y > H * 0.60f) continue;  // 竖直中下
            float d = Mathf.Abs(W - center.x) + Mathf.Abs(center.y - H * 0.40f);
            if (d < bestD) { bestD = d; best = b; bestRect = new Rect(center.x - w * 0.5f, center.y - h * 0.5f, w, h); }
        }
        if (best == null) return false;

        var brt = best.transform as RectTransform;
        // 1) 关掉内部的小方块图形
        int hidden = 0;
        float panelArea = brt.rect.width * brt.rect.height;
        foreach (var g in best.GetComponentsInChildren<Graphic>(true))
        {
            var grt = g.transform as RectTransform;
            if (grt == null || grt == brt) continue;
            float a = Mathf.Abs(grt.rect.width * grt.rect.height);
            float asp = Mathf.Abs(grt.rect.width) / Mathf.Max(Mathf.Abs(grt.rect.height), 1f);
            if (a < panelArea * 0.45f && asp > 0.5f && asp < 2.0f && g is Image)
            {
                g.enabled = false; hidden++;
            }
            else if (g is TMPro.TMP_Text t && t.text != null && t.text.Trim().Length <= 3)
            {
                g.enabled = false; hidden++;
            }
        }

        // 2) 叠齿轮
        var go = new GameObject("PortGearIcon");
        go.transform.SetParent(best.transform, false);
        var irect = go.AddComponent<RectTransform>();
        irect.anchorMin = irect.anchorMax = new Vector2(0.5f, 0.5f);
        irect.pivot = new Vector2(0.5f, 0.5f);
        float side = Mathf.Min(Mathf.Abs(brt.rect.width), Mathf.Abs(brt.rect.height)) * 0.66f;
        irect.sizeDelta = new Vector2(side, side);
        irect.anchoredPosition = Vector2.zero;
        var img = go.AddComponent<Image>();
        img.sprite = sp;
        img.color = Color.white;
        img.preserveAspect = true;
        img.raycastTarget = false;
        go.transform.SetAsLastSibling();

        PortLog.Write("[Gear] 命中 " + best.name + " rect=" + Mathf.RoundToInt(bestRect.width) + "x" +
                      Mathf.RoundToInt(bestRect.height) + " @(" + Mathf.RoundToInt(bestRect.center.x) + "," +
                      Mathf.RoundToInt(bestRect.center.y) + ") 隐藏图形=" + hidden + " 齿轮边=" + Mathf.RoundToInt(side));
        return true;
    }
}
#endif
