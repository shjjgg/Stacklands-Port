// 还原自 shader_extract/glsl_exact/Custom__TransportArrowMainlandShader__03_PS.glsl。
// 大陆区版本: 三点电缆 + _Middle 处呼吸圆头(_CircleNoise 控制抖动), 无车辆段。
// cb0: _m2=_Color, _m4/_m5=描边/内色, _m6/_m8=起点/终点, _m10=(线宽, 描边宽, 高亮, 噪声)。
Shader "Custom/TransportArrowMainlandShader"
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
        _LineThickness ("Line Thickness", Float) = 0.1
        _OutlineThickness ("Outline Thickness", Float) = 0.1
        _CircleColor ("Circle Color", Color) = (1,1,1,1)
        _CircleNoise ("Circle Noise", Float) = 1
        _HighlightAmount ("Highlight Amount", Float) = 1.2
        _ZTestCable ("_ZTestCable", Float) = 0
        _IsBehind ("Is behind", Float) = 1
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }

        Pass
        {
            ZTest Always
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
            float4 _OutlineColor; float _LineThickness; float _OutlineThickness;
            float4 _CircleColor; float _CircleNoise; float _HighlightAmount;
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

                // 中点呼吸圆: 半径随 _CircleNoise 抖动
                float rCircle = _LineThickness * 1.8 + (Hash01(round(_Time.y * 4.0)) - 0.5) * _CircleNoise * 0.05;
                float dCircle = length(p - m) - rCircle;
                float covCircle = saturate(-dCircle / max(abs(ddx(dCircle)) + abs(ddy(dCircle)), 1e-6) + 0.5);

                float aa = abs(ddy(d)) + abs(ddx(d));
                float covLine  = saturate((_LineThickness - d) / max(aa, 1e-6) + 0.5);
                float covOuter = saturate((_LineThickness + _OutlineThickness - d) / max(aa, 1e-6) + 0.5);

                float4 col = lerp(_OutlineColor, _Color, covLine);
                float4 cc  = _CircleColor * _HighlightAmount;
                col = lerp(col, cc, covCircle);

                float3 rgb = col.rgb * _Color.rgb + col.rgb * i.color.rgb;
                float  alpha = col.a * max(covOuter, covCircle) * _Color.a;
                return float4(rgb, alpha);
            }
            ENDCG
        }

        Pass
        {
            ZTest Always
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
            float _LineThickness; float _OutlineThickness; float4 _OutlineColor;
            float4 _CircleColor; float _CircleNoise; float _HighlightAmount;
            float _Noise; float _SideLength; float _ZTestCable; float _IsBehind;

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
                float d = min(SdSegT(p, a, m).x, SdSegT(p, m, b).x);
                float dCircle = length(p - m) - _LineThickness * 1.8;
                float covLine = saturate((_LineThickness - d) / max(abs(ddy(d)) + abs(ddx(d)), 1e-6) + 0.5);
                float covCircle = saturate(-dCircle / max(abs(ddx(dCircle)) + abs(ddy(dCircle)), 1e-6) + 0.5);
                float4 col = lerp(_OutlineColor, _Color, covLine);
                col = lerp(col, _CircleColor * _HighlightAmount, covCircle);
                return float4(col.rgb * _Color.rgb, col.a * max(covLine, covCircle) * _Color.a);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
