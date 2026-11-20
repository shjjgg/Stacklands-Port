# 03 · Shader 工具链与保真台账

> 硬性约束：**不美化、不重命名变量、不重构控制流**；反编译产物以二进制保真度为最高优先级，人类可读性让位于保真。AssetRipper 自带 shader 反编译仅作参考，不直接采信。禁止占位 / 粉色兜底 shader 糊弄。

## 1. 工具链（固定顺序）

> 第①步 blob 提取已脚本化：`tools/extract_shader_blobs.py`，实测从本批源包导出 **222 个 Shader blob（游戏自研/改编 30，其中 `Custom/` 20）+ 12 个 ComputeShader**，台账见 `shader_extract/shader_ledger.md/.json`（含每个 shader 的属性名、关键字、SubShader 数、blob 大小）。

```
原版 .assets 内 Shader 序列化 blob
   │  ① ShaderRipper: 提取 Unity shader blob（字节码/变体/常量缓冲/贴图槽/关键字）
   ▼
② bo3b / 3Dmigoto 原生 HLSLDecompiler: 输出机器友好的原始反编译 HLSL
   │   · 保留原始变量名/寄存器/控制流, 不做重排与美化
   │   · 记录每个 Pass 的 Tags、LOD、ZWrite/ZTest/Blend/Cull/Queue/渲染队列
   ▼
③ spirv-cross: 按目标后端 (Vulkan SPIR-V / GLES HLSL→GLSL) 交叉转换
   │
   ▼
④ 手工补全: 缺失宏、Pass、Tags、贴图绑定、属性默认值; 对照 blob 字节核对
   │
   ▼
⑤ RenderDoc 抓帧比对: PC 原版 vs Android 包, 逐 Pass 校验变体/输出
```

### 各步骤产出物

| 步骤 | 产出 | 存放 |
|---|---|---|
| ① | 每个 shader 的原始 blob、变体清单、常量缓冲布局、采样器槽位 | `Assets/Shaders/_blobs/<name>/` |
| ② | 原始反编译 HLSL（未美化） | `Assets/Shaders/_hlsl_raw/<name>.hlsl` |
| ③ | spirv-cross 转换中间产物 | `Assets/Shaders/_spirv/<name>/` |
| ④ | 可被 2022.3.4f1 编译的 ShaderLab + HLSL | `Assets/Shaders/<name>.shader` |
| ⑤ | 抓帧截图/变体命中记录 | `docs/shader_verify/<name>/` |

## 2. 自研 / 改编 Shader 台账（30 个，P4 重点）

> 全部 blob 已导出至 `shader_extract/blobs/`，属性名/关键字见 `shader_extract/shader_ledger.json`。
> 其余 192 个为官方内置/引擎栈（Standard、Hidden/PostProcessing/*、Shapes/*、TextMeshPro/*、DearImGui、Particles、Skybox、UI/*）。

### 2.1 Custom/*（20 个）

| Shader | 推断用途 | 风险点 | 校验重点 |
|---|---|---|---|
| Custom/ArrowSdfShader | 箭头 SDF | SDF 距离函数、抗锯齿 | 边缘锯齿/缩放 |
| Custom/BoosterShader | 增益道具底图 | 贴图混合/遮罩 | 叠层顺序 |
| Custom/BoosterShaderTop | 增益道具上层 | 同上 | |
| Custom/CardBackShader | 卡背 | 边框/底色参数 | 卡背显示 |
| Custom/CardShaderTest | 卡牌测试/通用卡面 | 主卡面流程 | 卡牌正面 |
| Custom/ConflictOutlineSdfShader | 冲突描边 SDF | 描边宽度/颜色 | 冲突高亮 |
| Custom/ConveyorArrowShader | 传送带箭头 | 流动动画/UV 滚动 | 帧动画方向 |
| Custom/EnergyCableShader | 线缆 | 贴图分片/连接点 | 线缆拼接 |
| Custom/FloorShader | 地块 | 平铺/噪声 | 地表纹理 |
| Custom/FloorShaderForest | 森林地块 | 变体参数 | 地表纹理 |
| Custom/FloorShaderIsland | 岛屿地块 | 水边过渡 | 岸线过渡 |
| Custom/GenericCardShader | 通用卡牌 | 主卡面通用路径 | 卡牌正面 |
| Custom/GridShader | 网格 | 线宽/坐标 | 网格对齐 |
| Custom/SewerPipeShader | 下水道管道 | 分层/前后遮挡 | 遮挡关系 |
| Custom/SpiritImageEffect | 灵体图像特效 | 后处理/透明混合 | 灵体质感 |
| Custom/SpiritTransitionEffect | 灵体转场 | 全屏转场 Pass | 转场时序 |
| Custom/StatusBar | 状态条 | 填充/颜色渐变 | 血量/状态条 |
| Custom/SuperSampled Texture | 超采样贴图 | 采样倍率/RT | 清晰度 |
| Custom/TransportArrowMainlandShader | 大陆运输箭头 | 路径箭头 | 方向/流向 |
| Custom/TransportArrowShader | 运输箭头 | 路径箭头 | 方向/流向 |

### 2.2 Sprites / Transition / Unlit / 开篇后处理（10 个）

| Shader | 推断用途 | 校验重点 |
|---|---|---|
| Sprites/BackgroundShader | 背景贴图 | 平铺/叠加 |
| Sprites/CombatCircleSpriteShader2 | 战斗圈精灵 | 圈体表现 |
| Sprites/SpriteOnTop | 置顶精灵 | 渲染层级/深度 |
| Sprites/StatusEffectSpriteShader | 状态效果精灵 | 状态图标表现 |
| Transition/Cities | 城市 DLC 转场 | 转场 Pass |
| Transition/Default | 默认转场 | 转场时序 |
| Transition/Energy | 能量转场 | 过渡效果 |
| Transition/Spirit | 灵体转场 | 透明混合 |
| Unlit/CardopediaBackgroundShader | 图鉴背景 | 底色/贴图 |
| Postprocess/SokpopIntro | 开篇 Logo 后处理 | 开场画面 |

## 3. 后处理栈与 ComputeShader

- 12 个 ComputeShader 全部属于 PostProcessing 栈：`AutoExposure`、`ExposureHistogram`、`GaussianDownsample`、`Histogram`、`Lut3DBaker`、`MultiScaleVODownsample1/2`、`MultiScaleVORender`、`MultiScaleVOUpsample`、`Texture3DLerp`、`Vectorscope`、`Waveform`。
- 随 `Unity.Postprocessing.Runtime.dll` 一起迁移；在 Android 上核对 ComputeShader 在 Vulkan/GLES3 的可编译性，直方图/多尺度 VO 降采样链路逐一抓帧确认。
- `Hidden/PostProcessing/*`（Bloom/Copy/CopyStd 等）与 `SkyboxProcedural` 走引擎/官方栈，优先用同版本内置实现，仅在渲染不一致时回查 blob；`Postprocess/SokpopIntro` 属游戏自研，见 2.2。

## 4. 变体与关键字

- 从 blob 提取每个 shader 的关键字（`#pragma multi_compile / shader_feature`）、RT 类型、雾效/贴片/UI 变体；建成变体表。
- Android 目标图形 API：**Vulkan 优先，GLES3 兼容**；逐变体在两种后端抓帧，记录未命中/粉色/黑块。
- TMP SDF 材质（Anton/Bangers/Consolas/NotoSans*/Roboto/Oswald/Varela 等）走 TMP 内置 SDF shader，核对 Atlus 模式与 SDF 缩放参数不丢。

## 5. 手工补全清单（编译报错时逐项溯源，禁止自动美化）

1. **宏**：补齐 `#pragma multi_compile/shader_feature`、`#define` 关键字、平台宏 `SHADER_API_VULKAN/GLES`。
2. **Pass**：补全缺失 Pass 的 `Tags`（LightMode/Queue/RenderType）、`ZWrite/ZTest/Blend/Cull`、`LOD`。
3. **贴图绑定**：按 blob 采样器槽位回填 `_MainTex`/遮罩/法线/法线图集等属性名与默认值；保持原版属性名。
4. **常量缓冲**：按反编译布局回填 CBUFFER 字段顺序，避免字段错位导致的颜色/尺寸错乱。
5. **控制流/变量**：保留反编译原始命名与结构；如确需改名，仅在隔离的适配层做别名映射，并在台账记录原名。

## 6. 校验流程

1. PC 原版用 RenderDoc 抓关键画面：主菜单、卡牌桌面、冲突高亮、线缆/传送带、灵体转场、后处理 Bloom。
2. Android 包同机位抓帧，逐 Pass 对比颜色、Alpha、描边、平铺、流动方向。
3. 变体缺失表现为粉色材质/黑块/锯齿；先回原始 shader blob 核对反编译是否漏变体，再补宏与 Pass，**不靠替换通用 shader 掩盖**。

## 7. 禁止项

- 禁止用 `UI/Default`、`Sprites/Default` 等通用 shader 占位自研效果。
- 禁止对 3Dmigoto 反编译结果自动重排、重命名变量、简化分支。
- 禁止删除未理解用途的 Pass/关键字；存疑先保留并在台账标注待运行时验证。
