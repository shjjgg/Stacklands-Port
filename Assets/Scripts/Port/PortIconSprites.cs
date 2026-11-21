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

        internal sealed class Runner : MonoBehaviour
        {
            float _t;
            float _alive;

            void Update()
            {
                _alive += Time.unscaledDeltaTime;
                if (_alive > 60f) { Destroy(gameObject); return; }
                _t += Time.unscaledDeltaTime;
                if (_t < 3f) return;
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
            try { Build(); }
            catch (Exception e) { PortLog.Write("[PortIcons] 构建失败: " + e); }
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
                var ch = new TMP_SpriteCharacter(0u, glyph);
                ch.name = sp.name;
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
            mat.SetTexture("_MainTex", atlas);

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
            PortLog.Write($"[PortIcons] ok: {chars.Count} 图标, 图集 {w}x{h}, 挂到 {applied} 个文本");

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
                t.spriteAsset = asset;
                t.SetAllDirty();
                n++;
            }
            return n;
        }
    }
}
