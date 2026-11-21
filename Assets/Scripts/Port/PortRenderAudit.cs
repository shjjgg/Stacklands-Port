// PortRenderAudit.cs — 渲染取证 (只读日志, 不改任何渲染状态)
//
// 目的: 用户反馈"没有原版味道/渲染问题", 但离线无法判断到底哪一层没生效。
// 这里把"实际在用的 shader/材质/后处理/相机参数/卡牌 sprite"打到 PortLog。
// v0.30: 1) 修 BoolParameter→bool 的强转异常; 2) 每段独立 try/catch, 一段失败不影响其余;
//        3) 分别在 6s(主菜单)和 25s(开局棋盘)各dump一次, 便于对比。
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
                yield return new WaitForSeconds(6f);
                Section("menu");
                yield return new WaitForSeconds(19f);
                Section("in-game");
            }
        }

        static void Section(string label)
        {
            try { PortLog.Write(Tag + "==== dump " + label + " ===="); } catch { }
            Safe("camera", DumpCamera);
            Safe("postfx", DumpPost);
            Safe("shaders", DumpShaders);
            Safe("sprites", DumpSprites);
            Safe("bad-materials", DumpBadMaterials);
        }

        static void Safe(string name, Action a)
        {
            try { a(); }
            catch (Exception e) { PortLog.Write(Tag + name + " 异常: " + e.GetType().Name + " " + e.Message); }
        }

        static void DumpCamera()
        {
            var cam = Camera.main;
            if (cam == null) { PortLog.Write(Tag + "没有 MainCamera"); return; }
            PortLog.Write(Tag + "camera clear=" + cam.clearFlags + " bg=" + cam.backgroundColor +
                          " ortho=" + cam.orthographic + " size=" + cam.orthographicSize +
                          " hdr=" + cam.allowHDR + " msaa=" + cam.allowMSAA +
                          " cullingMask=" + cam.cullingMask + " depth=" + cam.depth);
        }

        static void DumpPost()
        {
            var cam = Camera.main;
            if (cam == null) return;
            var layer = cam.GetComponent("PostProcessLayer");
            if (layer == null) { PortLog.Write(Tag + "相机上没有 PostProcessLayer"); }
            else
            {
                var t = layer.GetType();
                var res = t.GetField("m_Resources", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
                var resVal = res != null ? res.GetValue(layer) : null;
                PortLog.Write(Tag + "PostProcessLayer enabled=" + ((Behaviour)layer).enabled +
                              " resources=" + (resVal == null ? "null" : resVal.GetType().Name));
            }

            foreach (var mb in UnityEngine.Object.FindObjectsOfType<MonoBehaviour>())
            {
                if (mb == null || mb.GetType().Name != "PostProcessVolume") continue;
                var t = mb.GetType();
                var profField = t.GetField("sharedProfile", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                var profile = profField != null ? profField.GetValue(mb) : null;
                var isGlobal = t.GetField("isGlobal", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                var weight = t.GetField("weight", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                string profName = profile == null ? "null"
                    : (profile is UnityEngine.Object ? ((UnityEngine.Object)profile).name : profile.ToString());
                PortLog.Write(Tag + "volume " + mb.name + " global=" + (isGlobal != null ? isGlobal.GetValue(mb) : "?") +
                              " weight=" + (weight != null ? weight.GetValue(mb) : "?") + " profile=" + profName);
                if (profile == null) continue;
                var settingsField = profile.GetType().GetField("settings", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                var settings = settingsField != null ? settingsField.GetValue(profile) as IList : null;
                if (settings == null) { PortLog.Write(Tag + "  profile 读不到 settings"); continue; }
                var names = new List<string>();
                foreach (var s in settings)
                {
                    if (s == null) continue;
                    names.Add(s.GetType().Name + "=" + (ReadEnabled(s) ? "on" : "off"));
                }
                PortLog.Write(Tag + "  effects: " + string.Join(", ", names));
            }
        }

        /// <summary>PostProcessing 的参数是 ParameterOverride/BoolParameter 这类结构, enabled 不是裸 bool。</summary>
        static bool ReadEnabled(object setting)
        {
            var f = setting.GetType().GetField("enabled", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            if (f == null) return false;
            var v = f.GetValue(setting);
            if (v is bool b) return b;
            if (v == null) return false;
            var inner = v.GetType().GetField("value", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic)
                     ?? v.GetType().GetField("m_Value", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            if (inner != null)
            {
                var iv = inner.GetValue(v);
                if (iv is bool ib) return ib;
            }
            return false;
        }

        static void DumpShaders()
        {
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
            var top = shaderCount.OrderByDescending(kv => kv.Value).Take(14).Select(kv => kv.Key + " x" + kv.Value);
            PortLog.Write(Tag + "renderers=" + renderers.Length + " shaders top: " + string.Join(" | ", top));

            // 卡牌精灵所在渲染器用的材质, 逐个列出前 6 个
            int listed = 0;
            foreach (var sr in UnityEngine.Object.FindObjectsOfType<SpriteRenderer>())
            {
                if (sr == null) continue;
                var mat = sr.sharedMaterial;
                PortLog.Write(Tag + "sr " + sr.name + " mat=" + (mat == null ? "null" : mat.name) +
                              " shader=" + (mat == null || mat.shader == null ? "null" : mat.shader.name));
                if (++listed >= 6) break;
            }
        }

        static void DumpSprites()
        {
            var sample = new List<string>();
            foreach (var sr in UnityEngine.Object.FindObjectsOfType<SpriteRenderer>())
            {
                if (sr == null || sr.sprite == null) continue;
                var tr = sr.transform;
                sample.Add($"{sr.name}: sprite={sr.sprite.name} tex={sr.sprite.texture?.name} rect={sr.sprite.rect} " +
                           $"pivot={sr.sprite.pivot} flipXY={sr.flipX}/{sr.flipY} scale={tr.lossyScale} rot={tr.eulerAngles.z:0.0}");
                if (sample.Count >= 10) break;
            }
            PortLog.Write(Tag + "sprite sample: " + string.Join(" || ", sample));
        }

        static void DumpBadMaterials()
        {
            int bad = 0;
            foreach (var m in Resources.FindObjectsOfTypeAll<Material>())
            {
                if (m == null) continue;
                if (m.shader == null) { PortLog.Write(Tag + "材质 shader=null: " + m.name); bad++; }
                else if (!m.shader.isSupported) { PortLog.Write(Tag + "shader 不被支持: " + m.shader.name + " (mat=" + m.name + ")"); bad++; }
                if (bad >= 30) break;
            }
            PortLog.Write(Tag + "bad materials=" + bad);
        }
    }
}
