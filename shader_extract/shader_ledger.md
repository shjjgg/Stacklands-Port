# Shader / ComputeShader 台账

- 扫描时间: 2026-11-20T19:51:39
- Shader: 222（游戏自研/改编 30，其中 Custom/ 20）
- ComputeShader: 12

## 自研/改编 Shader（保真链重点）

| Shader | 分类 | blob | 大小(B) | SubShader | 属性 | 关键字数 |
|---|---|---|---:|---:|---|---:|
| Custom/ArrowSdfShader | Custom | blobs/Custom__ArrowSdfShader.blob | 4889 | 1 | _Color, _Start, _End, _SideLength, _Noise, _OutlineColor, _LineThickness, _OutlineThickness | 25 |
| Custom/StatusBar | Custom | blobs/Custom__StatusBar.blob | 12051 | 1 | _Color, _Color2, _Color3, _PauseColor, _FillAmount, _Pause, _MainTex, _Glossiness, _Metallic | 25 |
| Custom/SewerPipeShader | Custom | blobs/Custom__SewerPipeShader.blob | 5091 | 1 | _Color, _Start, _End, _Middle, _SideLength, _Noise, _OutlineColor, _ThickColor, _LineThickness, _OutlineThickness, _HighlightAmount, _ZTestCable, _IsBehind | 25 |
| Custom/CardBackShader | Custom | blobs/Custom__CardBackShader.blob | 20676 | 1 | _Color, _MainTex, _Glossiness, _Metallic | 26 |
| Custom/ConveyorArrowShader | Custom | blobs/Custom__ConveyorArrowShader.blob | 4801 | 1 | _Color, _Start, _End, _SideLength, _Noise, _OutlineColor, _LineThickness, _OutlineThickness, _Filled, _Gap | 25 |
| Transition/Default | Game | blobs/Transition__Default.blob | 900 | 1 | _MainTex, _TransitionTex, _TransitionAmount, _StencilComp, _Stencil, _StencilOp, _StencilWriteMask, _StencilReadMask, _ColorMask | 4 |
| Custom/ConflictOutlineSdfShader | Custom | blobs/Custom__ConflictOutlineSdfShader.blob | 4514 | 1 | _Color, _Size, _OutlineColor, _OutlineThickness | 25 |
| Transition/Spirit | Game | blobs/Transition__Spirit.blob | 1035 | 1 | _MainTex, _TransitionTex, _TransitionAmount, _StencilComp, _Stencil, _StencilOp, _StencilWriteMask, _StencilReadMask, _ColorMask | 4 |
| Custom/GenericCardShader | Custom | blobs/Custom__GenericCardShader.blob | 17710 | 1 | _Color, _Size, _BorderThickness | 25 |
| Custom/SpiritTransitionEffect | Custom | blobs/Custom__SpiritTransitionEffect.blob | 769 | 1 | _MainTex, _Weight | 4 |
| Custom/CardShaderTest | Custom | blobs/Custom__CardShaderTest.blob | 22496 | 1 | _Color, _Color2, _Foil, _Damaged, _IconColor, _ShineStrength, _BigShineStrength, _HasSecondaryIcon, _HasOutputDir, _MainTex, _IconTex, _SecondaryTex, _RainbowTex, _DamagedTex, _Glossiness, _Metallic, _SparkleIntensity, _BorderColor, _DamagedBorderColor | 25 |
| Custom/TransportArrowShader | Custom | blobs/Custom__TransportArrowShader.blob | 5182 | 1 | _Color, _Start, _End, _Middle, _SideLength, _Noise, _OutlineColor, _LineColor, _LineThickness, _OutlineThickness, _CarColor, _HighlightAmount, _ZTestCable, _IsBehind | 25 |
| Custom/BoosterShaderTop | Custom | blobs/Custom__BoosterShaderTop.blob | 12441 | 1 | _Color, _Color2, _Foil, _IconColor, _MainTex, _IconTex, _RainbowTex, _Glossiness, _Metallic, _SparkleIntensity, _SmallCirclePosition, _SmallCircleSize, _BorderColor | 25 |
| Custom/GridShader | Custom | blobs/Custom__GridShader.blob | 7266 | 1 | _Color, _Glossiness, _Metallic, _LineWidth | 25 |
| Custom/SpiritImageEffect | Custom | blobs/Custom__SpiritImageEffect.blob | 786 | 1 | _MainTex, _Weight | 4 |
| Custom/EnergyCableShader | Custom | blobs/Custom__EnergyCableShader.blob | 5389 | 1 | _Color, _Start, _End, _Middle, _SideLength, _Noise, _OutlineColor, _LineThickness, _OutlineThickness, _SecondColor, _DrawCircle, _ZTestCable, _IsBehind | 25 |
| Custom/FloorShaderForest | Custom | blobs/Custom__FloorShaderForest.blob | 6459 | 1 | _Color, _Color2, _OffsetTex, _StoneColor, _StoneEdge, _EdgeColor, _EdgeThickness, _MainTex, _Glossiness, _Metallic, _Rect | 25 |
| Custom/SuperSampled Texture | Custom | blobs/Custom__SuperSampled_Texture.blob | 1225 | 1 | _MainTex, _Color, _Bias, _SuperSampling, _AAScale, _StencilComp, _Stencil, _StencilOp, _StencilWriteMask, _StencilReadMask, _ColorMask | 7 |
| Unlit/CardopediaBackgroundShader | Game | blobs/Unlit__CardopediaBackgroundShader.blob | 1206 | 1 | _MainTex | 7 |
| Custom/TransportArrowMainlandShader | Custom | blobs/Custom__TransportArrowMainlandShader.blob | 5127 | 1 | _Color, _Start, _End, _Middle, _SideLength, _Noise, _OutlineColor, _LineThickness, _OutlineThickness, _CircleColor, _CircleNoise, _HighlightAmount, _ZTestCable, _IsBehind | 25 |
| Sprites/BackgroundShader | Game | blobs/Sprites__BackgroundShader.blob | 888 | 1 | _MainTex, _Color, PixelSnap | 5 |
| Sprites/StatusEffectSpriteShader | Game | blobs/Sprites__StatusEffectSpriteShader.blob | 1251 | 1 | _MainTex, _Color, _FillAmount, PixelSnap, _ColorA, _ColorB | 5 |
| Custom/FloorShader | Custom | blobs/Custom__FloorShader.blob | 6725 | 1 | _Color, _Color2, _OffsetTex, _StoneColor, _StoneEdge, _EdgeColor, _EdgeThickness, _MainTex, _Glossiness, _Metallic, _Rect | 25 |
| Sprites/CombatCircleSpriteShader2 | Game | blobs/Sprites__CombatCircleSpriteShader2.blob | 1137 | 1 | _MainTex, _Color, _FillAmount, PixelSnap | 5 |
| Transition/Energy | Game | blobs/Transition__Energy.blob | 908 | 1 | _MainTex, _TransitionTex, _TransitionAmount, _TransitionColor, _StencilComp, _Stencil, _StencilOp, _StencilWriteMask, _StencilReadMask, _ColorMask | 4 |
| Custom/FloorShaderIsland | Custom | blobs/Custom__FloorShaderIsland.blob | 7110 | 1 | _Color, _Color2, _OffsetTex, _StoneColor, _StoneEdge, _EdgeColor, _EdgeThickness, _MainTex, _SdfTex, _Glossiness, _Metallic, _WaterColor, _OutlineWidth, _OutlineColor, _FaceColor, _Rect, _IslandDownsize | 25 |
| Custom/BoosterShader | Custom | blobs/Custom__BoosterShader.blob | 12694 | 1 | _Color, _Color2, _IconColor, _MainTex, _IconTex, _RainbowTex, _Glossiness, _Metallic, _SparkleIntensity, _SmallCirclePosition, _SmallCircleSize, _BorderColor | 25 |
| Transition/Cities | Game | blobs/Transition__Cities.blob | 1575 | 1 | _MainTex, _TransitionTex, _TransitionAmount, _Color2, _NoiseTex, _StencilComp, _Stencil, _StencilOp, _StencilWriteMask, _StencilReadMask, _ColorMask | 4 |
| Sprites/SpriteOnTop | Game | blobs/Sprites__SpriteOnTop.blob | 1075 | 1 | _MainTex, _Color, PixelSnap | 5 |
| Postprocess/SokpopIntro | Game | blobs/Postprocess__SokpopIntro.blob | 901 | 1 | _MainTex, _CircleSize, _CircleDelta, _XOffset, _YOffset, _Darkness | 4 |

## 其他 Shader（引擎内置 / 后处理 / UI）

| Shader | blob | 大小(B) |
|---|---|---:|
| Standard | blobs/Standard.blob | 43350 |
| Particles/Standard Unlit | blobs/Particles__Standard_Unlit.blob | 7235 |
| Hidden/PostProcessing/CopyStdFromTexArray | blobs/Hidden__PostProcessing__CopyStdFromTexArray.blob | 676 |
| Hidden/PostProcessing/GrainBaker | blobs/Hidden__PostProcessing__GrainBaker.blob | 4999 |
| Hidden/PostProcessing/DepthOfField | blobs/Hidden__PostProcessing__DepthOfField.blob | 4884 |
| Hidden/PostProcessing/MotionBlur | blobs/Hidden__PostProcessing__MotionBlur.blob | 2874 |
| Hidden/PostProcessing/Debug/Waveform | blobs/Hidden__PostProcessing__Debug__Waveform.blob | 847 |
| Hidden/PostProcessing/Texture2DLerp | blobs/Hidden__PostProcessing__Texture2DLerp.blob | 720 |
| Hidden/PostProcessing/Uber | blobs/Hidden__PostProcessing__Uber.blob | 292815 |
| Hidden/PostProcessing/DeferredFog | blobs/Hidden__PostProcessing__DeferredFog.blob | 876 |
| Hidden/PostProcessing/CopyStd | blobs/Hidden__PostProcessing__CopyStd.blob | 726 |
| Hidden/PostProcessing/TemporalAntialiasing | blobs/Hidden__PostProcessing__TemporalAntialiasing.blob | 2221 |
| Hidden/PostProcessing/DiscardAlpha | blobs/Hidden__PostProcessing__DiscardAlpha.blob | 594 |
| Hidden/PostProcessing/MultiScaleVO | blobs/Hidden__PostProcessing__MultiScaleVO.blob | 1344 |
| Hidden/PostProcessing/Lut2DBaker | blobs/Hidden__PostProcessing__Lut2DBaker.blob | 5355 |
| Hidden/PostProcessing/SubpixelMorphologicalAntialiasing | blobs/Hidden__PostProcessing__SubpixelMorphologicalAntialiasing.blob | 4681 |
| UI/Default_New | blobs/UI__Default_New.blob | 1289 |
| Hidden/PostProcessing/Debug/Vectorscope | blobs/Hidden__PostProcessing__Debug__Vectorscope.blob | 859 |
| Hidden/PostProcessing/Debug/LightMeter | blobs/Hidden__PostProcessing__Debug__LightMeter.blob | 7995 |
| Hidden/PostProcessing/Debug/Overlays | blobs/Hidden__PostProcessing__Debug__Overlays.blob | 3241 |
| Hidden/PostProcessing/Bloom | blobs/Hidden__PostProcessing__Bloom.blob | 2378 |
| Hidden/PostProcessing/Copy | blobs/Hidden__PostProcessing__Copy.blob | 744 |
| Hidden/PostProcessing/ScalableAO | blobs/Hidden__PostProcessing__ScalableAO.blob | 4902 |
| Hidden/PostProcessing/CopyStdFromDoubleWide | blobs/Hidden__PostProcessing__CopyStdFromDoubleWide.blob | 726 |
| Hidden/PostProcessing/FinalPass | blobs/Hidden__PostProcessing__FinalPass.blob | 13443 |
| Hidden/PostProcessing/Debug/Histogram | blobs/Hidden__PostProcessing__Debug__Histogram.blob | 2049 |
| Hidden/PostProcessing/ScreenSpaceReflections | blobs/Hidden__PostProcessing__ScreenSpaceReflections.blob | 3627 |
| Shapes/Line 2D Subtractive | blobs/Shapes__Line_2D_Subtractive.blob | 3353 |
| Shapes/Line 2D ColorBurn | blobs/Shapes__Line_2D_ColorBurn.blob | 3407 |
| Shapes/Torus LinearBurn | blobs/Shapes__Torus_LinearBurn.blob | 1385 |
| Shapes/Triangle Multiplicative | blobs/Shapes__Triangle_Multiplicative.blob | 5333 |
| Shapes/Cuboid Opaque | blobs/Shapes__Cuboid_Opaque.blob | 1056 |
| Shapes/Sphere Screen | blobs/Shapes__Sphere_Screen.blob | 1054 |
| Shapes/Rect LinearBurn | blobs/Shapes__Rect_LinearBurn.blob | 6439 |
| Shapes/Disc Transparent | blobs/Shapes__Disc_Transparent.blob | 7131 |
| Shapes/Line 2D Transparent | blobs/Shapes__Line_2D_Transparent.blob | 3353 |
| Shapes/Polygon Opaque | blobs/Shapes__Polygon_Opaque.blob | 923 |
| Shapes/Cone LinearBurn | blobs/Shapes__Cone_LinearBurn.blob | 1176 |
| Shapes/Torus Opaque | blobs/Shapes__Torus_Opaque.blob | 1362 |
| Shapes/Line 3D Additive | blobs/Shapes__Line_3D_Additive.blob | 3335 |
| Shapes/Line 3D LinearBurn | blobs/Shapes__Line_3D_LinearBurn.blob | 3371 |
| Shapes/Rect Multiplicative | blobs/Shapes__Rect_Multiplicative.blob | 6436 |
| Shapes/Triangle Darken | blobs/Shapes__Triangle_Darken.blob | 5333 |
| Shapes/Rect Lighten | blobs/Shapes__Rect_Lighten.blob | 6397 |
| Shapes/Polygon ColorBurn | blobs/Shapes__Polygon_ColorBurn.blob | 993 |
| Shapes/Sphere ColorBurn | blobs/Shapes__Sphere_ColorBurn.blob | 1133 |
| Shapes/Regular Polygon LinearBurn | blobs/Shapes__Regular_Polygon_LinearBurn.blob | 4280 |
| Shapes/Cuboid Multiplicative | blobs/Shapes__Cuboid_Multiplicative.blob | 1091 |
| Shapes/Disc Screen | blobs/Shapes__Disc_Screen.blob | 7136 |
| Shapes/Line 2D Screen | blobs/Shapes__Line_2D_Screen.blob | 3353 |
| Shapes/Torus ColorDodge | blobs/Shapes__Torus_ColorDodge.blob | 1408 |
| Shapes/Line 3D ColorBurn | blobs/Shapes__Line_3D_ColorBurn.blob | 3456 |
| Shapes/Disc Subtractive | blobs/Shapes__Disc_Subtractive.blob | 7136 |
| Shapes/Disc Opaque | blobs/Shapes__Disc_Opaque.blob | 7131 |
| Shapes/Cone Multiplicative | blobs/Shapes__Cone_Multiplicative.blob | 1184 |
| Shapes/Torus Multiplicative | blobs/Shapes__Torus_Multiplicative.blob | 1392 |
| Shapes/Polygon Multiplicative | blobs/Shapes__Polygon_Multiplicative.blob | 952 |
| Shapes/Cone Additive | blobs/Shapes__Cone_Additive.blob | 1155 |
| Shapes/Texture Darken | blobs/Shapes__Texture_Darken.blob | 812 |
| Shapes/Polygon LinearBurn | blobs/Shapes__Polygon_LinearBurn.blob | 944 |
| Shapes/Torus Transparent | blobs/Shapes__Torus_Transparent.blob | 1362 |
| Shapes/Polyline 2D ColorBurn | blobs/Shapes__Polyline_2D_ColorBurn.blob | 4071 |
| Shapes/Cone ColorBurn | blobs/Shapes__Cone_ColorBurn.blob | 1231 |
| Shapes/Line 2D Multiplicative | blobs/Shapes__Line_2D_Multiplicative.blob | 3366 |
| Shapes/Texture Subtractive | blobs/Shapes__Texture_Subtractive.blob | 788 |
| Shapes/Texture ColorBurn | blobs/Shapes__Texture_ColorBurn.blob | 864 |
| Shapes/Regular Polygon Lighten | blobs/Shapes__Regular_Polygon_Lighten.blob | 4260 |
| Shapes/Cuboid ColorBurn | blobs/Shapes__Cuboid_ColorBurn.blob | 1138 |
| Shapes/Triangle Lighten | blobs/Shapes__Triangle_Lighten.blob | 5316 |
| Shapes/Cuboid LinearBurn | blobs/Shapes__Cuboid_LinearBurn.blob | 1083 |
| Shapes/Polyline 2D Multiplicative | blobs/Shapes__Polyline_2D_Multiplicative.blob | 4027 |
| DearImGui/Mesh | blobs/DearImGui__Mesh.blob | 892 |
| Shapes/Polyline 2D ColorDodge | blobs/Shapes__Polyline_2D_ColorDodge.blob | 4045 |
| Shapes/Sphere Subtractive | blobs/Shapes__Sphere_Subtractive.blob | 1054 |
| Shapes/Cone Screen | blobs/Shapes__Cone_Screen.blob | 1155 |
| Shapes/Regular Polygon ColorBurn | blobs/Shapes__Regular_Polygon_ColorBurn.blob | 4326 |
| Shapes/Triangle Transparent | blobs/Shapes__Triangle_Transparent.blob | 5314 |
| Shapes/Line 3D Opaque | blobs/Shapes__Line_3D_Opaque.blob | 3325 |
| Shapes/Polygon Lighten | blobs/Shapes__Polygon_Lighten.blob | 930 |
| Shapes/Polygon Darken | blobs/Shapes__Polygon_Darken.blob | 952 |
| Shapes/Texture Additive | blobs/Shapes__Texture_Additive.blob | 788 |
| Shapes/Polygon Subtractive | blobs/Shapes__Polygon_Subtractive.blob | 930 |
| Shapes/Line 2D LinearBurn | blobs/Shapes__Line_2D_LinearBurn.blob | 3362 |
| Shapes/Cone Opaque | blobs/Shapes__Cone_Opaque.blob | 1153 |
| Shapes/Line 3D Lighten | blobs/Shapes__Line_3D_Lighten.blob | 3335 |
| Shapes/Disc ColorBurn | blobs/Shapes__Disc_ColorBurn.blob | 7262 |
| Shapes/Texture LinearBurn | blobs/Shapes__Texture_LinearBurn.blob | 803 |
| Shapes/Sphere ColorDodge | blobs/Shapes__Sphere_ColorDodge.blob | 1102 |
| Shapes/Rect Transparent | blobs/Shapes__Rect_Transparent.blob | 6409 |
| Shapes/Polyline 2D Screen | blobs/Shapes__Polyline_2D_Screen.blob | 3996 |
| Shapes/Quad Screen | blobs/Shapes__Quad_Screen.blob | 842 |
| Shapes/Cuboid Additive | blobs/Shapes__Cuboid_Additive.blob | 1060 |
| TextMeshPro/Distance Field | blobs/TextMeshPro__Distance_Field.blob | 8456 |
| Shapes/Cuboid Transparent | blobs/Shapes__Cuboid_Transparent.blob | 1056 |
| Shapes/Regular Polygon Subtractive | blobs/Shapes__Regular_Polygon_Subtractive.blob | 4260 |
| Shapes/Regular Polygon Additive | blobs/Shapes__Regular_Polygon_Additive.blob | 4260 |
| Shapes/Triangle LinearBurn | blobs/Shapes__Triangle_LinearBurn.blob | 5331 |
| Shapes/Torus Additive | blobs/Shapes__Torus_Additive.blob | 1366 |
| Shapes/Sphere Multiplicative | blobs/Shapes__Sphere_Multiplicative.blob | 1086 |
| Shapes/Triangle ColorBurn | blobs/Shapes__Triangle_ColorBurn.blob | 5376 |
| Shapes/Rect Darken | blobs/Shapes__Rect_Darken.blob | 6436 |
| Shapes/Regular Polygon Opaque | blobs/Shapes__Regular_Polygon_Opaque.blob | 4269 |
| Shapes/Polyline 2D Lighten | blobs/Shapes__Polyline_2D_Lighten.blob | 3996 |
| Shapes/Triangle Screen | blobs/Shapes__Triangle_Screen.blob | 5316 |
| Shapes/Line 3D Transparent | blobs/Shapes__Line_3D_Transparent.blob | 3325 |
| Shapes/Line 2D Lighten | blobs/Shapes__Line_2D_Lighten.blob | 3353 |
| Shapes/Quad Subtractive | blobs/Shapes__Quad_Subtractive.blob | 842 |
| Shapes/Line 3D ColorDodge | blobs/Shapes__Line_3D_ColorDodge.blob | 3411 |
| Shapes/Torus Subtractive | blobs/Shapes__Torus_Subtractive.blob | 1366 |
| Shapes/Polyline 2D Darken | blobs/Shapes__Polyline_2D_Darken.blob | 4027 |
| Shapes/Polygon Screen | blobs/Shapes__Polygon_Screen.blob | 930 |
| TextMeshPro/Mobile/Distance Field (Surface) | blobs/TextMeshPro__Mobile__Distance_Field__Surface_.blob | 4497 |
| Shapes/Quad ColorBurn | blobs/Shapes__Quad_ColorBurn.blob | 916 |
| Shapes/Texture Transparent | blobs/Shapes__Texture_Transparent.blob | 772 |
| Shapes/Triangle Subtractive | blobs/Shapes__Triangle_Subtractive.blob | 5316 |
| Shapes/Quad Lighten | blobs/Shapes__Quad_Lighten.blob | 842 |
| Shapes/Sphere Transparent | blobs/Shapes__Sphere_Transparent.blob | 1052 |
| Shapes/Regular Polygon Multiplicative | blobs/Shapes__Regular_Polygon_Multiplicative.blob | 4284 |
| Shapes/Disc Lighten | blobs/Shapes__Disc_Lighten.blob | 7136 |
| Shapes/Polyline 2D Transparent | blobs/Shapes__Polyline_2D_Transparent.blob | 4000 |
| DearImGui/Procedural | blobs/DearImGui__Procedural.blob | 964 |
| Shapes/Triangle Additive | blobs/Shapes__Triangle_Additive.blob | 5316 |
| Shapes/Rect Opaque | blobs/Shapes__Rect_Opaque.blob | 11758 |
| Shapes/Texture Lighten | blobs/Shapes__Texture_Lighten.blob | 788 |
| Shapes/Regular Polygon Transparent | blobs/Shapes__Regular_Polygon_Transparent.blob | 4269 |
| TextMeshPro/Mobile/Distance Field Overlay | blobs/TextMeshPro__Mobile__Distance_Field_Overlay.blob | 2190 |
| Shapes/Cone Lighten | blobs/Shapes__Cone_Lighten.blob | 1155 |
| Shapes/Torus Screen | blobs/Shapes__Torus_Screen.blob | 1366 |
| Shapes/Texture Multiplicative | blobs/Shapes__Texture_Multiplicative.blob | 812 |
| Shapes/Sphere Darken | blobs/Shapes__Sphere_Darken.blob | 1086 |
| Shapes/Line 3D Screen | blobs/Shapes__Line_3D_Screen.blob | 3335 |
| Shapes/Sphere Lighten | blobs/Shapes__Sphere_Lighten.blob | 1054 |
| Shapes/Line 2D ColorDodge | blobs/Shapes__Line_2D_ColorDodge.blob | 3391 |
| Shapes/Regular Polygon Darken | blobs/Shapes__Regular_Polygon_Darken.blob | 4284 |
| Shapes/Quad Transparent | blobs/Shapes__Quad_Transparent.blob | 829 |
| Shapes/Polygon Transparent | blobs/Shapes__Polygon_Transparent.blob | 923 |
| Shapes/Triangle Opaque | blobs/Shapes__Triangle_Opaque.blob | 5314 |
| Shapes/Sphere Opaque | blobs/Shapes__Sphere_Opaque.blob | 1052 |
| Shapes/Texture Screen | blobs/Shapes__Texture_Screen.blob | 788 |
| Shapes/Quad Multiplicative | blobs/Shapes__Quad_Multiplicative.blob | 867 |
| Shapes/Line 3D Darken | blobs/Shapes__Line_3D_Darken.blob | 3380 |
| Shapes/Quad LinearBurn | blobs/Shapes__Quad_LinearBurn.blob | 856 |
| Shapes/Disc LinearBurn | blobs/Shapes__Disc_LinearBurn.blob | 7172 |
| Shapes/Quad Darken | blobs/Shapes__Quad_Darken.blob | 867 |
| Shapes/Quad Opaque | blobs/Shapes__Quad_Opaque.blob | 829 |
| TextMeshPro/Mobile/Distance Field - Masking | blobs/TextMeshPro__Mobile__Distance_Field_-_Masking.blob | 2176 |
| Shapes/Rect Additive | blobs/Shapes__Rect_Additive.blob | 6397 |
| Shapes/Triangle ColorDodge | blobs/Shapes__Triangle_ColorDodge.blob | 5354 |
| Shapes/Rect ColorDodge | blobs/Shapes__Rect_ColorDodge.blob | 6437 |
| Shapes/Sphere LinearBurn | blobs/Shapes__Sphere_LinearBurn.blob | 1078 |
| Shapes/Cuboid Lighten | blobs/Shapes__Cuboid_Lighten.blob | 1060 |
| Shapes/Quad ColorDodge | blobs/Shapes__Quad_ColorDodge.blob | 881 |
| Shapes/Rect Subtractive | blobs/Shapes__Rect_Subtractive.blob | 6397 |
| Shapes/Cone Darken | blobs/Shapes__Cone_Darken.blob | 1184 |
| Shapes/Cuboid Darken | blobs/Shapes__Cuboid_Darken.blob | 1091 |
| Shapes/Texture ColorDodge | blobs/Shapes__Texture_ColorDodge.blob | 830 |
| Shapes/Line 2D Darken | blobs/Shapes__Line_2D_Darken.blob | 3366 |
| Shapes/Sphere Additive | blobs/Shapes__Sphere_Additive.blob | 1054 |
| Shapes/Polyline 2D Opaque | blobs/Shapes__Polyline_2D_Opaque.blob | 4000 |
| TextMeshPro/Sprite | blobs/TextMeshPro__Sprite.blob | 1342 |
| Shapes/Polyline 2D Additive | blobs/Shapes__Polyline_2D_Additive.blob | 3996 |
| Shapes/Disc Darken | blobs/Shapes__Disc_Darken.blob | 7178 |
| Shapes/Line 3D Multiplicative | blobs/Shapes__Line_3D_Multiplicative.blob | 3380 |
| Shapes/Line 2D Additive | blobs/Shapes__Line_2D_Additive.blob | 3353 |
| Shapes/Cuboid Subtractive | blobs/Shapes__Cuboid_Subtractive.blob | 1060 |
| Shapes/Cone Transparent | blobs/Shapes__Cone_Transparent.blob | 1153 |
| TextMeshPro/Distance Field Overlay | blobs/TextMeshPro__Distance_Field_Overlay.blob | 2508 |
| Shapes/Quad Additive | blobs/Shapes__Quad_Additive.blob | 842 |
| Shapes/Polygon ColorDodge | blobs/Shapes__Polygon_ColorDodge.blob | 970 |
| Shapes/Polygon Additive | blobs/Shapes__Polygon_Additive.blob | 930 |
| Shapes/Polyline 2D Subtractive | blobs/Shapes__Polyline_2D_Subtractive.blob | 3996 |
| Shapes/Rect Screen | blobs/Shapes__Rect_Screen.blob | 6397 |
| Shapes/Polyline 2D LinearBurn | blobs/Shapes__Polyline_2D_LinearBurn.blob | 4022 |
| Shapes/Disc Multiplicative | blobs/Shapes__Disc_Multiplicative.blob | 7178 |
| Shapes/Disc Additive | blobs/Shapes__Disc_Additive.blob | 7136 |
| Shapes/Cone ColorDodge | blobs/Shapes__Cone_ColorDodge.blob | 1205 |
| Shapes/Regular Polygon Screen | blobs/Shapes__Regular_Polygon_Screen.blob | 4260 |
| Shapes/Cuboid Screen | blobs/Shapes__Cuboid_Screen.blob | 1060 |
| Shapes/Cuboid ColorDodge | blobs/Shapes__Cuboid_ColorDodge.blob | 1108 |
| Shapes/Disc ColorDodge | blobs/Shapes__Disc_ColorDodge.blob | 7211 |
| Shapes/Texture Opaque | blobs/Shapes__Texture_Opaque.blob | 772 |
| Shapes/Line 2D Opaque | blobs/Shapes__Line_2D_Opaque.blob | 3353 |
| Shapes/Regular Polygon ColorDodge | blobs/Shapes__Regular_Polygon_ColorDodge.blob | 4299 |
| TextMeshPro/Distance Field (Surface) | blobs/TextMeshPro__Distance_Field__Surface_.blob | 13523 |
| Shapes/Cone Subtractive | blobs/Shapes__Cone_Subtractive.blob | 1155 |
| Shapes/Torus Lighten | blobs/Shapes__Torus_Lighten.blob | 1366 |
| Shapes/Torus ColorBurn | blobs/Shapes__Torus_ColorBurn.blob | 1438 |
| Shapes/Rect ColorBurn | blobs/Shapes__Rect_ColorBurn.blob | 6478 |
| Shapes/Torus Darken | blobs/Shapes__Torus_Darken.blob | 1392 |
| Shapes/Line 3D Subtractive | blobs/Shapes__Line_3D_Subtractive.blob | 3335 |
| TextMeshPro/Mobile/Distance Field | blobs/TextMeshPro__Mobile__Distance_Field.blob | 4361 |
| Skybox/Procedural | blobs/Skybox__Procedural.blob | 3037 |

## ComputeShader（后处理栈）

| Name | Kernels | Variants | CBuffer |
|---|---:|---:|---:|
| Histogram | 0 | 1 | 0 |
| Texture3DLerp | 0 | 1 | 0 |
| AutoExposure | 0 | 1 | 0 |
| MultiScaleVORender | 0 | 1 | 0 |
| Lut3DBaker | 0 | 1 | 0 |
| MultiScaleVODownsample1 | 0 | 1 | 0 |
| MultiScaleVOUpsample | 0 | 1 | 0 |
| GaussianDownsample | 0 | 1 | 0 |
| ExposureHistogram | 0 | 1 | 0 |
| Waveform | 0 | 1 | 0 |
| Vectorscope | 0 | 1 | 0 |
| MultiScaleVODownsample2 | 0 | 1 | 0 |
