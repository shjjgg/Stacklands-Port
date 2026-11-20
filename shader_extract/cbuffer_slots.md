# cbuffer 槽位映射（dcl 槽位 ↔ Unity cbuffer 名）

- shader×stage 组合 46，问题 32

> 前提：同一 stage 所有 pass 的 cbuffer 列表一致、distinct dcl 槽位恰为 0..n-1、列表非空。
> 三条同时成立才输出映射，否则记 problem —— 不靠猜。

| Shader | 阶段 | dcl 槽位 | cbuffer（按槽位） |
|---|---|---|---|
| Custom/ArrowSdfShader | VS | 0 1 2 | UnityPerDraw | UnityPerFrame |
| Custom/ArrowSdfShader | PS | 0 1 2 3 | $Globals | UnityPerCamera | UnityLighting | UnityProbeVolume |
| Custom/SewerPipeShader | VS | 0 1 2 | UnityPerDraw | UnityPerFrame |
| Custom/SewerPipeShader | PS | 0 1 2 | $Globals | UnityLighting | UnityProbeVolume |
| Custom/ConveyorArrowShader | VS | 0 1 2 | UnityPerDraw | UnityPerFrame |
| Custom/ConveyorArrowShader | PS | 0 1 2 3 | $Globals | UnityPerCamera | UnityLighting | UnityProbeVolume |
| Transition/Default | VS | 0 1 | UnityPerDraw | UnityPerFrame |
| Transition/Default | PS | 0 | $Globals |
| Custom/ConflictOutlineSdfShader | VS | 0 1 2 | UnityPerDraw | UnityPerFrame |
| Custom/ConflictOutlineSdfShader | PS | 0 1 2 3 4 | $Globals | UnityPerCamera | UnityLighting | UnityPerDraw | UnityProbeVolume |
| Transition/Spirit | VS | 0 1 | UnityPerDraw | UnityPerFrame |
| Transition/Spirit | PS | 0 1 | $Globals | UnityPerCamera |
| Custom/SpiritTransitionEffect | VS | 0 1 | UnityPerDraw | UnityPerFrame |
| Custom/SpiritTransitionEffect | PS | 0 | $Globals |
| Custom/TransportArrowShader | VS | 0 1 2 | UnityPerDraw | UnityPerFrame |
| Custom/TransportArrowShader | PS | 0 1 2 | $Globals | UnityLighting | UnityProbeVolume |
| Custom/GridShader | VS | 0 1 2 | UnityPerDraw | UnityPerFrame |
| Custom/SpiritImageEffect | VS | 0 1 | UnityPerDraw | UnityPerFrame |
| Custom/SpiritImageEffect | PS | 0 1 | $Globals | UnityPerCamera |
| Custom/EnergyCableShader | VS | 0 1 2 | UnityPerDraw | UnityPerFrame |
| Custom/EnergyCableShader | PS | 0 1 2 3 | $Globals | UnityPerCamera | UnityLighting | UnityProbeVolume |
| Custom/FloorShaderForest | VS | 0 1 2 3 | UnityPerDraw | UnityPerFrame |
| Custom/FloorShaderForest | PS | 0 1 2 3 4 5 6 | $Globals | UnityLighting | UnityPerDraw | UnityProbeVolume |
| Custom/SuperSampled Texture | VS |  | UnityPerDraw | UnityPerFrame |
| Custom/SuperSampled Texture | PS |  | $Globals |
| Unlit/CardopediaBackgroundShader | VS | 0 1 2 3 | $Globals | UnityPerCamera | UnityPerDraw | UnityPerFrame |
| Unlit/CardopediaBackgroundShader | PS | 0 | UnityPerCamera |
| Custom/TransportArrowMainlandShader | VS | 0 1 2 | UnityPerDraw | UnityPerFrame |
| Custom/TransportArrowMainlandShader | PS | 0 1 2 | $Globals | UnityLighting | UnityProbeVolume |
| Sprites/BackgroundShader | VS | 0 1 2 | $Globals | UnityPerDraw | UnityPerFrame |
| Sprites/BackgroundShader | PS | 0 | UnityPerCamera |
| Sprites/StatusEffectSpriteShader | VS | 0 1 2 3 | $Globals | UnityPerDraw | UnityPerFrame |
| Sprites/StatusEffectSpriteShader | PS | 0 1 | $Globals | UnityPerCamera |
| Custom/FloorShader | VS | 0 1 2 3 | UnityPerDraw | UnityPerFrame |
| Custom/FloorShader | PS | 0 1 2 3 4 5 6 | $Globals | UnityLighting | UnityPerDraw | UnityProbeVolume |
| Sprites/CombatCircleSpriteShader2 | VS | 0 1 2 3 | $Globals | UnityPerDraw | UnityPerFrame |
| Sprites/CombatCircleSpriteShader2 | PS | 0 | $Globals |
| Transition/Energy | VS | 0 1 | UnityPerDraw | UnityPerFrame |
| Transition/Energy | PS | 0 | $Globals |
| Custom/FloorShaderIsland | VS | 0 1 2 3 | UnityPerDraw | UnityPerFrame |
| Custom/FloorShaderIsland | PS | 0 1 2 3 4 5 6 | $Globals | UnityPerCamera | UnityLighting | UnityPerDraw | UnityProbeVolume |
| Transition/Cities | VS | 0 1 | UnityPerDraw | UnityPerFrame |
| Transition/Cities | PS | 0 1 | $Globals | UnityPerCamera |
| Sprites/SpriteOnTop | VS | 0 1 2 3 | $Globals | UnityPerDraw | UnityPerFrame |
| Postprocess/SokpopIntro | VS | 0 1 | UnityPerDraw | UnityPerFrame |
| Postprocess/SokpopIntro | PS | 0 1 | $Globals | UnityPerCamera |
