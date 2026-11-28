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
        static FieldInfo _hashField;

        internal sealed class Runner : MonoBehaviour
        {
            float _t;
            float _alive;

            void Update()
            {
                _alive += Time.unscaledDeltaTime;
                if (_alive > 300f) { Destroy(gameObject); return; }
                _t += Time.unscaledDeltaTime;
                if (_t < 1f) return;
                _t = 0f;
                if (_asset != null) ApplyToAll(_asset);
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

        static void Build()
        {
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
            int applied = ApplyToAll(asset);
            int tagTexts = Diagnostic(asset);
            PortLog.Write($"[PortIcons] ok: {chars.Count} 图标, 图集 {w}x{h}, 挂到 {applied} 个文本, 含 sprite 标签 {tagTexts}");

            // 游戏里会持续克隆新文本(增强包价格、任务条), 克隆体不会继承 spriteAsset, 前 60 秒反复补挂
            var go = new GameObject("[PortIcons]");
            UnityEngine.Object.DontDestroyOnLoad(go);
            go.AddComponent<Runner>();
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
                if (t.spriteAsset != asset) t.spriteAsset = asset;
                t.SetAllDirty();
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
                        if (asset.GetSpriteCharacterFromName(nm) != null) resolved++;
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
