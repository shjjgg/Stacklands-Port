using System;
using System.Collections;
using System.Text;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;
using UnityEngine.UI;

namespace StacklandsPort
{
    /// <summary>
    /// 一次性 UI 造影: 进游戏后 10 秒把 Canvas 里所有可见子对象(名字/激活/尺寸/文中前 40 字)写进日志,
    /// 用于定位"屏幕上一大块灰板"和"左上角残留调试文字"到底是哪个对象。
    /// 只在 SampleScene 跑一次, 上限 400 行。
    /// </summary>
    public static class PortUiDump
    {
        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortUiDump]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        internal sealed class Runner : MonoBehaviour
        {
            bool _done;

            void Update()
            {
                if (_done) return;
                if (SceneManager.GetActiveScene().name != "SampleScene") return;
                if (Time.realtimeSinceStartup < 10f) return;
                _done = true;
                try { Dump(); }
                catch (Exception e) { PortLog.Write("[PortUiDump] failed: " + e); }
            }

            void Dump()
            {
                var sb = new StringBuilder();
                sb.AppendLine("---- ui dump start ----");
                int lines = 0;
                var canvases = UnityEngine.Object.FindObjectsOfType<Canvas>(true);
                foreach (var c in canvases)
                {
                    if (lines > 400) break;
                    sb.AppendLine($"canvas {Path(c.transform)} order={c.sortingOrder} mode={c.renderMode}");
                    Walk(c.transform, sb, ref lines);
                }
                // 额外: 把所有带 <sprite 标记的文本单独列出来(说明精灵表没生效)
                sb.AppendLine("---- legacy Text with log-like content ----");
                var legacyTexts = UnityEngine.Object.FindObjectsOfType<Text>(true);
                foreach (var t in legacyTexts)
                {
                    if (t == null || t.text == null) continue;
                    if (t.text.IndexOf("SteamAPI", StringComparison.OrdinalIgnoreCase) < 0 && t.text.IndexOf("Exception", StringComparison.OrdinalIgnoreCase) < 0) continue;
                    sb.AppendLine($"LOGLEGACY active={t.gameObject.activeInHierarchy} path={Path(t.transform)} text={Trim(t.text, 90)}");
                }
                sb.AppendLine("---- texts with unresolved sprite tags ----");
                var texts = UnityEngine.Object.FindObjectsOfType<TMP_Text>(true);
                foreach (var t in texts)
                {
                    if (t == null || t.text == null) continue;
                    if (t.text.IndexOf("<sprite", StringComparison.OrdinalIgnoreCase) < 0) continue;
                    sb.AppendLine($"BROKENTAG active={t.gameObject.activeInHierarchy} path={Path(t.transform)} text={Trim(t.text, 120)}");
                }
                sb.AppendLine("---- world renderers ----");
                var mrs = UnityEngine.Object.FindObjectsOfType<MeshRenderer>(true);
                int mc = 0;
                foreach (var mr in mrs)
                {
                    if (mr == null || mc++ > 120) break;
                    var m = mr.sharedMaterial;
                    sb.AppendLine($"MR act={mr.gameObject.activeInHierarchy} path={Path(mr.transform)} mat={(m == null ? "NULL" : m.name)} shader={(m == null || m.shader == null ? "NULL" : m.shader.name)} bounds={mr.bounds.size.x:F2}x{mr.bounds.size.y:F2} at={mr.bounds.center.x:F1},{mr.bounds.center.y:F1}");
                }
                var srs = UnityEngine.Object.FindObjectsOfType<SpriteRenderer>(true);
                int sc = 0;
                foreach (var sr in srs)
                {
                    if (sr == null || sc++ > 80) break;
                    sb.AppendLine($"SR act={sr.gameObject.activeInHierarchy} path={Path(sr.transform)} sprite={(sr.sprite == null ? "NULL" : sr.sprite.name)} mat={(sr.sharedMaterial == null ? "NULL" : sr.sharedMaterial.name)} col={sr.color.r:F2},{sr.color.g:F2},{sr.color.b:F2},{sr.color.a:F2} ls={sr.transform.localScale.x:F2},{sr.transform.localScale.y:F2} rot={sr.transform.localEulerAngles.z:F0}");
                }
                sb.AppendLine("---- ui dump end ----");
                PortLog.Write(sb.ToString());
            }

            static void Walk(Transform t, StringBuilder sb, ref int lines)
            {
                int depth = 0;
                var p = t;
                while (p.parent != null && depth < 30) { depth++; p = p.parent; }
                var rt = t as RectTransform;
                string rect = rt != null ? $"sz={rt.sizeDelta.x:F0}x{rt.sizeDelta.y:F0} pos={rt.anchoredPosition.x:F0},{rt.anchoredPosition.y:F0}" : "";
                string txt = "";
                var tmp = t.GetComponent<TMP_Text>();
                if (tmp != null && !string.IsNullOrEmpty(tmp.text)) txt = " text=" + Trim(tmp.text, 40);
                if (tmp == null)
                {
                    var legacy = t.GetComponent<Text>();
                    if (legacy != null && !string.IsNullOrEmpty(legacy.text)) txt = " ltext=" + Trim(legacy.text, 60);
                }
                var img = t.GetComponent<Image>();
                if (img != null) txt += $" img={(img.sprite == null ? "NULL" : img.sprite.name)} col={img.color.r:F2},{img.color.g:F2},{img.color.b:F2},{img.color.a:F2} mat={(img.material == null || img.material.shader == null ? "NULL" : img.material.shader.name)}";
                var sr = t.GetComponent<SpriteRenderer>();
                if (sr != null) txt += $" sr={(sr.sprite == null ? "NULL" : sr.sprite.name)} col={sr.color.r:F2},{sr.color.g:F2},{sr.color.b:F2},{sr.color.a:F2}";
                if (lines++ < 400)
                    sb.AppendLine($"{new string(' ', Mathf.Min(depth, 12))}{t.name} act={t.gameObject.activeSelf} {rect}{txt}");
                if (depth > 1 && t.childCount > 40) return;
                for (int i = 0; i < t.childCount; i++) Walk(t.GetChild(i), sb, ref lines);
            }

            static string Path(Transform t)
            {
                var sb = new StringBuilder(t.name);
                var p = t.parent;
                int guard = 0;
                while (p != null && guard++ < 20) { sb.Insert(0, p.name + "/"); p = p.parent; }
                return sb.ToString();
            }

            static string Trim(string s, int n)
            {
                if (s == null) return "";
                s = s.Replace("\n", "\\n");
                return s.Length <= n ? s : s.Substring(0, n) + "…";
            }
        }
    }
}
