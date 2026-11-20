# 变体预算台账（typetree ↔ DXBC 对账）

- shader 30 / pass 58
- 对账一致: 30/30
- 不一致: 无；缺 DXBC: 无

> 判据：`typetree 变体数 == DXBC 切出的程序数`。相等说明切片没丢程序；
> 不等说明链条有洞（切片漏段或 typetree 读错），必须先查清再谈重建。

| Shader | pass | VS 变体 | PS 变体 | DXBC 段(VS/PS) | 实例化 pass | 对账 |
|---|---|---:|---:|---:|---:|---|
| Custom/ArrowSdfShader | 2 | 8 | 7 | 15 (8/7) | 1 | 一致 |
| Custom/BoosterShader | 4 | 19 | 15 | 34 (19/15) | 3 | 一致 |
| Custom/BoosterShaderTop | 4 | 19 | 15 | 34 (19/15) | 3 | 一致 |
| Custom/CardBackShader | 3 | 37 | 29 | 66 (37/29) | 2 | 一致 |
| Custom/CardShaderTest | 4 | 33 | 25 | 58 (33/25) | 3 | 一致 |
| Custom/ConflictOutlineSdfShader | 2 | 8 | 7 | 15 (8/7) | 1 | 一致 |
| Custom/ConveyorArrowShader | 2 | 8 | 7 | 15 (8/7) | 1 | 一致 |
| Custom/EnergyCableShader | 2 | 8 | 7 | 15 (8/7) | 1 | 一致 |
| Custom/FloorShader | 2 | 13 | 9 | 22 (13/9) | 1 | 一致 |
| Custom/FloorShaderForest | 2 | 13 | 9 | 22 (13/9) | 1 | 一致 |
| Custom/FloorShaderIsland | 2 | 13 | 9 | 22 (13/9) | 1 | 一致 |
| Custom/GenericCardShader | 4 | 33 | 25 | 58 (33/25) | 3 | 一致 |
| Custom/GridShader | 2 | 8 | 7 | 15 (8/7) | 1 | 一致 |
| Custom/SewerPipeShader | 2 | 8 | 7 | 15 (8/7) | 1 | 一致 |
| Custom/SpiritImageEffect | 1 | 1 | 1 | 2 (1/1) | 0 | 一致 |
| Custom/SpiritTransitionEffect | 1 | 1 | 1 | 2 (1/1) | 0 | 一致 |
| Custom/StatusBar | 4 | 19 | 15 | 34 (19/15) | 3 | 一致 |
| Custom/SuperSampled Texture | 1 | 2 | 2 | 4 (2/2) | 0 | 一致 |
| Custom/TransportArrowMainlandShader | 2 | 8 | 7 | 15 (8/7) | 1 | 一致 |
| Custom/TransportArrowShader | 2 | 8 | 7 | 15 (8/7) | 1 | 一致 |
| Postprocess/SokpopIntro | 1 | 1 | 1 | 2 (1/1) | 0 | 一致 |
| Sprites/BackgroundShader | 1 | 1 | 1 | 2 (1/1) | 1 | 一致 |
| Sprites/CombatCircleSpriteShader2 | 1 | 2 | 2 | 4 (2/2) | 0 | 一致 |
| Sprites/SpriteOnTop | 1 | 2 | 2 | 4 (2/2) | 0 | 一致 |
| Sprites/StatusEffectSpriteShader | 1 | 2 | 2 | 4 (2/2) | 0 | 一致 |
| Transition/Cities | 1 | 1 | 1 | 2 (1/1) | 0 | 一致 |
| Transition/Default | 1 | 1 | 1 | 2 (1/1) | 0 | 一致 |
| Transition/Energy | 1 | 1 | 1 | 2 (1/1) | 0 | 一致 |
| Transition/Spirit | 1 | 1 | 1 | 2 (1/1) | 0 | 一致 |
| Unlit/CardopediaBackgroundShader | 1 | 1 | 1 | 2 (1/1) | 0 | 一致 |

## 逐 pass 变体明细

| Shader | Pass | ProgramMask | VS | PS | 其他阶段 | 实例化 |
|---|---|---:|---:|---:|---|---|
| Custom/ArrowSdfShader | — | 6 | 3 | 2 | {} | True |
| Custom/ArrowSdfShader | — | 6 | 5 | 5 | {} | False |
| Custom/StatusBar | — | 6 | 8 | 4 | {} | True |
| Custom/StatusBar | — | 6 | 5 | 5 | {} | False |
| Custom/StatusBar | — | 6 | 4 | 4 | {} | True |
| Custom/StatusBar | — | 6 | 2 | 2 | {} | True |
| Custom/SewerPipeShader | — | 6 | 3 | 2 | {} | True |
| Custom/SewerPipeShader | — | 6 | 5 | 5 | {} | False |
| Custom/CardBackShader | — | 6 | 16 | 8 | {} | True |
| Custom/CardBackShader | — | 6 | 13 | 13 | {} | False |
| Custom/CardBackShader | — | 6 | 8 | 8 | {} | True |
| Custom/ConveyorArrowShader | — | 6 | 3 | 2 | {} | True |
| Custom/ConveyorArrowShader | — | 6 | 5 | 5 | {} | False |
| Transition/Default | — | 6 | 1 | 1 | {} | False |
| Custom/ConflictOutlineSdfShader | — | 6 | 3 | 2 | {} | True |
| Custom/ConflictOutlineSdfShader | — | 6 | 5 | 5 | {} | False |
| Transition/Spirit | — | 6 | 1 | 1 | {} | False |
| Custom/GenericCardShader | — | 6 | 16 | 8 | {} | True |
| Custom/GenericCardShader | — | 6 | 5 | 5 | {} | False |
| Custom/GenericCardShader | — | 6 | 8 | 8 | {} | True |
| Custom/GenericCardShader | — | 6 | 4 | 4 | {} | True |
| Custom/SpiritTransitionEffect | — | 6 | 1 | 1 | {} | False |
| Custom/CardShaderTest | — | 6 | 16 | 8 | {} | True |
| Custom/CardShaderTest | — | 6 | 5 | 5 | {} | False |
| Custom/CardShaderTest | — | 6 | 8 | 8 | {} | True |
| Custom/CardShaderTest | — | 6 | 4 | 4 | {} | True |
| Custom/TransportArrowShader | — | 6 | 3 | 2 | {} | True |
| Custom/TransportArrowShader | — | 6 | 5 | 5 | {} | False |
| Custom/BoosterShaderTop | — | 6 | 8 | 4 | {} | True |
| Custom/BoosterShaderTop | — | 6 | 5 | 5 | {} | False |
| Custom/BoosterShaderTop | — | 6 | 4 | 4 | {} | True |
| Custom/BoosterShaderTop | — | 6 | 2 | 2 | {} | True |
| Custom/GridShader | — | 6 | 3 | 2 | {} | True |
| Custom/GridShader | — | 6 | 5 | 5 | {} | False |
| Custom/SpiritImageEffect | — | 6 | 1 | 1 | {} | False |
| Custom/EnergyCableShader | — | 6 | 3 | 2 | {} | True |
| Custom/EnergyCableShader | — | 6 | 5 | 5 | {} | False |
| Custom/FloorShaderForest | — | 6 | 8 | 4 | {} | True |
| Custom/FloorShaderForest | — | 6 | 5 | 5 | {} | False |
| Custom/SuperSampled Texture | — | 6 | 2 | 2 | {} | False |
| Unlit/CardopediaBackgroundShader | — | 6 | 1 | 1 | {} | False |
| Custom/TransportArrowMainlandShader | — | 6 | 3 | 2 | {} | True |
| Custom/TransportArrowMainlandShader | — | 6 | 5 | 5 | {} | False |
| Sprites/BackgroundShader | — | 6 | 1 | 1 | {} | True |
| Sprites/StatusEffectSpriteShader | — | 6 | 2 | 2 | {} | False |
| Custom/FloorShader | — | 6 | 8 | 4 | {} | True |
| Custom/FloorShader | — | 6 | 5 | 5 | {} | False |
| Sprites/CombatCircleSpriteShader2 | — | 6 | 2 | 2 | {} | False |
| Transition/Energy | — | 6 | 1 | 1 | {} | False |
| Custom/FloorShaderIsland | — | 6 | 8 | 4 | {} | True |
| Custom/FloorShaderIsland | — | 6 | 5 | 5 | {} | False |
| Custom/BoosterShader | — | 6 | 8 | 4 | {} | True |
| Custom/BoosterShader | — | 6 | 5 | 5 | {} | False |
| Custom/BoosterShader | — | 6 | 4 | 4 | {} | True |
| Custom/BoosterShader | — | 6 | 2 | 2 | {} | True |
| Transition/Cities | — | 6 | 1 | 1 | {} | False |
| Sprites/SpriteOnTop | — | 6 | 2 | 2 | {} | False |
| Postprocess/SokpopIntro | — | 6 | 1 | 1 | {} | False |
