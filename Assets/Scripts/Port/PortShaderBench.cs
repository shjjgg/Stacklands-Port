using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

namespace StacklandsPort
{
    /// <summary>
    /// 着色器靶场: 把每个移植过的 shader 离屏渲染成 PNG, 一一对比。
    /// 做法: 每种 shader 用一个 1x1 的 quad(uv0..1, 法线朝相机, 顶点色白), 若场景里已经有同 shader 的
    /// 材质就把它的属性抄过来(纹理/调色板/矩形参数都跟真实一致), 然后离屏相机渲染到 RenderTexture,
    /// ReadPixels 存 PNG 到 persistentDataPath/bench/, 并把每张的平均色/对比度/颜色种类写进日志。
    ///
    /// 为什么这样做: shader 的"效果对不对"没法靠截图整体观感判断, 但把每种 shader 单独铺在一个
    /// 已知 uv 的 quad 上, 同一输入下就能和原版算式/参考图逐张比; 而且 PNG 可以留作回归基线。
    /// 触发: HUD 上的 [靶场] 按钮, 或在 files 目录放一个空文件 bench_on 后进游戏。
    /// </summary>
    public static class PortShaderBench
    {
        public const string Tag = "[Bench] ";

        // 移植清单: 每个都要出图
        static readonly string[] Names =
        {
            "Custom/CardShaderTest",
            "Custom/CardBackShader",
            "Custom/FloorShader",
            "Custom/FloorShaderForest",
            "Custom/FloorShaderIsland",
            "Custom/GridShader",
            "Custom/BoosterShader",
            "Custom/BoosterShaderTop",
            "Custom/GenericCardShader",
            "Shapes/Rect Opaque",
            "Sprites/BackgroundShader",
            "Sprites/SpriteOnTop",
            "Sprites/StatusEffectSpriteShader",
            "Sprites/CombatCircleSpriteShader2",
            "Custom/ArrowSdfShader",
            "Custom/ConflictOutlineSdfShader",
            "Standard",
            // v0.55: 补齐全部 33 支(原来只覆盖 17 支), 让"一一测试"闭合
            "Custom/ConveyorArrowShader",
            "Custom/EnergyCableShader",
            "Custom/SewerPipeShader",
            "Custom/TransportArrowShader",
            "Custom/TransportArrowMainlandShader",
            "Custom/StatusBar",
            "Custom/SpiritImageEffect",
            "Custom/SpiritTransitionEffect",
            "Custom/SuperSampled Texture",
            "Postprocess/SokpopIntro",
            "Transition/Cities",
            "Transition/Default",
            "Transition/Energy",
            "Transition/Spirit",
            "Unlit/CardopediaBackgroundShader",
            "Shapes/Rect Transparent",
            "UI/Default Port",
        };

        public static bool Running { get; private set; }

        public static void Run()
        {
            if (Running) return;
            try { RunInner(); }
            catch (Exception e) { PortLog.Write(Tag + "失败: " + e.GetType().Name + " " + e.Message); }
            finally { Running = false; }
        }

        static GameObject _root;

        static void RunInner()
        {
            Running = true;
            if (_root != null) UnityEngine.Object.Destroy(_root);

            const int cols = 5;
            int rows = (Names.Length + cols - 1) / cols;
            int cell = 256;

            var rt = new RenderTexture(cols * cell, rows * cell, 24, RenderTextureFormat.ARGB32, RenderTextureReadWrite.sRGB);
            rt.Create();

            _root = new GameObject("[ShaderBench]");
            UnityEngine.Object.DontDestroyOnLoad(_root);
            _root.layer = 30;

            // 场景里同 shader 的材质当属性来源(保证纹理/调色板和真实一致)
            var source = new Dictionary<string, Material>();
            foreach (var r in UnityEngine.Object.FindObjectsOfType<Renderer>())
            {
                if (r == null || r.sharedMaterial == null || r.sharedMaterial.shader == null) continue;
                string sn = r.sharedMaterial.shader.name;
                if (!source.ContainsKey(sn)) source[sn] = r.sharedMaterial;
            }

            var mesh = BuildQuad();
            var mats = new List<Material>();
            for (int k = 0; k < Names.Length; k++)
            {
                var sh = Shader.Find(Names[k]);
                Material m;
                if (sh == null)
                {
                    PortLog.Write(Tag + Names[k] + " -> MISSING(被裁剪/未导入)");
                    m = null;
                }
                else if (source.ContainsKey(Names[k]))
                {
                    m = new Material(source[Names[k]]);        // 抄真实材质
                    PortLog.Write(Tag + Names[k] + " -> 用场景材质 " + source[Names[k]].name);
                }
                else
                {
                    m = new Material(sh);
                    PortLog.Write(Tag + Names[k] + " -> 用默认属性(场景内无同 shader 材质)");
                }

                if (m == null) { mats.Add(null); continue; }
                mats.Add(m);

                var go = new GameObject("q_" + Names[k]);
                go.transform.SetParent(_root.transform, false);
                int ix = k % cols, iy = k / cols;
                go.transform.localPosition = new Vector3(ix + 0.5f, -(iy + 0.5f), 0f);
                go.transform.localScale = Vector3.one * 0.92f;
                go.layer = 30;
                var mf = go.AddComponent<MeshFilter>();
                mf.sharedMesh = mesh;
                var mr = go.AddComponent<MeshRenderer>();
                mr.sharedMaterial = m;
                mr.shadowCastingMode = UnityEngine.Rendering.ShadowCastingMode.Off;
                mr.receiveShadows = false;
            }

            var camGo = new GameObject("benchCam");
            camGo.transform.SetParent(_root.transform, false);
            camGo.transform.localPosition = new Vector3(cols * 0.5f, -rows * 0.5f, -6f);
            var cam = camGo.AddComponent<Camera>();
            cam.orthographic = true;
            cam.orthographicSize = rows * 0.5f;
            cam.aspect = (float)(cols * cell) / (rows * cell);
            cam.clearFlags = CameraClearFlags.SolidColor;
            cam.backgroundColor = new Color(0.5f, 0.5f, 0.5f, 1f);
            cam.cullingMask = 1 << 30;
            cam.nearClipPlane = 0.1f;
            cam.farClipPlane = 20f;
            cam.allowHDR = false;
            cam.targetTexture = rt;

            var lightGo = new GameObject("benchLight");
            lightGo.transform.SetParent(_root.transform, false);
            lightGo.transform.rotation = Quaternion.Euler(30f, 20f, 0f);
            var li = lightGo.AddComponent<Light>();
            li.type = LightType.Directional;
            li.intensity = 1f;
            li.color = Color.white;
            RenderSettings.ambientMode = UnityEngine.Rendering.AmbientMode.Flat;
            RenderSettings.ambientLight = new Color(0.45f, 0.45f, 0.45f, 1f);

            cam.Render();

            Texture2D shot = null;
            try
            {
                RenderTexture.active = rt;
                shot = new Texture2D(rt.width, rt.height, TextureFormat.RGBA32, false, false);
                shot.ReadPixels(new Rect(0, 0, rt.width, rt.height), 0, 0);
                shot.Apply();
            }
            catch (Exception e) { PortLog.Write(Tag + "ReadPixels 失败: " + e.Message); }

            if (shot != null)
            {
                string dir = Path.Combine(Application.persistentDataPath, "bench");
                try { Directory.CreateDirectory(dir); } catch { }
                Save(Path.Combine(dir, "bench_sheet.png"), shot);

                // v0.59: 参数探针 —— 用"注入哨兵值看画面变不变"的方式, 把每支 shader 的
                // 材质属性逐个验证: 变 = 这个属性是活的输入; 不变 = 死属性或未接。
                // 这是"槽位无名"问题的实证解法, 不再靠猜 _m6/_m8/_m12 是谁。
                try
                {
                    if (File.Exists(Path.Combine(Application.persistentDataPath, "files/probe_on")))
                        ProbeAll(dir, mats, mesh, cols, cell, rows);
                }
                catch (Exception e) { PortLog.Write(Tag + "探针失败: " + e.Message); }


                for (int k = 0; k < Names.Length; k++)
                {
                    int ix = k % cols, iy = k / cols;
                    int px = ix * cell, py = (rows - 1 - iy) * cell;   // ReadPixels 原点在左下
                    var crop = new Texture2D(cell, cell, TextureFormat.RGBA32, false, false);
                    crop.SetPixels(shot.GetPixels(px, py, cell, cell));
                    crop.Apply();
                    string safe = Names[k].Replace('/', '_') + ".png";
                    Save(Path.Combine(dir, safe), crop);

                    float mean = 0f, mn = 999f, mx = -1f;
                    var px2 = crop.GetPixels32();
                    int distinct = 0;
                    var seen = new HashSet<int>();
                    for (int p = 0; p < px2.Length; p++)
                    {
                        float l = (px2[p].r + px2[p].g + px2[p].b) / 3f;
                        mean += l;
                        if (l < mn) mn = l;
                        if (l > mx) mx = l;
                        if (seen.Count < 4096)
                        {
                            int key = (px2[p].r >> 4) << 8 | (px2[p].g >> 4) << 4 | (px2[p].b >> 4);
                            if (seen.Add(key)) distinct++;
                        }
                    }
                    mean /= px2.Length;
                    string verdict = (mx - mn) < 2 ? "FLAT(几乎无图案)" : (distinct < 3 ? "LOWVAR" : "ok");
                    PortLog.Write(Tag + "[" + k + "] " + Names[k] + " mean=" + mean.ToString("F1") +
                                  " min=" + mn.ToString("F0") + " max=" + mx.ToString("F0") +
                                  " colors=" + distinct + " " + verdict);
                }
                PortLog.Write(Tag + "输出目录: " + dir);
            }

            cam.targetTexture = null;
            RenderTexture.active = null;
            rt.Release();
        }

        static void Save(string path, Texture2D tex)
        {
            byte[] png;
            try { png = tex.EncodeToPNG(); }
            catch (Exception e) { PortLog.Write(Tag + "EncodeToPNG 失败: " + e.Message); return; }
            File.WriteAllBytes(path, png);
        }

        // 逐属性注入哨兵: Color/Vector -> (1,0,1,1), Float -> 3.0, 记录目标格 mean 变化
        static void ProbeAll(string dir, List<Material> mats, Mesh mesh, int cols, int cell, int rows)
        {
            var rt = new RenderTexture(cell, cell, 0, RenderTextureFormat.ARGB32, RenderTextureReadWrite.sRGB);
            rt.Create();
            var tex = new Texture2D(cell, cell, TextureFormat.RGBA32, false, false);
            var cam = new GameObject("probeCam").AddComponent<Camera>();
            cam.orthographic = true;
            cam.orthographicSize = 0.5f;
            cam.aspect = 1f;
            cam.cullingMask = 1 << 30;
            cam.clearFlags = CameraClearFlags.SolidColor;
            cam.backgroundColor = new Color(0.5f, 0.5f, 0.5f, 1f);
            cam.targetTexture = rt;
            cam.transform.position = new Vector3(0, 0, -6f);

            var sb = new System.Text.StringBuilder();
            sb.AppendLine("shader,property,kind,default,sentinel,mean_before,mean_after,delta,live");
            int total = 0, live = 0;

            for (int k = 0; k < mats.Count; k++)
            {
                var m = mats[k];
                if (m == null) continue;
                if (_root == null || k >= _root.transform.childCount) continue;
                var go = _root.transform.GetChild(k).gameObject;
                int ix = k % cols, iy = k / cols;
                cam.transform.position = new Vector3(ix + 0.5f, -(iy + 0.5f), -6f);

                float before = MeanOf(cam, rt, tex);

                var fnames = new List<string>(m.GetPropertyNames(MaterialPropertyType.Float));
                var vnames = new List<string>(m.GetPropertyNames(MaterialPropertyType.Vector));
                foreach (var pn in fnames)
                {
                    if (pn.EndsWith("_ST")) continue;
                    float old = m.GetFloat(pn);
                    m.SetFloat(pn, 3f);
                    float after = MeanOf(cam, rt, tex);
                    m.SetFloat(pn, old);
                    bool lv = Mathf.Abs(after - before) > 1.5f;
                    total++; if (lv) live++;
                    sb.AppendLine(Names[k] + "," + pn + ",float," + old.ToString("F3") + ",3.0," +
                                  before.ToString("F1") + "," + after.ToString("F1") + "," +
                                  (after - before).ToString("F1") + "," + (lv ? 1 : 0));
                }
                foreach (var pn in vnames)
                {
                    if (pn.EndsWith("_ST")) continue;
                    Vector4 old = m.GetVector(pn);
                    m.SetVector(pn, new Vector4(1f, 0f, 1f, 1f));
                    float after = MeanOf(cam, rt, tex);
                    m.SetVector(pn, old);
                    bool lv = Mathf.Abs(after - before) > 1.5f;
                    total++; if (lv) live++;
                    sb.AppendLine(Names[k] + "," + pn + ",vector,(" + old.x.ToString("F2") + " " + old.y.ToString("F2") +
                                  " " + old.z.ToString("F2") + " " + old.w.ToString("F2") + "),magenta," +
                                  before.ToString("F1") + "," + after.ToString("F1") + "," +
                                  (after - before).ToString("F1") + "," + (lv ? 1 : 0));
                }
                PortLog.Write(Tag + "[Probe] " + Names[k] + " 属性扫描完成");
            }

            try { File.WriteAllText(Path.Combine(dir, "probe.csv"), sb.ToString()); } catch { }
            PortLog.Write(Tag + "[Probe] 汇总 属性=" + total + " 有效=" + live + " -> " + Path.Combine(dir, "probe.csv"));

            UnityEngine.Object.Destroy(cam.gameObject);
            rt.Release();
        }

        static float MeanOf(Camera cam, RenderTexture rt, Texture2D tex)
        {
            cam.Render();
            RenderTexture.active = rt;
            tex.ReadPixels(new Rect(0, 0, rt.width, rt.height), 0, 0, false);
            tex.Apply(false, false);
            var px = tex.GetPixels32();
            float s = 0f;
            for (int i = 0; i < px.Length; i++) s += (px[i].r + px[i].g + px[i].b) / 3f;
            return s / Mathf.Max(1, px.Length) / 255f * 100f;
        }

        static Mesh BuildQuad()
        {
            var m = new Mesh();
            m.vertices = new[]
            {
                new Vector3(-0.5f, -0.5f, 0f),
                new Vector3( 0.5f, -0.5f, 0f),
                new Vector3( 0.5f,  0.5f, 0f),
                new Vector3(-0.5f,  0.5f, 0f),
            };
            m.uv = new[] { new Vector2(0, 0), new Vector2(1, 0), new Vector2(1, 1), new Vector2(0, 1) };
            m.normals = new[] { new Vector3(0, 0, -1), new Vector3(0, 0, -1), new Vector3(0, 0, -1), new Vector3(0, 0, -1) };
            m.colors = new[] { Color.white, Color.white, Color.white, Color.white };
            m.triangles = new[] { 0, 1, 2, 0, 2, 3, 0, 2, 1, 0, 3, 2 };   // 双面, 免去 cull 差异
            m.RecalculateBounds();
            return m;
        }
    }
}
