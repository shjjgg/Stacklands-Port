// 还原自 shader_extract/glsl_exact/Custom__SewerPipeShader__03_PS.glsl。
// 下水道管道: 三点折线(_Start-_Middle-_End) 双段 SDF, _ThickColor 用于管壁加粗段,
// _HighlightAmount 抬高亮度(1.2)。pass 状态: ZTest Always / 前者 SrcAlpha OneMinusSrcAlpha / 后者 SrcAlpha One。
Shader "Custom/SewerPipeShader"
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
        _ThickColor ("Thick Color", Color) = (1,1,1,1)
        _LineThickness ("Line Thickness", Float) = 0.1
        _OutlineThickness ("Outline Thickness", Float) = 0.1
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
            float4 _OutlineColor; float4 _ThickColor;
            float _LineThickness; float _OutlineThickness;
            float _HighlightAmount; float _ZTestCable; float _IsBehind;

            struct appdata { float4 vertex : POSITION; float3 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f { float4 pos : SV_POSITION; float3 uv : TEXCOORD0; float4 color : TEXCOORD1; };

            v2f vert (appdata v) { v2f o; o.pos = UnityObjectToClipPos(v.vertex); o.uv = v.uv; o.color = v.color; return o; }

            float Hash01(float x) { return frac(sin(round(x)) * 43758.546875); }
            float SdSeg(float2 p, float2 a, float2 b)
            {
                float2 ab = b - a;
                float t = saturate(dot(p - a, ab) / max(dot(ab, ab), 1e-9));
                return length(p - (a + ab * t));
            }

            float4 frag (v2f i) : SV_Target
            {
                float n1 = Hash01(i.uv.x * 1000.0) - 0.5;
                float z1 = i.uv.z + n1 * _Noise * 0.005;
                float2 p = float2(i.uv.x + (Hash01(round(z1 * 10.0) + _Time.y) - 0.5) * _Noise * 0.005, z1);

                float2 a = float2(_Start.x, _Start.y);
                float2 m = float2(_Middle.x, _Middle.y);
                float2 b = float2(_End.x, _End.y);

                float d  = min(SdSeg(p, a, m), SdSeg(p, m, b));
                float aa = abs(ddy(d)) + abs(ddx(d));
                float covLine  = saturate((_LineThickness - d) / max(aa, 1e-6) + 0.5);
                float covOuter = saturate((_LineThickness + _OutlineThickness - d) / max(aa, 1e-6) + 0.5);

                // 管壁加粗环: 中线以外 _OutlineThickness 区间用 _ThickColor 高亮
                float covThick = covOuter * (1.0 - covLine);
                float4 col = lerp(_OutlineColor, _Color, covLine);
                col = lerp(col, _ThickColor * _HighlightAmount, covThick);

                float3 rgb = col.rgb * _Color.rgb + col.rgb * i.color.rgb;
                return float4(rgb, col.a * covOuter * _Color.a);
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
            float4 _OutlineColor; float4 _ThickColor;
            float _LineThickness; float _OutlineThickness;
            float _HighlightAmount; float _Noise; float _SideLength;
            float _ZTestCable; float _IsBehind;

            struct appdata { float4 vertex : POSITION; float3 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f { float4 pos : SV_POSITION; float3 uv : TEXCOORD0; float4 color : TEXCOORD1; };

            v2f vert (appdata v) { v2f o; o.pos = UnityObjectToClipPos(v.vertex); o.uv = v.uv; o.color = v.color; return o; }
            float SdSeg(float2 p, float2 a, float2 b)
            {
                float2 ab = b - a;
                float t = saturate(dot(p - a, ab) / max(dot(ab, ab), 1e-9));
                return length(p - (a + ab * t));
            }

            float4 frag (v2f i) : SV_Target
            {
                float2 p = float2(i.uv.x, i.uv.z);
                float d = min(SdSeg(p, float2(_Start.x, _Start.y), float2(_Middle.x, _Middle.y)),
                              SdSeg(p, float2(_Middle.x, _Middle.y), float2(_End.x, _End.y)));
                float aa = abs(ddy(d)) + abs(ddx(d));
                float covLine  = saturate((_LineThickness - d) / max(aa, 1e-6) + 0.5);
                float covOuter = saturate((_LineThickness + _OutlineThickness - d) / max(aa, 1e-6) + 0.5);
                float4 col = lerp(_OutlineColor, _Color, covLine);
                col = lerp(col, _ThickColor * _HighlightAmount, covOuter * (1.0 - covLine));
                return float4(col.rgb * _Color.rgb, col.a * covOuter * _Color.a);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
