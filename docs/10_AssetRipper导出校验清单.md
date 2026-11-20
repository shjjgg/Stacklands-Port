# 10 · AssetRipper 导出工程校验清单

> 阶段：P1 工程重建。用与 **Unity 2022.3.4f1** 匹配的 AssetRipper 版本打开还原后的 `Stacklands_Data`，导出 Unity 工程后，按本清单逐项核对。基线数字来自 `docs/scan_report.json`（元数据层实测）。

## 1. 前置条件

- [ ] 源目录已由 `tools/reconstruct_source.py` 还原，`reconstruct_report.json` 中 `ready=true`，4 个 `.assets` 版本均为 `2022.3.4f1`。
- [ ] AssetRipper 版本支持 2022.3 LTS；导出目标工程 Unity 版本锁定 2022.3.4f1。
- [ ] 导出选项：导出为 Unity 工程（非单个 asset bundle）；脚本反编译开启；保留原始目录层级与资源路径。
- [ ] 工程首次用 2022.3.4f1 编辑器打开，等待导入完成，记录 Console 报错/警告基线。

## 2. 版本与工程设置

| 检查项 | 预期 | 结果 |
|---|---|---|
| 编辑器版本 | 2022.3.4f1 | ☐ |
| 脚本运行时 | .NET 4.x / 同原版 | ☐ |
| 后端（导出期） | 先 Mono 跑通编辑器，再切 IL2CPP | ☐ |
| 产品名/公司 | Stacklands / sokpop | ☐ |
| 场景列表 | `IntroScene.unity`、`SampleScene.unity` 且顺序正确 | ☐ |
| 图形 API | 与原版一致；Android 目标 Vulkan + GLES3 | ☐ |

## 3. 场景 / Prefab 数量对齐（基线核对）

| 类型 | 元数据基线 | 工程内数量 | 偏差说明 |
|---|---:|---:|---|
| GameObject | 6576 | ☐ | |
| Transform | 5838 | ☐ | |
| RectTransform | 738 | ☐ | |
| SpriteRenderer | 5096 | ☐ | |
| MonoBehaviour | 2407 | ☐ | |
| Texture2D | 753 | ☐ | |
| Sprite | 622 | ☐ | |
| Material | 118 | ☐ | |
| Mesh | 37 | ☐ | |
| AudioClip | 137 | ☐ | |
| Font | 13 | ☐ | |
| TextAsset | 15 | ☐ | |
| ParticleSystem | 4 | ☐ | |

> 数量明显偏少 = 资源未导入或断链；偏多 = 导出重复，需排查。

## 4. 脚本 / 程序集绑定

- [ ] `GameScripts` 353 个脚本类全部回填，命名空间与类名与原版一致（未混淆）。
- [ ] `Assembly-CSharp`、`Assembly-CSharp-firstpass`(35)、`csS` 脚本就位。
- [ ] 2407 个 MonoBehaviour 的 `m_Script` 均解析到真实类；**无 `Missing Script`**。
- [ ] 程序集引用对齐 `scan_report.json` 的 `scripts_by_assembly`；`UnityEngine.TestRunner`(110)、`ShapesEditor`(1) 标记为测试/编辑器，不进 Player。
- [ ] 反编译源码可编译通过；无缺失 using / 类型引用。
- [ ] 重点复核元数据层不可读的 2372 个 MonoBehaviour：在编辑器内确认其脚本类型与序列化字段。

## 5. 资源引用链

- [ ] 贴图/Sprite：753 Texture2D / 622 Sprite 无红框缺失；图集切片、pivot、border 与原版一致。
- [ ] 字体/TMP：13 个字体与全部 TMP SDF 字体资产、材质就位；CJK（NotoSans JP/KR/SC/TC）不缺失。
- [ ] 材质：118 个 Material 引用的 Shader、贴图、参数值保留；属性名对照 `shader_extract/shader_ledger.json`。
- [ ] 网格/碰撞体：37 Mesh、BoxCollider/MeshCollider 绑定正确。
- [ ] 音频：137 AudioClip + AudioMixer 链路完整，引用不丢。
- [ ] TextAsset：15 个（CharSet、换行规则、VillagerNames、存档模板、CodeReferencedCards）路径不变。
- [ ] Resources 路径：`cards/main_cards/...`、`boosters/main_boosters/...` 相对路径与代码加载字符串一致。

## 6. 动画 / Timeline / 事件

- [ ] AnimatorController、状态机、参数、Avatar、动画事件完整保留，状态/参数未重命名。
- [ ] Timeline 轨道、绑定标记、信号槽与脚本事件调用顺序保留。
- [ ] `RuntimeInitializeOnLoad` 入口核对：Sirenix 序列化初始化、InputSystem 初始化保留；`SteamManager.InitOnPlayMode` 按桩接方案摘除并改由 `PlatformBootstrap` 接管。

## 7. Shader / ComputeShader

- [ ] 30 个自研/改编 shader（`Custom/` 20 + Sprites/Transition/Unlit/开篇 10）在工程内可定位；blob 与 `shader_extract/blobs/` 对应。
- [ ] 12 个后处理 ComputeShader 就位（Histogram/AutoExposure/Bloom/VO/LUT/Vectorscope/Waveform 等）。
- [ ] 首遍不要求 shader 已移植编译通过；先记录哪些材质 shader 解析失败、哪些变体缺失，纳入 03 台账。

## 8. DLC Bundle

- [ ] `cities_dlc`、`spirits_dlc`（UnityFS, 2022.3.4f1）原样置于 `Assets/StreamingAssets` 或指定目录，未拆包进主工程。
- [ ] bundle 内部资产路径与原版一致；加载入口可按本地 bundle 存在性判定。

## 9. 导出后常见问题分流

| 现象 | 归类 | 回查文档 |
|---|---|---|
| Missing Script / 类型找不到 | 脚本回填 / 程序集引用 | 02 §5、04 |
| 贴图/字体红框缺失 | 资源断链 | 02 §6、08 §6 |
| 材质粉色 / shader 报错 | Shader 变体/编译 | 03、08 §5 |
| 序列化字段丢失/错位 | TypeTree 缺失/反序列化偏差 | 01 §5、08 §6 |
| 编译引用到 Harmony/Emit/Roslyn | IL2CPP 阻断项 | 04 §1 |
| Steam/UGC 调用报错 | 平台桩接 | 05、09 |

## 10. 出口标准（进入 P2 的门槛）

1. 编辑器可打开两个场景，无致命导入报错；
2. 脚本编译通过，无 Missing Script；
3. §3 数量基线无明显偏差；§5 资源引用无阻断性缺失；
4. 失败项全部登记到对应台账（shader / 脚本 / 资源），并标注静态可检出或待运行时验证。

## 11. 局限声明

AssetRipper 导出的是资源 + 反编译 C#；编辑器元数据覆写、运行时动态绑定、部分 Inspector 序列化值天然缺失。缺失值按同类对象默认值补齐并标注，不臆造原版逻辑；与原版不一致处以 PC 原版抓帧/存档对照为准。
