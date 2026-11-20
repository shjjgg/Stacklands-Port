# Shader 输入/输出签名台账

- shader: 30，VS↔PS 链接干净: 30
- 存在问题: 无

| Shader | 程序 | VS | PS | 顶点输入(寄存器:类型) | 插值通道 | 实例化变体 | 仅VS | 仅PS | 掩码不一致 | 问题 |
|---|---:|---:|---:|---|---:|---|---|---|---|---|
| Custom/ArrowSdfShader | 15 | 8 | 7 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 5 | no | — | — | — | — |
| Custom/BoosterShader | 34 | 19 | 15 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 13 | no | — | — | — | — |
| Custom/BoosterShaderTop | 34 | 19 | 15 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 13 | no | — | — | — | — |
| Custom/CardBackShader | 64 | 37 | 27 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float、SV_InstanceID@r8:uint | 15 | yes | — | — | — | — |
| Custom/CardShaderTest | 58 | 33 | 25 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float、SV_InstanceID@r8:uint | 18 | yes | — | — | — | — |
| Custom/ConflictOutlineSdfShader | 15 | 8 | 7 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 5 | no | — | — | — | — |
| Custom/ConveyorArrowShader | 15 | 8 | 7 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 5 | no | — | — | — | — |
| Custom/EnergyCableShader | 15 | 8 | 7 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 5 | no | — | — | — | — |
| Custom/FloorShader | 22 | 13 | 9 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 8 | no | — | — | — | — |
| Custom/FloorShaderForest | 22 | 13 | 9 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 8 | no | — | — | — | — |
| Custom/FloorShaderIsland | 22 | 13 | 9 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 8 | no | — | — | — | — |
| Custom/GenericCardShader | 58 | 33 | 25 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float、SV_InstanceID@r8:uint | 17 | yes | — | — | — | — |
| Custom/GridShader | 15 | 8 | 7 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 6 | no | — | — | — | — |
| Custom/SewerPipeShader | 15 | 8 | 7 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 5 | no | — | — | — | — |
| Custom/SpiritImageEffect | 2 | 1 | 1 | POSITION@r0:float、TEXCOORD@r1:float | 2 | no | — | — | — | — |
| Custom/SpiritTransitionEffect | 2 | 1 | 1 | POSITION@r0:float、TEXCOORD@r1:float | 2 | no | — | — | — | — |
| Custom/StatusBar | 34 | 19 | 15 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 13 | no | — | — | — | — |
| Custom/SuperSampled_Texture | 4 | 2 | 2 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 3 | no | — | — | — | — |
| Custom/TransportArrowMainlandShader | 15 | 8 | 7 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 5 | no | — | — | — | — |
| Custom/TransportArrowShader | 15 | 8 | 7 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 5 | no | — | — | — | — |
| Postprocess/SokpopIntro | 2 | 1 | 1 | POSITION@r0:float、TEXCOORD@r1:float | 2 | no | — | — | — | — |
| Sprites/BackgroundShader | 2 | 1 | 1 | POSITION@r0:float、COLOR@r1:float、TEXCOORD@r2:float | 3 | no | — | — | — | — |
| Sprites/CombatCircleSpriteShader2 | 4 | 2 | 2 | POSITION@r0:float、COLOR@r1:float、TEXCOORD@r2:float | 3 | no | — | — | — | — |
| Sprites/SpriteOnTop | 4 | 2 | 2 | POSITION@r0:float、COLOR@r1:float、TEXCOORD@r2:float | 3 | no | — | — | — | — |
| Sprites/StatusEffectSpriteShader | 4 | 2 | 2 | POSITION@r0:float、COLOR@r1:float、TEXCOORD@r2:float | 3 | no | — | — | — | — |
| Transition/Cities | 2 | 1 | 1 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 4 | no | — | — | — | — |
| Transition/Default | 2 | 1 | 1 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 4 | no | — | — | — | — |
| Transition/Energy | 2 | 1 | 1 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 4 | no | — | — | — | — |
| Transition/Spirit | 2 | 1 | 1 | POSITION@r0:float、TANGENT@r1:float、NORMAL@r2:float、TEXCOORD@r3:float、TEXCOORD1@r4:float、TEXCOORD2@r5:float、TEXCOORD3@r6:float、COLOR@r7:float | 4 | no | — | — | — | — |
| Unlit/CardopediaBackgroundShader | 2 | 1 | 1 | POSITION@r0:float、TEXCOORD@r1:float | 3 | no | — | — | — | — |

> 重建判据：`vertex_inputs` 必须与重建 shader 的 `struct appdata` 完全一致（语义/索引/寄存器/掩码）；
> `仅VS`/`仅PS` 非空即链接断裂（原版应为空），重建后出现同类问题就是插值错乱或粉色块的根因。
