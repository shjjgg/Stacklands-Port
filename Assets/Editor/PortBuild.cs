// PortBuild.cs — 移植工程构建胶水 (放入 Assets/Editor/)
// 仅负责出包配置, 不改玩法逻辑。
// CI: 容器内 Unity -batchmode -executeMethod PortBuild.StrictBuild (严格模式, 推荐)
//     或 -executeMethod PortBuild.PerformAndroidBuild (旧入口, 行为受 STRICT 环境变量控制, 默认也是严格)
//
// 原版 PlayerSettings 实测(globalgamemanagers):
//   companyName = sokpop, productName = Stacklands, activeColorSpace = Linear(1),
//   MTRendering = true, 显示 Unity splash logo, 关闭独立 splash screen。
// 包名/方向在二进制中未以明文保存, 默认值由环境变量覆盖 (见 docs/15 T19), 未覆盖时保持占位并告警。
//
// 退出码(CI 直接判读, 不要合并成 1):
//   0  成功且全部严格门通过
//   2  前置不满足(引擎版本漂移 / 场景缺失或未启用 / 场景顺序错 / 缺 link.xml / 依赖清单异常)
//   3  严格设置校验失败(PlayerSettings 回读不一致 / Shader 编译错误 / 自研 shader 数量不足)
//   4  构建结果不合格(结果非 Succeeded / error 计数 > 0 / warning 未放行 / 产物过小 / Release 用调试签名)
#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEditor.Build.Reporting;
using UnityEngine;
using UnityEngine.Rendering;

public static class PortBuild
{
    // ---- 基线常量 (禁止随手改) ----
    private const string BaselineUnityVersion = "2022.3.4f1";
    private const string CompanyName = "sokpop";
    private const string ProductName = "Stacklands";
    // 移植包使用独立包名, 不冒充官方包; 可由 BUNDLE_IDENTIFIER 覆盖。
    private const string DefaultBundleIdentifier = "com.sokpop.stacklands.port";
    private const int DefaultMinSdkVersion = 26;
    private const string PortVersionName = "0.81";

    // 原版场景: Assets/SokpopIntro/IntroScene.unity → Assets/Scenes/SampleScene.unity
    private static readonly string[] RequiredScenes =
    {
        "Assets/SokpopIntro/IntroScene.unity",
        "Assets/Scenes/SampleScene.unity",
    };

    // 按用户口径: Vulkan 优先, GLES3 次选。
    private static readonly GraphicsDeviceType[] TargetGraphicsAPIs =
    {
        GraphicsDeviceType.Vulkan,
        GraphicsDeviceType.OpenGLES3,
    };

    private static bool _keystoreApplied;

    // ---- 入口 ----

    /// 严格模式入口: 无视 STRICT 环境变量, 全部门必过。
    public static void StrictBuild()
    {
        Environment.SetEnvironmentVariable("STRICT", "1");
        PerformAndroidBuild();
    }

    public static void PerformAndroidBuild()
    {
        var strict = Env("STRICT", "1") == "1";
        var warningsAreErrors = Env("STRICT_WARNINGS", strict ? "1" : "0") == "1";
        var isDevelopment = Env("BUILD_TYPE", "Release") == "Debug";
        var outputPath = GetOutputPath();

        Debug.Log($"[PortBuild] mode={(strict ? "STRICT" : "normal")} " +
                  $"warningsAsErrors={warningsAreErrors} output={outputPath}");

        // ---- 门 1: 环境前置 (引擎版本 / 场景 / IL2CPP 保留配置 / 依赖清单) ----
        RequireBaselineEngine(strict);
        var scenes = ResolveScenes(strict);
        ValidateScenesExist(scenes, strict);
        ValidateLinkXml(strict);
        ValidatePackageManifest(strict);

        // ---- 门 2: PlayerSettings 配置 ----
        ApplyPlayerSettings(isDevelopment);

        // ---- 门 3: 设置回读 + Shader 全量检查 (写进去 ≠ 生效) ----
        if (strict)
        {
            VerifyAppliedSettings();
            ScanShaderMessages();
        }

        // ---- 门 3.5: 内容自愈 (TMP 图集缺失 → 运行期 NRE 刷屏) ----
        Debug.Log(StacklandsPort.EditorTools.PortFontFix.FixAll(false));

        // ---- 门 3.55: 右上角资源图标 TMP 精灵表 (构建期生成) ----
        // v0.77: 之前 PortIconAsset.Build() 从来没被调用过 —— 仓库里的 Resources/Sprite Assets/*.asset
        // 还是 v0.18/v0.19 手工生成的旧件(字形矩形指向 960x960 合成图集的错格), 所以 v0.69~v0.75
        // 所有"构建期修图标"的改动实际一次都没生效, 真机才会一直黑方块。这里显式接进构建流水线。
        try
        {
            StacklandsPort.EditorTools.PortIconAsset.Build();
        }
        catch (Exception e)
        {
            Debug.LogError("[PortBuild] 图标精灵表生成失败: " + e.Message);
        }

        // ---- 门 3.6: DLC 重打包 (PC 包的 DXT5 贴图 Android 不可用, 必须用 Android 目标重打) ----
        if (!PortDlcBundle.BuildAll(false))
        {
            Debug.LogError("[PortBuild] DLC 重打包失败, 本次包的 DLC 不可用");
        }

        // ---- 门 4: 构建 ----
        Directory.CreateDirectory(Path.GetDirectoryName(outputPath) ?? "builds/android");

        var buildOptions = BuildOptions.DetailedBuildReport;
        if (strict)
        {
            // StrictMode: 任何构建期 error(含 shader 编译错误)都让构建失败, 而不是只写日志。
            buildOptions |= BuildOptions.StrictMode;
            if (Env("STRICT_CLEAN", "0") == "1")
            {
                buildOptions |= BuildOptions.CleanBuildCache;
            }
        }
        if (isDevelopment)
        {
            buildOptions |= BuildOptions.Development;
        }

        Debug.Log($"[PortBuild] target=Android backend=IL2CPP arch=ARM64 " +
                  $"bundle={PlayerSettings.applicationIdentifier} ver={PlayerSettings.bundleVersion}" +
                  $" code={PlayerSettings.Android.bundleVersionCode}" +
                  $"({PlayerSettings.Android.bundleVersionCode}) " +
                  $"minSdk={PlayerSettings.Android.minSdkVersion} " +
                  $"targetSdk={PlayerSettings.Android.targetSdkVersion} " +
                  $"orientation={PlayerSettings.defaultInterfaceOrientation} " +
                  $"keystore={(_keystoreApplied ? "custom" : "debug")} " +
                  $"dev={isDevelopment} options={buildOptions} " +
                  $"scenes={string.Join(",", scenes)}");

        var report = BuildPipeline.BuildPlayer(new BuildPlayerOptions
        {
            scenes = scenes,
            locationPathName = outputPath,
            target = BuildTarget.Android,
            options = buildOptions,
        });

        var summary = report.summary;
        Debug.Log($"[PortBuild] result={summary.result} scenes={scenes.Length} " +
                  $"output={summary.outputPath} size={summary.totalSize}B " +
                  $"errors={summary.totalErrors} warnings={summary.totalWarnings} " +
                  $"time={summary.totalTime}");

        // ---- 门 5: 结果与产物 ----
        if (summary.result != BuildResult.Succeeded)
        {
            Debug.LogError($"[PortBuild] 构建失败: {summary.result} (退出码 4)");
            EditorApplication.Exit(4);
            return;
        }
        if (summary.totalErrors > 0)
        {
            Debug.LogError($"[PortBuild] 构建报错计数 {summary.totalErrors} > 0, " +
                           "即使 result 为 Succeeded 也不接受 (退出码 4)");
            EditorApplication.Exit(4);
            return;
        }
        if (warningsAreErrors && summary.totalWarnings > MaxWarnings)
        {
            Debug.LogError($"[PortBuild] 警告基线为 {MaxWarnings}, 实得 {summary.totalWarnings} " +
                           "(基线来自原版脚本的 CS0169/CS0649 与占位包名提示; 超出基线视为新引入问题)");
            EditorApplication.Exit(4);
            return;
        }
        if (strict)
        {
            VerifyBuildArtifact(outputPath, isDevelopment);
            return; // VerifyBuildArtifact 内部会 Exit
        }

        Debug.Log("[PortBuild] OK: 全部门通过");
        EditorApplication.Exit(0);
    }

    // ---- 门 1: 前置 ----

    private static void RequireBaselineEngine(bool strict)
    {
        var ver = Application.unityVersion;
        if (ver == BaselineUnityVersion) return;

        if (strict)
        {
            Debug.LogError($"[PortBuild] 引擎版本 {ver} 与基线 {BaselineUnityVersion} 不一致, " +
                           "严格模式拒绝构建(IL2CPP 产物/API 面均按基线校准, 退出码 2)");
            EditorApplication.Exit(2);
        }
        Debug.LogWarning($"[PortBuild] 引擎版本漂移: {ver} != {BaselineUnityVersion}");
    }

    // strict: 只用 EditorBuildSettings 里真实启用且齐全的场景, 不允许回落固定列表。
    private static string[] ResolveScenes(bool strict)
    {
        var enabled = EditorBuildSettings.scenes
            .Where(s => s.enabled)
            .Select(s => s.path)
            .ToArray();

        if (!strict)
        {
            return enabled.Length >= RequiredScenes.Length ? enabled : RequiredScenes;
        }

        var missing = RequiredScenes.Where(r => !enabled.Contains(r)).ToList();
        if (missing.Count > 0)
        {
            foreach (var p in missing)
            {
                Debug.LogError("[PortBuild] EditorBuildSettings 未启用必需场景: " + p +
                               " (严格模式不接受回落固定列表, 退出码 2)");
            }
            EditorApplication.Exit(2);
        }
        // 顺序也要对: 启动场景必须是第一个, 否则进游戏先看到空场景。
        if (enabled.Length > 0 && enabled[0] != RequiredScenes[0])
        {
            Debug.LogError($"[PortBuild] 构建场景顺序错误: 首位是 {enabled[0]}, " +
                           $"应为 {RequiredScenes[0]} (退出码 2)");
            EditorApplication.Exit(2);
        }
        return enabled;
    }

    private static void ValidateScenesExist(string[] scenes, bool strict)
    {
        var missing = scenes.Where(p => !File.Exists(p)).ToList();
        if (missing.Count > 0)
        {
            foreach (var p in missing)
            {
                Debug.LogError("[PortBuild] 缺少场景文件: " + p);
            }
            Debug.LogError("[PortBuild] 场景未落地时不允许构建(AAB/APK 会装得上但进不去游戏)。" +
                           "先按 docs/15 T1 完成 AssetRipper 导出。");
            EditorApplication.Exit(2);
        }
        if (strict && scenes.Length == 0)
        {
            Debug.LogError("[PortBuild] 场景列表为空 (退出码 2)");
            EditorApplication.Exit(2);
        }
    }

    // link.xml 是 IL2CPP 裁剪的保留白名单: 丢了不会有编译错误, 只会在运行期 MissingMethod。
    private static void ValidateLinkXml(bool strict)
    {
        if (File.Exists("Assets/Plugins/link.xml")) return;

        if (strict)
        {
            Debug.LogError("[PortBuild] 缺少 Assets/Plugins/link.xml, IL2CPP 裁剪会误删反射入口 (退出码 2)");
            EditorApplication.Exit(2);
        }
        Debug.LogWarning("[PortBuild] 缺少 Assets/Plugins/link.xml");
    }

    // 依赖清单存在性 + 非空 (IL2CPP/Android 模块缺失时构建会在链接阶段炸, 版本锁在 docs/12)。
    private static void ValidatePackageManifest(bool strict)
    {
        var manifest = "Packages/manifest.json";
        if (!File.Exists(manifest))
        {
            if (strict)
            {
                Debug.LogError("[PortBuild] 缺少 Packages/manifest.json, 依赖不可复现 (退出码 2)");
                EditorApplication.Exit(2);
            }
            Debug.LogWarning("[PortBuild] 缺少 Packages/manifest.json");
            return;
        }

        var text = File.ReadAllText(manifest);
        if (strict && text.Trim().Length == 0)
        {
            Debug.LogError("[PortBuild] Packages/manifest.json 为空 (退出码 2)");
            EditorApplication.Exit(2);
        }
    }

    // ---- 门 2: 配置 ----

    private static void ApplyPlayerSettings(bool isDevelopment)
    {
        var bundleId = Env("BUNDLE_IDENTIFIER", DefaultBundleIdentifier);
        if (bundleId == DefaultBundleIdentifier)
        {
            Debug.LogWarning("[PortBuild] 使用占位包名 " + bundleId +
                             "; 原版包名未解出前不用于正式发布 (docs/15 T19)。");
        }
        PlayerSettings.companyName = CompanyName;
        PlayerSettings.productName = ProductName;
        PlayerSettings.applicationIdentifier = bundleId;
        PlayerSettings.bundleVersion = GetBuildVersion();
        PlayerSettings.Android.bundleVersionCode = GetBundleVersionCode();
        ApplyAndroidIcons();

        // 颜色空间 / 多线程渲染 (对齐原版: Linear, MT 开启)
        PlayerSettings.colorSpace = ColorSpace.Linear;
        PlayerSettings.SetMobileMTRendering(BuildTargetGroup.Android, true);

        // 启动画面: 原版显示 Unity logo
        PlayerSettings.SplashScreen.show = true;
        PlayerSettings.SplashScreen.showUnityLogo = true;

        // 屏幕方向: 原版方向未从二进制解出, 默认横屏左, 由 SCREEN_ORIENTATION 覆盖。
        PlayerSettings.defaultInterfaceOrientation = ParseOrientation(
            Env("SCREEN_ORIENTATION", "LandscapeLeft"));

        PlayerSettings.SetScriptingBackend(BuildTargetGroup.Android, ScriptingImplementation.IL2CPP);
        PlayerSettings.Android.targetArchitectures = AndroidArchitecture.ARM64;
        ApplyAndroidSdkLevel(Env("MIN_SDK", DefaultMinSdkVersion.ToString()),
            DefaultMinSdkVersion, v => PlayerSettings.Android.minSdkVersion = v, "MIN_SDK");
        // TARGET_SDK=auto 表示跟随 Unity 默认(2022.3 为 API 33); 否则按显式数值。
        var targetSdk = Env("TARGET_SDK", "auto");
        if (targetSdk != "auto")
        {
            ApplyAndroidSdkLevel(targetSdk, 33,
                v => PlayerSettings.Android.targetSdkVersion = v, "TARGET_SDK");
        }

        // 图形 API: Vulkan 优先, GLES3 兜底。必须先关掉"默认 API"开关, 否则上面的设置会被忽略。
        PlayerSettings.SetUseDefaultGraphicsAPIs(BuildTarget.Android, false);
        PlayerSettings.SetGraphicsAPIs(BuildTarget.Android, TargetGraphicsAPIs);

        // 裁剪: 首版保行为一致用 Low; 且关闭引擎代码裁剪 —— 本作有反射/Harmony 路径,
        // 引擎模块被裁会表现为运行期 MissingMethod, 见 docs/04。
        PlayerSettings.SetManagedStrippingLevel(BuildTargetGroup.Android, ManagedStrippingLevel.Low);
        PlayerSettings.stripEngineCode = false;

        // IL2CPP 编译器优化: Release 走 Release 编译, Debug 保留检查。
        PlayerSettings.SetIl2CppCompilerConfiguration(BuildTargetGroup.Android,
            isDevelopment ? Il2CppCompilerConfiguration.Debug : Il2CppCompilerConfiguration.Release);

        // SokLoc 在线同步走 UnityWebRequest, 需要 INTERNET 权限。
        PlayerSettings.Android.forceInternetPermission = true;

        // 签名 (Release): 由 CI 环境变量注入; 未配置时走 Unity 调试签名, 只允许内部冒烟。
        _keystoreApplied = ApplyKeystoreIfConfigured();
    }

    // 应用图标: 原版图标 AppIcon.png(黄底黑色小人)。不设的话 Unity 会用默认 Unity logo。
    private static void ApplyAndroidIcons()
    {
        const string IconPath = "Assets/Texture2D/AppIcon.png";
        const string FgPath = "Assets/Texture2D/AppIconFg.png";   // 自适应前景(透明底, 仅墨线图形)
        const string BgPath = "Assets/Texture2D/AppIconBg.png";   // 自适应背景(不透明白底)
        var tex = AssetDatabase.LoadAssetAtPath<Texture2D>(IconPath);
        if (tex == null)
        {
            Debug.LogWarning("[PortBuild] 找不到应用图标 " + IconPath + ", 会退化成 Unity 默认图标");
            return;
        }

        // 传统图标(API<26 与部分启动器)
        PlayerSettings.SetIconsForTargetGroup(BuildTargetGroup.Android, new[] { tex });
        TrySetIconsByName(BuildTargetGroup.Android, tex, new[] { "Application" });
        TrySetIconsByName(BuildTargetGroup.Android, tex, new[] { "Round", "RoundIcon" });

        // 自适应图标(API26+): 前景必须是"透明底图形", 背景必须"不透明"。
        // 之前只给了 Application 一项, 前景槽空着 → Android 8+ 拿 Unity 默认立方体当前景, 叠在
        // 我们的米色圆底上, 就是用户看到的"app 图标上又出现 Unity 图标"。
        var fg = AssetDatabase.LoadAssetAtPath<Texture2D>(FgPath);
        var bg = AssetDatabase.LoadAssetAtPath<Texture2D>(BgPath);
        if (fg == null || bg == null)
        {
            Debug.LogWarning("[PortBuild] 缺自适应图标分层 " + FgPath + " / " + BgPath +
                             "; 自适应前景会退回 Unity 默认图标");
        }
        else
        {
            // 不同 Unity 版本的 IconKind 命名不一样(本机 2022.3 没有 Round/Foreground/Background 字面量),
            // 这里用反射按名字找, 并把真实可用名打出来, 便于后续固化。
            TrySetIconsByName(BuildTargetGroup.Android, fg, new[] { "Foreground", "AdaptiveForeground", "Adaptive" });
            TrySetIconsByName(BuildTargetGroup.Android, bg, new[] { "Background", "AdaptiveBackground" });
        }
        LogIconKinds();

        var read = PlayerSettings.GetIconsForTargetGroup(BuildTargetGroup.Android);
        Debug.Log("[PortBuild] Android 图标 = " + IconPath + " " + tex.width + "x" + tex.height +
                  " 前景=" + (fg != null ? fg.width + "x" + fg.height : "缺") +
                  " 背景=" + (bg != null ? bg.width + "x" + bg.height : "缺") +
                  " (回读 " + read.Length + " 项)");
    }

    // 反射版本: 不依赖编译期的枚举字面量
    private static bool TrySetIconsByName(BuildTargetGroup group, Texture2D tex, string[] kindNames)
    {
        foreach (var n in kindNames)
        {
            try
            {
                var fi = typeof(PlayerSettings).Assembly.GetType("UnityEditor.IconKind");
                if (fi == null) { Debug.LogWarning("[PortBuild] 找不到 IconKind 类型"); return false; }
                object kind;
                try { kind = System.Enum.Parse(fi, n, true); }
                catch { continue; }
                var m = typeof(PlayerSettings).GetMethod("SetIconsForTargetGroup",
                    new[] { typeof(BuildTargetGroup), typeof(Texture2D[]), fi });
                if (m == null) { Debug.LogWarning("[PortBuild] 没有 SetIconsForTargetGroup(g,t,k) 重载"); return false; }
                m.Invoke(null, new object[] { group, new[] { tex }, kind });
                Debug.Log("[PortBuild] 图标槽 " + n + " <- " + tex.name);
                return true;
            }
            catch (Exception e)
            {
                Debug.LogWarning("[PortBuild] 图标槽 " + n + " 失败: " + e.Message);
            }
        }
        return false;
    }

    private static void LogIconKinds()
    {
        var t = typeof(PlayerSettings).Assembly.GetType("UnityEditor.IconKind");
        if (t == null) { Debug.LogWarning("[PortBuild] IconKind 类型不存在"); return; }
        var names = System.Enum.GetNames(t);
        Debug.Log("[PortBuild] IconKind 可用值 = " + string.Join(",", names));
    }

    // ---- 门 3: 回读校验 ----

    private static void VerifyAppliedSettings()
    {
        var failures = new List<string>();

        var apis = PlayerSettings.GetGraphicsAPIs(BuildTarget.Android);
        if (apis == null || apis.Length != TargetGraphicsAPIs.Length ||
            apis.Zip(TargetGraphicsAPIs, (a, b) => a == b).Any(x => !x))
        {
            failures.Add($"GraphicsAPIs 回读=[{string.Join(",", apis ?? new GraphicsDeviceType[0])}] " +
                         $"期望=[{string.Join(",", TargetGraphicsAPIs)}]");
        }
        if (PlayerSettings.GetScriptingBackend(BuildTargetGroup.Android) != ScriptingImplementation.IL2CPP)
        {
            failures.Add("ScriptingBackend 回读非 IL2CPP");
        }
        if (PlayerSettings.Android.targetArchitectures != AndroidArchitecture.ARM64)
        {
            failures.Add($"targetArchitectures 回读={PlayerSettings.Android.targetArchitectures}, 期望 ARM64");
        }
        if (PlayerSettings.colorSpace != ColorSpace.Linear)
        {
            failures.Add($"colorSpace 回读={PlayerSettings.colorSpace}, 期望 Linear");
        }
        // stripEngineCode 必须为 false(不裁引擎): 本作有反射/Harmony 路径, 裁了会运行期 MissingMethod。
        if (!PlayerSettings.stripEngineCode)
        {
            // 正常分支: 已经是 false, 什么都不做。
        }
        else
        {
            failures.Add("stripEngineCode 回读为 true, 期望 false(本作有反射路径)");
        }
        var bundle = PlayerSettings.applicationIdentifier;
        if (string.IsNullOrEmpty(bundle) || !bundle.Contains("."))
        {
            failures.Add($"applicationIdentifier 非法: {bundle}");
        }

        if (failures.Count > 0)
        {
            foreach (var f in failures)
            {
                Debug.LogError("[PortBuild] 设置回读失败: " + f);
            }
            Debug.LogError("[PortBuild] 严格模式拒绝出包(退出码 3)");
            EditorApplication.Exit(3);
        }
        Debug.Log("[PortBuild] 设置回读一致: GraphicsAPIs / IL2CPP / ARM64 / Linear / stripEngineCode=false");
    }

    // 工程内 Shader 全量编译检查: 任何一个 shader 有 error 就拒绝构建。
    // 这条是"禁止占位/坏 shader 混入移植包"的硬门 —— shader 错误在 Android 上表现为白块/粉块, 不会崩。
    private static void ScanShaderMessages()
    {
        var guids = AssetDatabase.FindAssets("t:Shader");
        var customRoot = "Assets/Shaders/";
        var customCount = 0;
        var bad = 0;
        var loaded = 0;

        foreach (var guid in guids)
        {
            var path = AssetDatabase.GUIDToAssetPath(guid);
            if (string.IsNullOrEmpty(path) || !path.StartsWith("Assets/", StringComparison.Ordinal)) continue;
            if (path.StartsWith(customRoot, StringComparison.Ordinal)) customCount++;

            var shader = AssetDatabase.LoadAssetAtPath<Shader>(path);
            if (shader == null) continue;
            loaded++;

            var n = ShaderUtil.GetShaderMessageCount(shader);
            if (n <= 0) continue;

            bad++;
            Debug.LogError($"[PortBuild] Shader 编译消息: {path} ({shader.name}) 共 {n} 条");
            if (n <= 8)
            {
                foreach (var m in ShaderUtil.GetShaderMessages(shader))
                {
                    Debug.LogError("    " + m.message);
                }
            }
        }

        Debug.Log($"[PortBuild] shader 检查: 资产 {guids.Length} / 载入 {loaded} / " +
                  $"Assets/Shaders 下 {customCount} / 有错误 {bad}");

        if (loaded == 0)
        {
            Debug.LogError("[PortBuild] 工程内没有任何 Shader 资产, 资源未落地 (退出码 3)");
            EditorApplication.Exit(3);
        }
        if (bad > 0)
        {
            Debug.LogError("[PortBuild] 存在编译不过的 Shader, 严格模式拒绝出包(退出码 3)");
            EditorApplication.Exit(3);
        }

        // 自研 shader 数量下限: 20 个 Custom shader 是 baseline 事实, 少于它说明保真链断了一环。
        var minCustom = ParseInt(Env("STRICT_MIN_CUSTOM_SHADERS", "20"), 20);
        if (minCustom > 0 && customCount < minCustom)
        {
            Debug.LogError($"[PortBuild] Assets/Shaders 下只有 {customCount} 个 Shader, " +
                           $"基线要求至少 {minCustom}。缺一个就是简化版, 严格模式拒绝出包(退出码 3)");
            EditorApplication.Exit(3);
        }
    }

    // ---- 门 5: 产物 ----

    private static void VerifyBuildArtifact(string outputPath, bool isDevelopment)
    {
        var fi = new FileInfo(outputPath);
        if (!fi.Exists || fi.Length < 1_000_000)
        {
            Debug.LogError($"[PortBuild] 产物不存在或过小: {outputPath} " +
                           $"({(fi.Exists ? fi.Length : 0)} bytes, 退出码 4)");
            EditorApplication.Exit(4);
            return;
        }
        // 调试签名不允许以 Release 名义出货。
        if (!isDevelopment && !_keystoreApplied)
        {
            Debug.LogError("[PortBuild] Release 构建未配置自定义 keystore(仅调试签名), " +
                           "严格模式拒绝(退出码 4)。CI 需注入 KEYSTORE_* 四件套。");
            EditorApplication.Exit(4);
            return;
        }
        Debug.Log($"[PortBuild] 产物检查通过: {outputPath} = {fi.Length / 1024 / 1024} MB");
        Debug.Log("[PortBuild] OK: 全部门通过");
        EditorApplication.Exit(0);
    }

    // ---- 环境变量 ----

    private static string Env(string key, string fallback)
    {
        var v = Environment.GetEnvironmentVariable(key);
        return string.IsNullOrEmpty(v) ? fallback : v.Trim();
    }

    /// <summary>
    /// 警告基线: 原版脚本自带 CS0169/CS0649 与占位包名/调试签名提示无法消除,
    /// 因此严格模式比的是"不超过已登记基线", 超出即为新引入问题。
    /// </summary>
    private static int MaxWarnings
    {
        get
        {
            // GameCI 只把白名单变量透传进容器, 所以基线同时支持命令行参数 -maxWarnings N。
            var argv = Environment.GetCommandLineArgs();
            for (int i = 0; i + 1 < argv.Length; i++)
            {
                if (argv[i] == "-maxWarnings" && int.TryParse(argv[i + 1], out var n) && n >= 0)
                    return n;
            }
            var raw = Env("STRICT_MAX_WARNINGS", "0");
            return int.TryParse(raw, out var m) && m >= 0 ? m : 0;
        }
    }

    private static int ParseInt(string value, int fallback)
    {
        return int.TryParse(value, out var v) ? v : fallback;
    }

    // AndroidSdkVersions 是离散枚举, 直接强转未定义值会让构建在 PlayerSettings 校验阶段抛错;
    // 这里先 Enum.IsDefined 校验, 不合法就报警并回落到默认。
    private static void ApplyAndroidSdkLevel(string raw, int fallback,
        Action<AndroidSdkVersions> setter, string label)
    {
        var level = ParseInt(raw, fallback);
        var candidate = (AndroidSdkVersions)level;
        if (!Enum.IsDefined(typeof(AndroidSdkVersions), candidate))
        {
            Debug.LogWarning($"[PortBuild] {label}={level} 不是 Unity 2022.3 支持的 AndroidSdkVersions, " +
                             $"回落到 {fallback}。");
            level = fallback;
            candidate = (AndroidSdkVersions)level;
        }
        setter(candidate);
    }

    private static UIOrientation ParseOrientation(string value)
    {
        switch (value)
        {
            case "Portrait": return UIOrientation.Portrait;
            case "PortraitUpsideDown": return UIOrientation.PortraitUpsideDown;
            case "LandscapeRight": return UIOrientation.LandscapeRight;
            case "AutoRotation": return UIOrientation.AutoRotation;
            default: return UIOrientation.LandscapeLeft;
        }
    }

    /// <summary>
    /// 版本号规则(用户指定): 原版 PC 版本号 + 修改次数, 由 tools/bump_version.py 写进 ProjectSettings。
    /// 环境变量 BUILD_VERSION 仍然优先, 便于临时覆盖。
    /// </summary>
    private static string GetBuildVersion()
    {
        // v0.58: 显示用版本号只认移植版本, 不再把 git 提交计数(1.5.0.174 这种)当版本名,
        // 那个数字每推一次就跳, 装到手机上完全看不出是第几版移植。
        var env = Environment.GetEnvironmentVariable("PORT_VERSION_NAME");
        if (!string.IsNullOrEmpty(env)) return env;
        return PortVersionName;   // 形如 0.58
    }

    /// <summary>bundleVersionCode 由版本号推导, 保证每次安装都是递增的。</summary>
    private static int GetBundleVersionCode()
    {
        var env = Environment.GetEnvironmentVariable("BUNDLE_VERSION_CODE");
        if (!string.IsNullOrEmpty(env)) return ParseInt(env, 1);

        // 单调递增仍用 git 提交计数(BUILD_VERSION=1.5.0.<n>), 只是不再显示成版本名
        var ver = Environment.GetEnvironmentVariable("BUILD_VERSION");
        if (string.IsNullOrEmpty(ver)) ver = PlayerSettings.bundleVersion;
        var parts = ver.Split('.');
        int major = parts.Length > 0 ? ParseInt(parts[0], 1) : 1;
        int minor = parts.Length > 1 ? ParseInt(parts[1], 5) : 5;
        int patch = parts.Length > 2 ? ParseInt(parts[2], 0) : 0;
        int rev = parts.Length > 3 ? ParseInt(parts[3], 0) : 0;
        return major * 10000 + minor * 100 + patch + rev;
    }

    private static string GetOutputPath()
    {
        // 出 AAB 还是 APK 由环境变量控制; 冒烟调试默认 APK。
        var aab = Env("BUILD_AAB", "0") == "1";
        return aab ? "builds/android/Stacklands-Port.aab" : "builds/android/Stacklands-Port.apk";
    }

    private static bool ApplyKeystoreIfConfigured()
    {
        var ksName = Environment.GetEnvironmentVariable("KEYSTORE_NAME");
        if (string.IsNullOrEmpty(ksName))
        {
            Debug.LogWarning("[PortBuild] 未配置 KEYSTORE_NAME, 走 Unity 调试签名(仅内部冒烟, 不可发布)。");
            return false;
        }

        PlayerSettings.Android.useCustomKeystore = true;
        PlayerSettings.Android.keystoreName = ksName;
        PlayerSettings.Android.keystorePass = Environment.GetEnvironmentVariable("KEYSTORE_PASSWORD");
        PlayerSettings.Android.keyaliasName = Environment.GetEnvironmentVariable("KEYALIAS_NAME");
        PlayerSettings.Android.keyaliasPass = Environment.GetEnvironmentVariable("KEYALIAS_PASSWORD");
        return true;
    }
}
#endif
