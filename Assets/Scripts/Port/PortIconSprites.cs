using System;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.TextCore;

namespace StacklandsPort
{
    /// <summary>
    /// 原版 TMP 精灵表在本工程导出时丢了(Resources/sprite assets/EmojiOne 被换成了 Unity 自带的 Smiley),
    /// 于是所有 &lt;sprite="goldicon" ...&gt; 标签原样输出成文字。这里在运行时用一个 1024x1024 图集
    /// 把 19 个原版图标重新打包成 TMP_SpriteAsset, 再逐个挂到场景里所有 TMP_Text 上。
    /// </summary>
    public static class PortIconSprites
    {
        static TMP_SpriteAsset _asset;
        static FieldInfo _nameLookup;
        static FieldInfo _hashField;

        internal sealed class Runner : MonoBehaviour
        {
            float _t;
            int _idle;      // 连续多少次"无事可做"
            int _hands;     // 已实际改动过的文本累计

            // v0.64: 之前是每 1 秒对全场景 TMP 文本做 ForceMeshUpdate、连跑 300 秒 ——
            // 这本身就是主线程峰值(动画卡顿的嫌疑源之一)。改成: 只在确有未挂图集的文本时才动,
            // 连续 30 次无事可做就自己退场。
            void Update()
            {
                _t += Time.unscaledDeltaTime;
                if (_t < 1.5f) return;
                _t = 0f;
                if (_asset == null) return;

                int done = ApplyToAll(_asset);
                if (done <= 0) { if (++_idle >= 30) Destroy(gameObject); }
                else { _idle = 0; _hands += done; }
            }
        }

        static readonly string[] Names =
        {
            "goldicon", "cardicon", "dollaricon", "energyicon", "foodicon", "healthicon",
            "happinessicon", "housingicon", "workericon", "calamityicon", "checkmarkicon",
            "circleicon", "hvicon", "lvicon", "pollutionicon", "sewericon", "shellicon",
            "transporticon", "directionicon"
        };

        [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterSceneLoad)]
        static void Boot()
        {
            // v0.53: 原来的注释说"改用构建期资产", 但工程里根本没有那份资产 ——
            // Resources/Sprite Assets 下只有 Unity 自带的 Default Sprite Asset,
            // 而 Canvas.prefab 里 178 个 TMP 文本的 m_spriteAsset 全是 fileID: 0。
            // 结果所有 <sprite="goldicon"> 都成了黑方块(右上角计数/价格)。这里恢复运行期打图集。
            Build();
        }

        // v0.66: 换路线 —— 不再运行时用 Graphics.Blit + ReadPixels 自己打图集。
        // 理由: 构建期已经生成了 Resources/Sprite Assets/<icon 名>.asset, 而 TMP 解析
        // <sprite="goldicon"> 时就是按这个名字 Resources.Load, 这条路径是原版机制。
        // 我们在运行期把每个文本的 spriteAsset 换成自己 Blit 出来的图集, 只会在 Vulkan 上
        // 回读为空 -> 黑方块。所以先停用, 只做取证。
        public static bool RuntimeAtlas = false;

        static void Build()
        {
            if (!RuntimeAtlas) { UseBuiltAssets(); return; }
            var ordered = new List<Sprite>();
            var all = Resources.LoadAll<Sprite>("Icons");
            if (all == null || all.Length == 0)
            {
                PortLog.Write("[PortIcons] Resources/Icons 为空, 跳过");
                return;
            }
            for (int i = 0; i < Names.Length; i++)
            {
                Sprite found = null;
                for (int j = 0; j < all.Length; j++)
                {
                    if (all[j] != null && all[j].name == Names[i]) { found = all[j]; break; }
                }
                if (found == null) PortLog.Write("[PortIcons] 缺图标: " + Names[i]);
                ordered.Add(found);
            }

            int cell = 0;
            for (int i = 0; i < ordered.Count; i++)
            {
                if (ordered[i] == null) continue;
                cell = Mathf.Max(cell, Mathf.CeilToInt(Mathf.Max(ordered[i].rect.width, ordered[i].rect.height)));
            }
            cell = Mathf.Clamp(cell + 8, 32, 256);
            int cols = 5;
            int rows = Mathf.CeilToInt(ordered.Count / (float)cols);
            int w = Mathf.NextPowerOfTwo(cols * cell);
            int h = Mathf.NextPowerOfTwo(rows * cell);

            var atlas = new Texture2D(w, h, TextureFormat.RGBA32, false);
            var clear = new Color32(0, 0, 0, 0);
            var empty = new Color32[w * h];
            for (int i = 0; i < empty.Length; i++) empty[i] = clear;
            atlas.SetPixels32(empty);

            _hashField = typeof(TMP_SpriteCharacter).GetField("m_HashCode", BindingFlags.Instance | BindingFlags.NonPublic);
            var chars = new List<TMP_SpriteCharacter>();
            var glyphs = new List<TMP_SpriteGlyph>();

            for (int i = 0; i < ordered.Count; i++)
            {
                var sp = ordered[i];
                if (sp == null) continue;
                int cw = Mathf.CeilToInt(sp.rect.width);
                int chh = Mathf.CeilToInt(sp.rect.height);
                if (cw <= 0 || chh <= 0) continue;

                int cx = (i % cols) * cell;
                int cy = (i / cols) * cell;
                // 保持宽高比, 在图集格子里居中
                int pw = cw, ph = chh;
                if (pw > cell - 8 || ph > cell - 8)
                {
                    float k = Mathf.Min((cell - 8) / (float)pw, (cell - 8) / (float)ph);
                    pw = Mathf.Max(1, Mathf.RoundToInt(pw * k));
                    ph = Mathf.Max(1, Mathf.RoundToInt(ph * k));
                }
                int px = cx + (cell - pw) / 2;
                int py = cy + (cell - ph) / 2;

                if (!BlitTo(atlas, sp, px, py, pw, ph))
                {
                    PortLog.Write("[PortIcons] 拷贝失败: " + sp.name);
                    continue;
                }

                var metrics = new GlyphMetrics(pw, ph, 0f, ph, pw);
                var rect = new GlyphRect(px, py, pw, ph);
                var glyph = new TMP_SpriteGlyph((uint)i, metrics, rect, 1f, 0, sp);
                // v0.58: 之前 19 个字符的 unicode 全是 0, TMP 内部的 unicode→字符 映射全撞在一起,
                // 名字查得到、渲染出来却还是方块。改用私用区 E000+i, 与原版 SpriteAsset 一致。
                var ch = new TMP_SpriteCharacter((uint)(0xE000 + i), glyph);
                ch.name = sp.name;
                // TMP 解析 <sprite name="..."> 用的是字符表里的 hashCode, 只设 name 不够
                if (_hashField != null)
                    _hashField.SetValue(ch, TMP_TextUtilities.GetSimpleHashCode(sp.name));
                glyphs.Add(glyph);
                chars.Add(ch);
            }

            atlas.Apply(false, false);

            var baseAsset = Resources.Load<TMP_SpriteAsset>("sprite assets/Default Sprite Asset");
            Material mat;
            if (baseAsset != null && baseAsset.material != null)
            {
                mat = new Material(baseAsset.material);
            }
            else
            {
                var sh = Shader.Find("TextMeshPro/Sprite");
                mat = new Material(sh != null ? sh : Shader.Find("UI/Default"));
            }
            if (mat.shader == null || mat.shader.name == "Hidden/InternalErrorShader")
            {
                var ui = Shader.Find("UI/Default");
                if (ui != null) mat = new Material(ui);
            }
            mat.SetTexture("_MainTex", atlas);
            PortLog.Write("[PortIcons] 材质着色器=" + (mat.shader != null ? mat.shader.name : "null"));

            var asset = ScriptableObject.CreateInstance<TMP_SpriteAsset>();
            asset.name = "Stacklands Icons";
            asset.material = mat;

            // TMP 的 spriteCharacterTable/spriteGlyphTable/version 都是 internal, 只能反射写
            var ty = typeof(TMP_SpriteAsset);
            var ctf = ty.GetField("m_SpriteCharacterTable", BindingFlags.Instance | BindingFlags.NonPublic);
            var gtf = ty.GetField("m_SpriteGlyphTable", BindingFlags.Instance | BindingFlags.NonPublic);
            var vf = ty.GetField("m_Version", BindingFlags.Instance | BindingFlags.NonPublic);
            if (ctf == null || gtf == null)
            {
                PortLog.Write("[PortIcons] 反射拿不到字形表字段, 放弃");
                return;
            }
            ctf.SetValue(asset, chars);
            gtf.SetValue(asset, glyphs);
            if (vf != null) vf.SetValue(asset, "1.1.0");
            asset.UpdateLookupTables();

            _asset = asset;

            // v0.64: 关键 —— 诊断显示启动时 texts=0, 也就是 HUD 文本是在我们之后创建的。
            // 新创建的 TMP_Text 只有在 TMP_Settings 的默认 SpriteAsset 上有这份图集时才会解析 <sprite>,
            // 否则永远是方块。把它设成默认, 后建的所有文本就自带。
            try
            {
                var f = typeof(TMPro.TMP_Settings).GetField("s_defaultSpriteAsset",
                    BindingFlags.Static | BindingFlags.NonPublic);
                if (f != null) f.SetValue(null, asset);
                else PortLog.Write("[PortIcons] 找不到 TMP_Settings.s_defaultSpriteAsset(反射失败)");
            }
            catch (System.Exception e) { PortLog.Write("[PortIcons] 设默认 SpriteAsset 失败 " + e.Message); }
            int applied = ApplyToAll(asset);
            int tagTexts = Diagnostic(asset);
            PortLog.Write($"[PortIcons] ok: {chars.Count} 图标, 图集 {w}x{h}, 挂到 {applied} 个文本, 含 sprite 标签 {tagTexts}");

            // 游戏里会持续克隆新文本(增强包价格、任务条), 克隆体不会继承 spriteAsset, 前 60 秒反复补挂
            var go = new GameObject("[PortIcons]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
        }

        // v0.66 取证: 构建期资产到底在不在包里、里面有没有字形、贴图有没有打包进来。
        static void UseBuiltAssets()
        {
            PortLog.Write("[PortIcons] 运行时不打图集(改用构建期 Resources/Sprite Assets/<name>)");
            int ok = 0, missing = 0, noTex = 0;
            for (int i = 0; i < Names.Length; i++)
            {
                var a = Resources.Load<TMP_SpriteAsset>("Sprite Assets/" + Names[i]);
                if (a == null) { missing++; if (missing <= 3) PortLog.Write("[PortIcons] 缺构建期资产: " + Names[i]); continue; }
                int cnum = 0;
                try { var tb = a.spriteCharacterTable; cnum = tb != null ? tb.Count : 0; } catch { }
                var tex = a.material != null ? a.material.mainTexture : null;
                if (tex == null) { noTex++; if (noTex <= 3) PortLog.Write("[PortIcons] 资产 " + Names[i] + " 的材质无贴图"); }
                ok++;
                if (i < 3) PortLog.Write("[PortIcons] " + Names[i] + " char=" + cnum + " tex=" + (tex != null ? tex.width + "x" + tex.height : "null"));
            }
            PortLog.Write("[PortIcons] 构建期资产: 可用 " + ok + " / 缺 " + missing + " / 无贴图 " + noTex);

            // 默认图集(实例字段 m_defaultSpriteAsset, 不是静态字段)
            try
            {
                var t = typeof(TMPro.TMP_Settings);
                var instP = t.GetProperty("instance", BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.Public);
                object inst = instP != null ? instP.GetValue(null) : null;
                if (inst == null)
                {
                    var load = t.GetMethod("LoadDefaultSettings", BindingFlags.Static | BindingFlags.Public | BindingFlags.NonPublic);
                    if (load != null) { load.Invoke(null, null); inst = instP != null ? instP.GetValue(null) : null; }
                }
                var f = t.GetField("m_defaultSpriteAsset", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
                var def = Resources.Load<TMP_SpriteAsset>("Sprite Assets/Default Sprite Asset");
                if (inst != null && f != null && def != null)
                {
                    f.SetValue(inst, def);
                    PortLog.Write("[PortIcons] 已把默认 SpriteAsset 设为构建期 Default Sprite Asset");
                }
                else
                {
                    PortLog.Write("[PortIcons] 默认 SpriteAsset 未设置 inst=" + (inst != null) + " field=" + (f != null) + " def=" + (def != null));
                }
            }
            catch (System.Exception e) { PortLog.Write("[PortIcons] 设默认 SpriteAsset 异常 " + e.Message); }

            var go = new GameObject("[PortIcons]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            go.AddComponent<Observ>();
        }

        // v0.66: 只观察, 不覆盖。20s / 40s 各报一次, 看 TMP 自己解析出了什么。
        internal sealed class Observ : MonoBehaviour
        {
            float _t; int _n;
            void Update()
            {
                _t += Time.unscaledDeltaTime;
                if (_n >= 2) return;
                if (_t < 20f) return;
                _t = 0f; _n++;
                try { Inspect(); } catch (System.Exception e) { PortLog.Write("[PortIcons] Inspect 异常 " + e.Message); }
                if (_n >= 2) { try { DumpBooster(); } catch (System.Exception e) { PortLog.Write("[PortIcons] Dump 异常 " + e.Message); } }
            }

            static void Inspect()
            {
                var arr = UnityEngine.Object.FindObjectsOfType<TMP_Text>(true);
                int tag = 0, hasAsset = 0, resolved = 0;
                string sample = "";
                for (int i = 0; i < arr.Length; i++)
                {
                    var t = arr[i];
                    if (t == null || t.text == null) continue;
                    if (t.text.IndexOf("<sprite", StringComparison.Ordinal) < 0) continue;
                    tag++;
                    if (t.spriteAsset != null) hasAsset++;
                    if (resolved < 3 && t.textInfo != null && t.textInfo.characterCount > 0)
                    {
                        resolved++;
                        if (sample.Length == 0) sample = t.text.Replace("\n", " ");
                    }
                }
                var firstNamed = "";
                for (int i = 0; i < arr.Length && firstNamed.Length == 0; i++)
                {
                    var t = arr[i];
                    if (t != null && t.text != null && t.text.IndexOf("<sprite", StringComparison.Ordinal) >= 0 && t.spriteAsset != null)
                        firstNamed = t.spriteAsset.name;
                }
                PortLog.Write("[PortIcons] 观察 含标签文本=" + tag + " 有 spriteAsset=" + hasAsset + " 已出字形=" + resolved
                    + " 首个资产名=" + firstNamed + " 样本=" + sample);
            }
        }

        // v0.66 取证: 卡包正面那四个灰格子到底是谁画的 —— 打印所有 Booster 材质的真实绑定。
        static void DumpBooster()
        {
            var mrs = UnityEngine.Object.FindObjectsOfType<MeshRenderer>(true);
            int n = 0;
            for (int i = 0; i < mrs.Length; i++)
            {
                var mr = mrs[i];
                if (mr == null) continue;
                var mat = mr.sharedMaterial;
                if (mat == null || mat.name.IndexOf("Booster", StringComparison.OrdinalIgnoreCase) < 0) continue;
                var tex = mat.HasProperty("_MainTex") ? mat.GetTexture("_MainTex") : null;
                var c = mat.HasProperty("_Color") ? mat.GetColor("_Color") : Color.black;
                var c2 = mat.HasProperty("_Color2") ? mat.GetColor("_Color2") : Color.black;
                var ic = mat.HasProperty("_IconColor") ? mat.GetColor("_IconColor") : Color.black;
                var r = mat.HasProperty("_Rect") ? mat.GetVector("_Rect") : Vector4.zero;
                PortLog.Write("[Booster] " + mr.transform.name + " mat=" + mat.name + " shader=" + (mat.shader != null ? mat.shader.name : "null")
                    + " size=" + (mr.GetComponent<MeshFilter>() != null && mr.GetComponent<MeshFilter>().sharedMesh != null
                        ? mr.GetComponent<MeshFilter>().sharedMesh.name : "-")
                    + " tex=" + (tex != null ? tex.name + " " + tex.width + "x" + tex.height : "null")
                    + " _Color=" + c.ToString("0.000") + " _Color2=" + c2.ToString("0.000") + " _Icon=" + ic.ToString("0.000")
                    + " _Rect=" + r.x.ToString("0.0") + "," + r.y.ToString("0.0") + "," + r.z.ToString("0.0") + "," + r.w.ToString("0.0"));
                n++;
                if (n >= 12) break;
            }
            PortLog.Write("[Booster] 命中 " + n + " 个 Booster 材质渲染器");
        }

        static bool BlitTo(Texture2D atlas, Sprite sp, int dx, int dy, int pw, int ph)
        {
            RenderTexture rt = null;
            RenderTexture prev = RenderTexture.active;
            try
            {
                var src = sp.texture;
                if (src == null) return false;
                var tr = sp.textureRect;
                rt = RenderTexture.GetTemporary(pw, ph, 0, RenderTextureFormat.ARGB32, RenderTextureReadWrite.sRGB);
                Graphics.Blit(src, rt, new Vector2(tr.width / src.width, tr.height / src.height),
                             new Vector2(tr.x / src.width, tr.y / src.height));
                RenderTexture.active = rt;
                atlas.ReadPixels(new Rect(0, 0, pw, ph), dx, dy, false);
                return true;
            }
            finally
            {
                RenderTexture.active = prev;
                if (rt != null) RenderTexture.ReleaseTemporary(rt);
            }
        }

        static int ApplyToAll(TMP_SpriteAsset asset)
        {
            int n = 0;
            var texts = UnityEngine.Object.FindObjectsOfType<TMP_Text>(true);
            for (int i = 0; i < texts.Length; i++)
            {
                var t = texts[i];
                if (t == null) continue;
                bool need = t.spriteAsset != asset;
                if (!need)
                {
                    // 已挂了图集, 只处理"带 <sprite 标签但还没解析成功"的文本, 其余一律跳过
                    if (t.text == null || t.text.IndexOf("<sprite", StringComparison.Ordinal) < 0) continue;
                }
                if (t.spriteAsset != asset) t.spriteAsset = asset;
                // TMP 对已解析过的字符串会缓存标签结果, 只 SetAllDirty 不一定重解析;
                // 手工回写一次 text 强制走一遍解析。
                var raw = t.text;
                if (!string.IsNullOrEmpty(raw)) t.text = raw;
                t.ForceMeshUpdate();
                n++;
            }
            return n;
        }

        // v0.58: 一次性诊断 —— 到底有多少文本带 <sprite 标签、首条能不能按名字解析出来。
        // 真机日志里"挂到 0 个文本"说明时机太早(HUD 在 GameScreen 加载之后才建),
        // 这条日志能直接区分"没挂上"和"挂上了但查不到字符"。
        static int Diagnostic(TMP_SpriteAsset asset)
        {
            int tag = 0, resolved = 0, texts = 0, usingIt = 0;
            string first = "";
            try
            {
                var arr = UnityEngine.Object.FindObjectsOfType<TMP_Text>(true);
                texts = arr != null ? arr.Length : 0;
                for (int i = 0; i < arr.Length; i++)
                {
                    var t = arr[i];
                    if (t == null) continue;
                    if (t.spriteAsset == asset) usingIt++;
                    var txt = t.text;
                    if (txt == null) continue;
                    int at = txt.IndexOf("<sprite=", System.StringComparison.Ordinal);
                    if (at < 0) continue;
                    tag++;
                    if (first.Length == 0) first = t.name + " | " + txt;
                    int q1 = txt.IndexOf('"', at), q2 = txt.IndexOf('"', q1 + 1);
                    if (q1 > 0 && q2 > q1)
                    {
                        var nm = txt.Substring(q1 + 1, q2 - q1 - 1);
                        // TMP_SpriteAsset 没有公开的 GetSpriteCharacterFromName(编译报 CS1061),
                        // 只能反射读它内部的 m_NameLookup: Dictionary<int, TMP_SpriteCharacter>
                        if (_nameLookup == null)
                            _nameLookup = typeof(TMP_SpriteAsset).GetField("m_NameLookup",
                                BindingFlags.Instance | BindingFlags.NonPublic);
                        if (_nameLookup != null)
                        {
                            var dict = _nameLookup.GetValue(asset) as System.Collections.IDictionary;
                            if (dict != null && dict.Contains(TMP_TextUtilities.GetSimpleHashCode(nm))) resolved++;
                        }
                    }
                }
                PortLog.Write("[PortIcons] 诊断 texts=" + texts + " usingAsset=" + usingIt +
                              " 含标签=" + tag + " 可解析=" + resolved + " 首条=" + first);
            }
            catch (System.Exception e)
            {
                PortLog.Write("[PortIcons] 诊断异常 " + e.GetType().Name + " " + e.Message);
            }
            return tag;
        }
    }
}
