# Stacklands 安卓 IL2CPP 移植工程 · 交付索引

> 目标：基于 PC Mono 原版导出物，**一比一复刻原版行为**重建 Unity 工程并出 Android IL2CPP 包；禁止简化 / Demo 化 / 占位 shader。
> 本目录为规划与前置扫描阶段产物；可执行代码、shader 源码随迭代逐步落地。

## 锁定基线（来自源包实测）

| 项 | 实测值 |
|---|---|
| 引擎版本 | **Unity 2022.3.4f1**（与导出源严格对齐，禁止跨大版本） |
| 源后端 | PC **Mono**（含 MonoBleedingEdge / mscorlib.dll） |
| 目标后端 | **IL2CPP**（Android） |
| 游戏逻辑程序集 | **GameScripts.dll**（未混淆，353 个 MonoScript） |
| 引导程序集 | Assembly-CSharp.dll（8KB 薄引导）、Assembly-CSharp-firstpass.dll（35 脚本） |
| 场景 | `Assets/Scenes/SampleScene.unity`、`Assets/SokpopIntro/IntroScene.unity` |
| Steam AppID | 1948280；DLC 2446110(Cursed Worlds)、2867570(2000)；另含 Cities / Spirits 两个 UnityFS bundle |

## 静态扫描要点（详见 docs/scan_report.md）

- 对象总量 24605：GameObject 6576、MonoBehaviour 2407、MonoScript 1319、Texture2D 753、Sprite 622、Shader 222、ComputeShader 12、AudioClip 137、Material 118、Mesh 37、Font 13、TextAsset 15、ParticleSystem 4。
- 脚本→程序集：GameScripts 353、Unity.InputSystem 318、UnityEngine.TestRunner 110(测试,剔除)、Steamworks.NET 100、UnityEngine.UI 80、ShapesRuntime 69、Timeline 64、PostProcessing 56、TMP 54、firstpass 35、UImGui 34、SokLoc 10、Sirenix 序列化若干、DOTween 9、Navigation 5、csS 3、SokSheet 1。
- 扫描告警：MonoBehaviour 2407（UnityPy 仅可读 35，2372 因 TypeTree 缺失待 AssetRipper 复核）；空脚本引用 0；引用但 Managed 未提供 `UnityEngine.TestRunner`(110, 测试程序集)、`ShapesEditor`(1, 编辑器程序集)，均非运行时阻断项。
- 自研/改编 shader **30 个**（其中 `Custom/` 20，另有 Sprites/Transition/Unlit/开篇后处理 10；见 docs/03）；12 个 ComputeShader 全部属于 PostProcessing 栈。

## 文档导航

| 文档 | 内容 |
|---|---|
| [docs/01_源包静态扫描结论.md](docs/01_源包静态扫描结论.md) | 源包构成、DLL 托管/原生分类、资源清单、扫描告警与局限 |
| [docs/02_移植主方案.md](docs/02_移植主方案.md) | 阶段划分、工程重建、脚本回填、资源引用链保留原则、目录映射 |
| [docs/03_Shader工具链.md](docs/03_Shader工具链.md) | ShaderRipper→3Dmigoto HLSLDecompiler→spirv-cross 保真链、变体校验、30 个自研/改编 shader 台账 |
| [docs/04_IL2CPP与兼容风险.md](docs/04_IL2CPP与兼容风险.md) | 反射/反射emit/Harmony/MonoMod/动态编译裁剪风险、保留策略、桩接边界 |
| [docs/05_平台适配与原生插件.md](docs/05_平台适配与原生插件.md) | Steamworks / cimgui / Google Sheets / DLC bundle 的 Android 处置 |
| [docs/06_GitHubActions_GameCI.md](docs/06_GitHubActions_GameCI.md) | CI 流水线、密钥、缓存、IL2CPP 构建与产物归档 |
| [docs/07_冒烟测试清单.md](docs/07_冒烟测试清单.md) | 启动/场景/UI/本地化/音频/Shader/存档/DLC 分级冒烟用例 |
| [docs/08_构建排查指引.md](docs/08_构建排查指引.md) | 编译/链接/裁剪/元数据丢失/运行时堆栈分类排查路径 |
| [docs/09_Steam调用清单与守卫.md](docs/09_Steam调用清单与守卫.md) | Steam/UGC 方法级调用清单与桩接守卫表 |
| [docs/10_AssetRipper导出校验清单.md](docs/10_AssetRipper导出校验清单.md) | 工程重建后目录/脚本/资源/场景核对项与出口标准 |
| [docs/11_配置本地化DLC盘点.md](docs/11_配置本地化DLC盘点.md) | TextAsset/存档模板/字符集/DLC bundle/混音器链路盘点 |
| [docs/12_工具链版本与安装清单.md](docs/12_工具链版本与安装清单.md) | Unity/AssetRipper/反编译/Shader/抓帧工具版本与安装 |
| [docs/13_仓库结构与版本管理.md](docs/13_仓库结构与版本管理.md) | 仓库布局/入库排除清单/分支策略/版本对齐 |
| [docs/14_交付清单与环境限制.md](docs/14_交付清单与环境限制.md) | 归档内容、锁定基线、环境限制与待补全占位项 |
| [docs/15_反编译落地后待办清单.md](docs/15_反编译落地后待办清单.md) | 反编译/编辑器/真机落地后的待办事项、前置条件与验收标准 |
| [.github/workflows/unity-android-il2cpp.yml](.github/workflows/unity-android-il2cpp.yml) | GameCI 工作流模板（待按仓库实际参数填值） |
| [.gitignore](.gitignore) | Unity + 移植工程忽略清单 |
| [tools/scan_static.py](tools/scan_static.py) | 前置静态扫描脚本（只读，输出 md+json） |
| [tools/scan_il2cpp_risks.py](tools/scan_il2cpp_risks.py) | 反编译源码 IL2CPP 风险 API 扫描 |
| [tools/scan_blocked_metadata.py](tools/scan_blocked_metadata.py) | 托管 DLL 元数据级阻断子系统 / PInvoke 预扫描 |
| [tools/scan_platform_refs.py](tools/scan_platform_refs.py) | Steamworks / Google.Apis 类型与成员引用核对 |
| [tools/scan_type_inventory.py](tools/scan_type_inventory.py) | 自研程序集 TypeDef 清单与脚本回填映射 |
| [tools/scan_method_inventory.py](tools/scan_method_inventory.py) | 自研程序集 MethodDef 清单与 Unity 生命周期消息核对 |
| [tools/scan_field_inventory.py](tools/scan_field_inventory.py) | 自研程序集 FieldDef 清单与枚举成员取值核对 |
| [tools/scan_property_event_inventory.py](tools/scan_property_event_inventory.py) | 自研程序集 PropertyDef/EventDef 清单与访问器关联 |
| [tools/scan_attribute_inventory.py](tools/scan_attribute_inventory.py) | 自研程序集 CustomAttribute 特性分桶与归属核对 |
| [tools/scan_dependency_inventory.py](tools/scan_dependency_inventory.py) | 程序集引用闭包 / 内嵌资源与磁盘 DLL 交叉核对 |
| [tools/scan_interface_member.py](tools/scan_interface_member.py) | 接口实现 (InterfaceImpl) 与外部成员引用 (MemberRef) 核对 |
| [tools/scan_metadata_overview.py](tools/scan_metadata_overview.py) | 七份台账汇总主表与跨台账一致性断言 |
| [tools/reconstruct_source.py](tools/reconstruct_source.py) | 源包分卷拼接/侧车归位/版本与大小校验 |
| [tools/extract_shader_blobs.py](tools/extract_shader_blobs.py) | Shader/ComputeShader blob 与元数据提取 |
| [tools/extract_pass_state.py](tools/extract_pass_state.py) | 导出 pass 渲染状态（ZTest/ZWrite/Blend/Stencil/ColorMask）并去重成组合 |
| [tools/extract_signatures.py](tools/extract_signatures.py) | 解析 ISGN/OSGN：顶点输入布局 + VS↔PS 链接校验 |
| [tools/extract_dxbc_programs.py](tools/extract_dxbc_programs.py) | LZ4 解码 shader blob + 切出 DXBC 程序段（VS/PS 分阶段） |
| [tools/build_shader_worklist.py](tools/build_shader_worklist.py) | 30 个自研 shader 分族 + 差集 + 风险，生成保真链工作单 |
| [tools/export_content_inventory.py](tools/export_content_inventory.py) | TextAsset/DLC bundle/混音器链路盘点 |
| [shader_extract/shader_ledger.md](shader_extract/shader_ledger.md) | Shader 台账（属性/关键字/blob 大小） |
| [shader_extract/pass_state.md](shader_extract/pass_state.md) | 58 pass → 14 种状态组合 + 反常规项 |
| [shader_extract/signature_ledger.md](shader_extract/signature_ledger.md) | 30 shader 顶点输入/插值通道/链接校验台账 |
| [shader_extract/dxbc_ledger.md](shader_extract/dxbc_ledger.md) | 30 shader / 502 段 DXBC 程序台账（含阶段与体积） |
| [shader_extract/shader_worklist.md](shader_extract/shader_worklist.md) | Shader 保真链工作单（15 族/差集/风险/验收） |
| [blocked_metadata/blocked_metadata.md](blocked_metadata/blocked_metadata.md) | 阻断子系统引用与原生 PInvoke 元数据台账 |
| [platform_refs/platform_refs.md](platform_refs/platform_refs.md) | Steamworks / Google.Apis 类型与成员引用台账 |
| [type_inventory/type_inventory.md](type_inventory/type_inventory.md) | 自研程序集类型清单与回填映射台账 |
| [method_inventory/method_inventory.md](method_inventory/method_inventory.md) | 自研程序集方法清单与生命周期消息台账 |
| [field_inventory/field_inventory.md](field_inventory/field_inventory.md) | 自研程序集字段清单与枚举取值台账 |
| [property_event_inventory/property_event_inventory.md](property_event_inventory/property_event_inventory.md) | 自研程序集属性/事件清单台账 |
| [attribute_inventory/attribute_inventory.md](attribute_inventory/attribute_inventory.md) | 自研程序集 CustomAttribute 特性台账 |
| [dependency_inventory/dependency_inventory.md](dependency_inventory/dependency_inventory.md) | 程序集引用闭包与内嵌资源台账 |
| [interface_member_inventory/interface_member_inventory.md](interface_member_inventory/interface_member_inventory.md) | 接口实现与外部成员引用台账 |
| [docs/metadata_overview.md](docs/metadata_overview.md) | 元数据总览主表与一致性断言（31 项） |
| [tools/lint_unity_api_usage.py](tools/lint_unity_api_usage.py) | C# 静态门：括号/守卫/using/API 白名单 |
| [docs/api_verified.json](docs/api_verified.json) | Unity 2022.3 API 使用白名单（逐条附文档页） |
| [tools/preflight_project.py](tools/preflight_project.py) | 首跑前置检查（11 项逐条判定 + Step Summary 表格） |
| [tools/verify_apk.py](tools/verify_apk.py) | 严格产物审计：拆 APK/AAB 校验 IL2CPP 单 ABI、元数据、Mono 残留、包名 |
| [tools/selftest_strict.py](tools/selftest_strict.py) | 审计脚本自测（合成包/日志断言退出码，纳入 CI） |
| [tools/strict_log_audit.py](tools/strict_log_audit.py) | 严格日志审计：Unity 退出码 0 但日志有 error/warning 也判失败 |
| [Assets/Editor/PortBuild.cs](Assets/Editor/PortBuild.cs) | 构建胶水（严格模式五道门 + 退出码语义） |
| [Assets/Plugins/link.xml](Assets/Plugins/link.xml) | IL2CPP 裁剪保留清单 |
| [Assets/Plugins/PlatformStubs/](Assets/Plugins/PlatformStubs/) | Steam/ImGui/在线服务桩接骨架 |

## 迭代汇报格式（每次迭代固定）

```
【当前进度】阶段 x/y · 里程碑
【已修复清单】1) … 2) …
【新增风险】…
【下一步动作】…
```
