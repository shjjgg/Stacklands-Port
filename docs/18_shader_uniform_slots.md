# 18 · Shader 材质常量槽位证据表

> 由 `tools/uniform_slot_evidence.py` 从 DXBC 汇编(`cb0[R].mask`)导出，记录每个 shader 基础 pass 实际读到的 cb0 行与分量。

| Shader | 代表 PS 片段 | cb0 行数 / 全 xyzw 行 | 行:分量 |
|---|---|---|---|
| Custom/ArrowSdfShader | Custom__ArrowSdfShader__10_PS.txt | 11 行; 全 xyzw 5 行 | 2:wxyz 4:xyz 5:xyz 6:xyz 7:xyz 8:wxyz 9:wxyz 10:xy 11:xy 12:wxyz 13:wxyz |
| Custom/BoosterShader | Custom__BoosterShader__17_PS.txt | 10 行; 全 xyzw 1 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 8:xy 9:xyz 10:xyz 12:xyz 13:wxyz |
| Custom/BoosterShaderTop | Custom__BoosterShaderTop__17_PS.txt | 9 行; 全 xyzw 1 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 8:xy 9:xyz 10:xyz 11:wxyz |
| Custom/CardBackShader | Custom__CardBackShader__43_PS.txt | 9 行; 全 xyzw 6 行 | 2:xyz 8:wxyz 9:wxyz 10:wxyz 11:wxyz 12:wxyz 13:xy 14:xyz 15:wxyz |
| Custom/CardShaderTest | Custom__CardShaderTest__29_PS.txt | 13 行; 全 xyzw 2 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 8:xy 9:xyz 10:xyz 11:xyz 13:xyz 14:xy 16:wxyz 17:wxyz |
| Custom/ConflictOutlineSdfShader | Custom__ConflictOutlineSdfShader__10_PS.txt | 10 行; 全 xyzw 4 行 | 2:wxyz 4:xyz 5:xyz 6:xyz 7:xyz 8:wxyz 9:wxyz 10:xy 11:x 12:wxyz |
| Custom/ConveyorArrowShader | Custom__ConveyorArrowShader__10_PS.txt | 11 行; 全 xyzw 4 行 | 2:wxyz 4:xyz 5:xyz 6:xyz 7:xyz 8:wxyz 9:wxyz 10:xy 11:xy 12:wxz 13:wxyz |
| Custom/EnergyCableShader | Custom__EnergyCableShader__10_PS.txt | 13 行; 全 xyzw 4 行 | 2:wxyz 4:xyz 5:xyz 6:xyz 7:xyz 8:wxyz 9:wxyz 11:xy 12:xy 13:xy 14:wxy 15:xy 16:wxyz |
| Custom/FloorShader | Custom__FloorShader__17_PS.txt | 13 行; 全 xyzw 2 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 9:xyz 10:xyz 11:xyz 12:xyz 14:y 15:wxyz 17:x 18:wxyz |
| Custom/FloorShaderForest | Custom__FloorShaderForest__17_PS.txt | 12 行; 全 xyzw 2 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 9:xyz 10:xyz 11:xyz 14:y 15:wxyz 17:x 18:wxyz |
| Custom/FloorShaderIsland | Custom__FloorShaderIsland__17_PS.txt | 13 行; 全 xyzw 2 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 10:xyz 11:xyz 12:xyz 14:y 15:wxyz 17:x 20:xyz 21:wxyz |
| Custom/GenericCardShader | Custom__GenericCardShader__29_PS.txt | 10 行; 全 xyzw 1 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 8:xy 9:xyz 10:xy 11:x 12:wxyz |
| Custom/GridShader | Custom__GridShader__10_PS.txt | 9 行; 全 xyzw 2 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 8:xy 9:xyz 10:wxyz 11:wxyz |
| Custom/SewerPipeShader | Custom__SewerPipeShader__10_PS.txt | 12 行; 全 xyzw 5 行 | 2:wxyz 4:xyz 5:xyz 6:xyz 7:xyz 8:wxyz 9:wxyz 10:xyz 11:xy 12:xy 14:wxyz 15:wxyz |
| Custom/SpiritImageEffect | Custom__SpiritImageEffect__01_PS.txt | 2 行; 全 xyzw 1 行 | 2:x 3:wxyz |
| Custom/SpiritTransitionEffect | Custom__SpiritTransitionEffect__01_PS.txt | 2 行; 全 xyzw 1 行 | 2:x 3:wxyz |
| Custom/StatusBar | Custom__StatusBar__17_PS.txt | 12 行; 全 xyzw 1 行 | 2:xyz 4:xyz 5:xyz 6:xyz 7:xyz 8:xy 9:xyz 10:xyz 11:xyz 12:xyz 13:xy 14:wxyz |
| Custom/SuperSampled Texture | (无汇编) |  |  |
| Custom/TransportArrowMainlandShader | Custom__TransportArrowMainlandShader__10_PS.txt | 16 行; 全 xyzw 7 行 | 2:wxyz 4:xyz 5:xyz 6:xyz 7:xyz 8:wxyz 9:wxyz 10:wxyz 11:xy 12:xy 13:xy 14:xyz 15:xy 16:wxyz 17:wxyz 18:wxyz |
| Custom/TransportArrowShader | Custom__TransportArrowShader__10_PS.txt | 15 行; 全 xyzw 6 行 | 2:wxyz 4:xyz 5:xyz 6:xyz 7:xyz 8:wxyz 9:wxyz 10:wxyz 11:wxyz 12:xy 13:xy 14:xy 15:xyz 16:x 17:wxyz |
| Postprocess/SokpopIntro | Postprocess__SokpopIntro__01_PS.txt | 3 行; 全 xyzw 2 行 | 0:wxyz 1:x 2:wxyz |
| Sprites/BackgroundShader | Sprites__BackgroundShader__01_PS.txt | 2 行; 全 xyzw 1 行 | 0:z 1:wxyz |
| Sprites/CombatCircleSpriteShader2 | Sprites__CombatCircleSpriteShader2__02_PS.txt | 2 行; 全 xyzw 1 行 | 4:x 5:wxyz |
| Sprites/SpriteOnTop | (无汇编) |  |  |
| Sprites/StatusEffectSpriteShader | Sprites__StatusEffectSpriteShader__02_PS.txt | 4 行; 全 xyzw 3 行 | 3:wxyz 4:wxyz 5:x 6:wxyz |
| Transition/Cities | Transition__Cities__01_PS.txt | 3 行; 全 xyzw 1 行 | 3:xyz 4:x 5:wxyz |
| Transition/Default | Transition__Default__01_PS.txt | 2 行; 全 xyzw 1 行 | 4:x 5:wxyz |
| Transition/Energy | Transition__Energy__01_PS.txt | 3 行; 全 xyzw 1 行 | 4:xyz 5:x 6:wxyz |
| Transition/Spirit | Transition__Spirit__01_PS.txt | 2 行; 全 xyzw 1 行 | 4:x 5:wxyz |
| Unlit/CardopediaBackgroundShader | Unlit__CardopediaBackgroundShader__01_PS.txt | 2 行; 全 xyzw 1 行 | 0:y 1:wxyz |

## 结论（槽位风险的处理方式）

1. 本项目自写 ShaderLab 一律**按名字声明 uniform**，Unity 的着色器编译器自行完成 cbuffer 打包与绑定，
   因此"属性值送错槽"在结构上不可能发生，无需复刻原版的槽位编号。
2. 上表只作为**语义核对证据**：原版每行读到的分量形态（纯 xyzw / 尾部标量 …）用于确认
   我们对 `glsl_exact` 里 `cb0._mN` 的语义解释（哪个是色、哪个是起点终点、哪个是标量组）是否合理。
3. 残余风险：语义命名（例：`_m4/_m5` 谁是描边色、谁是内色）只能靠行为推断，离线阶段无法证明，
   只能在 CI 真编译 + 真机画面比对时定案。
