// PortRenderAudit.cs — 一次性渲染取证 (只读日志, 不改任何渲染状态)
//
// 目的: 用户反馈"没有原版味道/渲染问题", 但离线无法判断到底哪一层没生效。
// 这里在首个游戏画面出现后, 把"实际在用的 shader/材质/后处理/相机参数/卡牌 sprite"
// 全部打到 PortLog, 用事实定位, 而不是继续凭截图猜。
#if !UNITY_EDITOR
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEngine;

namespace StacklandsPort
{
    public static class PortRenderAudit
    {
        const string Tag = "[RenderAudit] ";
        static bool _done;

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            var go = new GameObject("[PortRenderAudit]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        internal sealed class Runner : MonoBehaviour
        {
            IEnumerator Start()
            {
                // 等主菜单/游戏画面稳定
                yield return new WaitForSeconds(6f);
                if (_done) yield break;
                _done = true;
                try { Dump(); } catch (Exception e) { PortLog.Write(Tag + "dump 异常: " + e); }
            }
        }

        static void Dump()
        {
            var cam = Camera.main;
            if (cam == null) { PortLog.Write(Tag + "没有 MainCamera"); return; }

            PortLog.Write(Tag + "camera clear=" + cam.clearFlags + " bg=" + cam.backgroundColor +
                          " ortho=" + cam.orthographic + " size=" + cam.orthographicSize +
                          " hdr=" + cam.allowHDR + " msaa=" + cam.allowMSAA +
                          " cullingMask=" + cam.cullingMask + " depth=" + cam.depth);

            // 后处理层
            var layer = cam.GetComponent("PostProcessLayer");
            if (layer == null)
            {
                PortLog.Write(Tag + "相机上没有 PostProcessLayer");
            }
            else
            {
                var t = layer.GetType();
                var res = t.GetField("m_Resources", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
                var resVal = res != null ? res.GetValue(layer) : null;
                PortLog.Write(Tag + "PostProcessLayer enabled=" + ((Behaviour)layer).enabled +
                              " resources=" + (resVal == null ? "null" : resVal.GetType().Name));
            }

            // 全局 volume profile 里实际启用的效果
            foreach (var mb in UnityEngine.Object.FindObjectsOfType<MonoBehaviour>())
            {
                if (mb == null || mb.GetType().Name != "PostProcessVolume") continue;
                var t = mb.GetType();
                var profField = t.GetField("sharedProfile", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                var profile = profField != null ? profField.GetValue(mb) : null;
                var isGlobal = t.GetField("isGlobal", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                var weight = t.GetField("weight", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                PortLog.Write(Tag + "volume " + mb.name + " global=" + (isGlobal != null ? isGlobal.GetValue(mb) : "?") +
                              " weight=" + (weight != null ? weight.GetValue(mb) : "?") +
                              " profile=" + (profile == null ? "null" : profile.name));
                if (profile == null) continue;
                var settingsField = profile.GetType().GetField("settings", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                var settings = settingsField != null ? settingsField.GetValue(profile) as IList : null;
                if (settings == null) { PortLog.Write(Tag + "  profile 读不到 settings"); continue; }
                var names = new List<string>();
                foreach (var s in settings)
                {
                    if (s == null) continue;
                    var enabled = s.GetType().GetField("enabled", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                    var on = enabled != null ? enabled.GetValue(s) : null;
                    names.Add(s.GetType().Name + "=" + (on != null && (bool)on ? "on" : "off"));
                }
                PortLog.Write(Tag + "  effects: " + string.Join(", ", names));
            }

            // 场景里实际使用的 shader 统计 (只看前 4000 个渲染器, 卡牌场景也就这个量级)
            var shaderCount = new Dictionary<string, int>();
            var renderers = UnityEngine.Object.FindObjectsOfType<Renderer>();
            int taken = 0;
            foreach (var r in renderers)
            {
                if (r == null) continue;
                var mats = r.sharedMaterials;
                for (int i = 0; i < mats.Length; i++)
                {
                    var m = mats[i];
                    string key = m == null || m.shader == null ? "(null)" : m.shader.name;
                    shaderCount[key] = shaderCount.TryGetValue(key, out var c) ? c + 1 : 1;
                }
                if (++taken >= 4000) break;
            }
            var top = shaderCount.OrderByDescending(kv => kv.Value).Take(12)
                .Select(kv => kv.Key + " x" + kv.Value);
            PortLog.Write(Tag + "renderers=" + renderers.Length + " shaders top: " + string.Join(" | ", top));

            // 卡牌 sprite 抽样: 看插画是否被翻转/缩放为负
            var cardSprites = new List<string>();
            foreach (var sr in UnityEngine.Object.FindObjectsOfType<SpriteRenderer>())
            {
                if (sr == null || sr.sprite == null) continue;
                var tr = sr.transform;
                cardSprites.Add($"{sr.name}: sprite={sr.sprite.name} tex={sr.sprite.texture?.name} rect={sr.sprite.rect} " +
                                $"flipXY={sr.flipX}/{sr.flipY} scale={tr.lossyScale} rot={tr.eulerAngles.z:0.0}");
                if (cardSprites.Count >= 8) break;
            }
            PortLog.Write(Tag + "sprite sample: " + string.Join(" || ", cardSprites));

            // 失败兜底: 是否有材质用了找不到的 shader
            foreach (var m in Resources.FindObjectsOfTypeAll<Material>())
            {
                if (m == null || m.shader == null) { PortLog.Write(Tag + "材质 shader=null: " + m?.name); continue; }
                if (!m.shader.isSupported) PortLog.Write(Tag + "shader 不被支持: " + m.shader.name + " (mat=" + m.name + ")");
            }
        }
    }
}
#endif
