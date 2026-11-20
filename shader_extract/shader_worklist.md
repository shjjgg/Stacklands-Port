# Shader 保真链工作单

- 来源: `shader_extract/shader_ledger.json`（扫描时间 2026-11-20T19:51:39）
- 目标 shader: 30 个（自研/改编 30 = Custom/ 20 + Sprites/Transition/Unlit 等 10）
- 分族阈值: 属性 Jaccard ≥ 0.55 且关键字签名相容

## 族 F1: Custom/ArrowSdfShader, Custom/SewerPipeShader, Custom/ConveyorArrowShader, Custom/TransportArrowShader, Custom/EnergyCableShader, Custom/TransportArrowMainlandShader

- 成员 6 个；公共属性 8 个：_Color, _End, _LineThickness, _Noise, _OutlineColor, _OutlineThickness, _SideLength, _Start
- 族内差集属性 13 个：_CarColor, _CircleColor, _CircleNoise, _DrawCircle, _Filled, _Gap, _HighlightAmount, _IsBehind, _LineColor, _Middle, _SecondColor, _ThickColor, _ZTestCable
- 关键字并集 25 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/ArrowSdfShader | Custom | 4889 | 42628 | 15 (8/7) | 8 | 25 | 1 | — | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/SewerPipeShader | Custom | 5091 | 43540 | 15 (8/7) | 13 | 25 | 1 | _HighlightAmount, _IsBehind, _Middle, _ThickColor, _ZTestCable | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/ConveyorArrowShader | Custom | 4801 | 40756 | 15 (8/7) | 10 | 25 | 1 | _Filled, _Gap | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/TransportArrowShader | Custom | 5182 | 46784 | 15 (8/7) | 14 | 25 | 1 | _CarColor, _HighlightAmount, _IsBehind, _LineColor, _Middle, _ZTestCable | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/EnergyCableShader | Custom | 5389 | 52004 | 15 (8/7) | 13 | 25 | 1 | _DrawCircle, _IsBehind, _Middle, _SecondColor, _ZTestCable | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/TransportArrowMainlandShader | Custom | 5127 | 46788 | 15 (8/7) | 14 | 25 | 1 | _CircleColor, _CircleNoise, _HighlightAmount, _IsBehind, _Middle, _ZTestCable | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |

## 族 F2: Transition/Default, Transition/Spirit, Transition/Energy, Transition/Cities

- 成员 4 个；公共属性 9 个：_ColorMask, _MainTex, _Stencil, _StencilComp, _StencilOp, _StencilReadMask, _StencilWriteMask, _TransitionAmount, _TransitionTex
- 族内差集属性 3 个：_Color2, _NoiseTex, _TransitionColor
- 关键字并集 4 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Transition/Default | Game | 900 | 1960 | 2 (1/1) | 9 | 4 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |
| Transition/Spirit | Game | 1035 | 2288 | 2 (1/1) | 9 | 4 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |
| Transition/Energy | Game | 908 | 1980 | 2 (1/1) | 10 | 4 | 1 | _TransitionColor | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |
| Transition/Cities | Game | 1575 | 5256 | 2 (1/1) | 11 | 4 | 1 | _Color2, _NoiseTex | 非可改贴图 2 个 |

## 族 F3: Custom/FloorShaderForest, Custom/FloorShader, Custom/FloorShaderIsland

- 成员 3 个；公共属性 11 个：_Color, _Color2, _EdgeColor, _EdgeThickness, _Glossiness, _MainTex, _Metallic, _OffsetTex, _Rect, _StoneColor, _StoneEdge
- 族内差集属性 6 个：_FaceColor, _IslandDownsize, _OutlineColor, _OutlineWidth, _SdfTex, _WaterColor
- 关键字并集 25 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/FloorShaderForest | Custom | 6459 | 61732 | 22 (13/9) | 11 | 25 | 1 | — | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/FloorShader | Custom | 6725 | 68408 | 22 (13/9) | 11 | 25 | 1 | — | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/FloorShaderIsland | Custom | 7110 | 79116 | 22 (13/9) | 17 | 25 | 1 | _FaceColor, _IslandDownsize, _OutlineColor, _OutlineWidth, _SdfTex, _WaterColor | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |

## 族 F4: Sprites/StatusEffectSpriteShader, Sprites/CombatCircleSpriteShader2, Sprites/SpriteOnTop

- 成员 3 个；公共属性 3 个：PixelSnap, _Color, _MainTex
- 族内差集属性 3 个：_ColorA, _ColorB, _FillAmount
- 关键字并集 5 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Sprites/StatusEffectSpriteShader | Game | 1251 | 4388 | 4 (2/2) | 6 | 5 | 1 | _ColorA, _ColorB, _FillAmount | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |
| Sprites/CombatCircleSpriteShader2 | Game | 1137 | 3852 | 4 (2/2) | 4 | 5 | 1 | _FillAmount | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |
| Sprites/SpriteOnTop | Game | 1075 | 3556 | 4 (2/2) | 3 | 5 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |

## 族 F5: Custom/CardBackShader, Custom/GridShader

- 成员 2 个；公共属性 3 个：_Color, _Glossiness, _Metallic
- 族内差集属性 2 个：_LineWidth, _MainTex
- 关键字并集 26 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/CardBackShader | Custom | 20676 | 222092 | 64 (37/27) | 4 | 26 | 1 | _MainTex | 关键字 26 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/GridShader | Custom | 7266 | 51196 | 15 (8/7) | 4 | 25 | 1 | _LineWidth | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |

## 族 F6: Custom/SpiritTransitionEffect, Custom/SpiritImageEffect

- 成员 2 个；公共属性 2 个：_MainTex, _Weight
- 关键字并集 4 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/SpiritTransitionEffect | Custom | 769 | 1620 | 2 (1/1) | 2 | 4 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |
| Custom/SpiritImageEffect | Custom | 786 | 1640 | 2 (1/1) | 2 | 4 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |

## 族 F7: Custom/BoosterShaderTop, Custom/BoosterShader

- 成员 2 个；公共属性 12 个：_BorderColor, _Color, _Color2, _Glossiness, _IconColor, _IconTex, _MainTex, _Metallic, _RainbowTex, _SmallCirclePosition, _SmallCircleSize, _SparkleIntensity
- 族内差集属性 1 个：_Foil
- 关键字并集 25 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/BoosterShaderTop | Custom | 12441 | 112052 | 34 (19/15) | 13 | 25 | 1 | _Foil | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |
| Custom/BoosterShader | Custom | 12694 | 117460 | 34 (19/15) | 12 | 25 | 1 | — | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |

## 族 F8: Custom/StatusBar

- 成员 1 个；公共属性 9 个：_Color, _Color2, _Color3, _FillAmount, _Glossiness, _MainTex, _Metallic, _Pause, _PauseColor
- 关键字并集 25 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/StatusBar | Custom | 12051 | 108332 | 34 (19/15) | 9 | 25 | 1 | — | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |

## 族 F9: Custom/ConflictOutlineSdfShader

- 成员 1 个；公共属性 4 个：_Color, _OutlineColor, _OutlineThickness, _Size
- 关键字并集 25 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/ConflictOutlineSdfShader | Custom | 4514 | 36308 | 15 (8/7) | 4 | 25 | 1 | — | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |

## 族 F10: Custom/GenericCardShader

- 成员 1 个；公共属性 3 个：_BorderThickness, _Color, _Size
- 关键字并集 25 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/GenericCardShader | Custom | 17710 | 177732 | 58 (33/25) | 3 | 25 | 1 | — | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |

## 族 F11: Custom/CardShaderTest

- 成员 1 个；公共属性 19 个：_BigShineStrength, _BorderColor, _Color, _Color2, _Damaged, _DamagedBorderColor, _DamagedTex, _Foil, _Glossiness, _HasOutputDir, _HasSecondaryIcon, _IconColor, _IconTex, _MainTex, _Metallic, _RainbowTex, _SecondaryTex, _ShineStrength, _SparkleIntensity
- 关键字并集 25 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/CardShaderTest | Custom | 22496 | 263784 | 58 (33/25) | 19 | 25 | 1 | — | 关键字 25 条(变体爆炸, 需按需剔除无用 multi_compile)；非可改贴图 2 个；fallback=Diffuse(需决定是否保留) |

## 族 F12: Custom/SuperSampled Texture

- 成员 1 个；公共属性 11 个：_AAScale, _Bias, _Color, _ColorMask, _MainTex, _Stencil, _StencilComp, _StencilOp, _StencilReadMask, _StencilWriteMask, _SuperSampling
- 关键字并集 7 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Custom/SuperSampled Texture | Custom | 1225 | 3952 | 4 (2/2) | 11 | 7 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |

## 族 F13: Unlit/CardopediaBackgroundShader

- 成员 1 个；公共属性 1 个：_MainTex
- 关键字并集 7 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Unlit/CardopediaBackgroundShader | Game | 1206 | 2800 | 2 (1/1) | 1 | 7 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |

## 族 F14: Sprites/BackgroundShader

- 成员 1 个；公共属性 3 个：PixelSnap, _Color, _MainTex
- 关键字并集 5 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Sprites/BackgroundShader | Game | 888 | 1856 | 2 (1/1) | 3 | 5 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |

## 族 F15: Postprocess/SokpopIntro

- 成员 1 个；公共属性 6 个：_CircleDelta, _CircleSize, _Darkness, _MainTex, _XOffset, _YOffset
- 关键字并集 4 条

| Shader | 分类 | 压缩(B) | 解压(B) | 程序(VS/PS) | 属性数 | 关键字 | SubShader | 独有属性 | 风险 |
|---|---|---:|---:|---|---:|---:|---:|---|---|
| Postprocess/SokpopIntro | Game | 901 | 1920 | 2 (1/1) | 6 | 4 | 1 | — | blob<1.5KB(疑似已剥/极简实现, 需确认不是空壳)；非可改贴图 2 个 |

## 执行顺序建议

1. 先做**人口径最大**的族（成员数多、公共属性多）——一套基座覆盖多个 shader，收益最高。
2. 族内先做 blob 最大、关键字最多的那个（信息最全，反编译成功率最高），再往下做小变体。
3. `blob<1.5KB` 的条目先确认是否为真实空壳；若是，按原版视觉重建而不是硬还原字节。
4. 每完成一个 shader，把 `shader_worklist.csv` 的 `status` 从 `pending` 改 `done` 并记抓帧结论。
5. **验收硬指标**：`shader_extract/dxbc/` 里该 shader 的原版程序数（如 `Custom/BoosterShader` 34 段 = VS 19 / PS 15）
   是重建的下限参照 —— 重建后编译出的程序段数明显少于原版，说明关键字/变体被吃掉了，不算复刻。
