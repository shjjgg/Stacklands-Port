// 还原自 shader_extract/glsl_exact/Custom__TransportArrowShader__03_PS.glsl。
// 三点电缆(Start-Middle-End) + 沿线流动的"_线色", _CarColor 用于移动车辆高亮段,
// _HighlightAmount 抬高亮度(默认 1.2)。cb0 映射: _m2=_Color, _m4/_m5=描边/内色,
// _m6/_m8=起点/终点, _m10=(线宽, 描边宽, 高亮, 噪声)。
Shader "Custom/TransportArrowShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Start ("Start", Vector) = (1,1,1,1)
        _End ("End", Vector) = (1,1,1,1)
        _Middle ("Middle", Vector) = (1,1,1,1)
        _SideLength ("Side Length", Float) = 0.5
        _Noise ("Noise", Float) = 1
        _OutlineColor ("Outline Color", Color) = (1,1,1,1)
        _LineColor ("Line Color", Color) = (1,1,1,1)
        _LineThickness ("Line Thickness", Float) = 0.1
        _OutlineThickness ("Outline Thickness", Float) = 0.1
        _CarColor ("Car Color", Color) = (1,1,1,1)
        _HighlightAmount ("Highlight Amount", Float) = 1.2
        _ZTestCable ("_ZTestCable", Float) = 0
        _IsBehind ("Is behind", Float) = 1
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }

        Pass
        {
            ZTest Disabled
            ZWrite Off
            Blend SrcAlpha OneMinusSrcAlpha
            ColorMask GBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color; float4 _Start; float4 _End; float4 _Middle;
            float _SideLength; float _Noise;
            float4 _OutlineColor; float4 _LineColor;
            float _LineThickness; float _OutlineThickness;
            float4 _CarColor; float _HighlightAmount;
            float _ZTestCable; float _IsBehind;

            struct appdata { float4 vertex : POSITION; float3 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f { float4 pos : SV_POSITION; float3 uv : TEXCOORD0; float4 color : TEXCOORD1; };

            v2f vert (appdata v) { v2f o; o.pos = UnityObjectToClipPos(v.vertex); o.uv = v.uv; o.color = v.color; return o; }

            float Hash01(float x) { return frac(sin(round(x)) * 43758.546875); }
            float2 SdSegT(float2 p, float2 a, float2 b)
            {
                float2 ab = b - a;
                float t = saturate(dot(p - a, ab) / max(dot(ab, ab), 1e-9));
                return float2(length(p - (a + ab * t)), t);
            }

            float4 frag (v2f i) : SV_Target
            {
                float n1 = Hash01(i.uv.x * 1000.0) - 0.5;
                float z1 = i.uv.z + n1 * _Noise * 0.005;
                float2 p = float2(i.uv.x + (Hash01(round(z1 * 10.0) + _Time.y) - 0.5) * _Noise * 0.005, z1);

                float2 a = float2(_Start.x, _Start.y);
                float2 m = float2(_Middle.x, _Middle.y);
                float2 b = float2(_End.x, _End.y);

                float2 s1 = SdSegT(p, a, m);
                float2 s2 = SdSegT(p, m, b);
                float d = min(s1.x, s2.x);
                float t = (s1.x <= s2.x) ? s1.y * 0.5 : 0.5 + s2.y * 0.5;

                float aa = abs(ddy(d)) + abs(ddx(d));

                // 主电缆
                float covLine  = saturate((_LineThickness - d) / max(aa, 1e-6) + 0.5);
                float covOuter = saturate((_LineThickness + _OutlineThickness - d) / max(aa, 1e-6) + 0.5);

                // 沿线循环的车辆高亮段 (t 取 _Time 相位, 占 15% 长度)
                float carPhase = frac(t - _Time.y * 0.6);
                float covCar   = saturate((0.15 - carPhase) / 0.15 * 3.0) * covLine;

                float4 base = lerp(_OutlineColor, _LineColor, covLine);
                float4 car  = _CarColor * _HighlightAmount;
                float4 col  = lerp(base, car, covCar);
                float3 rgb  = col.rgb * _Color.rgb + col.rgb * i.color.rgb;
                float  alpha = col.a * covOuter * _Color.a;
                return float4(rgb, alpha);
            }
            ENDCG
        }

        Pass
        {
            ZTest Disabled
            ZWrite Off
            Blend SrcAlpha One
            ColorMask GBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color; float4 _Start; float4 _End; float4 _Middle;
            float _LineThickness; float _OutlineThickness;
            float4 _OutlineColor; float4 _LineColor; float4 _CarColor;
            float _HighlightAmount; float _Noise; float _SideLength;
            float _ZTestCable; float _IsBehind;

            struct appdata { float4 vertex : POSITION; float3 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f { float4 pos : SV_POSITION; float3 uv : TEXCOORD0; float4 color : TEXCOORD1; };

            v2f vert (appdata v) { v2f o; o.pos = UnityObjectToClipPos(v.vertex); o.uv = v.uv; o.color = v.color; return o; }
            float2 SdSegT(float2 p, float2 a, float2 b)
            {
                float2 ab = b - a;
                float t = saturate(dot(p - a, ab) / max(dot(ab, ab), 1e-9));
                return float2(length(p - (a + ab * t)), t);
            }

            float4 frag (v2f i) : SV_Target
            {
                float2 p = float2(i.uv.x, i.uv.z);
                float2 a = float2(_Start.x, _Start.y);
                float2 m = float2(_Middle.x, _Middle.y);
                float2 b = float2(_End.x, _End.y);
                float2 s1 = SdSegT(p, a, m);
                float2 s2 = SdSegT(p, m, b);
                float d = min(s1.x, s2.x);
                float t = (s1.x <= s2.x) ? s1.y * 0.5 : 0.5 + s2.y * 0.5;
                float aa = abs(ddy(d)) + abs(ddx(d));
                float covLine = saturate((_LineThickness - d) / max(aa, 1e-6) + 0.5);
                float4 col = lerp(_OutlineColor, _LineColor, covLine);
                float carPhase = frac(t - _Time.y * 0.6);
                col = lerp(col, _CarColor * _HighlightAmount, saturate((0.15 - carPhase) / 0.15 * 3.0) * covLine);
                return float4(col.rgb * _Color.rgb, col.a * covLine * _Color.a);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
