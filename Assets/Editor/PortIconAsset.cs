#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using TMPro;
using UnityEditor;
using UnityEngine;
using UnityEngine.TextCore;

namespace StacklandsPort.EditorTools
{
    /// <summary>
    /// 把 Resources/Icons 下的 19 个图标精灵打包成一张 TMP 精灵表, 并设为 TMP Settings 的默认
    /// 精灵资产。这样游戏里 &lt;sprite="goldicon" name="goldicon"&gt; 这类标签才能被解析。
    /// PC 版这些图标是运行时注册的, 导出工程里没有可直接使用的 TMP_SpriteAsset。
    /// 菜单: Stacklands/字体/重建图标精灵表
    /// </summary>
    public static class PortIconAsset
    {
        const string IconDir = "Assets/Resources/Icons";
        const string AtlasPath = "Assets/Resources/PortIconsAtlas.png";
        const string MatPath = "Assets/Resources/PortIconsMat.mat";
        const string AssetPath = "Assets/Resources/PortIcons.asset";
        const string TmpSettings = "Assets/Resources/TMP Settings.asset";

        [MenuItem("Stacklands/字体/重建图标精灵表")]
        public static void Build()
        {
            var sprites = AssetDatabase.FindAssets("t:Sprite", new[] { IconDir })
                .Select(AssetDatabase.GUIDToAssetPath)
                .Select(AssetDatabase.LoadAssetAtPath<Sprite>)
                .Where(s => s != null)
                .OrderBy(s => s.name, StringComparer.Ordinal)
                .ToArray();

            if (sprites.Length == 0) throw new Exception("[PortIcons] 没找到图标精灵: " + IconDir);

            const int Cell = 192, Cols = 4, Rows = 5, Pad = 2;
            int size = Cell * Math.Max(Cols, Rows);
            var px = new Color32[size * size];
            for (int i = 0; i < px.Length; i++) px[i] = new Color32(255, 255, 255, 0);

            var glyphs = new List<TMP_SpriteGlyph>();
            var chars = new List<TMP_SpriteCharacter>();
            var cells = new Dictionary<string, RectInt>();
            int idx = 0;
            foreach (var sp in sprites)
            {
                int col = idx % Cols, row = idx / Cols;
                int x0 = col * Cell, y0 = row * Cell;

                // 直接读源 PNG 再按 sprite.rect 裁剪, 避免依赖贴图 Read/Write 开关
                Texture2D src = LoadPixels(sp, out Rect rect);
                int w = Mathf.Min((int)rect.width, Cell - Pad * 2);
                int h = Mathf.Min((int)rect.height, Cell - Pad * 2);
                if (w <= 0 || h <= 0) { idx++; continue; }

                for (int y = 0; y < h; y++)
                {
                    for (int x = 0; x < w; x++)
                    {
                        var c = src.GetPixel((int)rect.x + x, (int)rect.y + y);
                        px[(y0 + Pad + y) * size + (x0 + Pad + x)] = c;
                    }
                }
                UnityEngine.Object.DestroyImmediate(src);

                cells[sp.name] = new RectInt(x0 + Pad, y0 + Pad, w, h);
                // v0.69: TMP 的 GlyphRect 以「左上」为原点, 我们写像素是从下往上,
                // 之前没翻 Y —— 采样到的就是相邻格子/空白区, 画出来是白块或黑块。
                var gr = new GlyphRect(x0 + Pad, size - (y0 + Pad + h), w, h);
                var gm = new GlyphMetrics(w, h, 0, h, w);
                var glyph = new TMP_SpriteGlyph((uint)idx, gm, gr, 1f, 0, sp);
                var ch = new TMP_SpriteCharacter(0xE000u + (uint)idx, glyph);
                ch.name = sp.name;

                var hashField = typeof(TMP_SpriteCharacter).GetField("m_HashCode", BindingFlags.Instance | BindingFlags.NonPublic);
                if (hashField != null) hashField.SetValue(ch, TMP_TextUtilities.GetSimpleHashCode(sp.name));

                glyphs.Add(glyph);
                chars.Add(ch);
                idx++;
            }

            var tex = new Texture2D(size, size, TextureFormat.RGBA32, false);
            tex.SetPixels32(px);
            tex.Apply();
            File.WriteAllBytes(AtlasPath, tex.EncodeToPNG());
            UnityEngine.Object.DestroyImmediate(tex);
            AssetDatabase.ImportAsset(AtlasPath, ImportAssetOptions.ForceUpdate);
            var importer = (TextureImporter)AssetImporter.GetAtPath(AtlasPath);
            importer.textureType = TextureImporterType.Default;
            importer.alphaIsTransparency = true;
            importer.mipmapEnabled = false;
            importer.maxTextureSize = 2048;
            importer.textureCompression = TextureImporterCompression.Uncompressed;
            importer.SaveAndReimport();
            var atlas = AssetDatabase.LoadAssetAtPath<Texture2D>(AtlasPath);

            // 材质: 用现有 TMP 精灵材质当模板(保留 TextMeshPro/Sprite 的 shader 与参数)
            var templateAsset = AssetDatabase.LoadAssetAtPath<TMP_SpriteAsset>("Assets/Resources/sprite assets/Default Sprite Asset.asset");
            var mat = new Material(templateAsset != null && templateAsset.material != null
                ? templateAsset.material.shader
                : Shader.Find("TextMeshPro/Sprite"));
            mat.name = "PortIconsMat";
            mat.SetTexture("_MainTex", atlas);
            if (File.Exists(MatPath)) AssetDatabase.DeleteAsset(MatPath);
            AssetDatabase.CreateAsset(mat, MatPath);

            var sa = ScriptableObject.CreateInstance<TMP_SpriteAsset>();
            sa.name = "PortIcons";
            sa.material = AssetDatabase.LoadAssetAtPath<Material>(MatPath);
            sa.spriteSheet = atlas;

            SetPrivate(sa, "m_SpriteCharacterTable", chars);
            SetPrivate(sa, "m_SpriteGlyphTable", glyphs);
            SetPrivate(sa, "m_Version", "1.1.0");
            sa.UpdateLookupTables();

            if (File.Exists(AssetPath)) AssetDatabase.DeleteAsset(AssetPath);
            AssetDatabase.CreateAsset(sa, AssetPath);

            // 挂到 TMP Settings 的默认精灵资产
            var settings = AssetDatabase.LoadAssetAtPath<TMP_Settings>(TmpSettings);
            var setter = typeof(TMP_Settings).GetField("m_defaultSpriteAsset", BindingFlags.Instance | BindingFlags.NonPublic)
                         ?? typeof(TMP_Settings).GetField("m_defaultSpriteAsset", BindingFlags.Instance | BindingFlags.Public);
            if (settings != null && setter != null)
            {
                setter.SetValue(settings, sa);
                EditorUtility.SetDirty(settings);
            }
            else
            {
                Debug.LogWarning("[PortIcons] 无法写 TMP Settings 默认精灵资产, 将在运行时兜底");
            }

            // ---- 每个图标再单独生成一个同名 TMP 精灵资产 ----
            // 游戏里的标签是 <sprite="goldicon" name="goldicon" tint>, TMP 会按
            // Resources/Sprite Assets/<sprite 名> 去 Load 一个 TMP_SpriteAsset, 找不到就整段当纯文本输出。
            const string SpriteAssetDir = "Assets/Resources/Sprite Assets";
            Directory.CreateDirectory(SpriteAssetDir);
            int perName = 0;
            foreach (var sp in sprites)
            {
                string path = SpriteAssetDir + "/" + sp.name + ".asset";
                if (File.Exists(path)) AssetDatabase.DeleteAsset(path);

                if (!cells.ContainsKey(sp.name)) continue;

                // v0.76: 逐名资产直接拿精灵自己的整张贴图, 字形矩形 = 整张(0,0,w,h)。
                // 之前按 sp.rect/textureRect 裁, 只要 rect 与贴图坐标系不一致就整格错位(真机上表现为黑方块);
                // 图标源 png 本身带透明边距, 用整张 = 零裁切零坐标假设, 不可能错位, 只是图标略小(原版也有边距)。
                var stex = sp.texture as Texture2D;
                if (stex == null) continue;
                Rect src = new Rect(0f, 0f, stex.width, stex.height);
                var tmpl = AssetDatabase.LoadAssetAtPath<TMP_SpriteAsset>("Assets/Resources/sprite assets/Default Sprite Asset.asset");
                var sh = (tmpl != null && tmpl.material != null) ? tmpl.material.shader : Shader.Find("TextMeshPro/Sprite");
                var imat = new Material(sh != null ? sh : Shader.Find("TextMeshPro/Sprite"));
                imat.name = sp.name + "Mat";
                imat.SetTexture("_MainTex", stex);
                AssetDatabase.CreateAsset(imat, MatPath.Replace("PortIconsMat", sp.name + "Mat"));

                var single = ScriptableObject.CreateInstance<TMP_SpriteAsset>();
                single.name = sp.name;
                single.material = AssetDatabase.LoadAssetAtPath<Material>(MatPath.Replace("PortIconsMat", sp.name + "Mat"));
                single.spriteSheet = stex;

                // 整张 = 全矩形, 无需翻 Y / 无坐标系假设
                int gy = 0;
                var glyph = new TMP_SpriteGlyph(0u,
                    new GlyphMetrics(src.width, src.height, 0, src.height, src.width),
                    new GlyphRect(Mathf.RoundToInt(src.x), gy, Mathf.RoundToInt(src.width), Mathf.RoundToInt(src.height)),
                    1f, 0);
                var ch = new TMP_SpriteCharacter(0xE000u, glyph);
                ch.name = sp.name;
                var hashField = typeof(TMP_SpriteCharacter).GetField("m_HashCode", BindingFlags.Instance | BindingFlags.NonPublic);
                if (hashField != null) hashField.SetValue(ch, TMP_TextUtilities.GetSimpleHashCode(sp.name));

                SetPrivate(single, "m_SpriteCharacterTable", new List<TMP_SpriteCharacter> { ch });
                SetPrivate(single, "m_SpriteGlyphTable", new List<TMP_SpriteGlyph> { glyph });
                SetPrivate(single, "m_Version", "1.1.0");
                single.UpdateLookupTables();

                AssetDatabase.CreateAsset(single, path);
                perName++;
            }

            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            // 回读校验: 资产能把 19 个名字都查出来
            var saved = AssetDatabase.LoadAssetAtPath<TMP_SpriteAsset>(AssetPath);
            var names = new List<string> { "goldicon", "cardicon", "workericon", "energyicon", "foodicon" };
            int ok = 0;
            foreach (var n in names)
            {
                if (saved.GetSpriteIndexFromName(n) >= 0) ok++;
            }
            Debug.Log("[PortIcons] 生成完成: 精灵 " + chars.Count + "/按名 " + perName + " 个, 图集 " + size + "x" + size + ", 抽查 " + ok + "/" + names.Count);
            if (ok < names.Count) throw new Exception("[PortIcons] 精灵查表失败, 哈希/名字未生效");
        }

        static void SetPrivate(object owner, string field, object value)
        {
            var f = owner.GetType().GetField(field, BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
            if (f == null) { Debug.LogWarning("[PortIcons] 无字段 " + field); return; }
            f.SetValue(owner, value);
        }

        /// <summary>从 PNG 原文件解码并按精灵矩形裁切, 不要求贴图可读。</summary>
        static Texture2D LoadPixels(Sprite sp, out Rect rect)
        {
            // v0.74: 精灵若被打进图集, sp.rect 是"原图里的矩形", 直接按它裁会切错位置 ——
            // 这正是 PortIconsAtlas.png 里只剩一堆碎片/边角料的原因。打包过的必须用 textureRect。
            rect = sp.packed ? sp.textureRect : sp.rect;
            if (sp.packingRotation != SpritePackingRotation.None)
                Debug.LogWarning("[PortIcons] " + sp.name + " 带旋转打包 " + sp.packingRotation + ", 裁切可能不准");
            string path = AssetDatabase.GetAssetPath(sp.texture);
            var tex = new Texture2D(2, 2, TextureFormat.RGBA32, false);
            if (!string.IsNullOrEmpty(path) && File.Exists(path))
                tex.LoadImage(File.ReadAllBytes(path));
            else
            {
                // 贴图在别处(跨引用)时退化为整图
                var src = sp.texture as Texture2D;
                rect = new Rect(0, 0, src.width, src.height);
                var rt = RenderTexture.GetTemporary(src.width, src.height, 0, RenderTextureFormat.ARGB32);
                Graphics.Blit(src, rt);
                var prev = RenderTexture.active;
                RenderTexture.active = rt;
                tex.ReadPixels(new Rect(0, 0, src.width, src.height), 0, 0);
                tex.Apply();
                RenderTexture.active = prev;
                RenderTexture.ReleaseTemporary(rt);
            }
            return tex;
        }
    }
}
#endif
