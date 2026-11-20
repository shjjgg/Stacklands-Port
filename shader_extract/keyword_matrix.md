# 关键字矩阵（关键字全集 / 互斥组 / 理论上界 ↔ 实际段数）

- shader 30，最多关键字 26 个

> 读法：`理论上界` 是按互斥组展开的**可能**状态数，`实际段数` 是原版构建后真正编出来的程序数。
> 两者相差很多是正常的（Unity 按平台裁剪）；关键要求是：重建支持的 keyword 名字集合不得少于
> 本表的 `关键字`，且互斥组的每个分支都必须能编译出一条程序。

| Shader | 关键字 | 平台强制 | 单开关 | 理论上界 | 实际段数 | 覆盖率 |
|---|---:|---|---:|---:|---:|---:|
| Custom/CardBackShader | 26 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 230,400 | 66 | 0.000286 |
| Custom/ArrowSdfShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 15 | 9.8e-05 |
| Custom/BoosterShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 34 | 0.000221 |
| Custom/BoosterShaderTop | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 34 | 0.000221 |
| Custom/CardShaderTest | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 58 | 0.000378 |
| Custom/ConflictOutlineSdfShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 15 | 9.8e-05 |
| Custom/ConveyorArrowShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 15 | 9.8e-05 |
| Custom/EnergyCableShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 15 | 9.8e-05 |
| Custom/FloorShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 22 | 0.000143 |
| Custom/FloorShaderForest | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 22 | 0.000143 |
| Custom/FloorShaderIsland | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 22 | 0.000143 |
| Custom/GenericCardShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 58 | 0.000378 |
| Custom/GridShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 15 | 9.8e-05 |
| Custom/SewerPipeShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 15 | 9.8e-05 |
| Custom/StatusBar | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 34 | 0.000221 |
| Custom/TransportArrowMainlandShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 15 | 9.8e-05 |
| Custom/TransportArrowShader | 25 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 5 | 153,600 | 15 | 9.8e-05 |
| Custom/SuperSampled Texture | 7 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 3 | 40 | 4 | 0.1 |
| Unlit/CardopediaBackgroundShader | 7 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 0 | 20 | 2 | 0.1 |
| Sprites/BackgroundShader | 5 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON | 1 | 10 | 2 | 0.2 |
| Sprites/CombatCircleSpriteShader2 | 5 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 1 | 10 | 4 | 0.4 |
| Sprites/SpriteOnTop | 5 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 1 | 10 | 4 | 0.4 |
| Sprites/StatusEffectSpriteShader | 5 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 1 | 10 | 4 | 0.4 |
| Custom/SpiritImageEffect | 4 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 0 | 5 | 2 | 0.4 |
| Custom/SpiritTransitionEffect | 4 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 0 | 5 | 2 | 0.4 |
| Postprocess/SokpopIntro | 4 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 0 | 5 | 2 | 0.4 |
| Transition/Cities | 4 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 0 | 5 | 2 | 0.4 |
| Transition/Default | 4 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 0 | 5 | 2 | 0.4 |
| Transition/Energy | 4 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 0 | 5 | 2 | 0.4 |
| Transition/Spirit | 4 | STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON | 0 | 5 | 2 | 0.4 |

## 互斥组明细

| Shader | 互斥组 |
|---|---|
| Custom/CardBackShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 3} |
| Custom/ArrowSdfShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/BoosterShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/BoosterShaderTop | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/CardShaderTest | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/ConflictOutlineSdfShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/ConveyorArrowShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/EnergyCableShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/FloorShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/FloorShaderForest | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/FloorShaderIsland | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/GenericCardShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/GridShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/SewerPipeShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/StatusBar | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/TransportArrowMainlandShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/TransportArrowShader | {"雾模式": 4, "主光类型": 6, "阴影类型": 4, "立体渲染": 5, "光照贴图": 5, "阴影质量": 2} |
| Custom/SuperSampled Texture | {"立体渲染": 5} |
| Unlit/CardopediaBackgroundShader | {"雾模式": 4, "立体渲染": 5} |
| Sprites/BackgroundShader | {"立体渲染": 5} |
| Sprites/CombatCircleSpriteShader2 | {"立体渲染": 5} |
| Sprites/SpriteOnTop | {"立体渲染": 5} |
| Sprites/StatusEffectSpriteShader | {"立体渲染": 5} |
| Custom/SpiritImageEffect | {"立体渲染": 5} |
| Custom/SpiritTransitionEffect | {"立体渲染": 5} |
| Postprocess/SokpopIntro | {"立体渲染": 5} |
| Transition/Cities | {"立体渲染": 5} |
| Transition/Default | {"立体渲染": 5} |
| Transition/Energy | {"立体渲染": 5} |
| Transition/Spirit | {"立体渲染": 5} |
