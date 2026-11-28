// PortAlignButton.cs — 设置齿轮上方加一个「对齐」键 (v0.72)
//
// 1) 定位右下角设置按钮(RectTransform 几何匹配: 贴右缘、竖直中下、纸块比例);
// 2) 在它正上方同尺寸复制一个按钮, 图标用 Resources/PortAlignIcon.png —— 与齿轮同款手绘粗墨线,
//    内容沿用「四张卡牌排成 2×2 + 十字虚线对齐辅助线」的语义, 不加纸底、不加阴影, 与齿轮一样浮在卡场上;
// 3) 点击 = 把同一父节点下散落的卡牌按网格对齐: 保持在场上的相对次序(先上后下、先左后右),
//    用卡牌自身包围盒的 1.12 倍做格距, 以当前重心为中心重排; 只调位置(TargetPosition), 不动父子关系、不动数据。
// 只影响摆位, 不改任何游戏逻辑与美术。
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;

namespace StacklandsPort
{
    public class PortAlignButton : MonoBehaviour
    {
        const string Tag = "[PortAlign] ";

        static PortAlignButton _inst;
        RectTransform _gear;
        Button _btn;
        Sprite _icon;
        bool _built;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            if (_inst != null) return;
            var go = new GameObject("PortAlignButton");
            UnityEngine.Object.DontDestroyOnLoad(go);
            _inst = go.AddComponent<PortAlignButton>();
        }

        IEnumerator Start()
        {
            var tex = Resources.Load<Texture2D>("PortAlignIcon");
            if (tex == null) { PortLog.Write(Tag + "缺少 Resources/PortAlignIcon.png, 跳过"); yield break; }
            _icon = Sprite.Create(tex, new Rect(0, 0, tex.width, tex.height), new Vector2(0.5f, 0.5f), 100f);

            for (int i = 0; i < 120 && !_built; i++)
            {
                yield return new WaitForSecondsRealtime(0.5f);
                try { _built = TryBuild(); }
                catch (Exception e) { PortLog.Write(Tag + "异常 " + e.GetType().Name + " " + e.Message); }
            }
            if (!_built) PortLog.Write(Tag + "未找到设置按钮(几何匹配失败)");
        }

        // ---------- 建按钮 ----------
        bool TryBuild()
        {
            var btns = FindObjectsOfType<Button>(true);
            float W = Screen.width, H = Screen.height;
            Button best = null; float bestD = float.MaxValue;
            foreach (var b in btns)
            {
                var rt = b.transform as RectTransform;
                if (rt == null || !rt.gameObject.activeInHierarchy) continue;
                var corners = new Vector3[4];
                rt.GetWorldCorners(corners);
                var p0 = RectTransformUtility.WorldToScreenPoint(null, corners[0]);
                var p2 = RectTransformUtility.WorldToScreenPoint(null, corners[2]);
                var c = RectTransformUtility.WorldToScreenPoint(null, rt.position);
                float w = Mathf.Abs(p2.x - p0.x), h = Mathf.Abs(p2.y - p0.y);
                if (w < 60 || w > 400 || h < 40 || h > 300) continue;
                float aspect = w / Mathf.Max(h, 1f);
                if (aspect < 0.9f || aspect > 2.4f) continue;
                if (c.x < W * 0.88f) continue;
                if (c.y < H * 0.22f || c.y > H * 0.60f) continue;
                // 排除自己建的按钮
                if (b.gameObject.name == "PortAlignButton") continue;
                float d = Mathf.Abs(W - c.x) + Mathf.Abs(c.y - H * 0.40f);
                if (d < bestD) { bestD = d; best = b; }
            }
            if (best == null) return false;

            _gear = best.transform as RectTransform;
            var parent = _gear.parent as RectTransform;
            if (parent == null) parent = _gear;

            var go = new GameObject("PortAlignButton");
            go.transform.SetParent(parent, false);
            var nrt = go.AddComponent<RectTransform>();
            nrt.anchorMin = _gear.anchorMin; nrt.anchorMax = _gear.anchorMax;
            nrt.pivot = _gear.pivot;
            nrt.sizeDelta = _gear.sizeDelta;
            nrt.anchoredPosition = _gear.anchoredPosition + new Vector2(0f, _gear.rect.height * 1.5f);
            nrt.localScale = Vector3.one;
            nrt.localRotation = Quaternion.identity;

            var bg = go.AddComponent<Image>();
            bg.color = new Color(1f, 1f, 1f, 0f);   // 透明底, 但保留 raycast
            bg.raycastTarget = true;

            _btn = go.AddComponent<Button>();
            _btn.targetGraphic = bg;
            _btn.transition = Selectable.Transition.None;
            _btn.onClick.AddListener(OnClick);

            var icon = new GameObject("PortAlignIcon");
            icon.transform.SetParent(go.transform, false);
            var irt = icon.AddComponent<RectTransform>();
            irt.anchorMin = irt.anchorMax = new Vector2(0.5f, 0.5f);
            irt.pivot = new Vector2(0.5f, 0.5f);
            float side = Mathf.Min(Mathf.Abs(_gear.rect.width), Mathf.Abs(_gear.rect.height)) * 0.72f;
            irt.sizeDelta = new Vector2(side, side);
            irt.anchoredPosition = Vector2.zero;
            var img = icon.AddComponent<Image>();
            img.sprite = _icon; img.color = Color.white; img.preserveAspect = true; img.raycastTarget = false;

            PortLog.Write(Tag + "已建 对齐键 于 " + _gear.name + " 上方 side=" + Mathf.RoundToInt(side)
                + " 齿轮锚点=" + _gear.anchoredPosition + " 对齐键锚点=" + nrt.anchoredPosition);
            return true;
        }

        // ---------- 点击 ----------
        void OnClick()
        {
            try
            {
                int moved = AlignAll();
                PortLog.Write(Tag + "点击对齐, 重排卡牌=" + moved);
            }
            catch (Exception e) { PortLog.Write(Tag + "对齐失败 " + e.GetType().Name + " " + e.Message); }
        }

        static bool IsContainer(Transform p)
        {
            if (p == null) return false;
            if (p.GetComponent<GameCard>() != null) return true;      // 卡叠在卡上, 别拆堆
            if (p.GetComponent<Boosterpack>() != null) return true;
            var n = p.name;
            if (n.IndexOf("Stack", StringComparison.OrdinalIgnoreCase) >= 0) return true;
            return false;
        }

        int AlignAll()
        {
            var cam = Camera.main;
            if (cam == null) return 0;

            var cards = FindObjectsOfType<GameCard>(true)
                .Where(c => c != null && c.gameObject.activeInHierarchy)
                .Where(c => !IsContainer(c.transform.parent))
                .GroupBy(c => c.transform.parent)
                .Where(g => g.Count() >= 2)
                .ToList();

            int moved = 0;
            foreach (var g in cards)
            {
                var list = g.ToList();
                // 视线方向: 屏幕"上"对应世界的哪个水平方向
                Vector3 center = list.Aggregate(Vector3.zero, (a, c) => a + c.transform.position) / list.Count;
                var vx = Vector3.ProjectOnPlane(cam.transform.right, Vector3.up).normalized;
                var vz = Vector3.ProjectOnPlane(cam.transform.up, Vector3.up).normalized;
                if (vx.sqrMagnitude < 0.01f) vx = Vector3.right;
                if (vz.sqrMagnitude < 0.01f) vz = Vector3.forward;

                // 卡片尺寸(取包围盒)
                float cw = 0f, ch = 0f;
                foreach (var c in list)
                {
                    var col = c.GetComponentInChildren<Collider>();
                    var b = col != null ? col.bounds.size : new Vector3(1f, 0.02f, 1.45f);
                    cw = Mathf.Max(cw, Mathf.Abs(Vector3.Dot(b, vx)) + Mathf.Abs(Vector3.Dot(b, vz)));
                    ch = Mathf.Max(ch, Mathf.Abs(Vector3.Dot(b, vz)) + Mathf.Abs(Vector3.Dot(b, vx)));
                }
                if (cw < 0.01f) cw = 1f;
                if (ch < 0.01f) ch = 1.4f;

                // 行高在屏幕上的像素(用来判定"同一行", 避免世界单位/像素混用)
                float rowPx = Mathf.Abs(cam.WorldToScreenPoint(center + vz * ch).y
                                      - cam.WorldToScreenPoint(center).y) * 0.6f;
                if (rowPx < 2f) rowPx = 2f;

                // 按屏幕位置排序: 先上后下, 先左后右
                list.Sort((a, b) =>
                {
                    var sa = cam.WorldToScreenPoint(a.transform.position);
                    var sb = cam.WorldToScreenPoint(b.transform.position);
                    if (Mathf.Abs(sb.y - sa.y) > rowPx) return sb.y.CompareTo(sa.y);
                    return sa.x.CompareTo(sb.x);
                });

                int n = list.Count;
                int cols = Mathf.CeilToInt(Mathf.Sqrt(n * 1.6f));
                cols = Mathf.Clamp(cols, 2, n);
                int rows = Mathf.CeilToInt(n / (float)cols);
                float stepX = cw * 1.12f, stepZ = ch * 1.12f;

                for (int i = 0; i < n; i++)
                {
                    int r = i / cols, c2 = i % cols;
                    int inRow = Mathf.Min(cols, n - r * cols);
                    float ox = (c2 - (inRow - 1) * 0.5f) * stepX;
                    float oz = ((rows - 1) * 0.5f - r) * stepZ;
                    var target = center + vx * ox + vz * oz;
                    target.y = 0f;
                    var card = list[i];
                    try { card.SendToPosition(target); moved++; }
                    catch { try { card.transform.position = target; moved++; } catch { } }
                }
                PortLog.Write(Tag + "组 " + g.Key.name + " 卡=" + n + " " + cols + "×" + rows
                    + " 格距=" + stepX.ToString("F2") + "/" + stepZ.ToString("F2"));
            }
            return moved;
        }
    }
}
