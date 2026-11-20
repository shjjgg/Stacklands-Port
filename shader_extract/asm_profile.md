# DXBC 指令级剖面（结构层）

- 程序 504，指令合计 42,036
- 未登记 opcode: 0 条；长度不符: 0 条

> `cbuffers/textures/samplers` 是 dcl 声明里真正绑定的索引, 重建的 HLSL 必须绑同一组;
> `top_opcodes` 是该 shader 全部程序段的 opcode 频次, 用于判断数学/采样/流程控制的结构。

| Shader | 指令数 | 不同 opcode | Top opcodes | cbuffer | texture | sampler |
|---|---:|---:|---|---:|---:|---:|
| Custom/CardShaderTest | 7,124 | 45 | MAD:1341 MUL:1178 ADD:932 DP3:303 MOV:247 DCL_CONSTANT_BUFFER:245 | 0 1 2 3 4 5 6 7 8 | 0 1 2 3 4 5 6 7 | 0 1 2 3 4 5 6 |
| Custom/CardBackShader | 5,714 | 42 | MUL:1071 MAD:934 ADD:614 DP3:382 DCL_CONSTANT_BUFFER:285 MOV:255 | 0 1 2 3 4 5 6 7 8 | 0 1 2 3 4 | 0 1 2 3 4 |
| Custom/GenericCardShader | 4,501 | 42 | MUL:785 MAD:771 ADD:505 DP3:282 DCL_CONSTANT_BUFFER:229 DCL_OUTPUT:215 | 0 1 2 3 4 5 6 7 8 | 0 1 2 3 | 0 1 2 |
| Custom/BoosterShader | 3,186 | 39 | MUL:606 MAD:595 ADD:395 DP3:187 DCL_CONSTANT_BUFFER:125 DCL_OUTPUT:115 | 0 1 2 3 4 5 6 | 0 1 2 3 4 5 | 0 1 2 3 4 |
| Custom/BoosterShaderTop | 3,036 | 38 | MUL:593 MAD:556 ADD:343 DP3:187 DCL_CONSTANT_BUFFER:125 DCL_OUTPUT:115 | 0 1 2 3 4 5 6 | 0 1 2 3 4 5 | 0 1 2 3 4 |
| Custom/StatusBar | 2,898 | 39 | MUL:541 MAD:517 ADD:380 DP3:174 DCL_CONSTANT_BUFFER:121 DCL_OUTPUT:115 | 0 1 2 3 4 5 6 | 0 1 2 3 | 0 1 2 |
| Custom/FloorShaderIsland | 2,042 | 34 | ADD:417 MAD:368 MUL:218 DP3:104 MOV:92 DCL_CONSTANT_BUFFER:89 | 0 1 2 3 4 5 6 | 0 1 2 3 | 0 1 2 3 |
| Custom/FloorShader | 1,729 | 33 | ADD:327 MAD:323 MUL:218 MOV:92 DCL_CONSTANT_BUFFER:82 DP3:77 | 0 1 2 3 4 5 6 | 0 1 2 3 | 0 1 2 3 |
| Custom/FloorShaderForest | 1,513 | 33 | MAD:287 ADD:264 MUL:182 MOV:92 DCL_CONSTANT_BUFFER:82 DP3:77 | 0 1 2 3 4 5 6 | 0 1 2 3 | 0 1 2 3 |
| Custom/EnergyCableShader | 1,405 | 37 | MAD:296 MUL:216 ADD:215 DCL_CONSTANT_BUFFER:50 DP2:49 DIV:44 | 0 1 2 3 | 0 1 2 | 0 1 2 |
| Custom/GridShader | 1,374 | 34 | MUL:356 MAD:257 ADD:173 DP3:100 DCL_CONSTANT_BUFFER:52 RSQ:37 | 0 1 2 3 4 | 0 1 2 | 0 1 2 |
| Custom/TransportArrowMainlandShader | 1,237 | 37 | MAD:233 MUL:223 ADD:138 MOV:53 MOVC:49 DCL_CONSTANT_BUFFER:43 | 0 1 2 | 0 1 2 | 0 1 2 |
| Custom/TransportArrowShader | 1,237 | 38 | MAD:233 MUL:195 ADD:145 LT:64 MOVC:49 MOV:46 | 0 1 2 | 0 1 2 | 0 1 2 |
| Custom/SewerPipeShader | 1,132 | 39 | MAD:198 MUL:153 ADD:117 MOVC:91 MOV:67 DCL_CONSTANT_BUFFER:43 | 0 1 2 | 0 1 2 | 0 1 2 |
| Custom/ArrowSdfShader | 1,111 | 34 | MAD:226 MUL:174 ADD:145 DP2:63 DCL_CONSTANT_BUFFER:50 DIV:37 | 0 1 2 3 | 0 1 2 | 0 1 2 |
| Custom/ConveyorArrowShader | 1,062 | 34 | MAD:205 MUL:174 ADD:124 DP2:63 DCL_CONSTANT_BUFFER:50 DP3:35 | 0 1 2 3 | 0 1 2 | 0 1 2 |
| Custom/ConflictOutlineSdfShader | 922 | 33 | MAD:191 MUL:139 ADD:124 DCL_CONSTANT_BUFFER:57 DP3:35 ROUND_NE:35 | 0 1 2 3 4 | 0 1 2 | 0 1 2 |
| Transition/Cities | 135 | 21 | ADD:37 MAD:35 MUL:10 DP2:8 SQRT:8 MAX:7 | 0 1 | 0 | 0 |
| Sprites/StatusEffectSpriteShader | 96 | 19 | MAD:18 MUL:15 DCL_CONSTANT_BUFFER:11 DCL_INPUT:6 DCL_OUTPUT:6 ADD:6 | 0 1 2 3 | 0 | 0 |
| Custom/SuperSampled_Texture | 86 | 21 | MUL:12 MAD:12 MOV:9 DCL_CONSTANT_BUFFER:6 DCL_INPUT:6 DCL_OUTPUT:6 | 0 1 | 0 | 0 |
| Sprites/CombatCircleSpriteShader2 | 80 | 16 | MUL:17 MAD:12 DCL_CONSTANT_BUFFER:9 DCL_INPUT:6 DCL_OUTPUT:6 MOV:5 | 0 1 2 3 | 0 | 0 |
| Sprites/SpriteOnTop | 72 | 16 | MUL:13 MAD:10 DCL_CONSTANT_BUFFER:7 DCL_INPUT:6 DCL_OUTPUT:6 MOV:5 | 0 1 2 3 | 0 | 0 |
| Unlit/CardopediaBackgroundShader | 67 | 20 | MAD:15 MUL:12 DCL_CONSTANT_BUFFER:5 ADD:4 DCL_OUTPUT:3 LT:3 | 0 1 2 3 |  |  |
| Transition/Spirit | 47 | 15 | MAD:10 ADD:7 MUL:5 DCL_CONSTANT_BUFFER:4 DCL_INPUT:3 DCL_OUTPUT:3 | 0 1 |  |  |
| Postprocess/SokpopIntro | 43 | 17 | MAD:9 MUL:8 DCL_CONSTANT_BUFFER:4 ADD:3 DCL_INPUT:2 DCL_OUTPUT:2 | 0 1 | 0 | 0 |
| Sprites/BackgroundShader | 42 | 17 | MUL:8 MAD:7 DCL_CONSTANT_BUFFER:4 DCL_INPUT:3 DCL_OUTPUT:3 MOV:3 | 0 1 2 | 0 | 0 |
| Transition/Energy | 39 | 15 | MUL:6 MAD:6 ADD:5 DCL_CONSTANT_BUFFER:3 DCL_INPUT:3 DCL_OUTPUT:3 | 0 1 |  |  |
| Transition/Default | 38 | 14 | MUL:6 MAD:6 ADD:5 DCL_CONSTANT_BUFFER:3 DCL_INPUT:3 DCL_OUTPUT:3 | 0 1 |  |  |
| Custom/SpiritImageEffect | 34 | 15 | MAD:9 DCL_CONSTANT_BUFFER:4 MUL:4 DCL_INPUT:2 DCL_OUTPUT:2 DCL_TEMPS:2 | 0 1 | 0 | 0 |
| Custom/SpiritTransitionEffect | 34 | 14 | MAD:7 MOV:5 SAMPLE:4 DCL_CONSTANT_BUFFER:3 DCL_INPUT:2 DCL_OUTPUT:2 | 0 1 | 0 | 0 |
