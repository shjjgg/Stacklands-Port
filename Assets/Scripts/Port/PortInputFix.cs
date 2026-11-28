using System;
using System.Reflection;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace StacklandsPort
{
    /// <summary>
    /// v0.69: UI 指针事件的病灶。
    /// 工程已切到 Input System 包, 旧版 UnityEngine.Input 被禁用(日志里那条
    /// "旧版 Input 不可用(InvalidOperationException)")。而 EventSystem 上挂的还是
    /// StandaloneInputModule —— 它每帧去读旧 Input, 直接抛异常, 结果 UI 拿不到
    /// pointer down/drag, ScrollRect 永远收不到拖拽: 任务栏就滑不动。
    /// 做法: 运行时把它换成 InputSystemUIInputModule 并赋默认 action。
    /// </summary>
    public class PortInputFix : MonoBehaviour
    {
        const string Tag = "[Input]";

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortInputFix]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            go.AddComponent<PortInputFix>();
        }

        float _t; bool _done;

        void Update()
        {
            if (_done) return;
            _t += Time.unscaledDeltaTime;
            if (_t < 0.8f) return;
            _done = true;
            try { Fix(); } catch (Exception e) { PortLog.Write(Tag + "失败 " + e.GetType().Name + " " + e.Message); }
            try { FixScroll(); } catch (Exception e) { PortLog.Write(Tag + "Scroll 失败 " + e.Message); }
        }

        static void Fix()
        {
            var es = EventSystem.current;
            if (es == null) { PortLog.Write(Tag + "场景里没有 EventSystem"); return; }

            var legacy = es.GetComponent<StandaloneInputModule>();
            if (legacy != null)
            {
                UnityEngine.Object.Destroy(legacy);
                PortLog.Write(Tag + "已移除 StandaloneInputModule(它读旧 Input, 每帧抛异常, UI 收不到指针)");
            }

            var m = es.GetComponent<UnityEngine.InputSystem.UI.InputSystemUIInputModule>();
            if (m == null) m = es.gameObject.AddComponent<UnityEngine.InputSystem.UI.InputSystemUIInputModule>();

            var mi = typeof(UnityEngine.InputSystem.UI.InputSystemUIInputModule)
                .GetMethod("AssignDefaultActions", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            if (mi != null) mi.Invoke(m, null);
            else PortLog.Write(Tag + "InputSystemUIInputModule 没有 AssignDefaultActions, 可能指针 action 为空");
            PortLog.Write(Tag + "已切到 InputSystemUIInputModule");
        }

        // 任务栏滑不动的第二种可能: 内容高度算成 0, ScrollRect 认为"不需要滚动"。
        // 先强制重建布局, 高度仍为 0 就按子项高度求和兜底。
        static void FixScroll()
        {
            var rects = UnityEngine.Object.FindObjectsOfType<ScrollRect>(true);
            int fixedN = 0;
            for (int i = 0; i < rects.Length; i++)
            {
                var sr = rects[i];
                if (sr == null || sr.content == null) continue;
                var rt = sr.content;
                LayoutRebuilder.ForceRebuildLayoutImmediate(rt);
                float before = rt.rect.height;
                if (before < 1f && rt.childCount > 0)
                {
                    float sum = 0f;
                    for (int c = 0; c < rt.childCount; c++)
                    {
                        var ch = rt.GetChild(c) as RectTransform;
                        if (ch == null || !ch.gameObject.activeSelf) continue;
                        sum += ch.rect.height > 1f ? ch.rect.height : ch.sizeDelta.y;
                    }
                    if (sum > 1f)
                    {
                        rt.sizeDelta = new Vector2(rt.sizeDelta.x, sum);
                        LayoutRebuilder.ForceRebuildLayoutImmediate(rt);
                        fixedN++;
                    }
                }
            }
            PortLog.Write(Tag + "ScrollRect 检查 " + rects.Length + " 个, 高度兜底修正 " + fixedN + " 个");
        }
    }
}
