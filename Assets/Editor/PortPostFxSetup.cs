using System;
using System.IO;
using System.Linq;
using System.Reflection;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

namespace Port.Editor
{
    /// <summary>
    /// 重建 PostProcessing 的 PostProcessResources 资产。
    /// PC 版的这些资源是包体内编译产物，AssetRipper 只导出了空壳，这里用官方 v2 源码
    /// (Shaders/Textures) 重新组装成可用的资源对象。
    /// 菜单: Stacklands/后处理/重建资源
    /// </summary>
    public static class PortPostFxSetup
    {
        const string Root = "Assets/PostProcessing";
        const string OutAsset = Root + "/PostProcessResources.asset";

        static readonly (string field, string file)[] ShaderMap =
        {
            ("bloom", "Builtins/Bloom.shader"),
            ("copy", "Builtins/Copy.shader"),
            ("copyStd", "Builtins/CopyStd.shader"),
            ("copyStdFromTexArray", "Builtins/CopyStdFromTexArray.shader"),
            ("copyStdFromDoubleWide", "Builtins/CopyStdFromDoubleWide.shader"),
            ("discardAlpha", "Builtins/DiscardAlpha.shader"),
            ("depthOfField", "Builtins/DepthOfField.shader"),
            ("finalPass", "Builtins/FinalPass.shader"),
            ("grainBaker", "Builtins/GrainBaker.shader"),
            ("motionBlur", "Builtins/MotionBlur.shader"),
            ("temporalAntialiasing", "Builtins/TemporalAntialiasing.shader"),
            ("subpixelMorphologicalAntialiasing", "Builtins/SubpixelMorphologicalAntialiasing.shader"),
            ("texture2dLerp", "Builtins/Texture2DLerp.shader"),
            ("uber", "Builtins/Uber.shader"),
            ("lut2DBaker", "Builtins/Lut2DBaker.shader"),
            ("lightMeter", "Debug/LightMeter.shader"),
            ("gammaHistogram", "Debug/Histogram.shader"),
            ("waveform", "Debug/Waveform.shader"),
            ("vectorscope", "Debug/Vectorscope.shader"),
            ("debugOverlays", "Debug/Overlays.shader"),
            ("deferredFog", "Builtins/DeferredFog.shader"),
            ("scalableAO", "Builtins/ScalableAO.shader"),
            ("multiScaleAO", "Builtins/MultiScaleVO.shader"),
            ("screenSpaceReflections", "Builtins/ScreenSpaceReflections.shader"),
        };

        static readonly (string field, string file)[] ComputeMap =
        {
            ("autoExposure", "Builtins/AutoExposure.compute"),
            ("exposureHistogram", "Builtins/ExposureHistogram.compute"),
            ("lut3DBaker", "Builtins/Lut3DBaker.compute"),
            ("texture3dLerp", "Builtins/Texture3DLerp.compute"),
            ("gammaHistogram", "Debug/Histogram.compute"),
            ("waveform", "Debug/Waveform.compute"),
            ("vectorscope", "Debug/Vectorscope.compute"),
            ("multiScaleAODownsample1", "Builtins/MultiScaleVODownsample1.compute"),
            ("multiScaleAODownsample2", "Builtins/MultiScaleVODownsample2.compute"),
            ("multiScaleAORender", "Builtins/MultiScaleVORender.compute"),
            ("multiScaleAOUpsample", "Builtins/MultiScaleVOUpsample.compute"),
            ("gaussianDownsample", "Builtins/GaussianDownsample.compute"),
        };

        [MenuItem("Stacklands/后处理/重建资源")]
        public static void Build()
        {
            var res = ScriptableObject.CreateInstance<PostProcessResources>();

            SetNested(res, "shaders", ShaderMap.Select(x => (x.field, (UnityEngine.Object)Load<Shader>(Root + "/Shaders/" + x.file))).ToArray());
            SetNested(res, "computeShaders", ComputeMap.Select(x => (x.field, (UnityEngine.Object)Load<ComputeShader>(Root + "/Shaders/" + x.file))).ToArray());

            var bn64 = LoadAll<Texture2D>(Root + "/Textures/Blue Noise 64px", "*.png");
            var bn256 = LoadAll<Texture2D>(Root + "/Textures/Blue Noise 256px", "*.png");
            var area = Load<Texture2D>(Root + "/Textures/SMAA/AreaTex.tga");
            var search = Load<Texture2D>(Root + "/Textures/SMAA/SearchTex.tga");
            SetField(res, "blueNoise64", bn64);
            SetField(res, "blueNoise256", bn256);
            SetSmaa(res, area, search);
            var smaa = new[] { area, search };

            if (Application.isBatchMode && !File.Exists(OutAsset))
                AssetDatabase.CreateAsset(res, OutAsset);
            else
                AssetDatabase.CreateAsset(res, OutAsset);
            AssetDatabase.SaveAssets();
            AssetDatabase.Refresh();

            var issues = Verify(res);
            Debug.Log("[PortPostFx] 资源资产已生成: " + OutAsset +
                      " shaders=" + CountSet(res, "shaders") +
                      " compute=" + CountSet(res, "computeShaders") +
                      " bn64=" + bn64.Length + " bn256=" + bn256.Length + " smaa=" + smaa.Length +
                      (issues.Length == 0 ? " 完整" : " 缺失:" + issues));
            if (issues.Length > 0)
                throw new Exception("[PortPostFx] 资源不完整: " + issues);
        }

        static T Load<T>(string path) where T : UnityEngine.Object
        {
            var a = AssetDatabase.LoadAssetAtPath<T>(path);
            if (a == null) Debug.LogWarning("[PortPostFx] 缺失 " + path);
            return a;
        }

        static T[] LoadAll<T>(string dir, string pattern) where T : UnityEngine.Object
        {
            var list = new System.Collections.Generic.List<T>();
            foreach (var f in Directory.GetFiles(dir, pattern).OrderBy(x => x, StringComparer.Ordinal))
            {
                if (f.EndsWith(".meta")) continue;
                var a = AssetDatabase.LoadAssetAtPath<T>(f.Replace('\\', '/'));
                if (a != null) list.Add(a);
            }
            return list.ToArray();
        }

        static void SetNested(object owner, string field, (string field, UnityEngine.Object value)[] values)
        {
            var f = owner.GetType().GetField(field, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            if (f == null) { Debug.LogWarning("[PortPostFx] 无字段 " + field); return; }
            var holder = f.GetValue(owner);
            if (holder == null)
            {
                // 这些嵌套类只在 OnEnable 里由运行时创建, 序列化资产需要我们自己先建实例
                var nestedType = f.FieldType;
                holder = Activator.CreateInstance(nestedType);
                f.SetValue(owner, holder);
            }
            foreach (var (name, value) in values)
            {
                var nested = holder.GetType().GetField(name, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                if (nested == null) { Debug.LogWarning("[PortPostFx] 无子字段 " + field + "." + name); continue; }
                nested.SetValue(holder, value);
            }
            f.SetValue(owner, holder);   // struct 副本必须写回
        }

        static void SetSmaa(object owner, Texture2D area, Texture2D search)
        {
            var f = owner.GetType().GetField("smaaLuts", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            if (f == null) { Debug.LogWarning("[PortPostFx] 无字段 smaaLuts"); return; }
            var v = f.GetValue(owner);
            if (v == null) { v = Activator.CreateInstance(f.FieldType); }
            foreach (var (name, tex) in new[] { ("area", area), ("search", search) })
            {
                var sub = v.GetType().GetField(name, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
                if (sub == null) { Debug.LogWarning("[PortPostFx] 无子字段 smaaLuts." + name); continue; }
                sub.SetValue(v, tex);
            }
            f.SetValue(owner, v);
        }

        static void SetField(object owner, string field, UnityEngine.Object[] value)
        {
            var f = owner.GetType().GetField(field, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            if (f == null) { Debug.LogWarning("[PortPostFx] 无字段 " + field); return; }
            var elem = f.FieldType.GetElementType();
            var arr = Array.CreateInstance(elem, value.Length);
            for (int i = 0; i < value.Length; i++) arr.SetValue(value[i], i);
            f.SetValue(owner, arr);
        }

        static string[] Verify(object res)
        {
            var list = new System.Collections.Generic.List<string>();
            foreach (var (field, _) in ShaderMap)
                if (!HasNested(res, "shaders", field)) list.Add("shaders." + field);
            foreach (var (field, _) in ComputeMap)
                if (!HasNested(res, "computeShaders", field)) list.Add("computeShaders." + field);
            foreach (var f in new[] { "blueNoise64", "blueNoise256" })
                if (Count(res, f) == 0) list.Add(f);
            if (!HasNested(res, "smaaLuts", "area") || !HasNested(res, "smaaLuts", "search")) list.Add("smaaLuts");
            return list.ToArray();
        }

        static int Count(object owner, string field)
        {
            var f = owner.GetType().GetField(field, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            var v = f?.GetValue(owner) as Array;
            return v?.Length ?? 0;
        }

        static int CountSet(object owner, string field)
        {
            var f = owner.GetType().GetField(field, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            var holder = f?.GetValue(owner);
            if (holder == null) return 0;
            int n = 0;
            foreach (var sub in holder.GetType().GetFields(BindingFlags.Instance | BindingFlags.Public))
                if (sub.GetValue(holder) != null) n++;
            return n;
        }

        static bool HasNested(object owner, string field, string sub)
        {
            var f = owner.GetType().GetField(field, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            var holder = f?.GetValue(owner);
            if (holder == null) return false;
            var g = holder.GetType().GetField(sub, BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            return g != null && g.GetValue(holder) != null;
        }
    }
}
