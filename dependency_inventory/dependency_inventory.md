# 自研程序集引用闭包与内嵌资源台账

- 扫描时间: 2026-11-20T20:26:07
- 元数据 AssemblyRef / ManifestResource；资源 blob 内容与版本一致性需反编译/加载后核对。

## 1. 汇总

| 程序集 | 引用数 | 磁盘未解析 | 内嵌资源数 |
|---|---:|---:|---:|
| GameScripts.dll | 26 | 0 | 0 |
| Assembly-CSharp.dll | 5 | 0 | 0 |
| Assembly-CSharp-firstpass.dll | 9 | 0 | 0 |
| csS.dll | 1 | 0 | 0 |

## 2. 全量托管闭包

- Managed 目录 DLL 总数: **129**
- 磁盘未解析引用: **0**
- 含内嵌资源的程序集: **6**（均为 BCL/第三方 XML/音频/图标，自研程序集无内嵌资源）

## 3. GameScripts.dll 引用程序集

| 引用程序集 | 版本 | 公钥标记 | 磁盘解析 |
|---|---|:---:|:---:|
| `0Harmony` | 2.10.1.0 | 否 | ✅ 0Harmony.dll |
| `DOTween` | 1.0.0.0 | 否 | ✅ DOTween.dll |
| `DOTween.Modules` | 0.0.0.0 | 否 | ✅ DOTween.Modules.dll |
| `ImGui.NET` | 1.89.4.0 | 否 | ✅ ImGui.NET.dll |
| `Newtonsoft.Json` | 13.0.0.0 | 是 | ✅ Newtonsoft.Json.dll |
| `ShapesRuntime` | 0.0.0.0 | 否 | ✅ ShapesRuntime.dll |
| `SokLoc` | 0.0.0.0 | 否 | ✅ SokLoc.dll |
| `SokSheet` | 0.0.0.0 | 否 | ✅ SokSheet.dll |
| `UImGui` | 0.0.0.0 | 否 | ✅ UImGui.dll |
| `Unity.InputSystem` | 1.6.1.0 | 否 | ✅ Unity.InputSystem.dll |
| `Unity.Postprocessing.Runtime` | 0.0.0.0 | 否 | ✅ Unity.Postprocessing.Runtime.dll |
| `Unity.TextMeshPro` | 0.0.0.0 | 否 | ✅ Unity.TextMeshPro.dll |
| `UnityEngine.AssetBundleModule` | 0.0.0.0 | 否 | ✅ UnityEngine.AssetBundleModule.dll |
| `UnityEngine.AudioModule` | 0.0.0.0 | 否 | ✅ UnityEngine.AudioModule.dll |
| `UnityEngine.CoreModule` | 0.0.0.0 | 否 | ✅ UnityEngine.CoreModule.dll |
| `UnityEngine.IMGUIModule` | 0.0.0.0 | 否 | ✅ UnityEngine.IMGUIModule.dll |
| `UnityEngine.ImageConversionModule` | 0.0.0.0 | 否 | ✅ UnityEngine.ImageConversionModule.dll |
| `UnityEngine.JSONSerializeModule` | 0.0.0.0 | 否 | ✅ UnityEngine.JSONSerializeModule.dll |
| `UnityEngine.ParticleSystemModule` | 0.0.0.0 | 否 | ✅ UnityEngine.ParticleSystemModule.dll |
| `UnityEngine.PhysicsModule` | 0.0.0.0 | 否 | ✅ UnityEngine.PhysicsModule.dll |
| `UnityEngine.UI` | 1.0.0.0 | 否 | ✅ UnityEngine.UI.dll |
| `UnityEngine.UIModule` | 0.0.0.0 | 否 | ✅ UnityEngine.UIModule.dll |
| `UnityEngine.UnityWebRequestAudioModule` | 0.0.0.0 | 否 | ✅ UnityEngine.UnityWebRequestAudioModule.dll |
| `UnityEngine.UnityWebRequestModule` | 0.0.0.0 | 否 | ✅ UnityEngine.UnityWebRequestModule.dll |
| `com.rlabrecque.steamworks.net` | 0.0.0.0 | 否 | ✅ com.rlabrecque.steamworks.net.dll |
| `netstandard` | 2.1.0.0 | 是 | ✅ netstandard.dll |


## 3. Assembly-CSharp.dll 引用程序集

| 引用程序集 | 版本 | 公钥标记 | 磁盘解析 |
|---|---|:---:|:---:|
| `Unity.InputSystem` | 1.6.1.0 | 否 | ✅ Unity.InputSystem.dll |
| `UnityEngine.AudioModule` | 0.0.0.0 | 否 | ✅ UnityEngine.AudioModule.dll |
| `UnityEngine.CoreModule` | 0.0.0.0 | 否 | ✅ UnityEngine.CoreModule.dll |
| `UnityEngine.UI` | 1.0.0.0 | 否 | ✅ UnityEngine.UI.dll |
| `netstandard` | 2.1.0.0 | 是 | ✅ netstandard.dll |


## 3. Assembly-CSharp-firstpass.dll 引用程序集

| 引用程序集 | 版本 | 公钥标记 | 磁盘解析 |
|---|---|:---:|:---:|
| `Unity.TextMeshPro` | 0.0.0.0 | 否 | ✅ Unity.TextMeshPro.dll |
| `UnityEngine.CoreModule` | 0.0.0.0 | 否 | ✅ UnityEngine.CoreModule.dll |
| `UnityEngine.InputLegacyModule` | 0.0.0.0 | 否 | ✅ UnityEngine.InputLegacyModule.dll |
| `UnityEngine.PhysicsModule` | 0.0.0.0 | 否 | ✅ UnityEngine.PhysicsModule.dll |
| `UnityEngine.TextCoreFontEngineModule` | 0.0.0.0 | 否 | ✅ UnityEngine.TextCoreFontEngineModule.dll |
| `UnityEngine.TextRenderingModule` | 0.0.0.0 | 否 | ✅ UnityEngine.TextRenderingModule.dll |
| `UnityEngine.UI` | 1.0.0.0 | 否 | ✅ UnityEngine.UI.dll |
| `UnityEngine.UIModule` | 0.0.0.0 | 否 | ✅ UnityEngine.UIModule.dll |
| `netstandard` | 2.1.0.0 | 是 | ✅ netstandard.dll |


## 3. csS.dll 引用程序集

| 引用程序集 | 版本 | 公钥标记 | 磁盘解析 |
|---|---|:---:|:---:|
| `netstandard` | 2.1.0.0 | 是 | ✅ netstandard.dll |

