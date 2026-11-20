# Pass 渲染状态台账

- shader 30 / pass 58 / **去重后状态组合 14**
- 枚举映射经交叉验证：最常见的 `Blend 5/10` 解为 `SrcAlpha / OneMinusSrcAlpha`（标准 alpha 混合）

## 状态组合（按使用次数）

| # | 使用次数 | ShaderLab 状态片段 | 使用者 |
|---|---:|---|---|
| 1 | 20 | `ZTest LessEqual；ZWrite On` | Custom/StatusBar#0, Custom/StatusBar#2, Custom/StatusBar#3, Custom/CardBackShader#0… |
| 2 | 9 | `ZTest LessEqual；ZWrite Off；Blend One One` | Custom/StatusBar#1, Custom/CardBackShader#1, Custom/GenericCardShader#1, Custom/CardShaderTest#1… |
| 3 | 4 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | Custom/SewerPipeShader#0, Custom/TransportArrowShader#0, Custom/EnergyCableShader#0, Custom/TransportArrowMainlandShader#0 |
| 4 | 4 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | Custom/SewerPipeShader#1, Custom/TransportArrowShader#1, Custom/EnergyCableShader#1, Custom/TransportArrowMainlandShader#1 |
| 5 | 4 | `Cull Off；ZTest Disabled；ZWrite On；Blend SrcAlpha OneMinusSrcAlpha；ColorMask 0` | Transition/Default#0, Transition/Spirit#0, Transition/Energy#0, Transition/Cities#0 |
| 6 | 3 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | Custom/ArrowSdfShader#0, Custom/ConveyorArrowShader#0, Custom/ConflictOutlineSdfShader#0 |
| 7 | 3 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | Custom/ArrowSdfShader#1, Custom/ConveyorArrowShader#1, Custom/ConflictOutlineSdfShader#1 |
| 8 | 3 | `Cull Off；ZTest Always；ZWrite Off` | Custom/SpiritTransitionEffect#0, Custom/SpiritImageEffect#0, Postprocess/SokpopIntro#0 |
| 9 | 3 | `Cull Off；ZTest LessEqual；ZWrite Off；Blend One OneMinusSrcAlpha` | Sprites/BackgroundShader#0, Sprites/StatusEffectSpriteShader#0, Sprites/CombatCircleSpriteShader2#0 |
| 10 | 1 | `ZTest LessEqual；ZWrite Off；Blend One OneMinusSrcAlpha；ColorMask GBA` | Custom/GridShader#0 |
| 11 | 1 | `ZTest LessEqual；ZWrite Off；Blend One One；ColorMask GBA` | Custom/GridShader#1 |
| 12 | 1 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask 0；Stencil { Ref 0 Comp Disabled Pass Keep Fail Keep ZFail Keep }；Stencil ReadMask 0 WriteMask 0` | Custom/SuperSampled Texture#0 |
| 13 | 1 | `ZTest LessEqual；ZWrite On；Blend SrcAlpha OneMinusSrcAlpha` | Unlit/CardopediaBackgroundShader#0 |
| 14 | 1 | `Cull Off；ZTest Always；ZWrite Off；Blend One OneMinusSrcAlpha` | Sprites/SpriteOnTop#0 |

## 反常规状态（人工确认）

| Shader | Pass | 状态片段 | 反常规点 |
|---|---|---|---|
| Custom/ArrowSdfShader | 0 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写) |
| Custom/ArrowSdfShader | 1 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写) |
| Custom/SewerPipeShader | 0 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写)；ZTest Disabled(不做深度测试) |
| Custom/SewerPipeShader | 1 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写)；ZTest Disabled(不做深度测试) |
| Custom/ConveyorArrowShader | 0 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写) |
| Custom/ConveyorArrowShader | 1 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写) |
| Transition/Default | 0 | `Cull Off；ZTest Disabled；ZWrite On；Blend SrcAlpha OneMinusSrcAlpha；ColorMask 0` | ColorMask 仅 无(其余通道不写)；Transparent 队列却 ZWrite On(可能造成排序异常)；Cull Off(双面)；ZTest Disabled(不做深度测试) |
| Custom/ConflictOutlineSdfShader | 0 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写) |
| Custom/ConflictOutlineSdfShader | 1 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写) |
| Transition/Spirit | 0 | `Cull Off；ZTest Disabled；ZWrite On；Blend SrcAlpha OneMinusSrcAlpha；ColorMask 0` | ColorMask 仅 无(其余通道不写)；Transparent 队列却 ZWrite On(可能造成排序异常)；Cull Off(双面)；ZTest Disabled(不做深度测试) |
| Custom/SpiritTransitionEffect | 0 | `Cull Off；ZTest Always；ZWrite Off` | Cull Off(双面) |
| Custom/TransportArrowShader | 0 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写)；ZTest Disabled(不做深度测试) |
| Custom/TransportArrowShader | 1 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写)；ZTest Disabled(不做深度测试) |
| Custom/GridShader | 0 | `ZTest LessEqual；ZWrite Off；Blend One OneMinusSrcAlpha；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写) |
| Custom/GridShader | 1 | `ZTest LessEqual；ZWrite Off；Blend One One；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写) |
| Custom/SpiritImageEffect | 0 | `Cull Off；ZTest Always；ZWrite Off` | Cull Off(双面) |
| Custom/EnergyCableShader | 0 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写)；ZTest Disabled(不做深度测试) |
| Custom/EnergyCableShader | 1 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写)；ZTest Disabled(不做深度测试) |
| Custom/SuperSampled Texture | 0 | `ZTest LessEqual；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask 0；Stencil { Ref 0 Comp Disabled Pass Keep Fail Keep ZFail Keep }；Stencil ReadMask 0 WriteMask 0` | ColorMask 仅 无(其余通道不写) |
| Unlit/CardopediaBackgroundShader | 0 | `ZTest LessEqual；ZWrite On；Blend SrcAlpha OneMinusSrcAlpha` | Transparent 队列却 ZWrite On(可能造成排序异常) |
| Custom/TransportArrowMainlandShader | 0 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha OneMinusSrcAlpha；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写)；ZTest Disabled(不做深度测试) |
| Custom/TransportArrowMainlandShader | 1 | `ZTest Disabled；ZWrite Off；Blend SrcAlpha One；ColorMask GBA` | ColorMask 仅 GBA(其余通道不写)；ZTest Disabled(不做深度测试) |
| Sprites/BackgroundShader | 0 | `Cull Off；ZTest LessEqual；ZWrite Off；Blend One OneMinusSrcAlpha` | Cull Off(双面) |
| Sprites/StatusEffectSpriteShader | 0 | `Cull Off；ZTest LessEqual；ZWrite Off；Blend One OneMinusSrcAlpha` | Cull Off(双面) |
| Sprites/CombatCircleSpriteShader2 | 0 | `Cull Off；ZTest LessEqual；ZWrite Off；Blend One OneMinusSrcAlpha` | Cull Off(双面) |
| Transition/Energy | 0 | `Cull Off；ZTest Disabled；ZWrite On；Blend SrcAlpha OneMinusSrcAlpha；ColorMask 0` | ColorMask 仅 无(其余通道不写)；Transparent 队列却 ZWrite On(可能造成排序异常)；Cull Off(双面)；ZTest Disabled(不做深度测试) |
| Transition/Cities | 0 | `Cull Off；ZTest Disabled；ZWrite On；Blend SrcAlpha OneMinusSrcAlpha；ColorMask 0` | ColorMask 仅 无(其余通道不写)；Transparent 队列却 ZWrite On(可能造成排序异常)；Cull Off(双面)；ZTest Disabled(不做深度测试) |
| Sprites/SpriteOnTop | 0 | `Cull Off；ZTest Always；ZWrite Off；Blend One OneMinusSrcAlpha` | Cull Off(双面) |
| Postprocess/SokpopIntro | 0 | `Cull Off；ZTest Always；ZWrite Off` | Cull Off(双面) |

## 逐 pass 明细

| Shader | SubShader | Pass | Queue | RenderType | LightMode | Cull | ZTest | ZWrite | Blend | Stencil | LOD |
|---|---:|---:|---|---|---|---|---|---|---|---|---:|
| Custom/ArrowSdfShader | 0 | 0 | Transparent | Transparent | FORWARDBASE | Back | LessEqual | Off | SrcAlpha/OneMinusSrcAlpha | — | 200 |
| Custom/ArrowSdfShader | 0 | 1 | Transparent | Transparent | FORWARDADD | Back | LessEqual | Off | SrcAlpha/One | — | 200 |
| Custom/StatusBar | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/StatusBar | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/StatusBar | 0 | 2 | — | Opaque | DEFERRED | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/StatusBar | 0 | 3 | — | Opaque | SHADOWCASTER | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/SewerPipeShader | 0 | 0 | Transparent | Transparent | FORWARDBASE | Back | Disabled | Off | SrcAlpha/OneMinusSrcAlpha | — | 200 |
| Custom/SewerPipeShader | 0 | 1 | Transparent | Transparent | FORWARDADD | Back | Disabled | Off | SrcAlpha/One | — | 200 |
| Custom/CardBackShader | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/CardBackShader | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/CardBackShader | 0 | 2 | — | Opaque | DEFERRED | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/ConveyorArrowShader | 0 | 0 | Transparent | Transparent | FORWARDBASE | Back | LessEqual | Off | SrcAlpha/OneMinusSrcAlpha | — | 200 |
| Custom/ConveyorArrowShader | 0 | 1 | Transparent | Transparent | FORWARDADD | Back | LessEqual | Off | SrcAlpha/One | — | 200 |
| Transition/Default | 0 | 0 | Transparent | — | — | Off | Disabled | On | SrcAlpha/OneMinusSrcAlpha | — | 100 |
| Custom/ConflictOutlineSdfShader | 0 | 0 | Transparent | Transparent | FORWARDBASE | Back | LessEqual | Off | SrcAlpha/OneMinusSrcAlpha | — | 200 |
| Custom/ConflictOutlineSdfShader | 0 | 1 | Transparent | Transparent | FORWARDADD | Back | LessEqual | Off | SrcAlpha/One | — | 200 |
| Transition/Spirit | 0 | 0 | Transparent | — | — | Off | Disabled | On | SrcAlpha/OneMinusSrcAlpha | — | 100 |
| Custom/GenericCardShader | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/GenericCardShader | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/GenericCardShader | 0 | 2 | — | Opaque | DEFERRED | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/GenericCardShader | 0 | 3 | — | Opaque | SHADOWCASTER | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/SpiritTransitionEffect | 0 | 0 | — | — | — | Off | Always | Off | One/Zero | — | 0 |
| Custom/CardShaderTest | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/CardShaderTest | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/CardShaderTest | 0 | 2 | — | Opaque | DEFERRED | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/CardShaderTest | 0 | 3 | — | Opaque | SHADOWCASTER | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/TransportArrowShader | 0 | 0 | Transparent | Transparent | FORWARDBASE | Back | Disabled | Off | SrcAlpha/OneMinusSrcAlpha | — | 200 |
| Custom/TransportArrowShader | 0 | 1 | Transparent | Transparent | FORWARDADD | Back | Disabled | Off | SrcAlpha/One | — | 200 |
| Custom/BoosterShaderTop | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/BoosterShaderTop | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/BoosterShaderTop | 0 | 2 | — | Opaque | DEFERRED | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/BoosterShaderTop | 0 | 3 | — | Opaque | SHADOWCASTER | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/GridShader | 0 | 0 | Transparent | Opaque | FORWARDBASE | Back | LessEqual | Off | One/OneMinusSrcAlpha | — | 200 |
| Custom/GridShader | 0 | 1 | Transparent | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/SpiritImageEffect | 0 | 0 | — | — | — | Off | Always | Off | One/Zero | — | 0 |
| Custom/EnergyCableShader | 0 | 0 | Transparent | Transparent | FORWARDBASE | Back | Disabled | Off | SrcAlpha/OneMinusSrcAlpha | — | 200 |
| Custom/EnergyCableShader | 0 | 1 | Transparent | Transparent | FORWARDADD | Back | Disabled | Off | SrcAlpha/One | — | 200 |
| Custom/FloorShaderForest | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/FloorShaderForest | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/SuperSampled Texture | 0 | 0 | Transparent | Transparent | — | Back | LessEqual | Off | SrcAlpha/OneMinusSrcAlpha | Disabled PKeep R0 | 0 |
| Unlit/CardopediaBackgroundShader | 0 | 0 | Transparent | Opaque | — | Back | LessEqual | On | SrcAlpha/OneMinusSrcAlpha | — | 100 |
| Custom/TransportArrowMainlandShader | 0 | 0 | Transparent | Transparent | FORWARDBASE | Back | Disabled | Off | SrcAlpha/OneMinusSrcAlpha | — | 200 |
| Custom/TransportArrowMainlandShader | 0 | 1 | Transparent | Transparent | FORWARDADD | Back | Disabled | Off | SrcAlpha/One | — | 200 |
| Sprites/BackgroundShader | 0 | 0 | Transparent | Transparent | — | Off | LessEqual | Off | One/OneMinusSrcAlpha | — | 0 |
| Sprites/StatusEffectSpriteShader | 0 | 0 | Transparent | Transparent | — | Off | LessEqual | Off | One/OneMinusSrcAlpha | — | 0 |
| Custom/FloorShader | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/FloorShader | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Sprites/CombatCircleSpriteShader2 | 0 | 0 | Transparent | Transparent | — | Off | LessEqual | Off | One/OneMinusSrcAlpha | — | 0 |
| Transition/Energy | 0 | 0 | Transparent | — | — | Off | Disabled | On | SrcAlpha/OneMinusSrcAlpha | — | 100 |
| Custom/FloorShaderIsland | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/FloorShaderIsland | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/BoosterShader | 0 | 0 | — | Opaque | FORWARDBASE | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/BoosterShader | 0 | 1 | — | Opaque | FORWARDADD | Back | LessEqual | Off | One/One | — | 200 |
| Custom/BoosterShader | 0 | 2 | — | Opaque | DEFERRED | Back | LessEqual | On | One/Zero | — | 200 |
| Custom/BoosterShader | 0 | 3 | — | Opaque | SHADOWCASTER | Back | LessEqual | On | One/Zero | — | 200 |
| Transition/Cities | 0 | 0 | Transparent | — | — | Off | Disabled | On | SrcAlpha/OneMinusSrcAlpha | — | 100 |
| Sprites/SpriteOnTop | 0 | 0 | Transparent | Transparent | — | Off | Always | Off | One/OneMinusSrcAlpha | — | 0 |
| Postprocess/SokpopIntro | 0 | 0 | — | — | — | Off | Always | Off | One/Zero | — | 0 |
