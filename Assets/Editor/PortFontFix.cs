#if UNITY_EDITOR
using System.Collections.Generic;
using System.IO;
using System.Text;
using TMPro;
using UnityEditor;
using UnityEngine;

namespace StacklandsPort.EditorTools
{
    /// <summary>
    /// 修复 AssetRipper 导出后丢失图集纹理的 TMP 字体资产。
    /// 这些字体是 Dynamic(AtlasPopulationMode=1), 图集纹素在运行期按需生成,
    /// 因此只要能给它们一张可写的空图集 + 正确材质贴图即可正常工作;
    /// 若不修, 运行期 TMP_FontAsset.TryAddCharacterInternal 会对 null 图集刷 NullReferenceException。
    /// </summary>
    public static class PortFontFix
    {
        const string MenuPath = "Stacklands/字体/修复 TMP 图集";

        [MenuItem(MenuPath)]
        public static void FixAllMenu() => FixAll(true);

        /// <summary>构建前自动调用。返回修复/检查的条目说明。</summary>
        public static string FixAll(bool verbose)
        {
            var report = new StringBuilder();
            string[] guids = AssetDatabase.FindAssets("t:TMP_FontAsset", new[] { "Assets" });
            int fixedCount = 0;

            foreach (string guid in guids)
            {
                string path = AssetDatabase.GUIDToAssetPath(guid);
                if (string.IsNullOrEmpty(path)) continue;
                var fa = AssetDatabase.LoadAssetAtPath<TMP_FontAsset>(path);
                if (fa == null) continue;

                Texture2D atlas = (fa.atlasTextures != null && fa.atlasTextures.Length > 0)
                    ? fa.atlasTextures[0] : null;

                if (atlas != null) continue;   // 已有图集, 不动

                int w = fa.atlasWidth > 0 ? fa.atlasWidth : 2048;
                int h = fa.atlasHeight > 0 ? fa.atlasHeight : 2048;
                if (w > 4096) w = 4096;
                if (h > 4096) h = 4096;

                var tex = new Texture2D(w, h, TextureFormat.Alpha8, false, true);
                var px = new Color32[w * h];
                for (int i = 0; i < px.Length; i++) px[i] = new Color32(0, 0, 0, 0);
                tex.SetPixels32(px);
                tex.Apply(false, false);
                tex.name = fa.name + " Atlas";

                string dir = "Assets/Texture2D";
                if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);
                string texPath = $"{dir}/{fa.name} Atlas.asset";
                AssetDatabase.DeleteAsset(texPath);
                AssetDatabase.CreateAsset(tex, texPath);

                // 写回 atlas 数组(字段私有, 走 SerializedObject)
                var so = new SerializedObject(fa);
                var prop = so.FindProperty("m_AtlasTextures");
                if (prop != null)
                {
                    prop.arraySize = 1;
                    prop.GetArrayElementAtIndex(0).objectReferenceValue = tex;
                    so.ApplyModifiedPropertiesWithoutUndo();
                }
                fa.atlasTextures = new[] { tex };
                var idx = so.FindProperty("m_AtlasTextureIndex");
                if (idx != null) { idx.intValue = 0; so.ApplyModifiedPropertiesWithoutUndo(); }

                // 材质贴图同步
                if (fa.material != null)
                {
                    fa.material.SetTexture(ShaderUtilities.ID_MainTex, tex);
                    EditorUtility.SetDirty(fa.material);
                }

                EditorUtility.SetDirty(fa);
                fixedCount++;
                report.AppendLine($"  修复 {fa.name}: 新建 {w}x{h} Alpha8 动态图集 {texPath}");
            }

            if (fixedCount > 0)
            {
                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();
            }

            string summary = $"[PortFontFix] 检查 TMP 字体 {guids.Length} 个, 补齐图集 {fixedCount} 个";
            if (verbose) Debug.Log(summary + "\n" + report);
            return summary;
        }
    }
}
#endif
