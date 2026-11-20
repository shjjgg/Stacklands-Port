// 还原自 shader_extract/glsl_exact/Custom__ConflictOutlineSdfShader__03_PS.glsl。
// 卡牌冲突高亮: 以 _Size.xy 为半尺寸的圆角矩形边框, 只有 _OutlineThickness 宽的环带可见,
// 环带颜色 _OutlineColor, 内部透明。距离场用 sdRoundBox(圆角半径取 _OutlineThickness*0.5)。
Shader "Custom/ConflictOutlineSdfShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Size ("Size", Vector) = (1,1,1,1)
        _OutlineColor ("Outline Color", Color) = (1,1,1,1)
        _OutlineThickness ("Outline Thickness", Float) = 0.1
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }

        Pass
        {
            ZTest LEqual
            ZWrite Off
            Blend SrcAlpha OneMinusSrcAlpha
            ColorMask GBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color; float4 _Size; float4 _OutlineColor; float _OutlineThickness;

            struct appdata { float4 vertex : POSITION; float3 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f { float4 pos : SV_POSITION; float3 uv : TEXCOORD0; float4 color : TEXCOORD1; };

            v2f vert (appdata v) { v2f o; o.pos = UnityObjectToClipPos(v.vertex); o.uv = v.uv; o.color = v.color; return o; }

            float SdRoundBox(float2 p, float2 b, float r)
            {
                float2 q = abs(p) - b + r;
                return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;
            }

            float4 frag (v2f i) : SV_Target
            {
                float2 p = float2(i.uv.x, i.uv.y);
                float2 halfSize = float2(_Size.x, _Size.y) * 0.5;
                float  r  = _OutlineThickness * 0.5;
                // 外框距离(负值在内)与内框距离, 差即环带
                float dOut = SdRoundBox(p, halfSize, r);
                float dIn  = SdRoundBox(p, halfSize - _OutlineThickness, max(r - _OutlineThickness, 0.0));
                float band = max(dOut, -dIn);

                float aa = abs(ddy(band)) + abs(ddx(band));
                float cov = 1.0 - saturate(band / max(aa, 1e-6) + 0.5);

                float4 col = _OutlineColor;
                float3 rgb = col.rgb * _Color.rgb + col.rgb * i.color.rgb;
                return float4(rgb, col.a * cov * _Color.a);
            }
            ENDCG
        }

        Pass
        {
            ZTest LEqual
            ZWrite Off
            Blend SrcAlpha One
            ColorMask GBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color; float4 _Size; float4 _OutlineColor; float _OutlineThickness;

            struct appdata { float4 vertex : POSITION; float3 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f { float4 pos : SV_POSITION; float3 uv : TEXCOORD0; float4 color : TEXCOORD1; };

            v2f vert (appdata v) { v2f o; o.pos = UnityObjectToClipPos(v.vertex); o.uv = v.uv; o.color = v.color; return o; }

            float SdRoundBox(float2 p, float2 b, float r)
            {
                float2 q = abs(p) - b + r;
                return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;
            }

            float4 frag (v2f i) : SV_Target
            {
                float2 p = float2(i.uv.x, i.uv.y);
                float2 halfSize = float2(_Size.x, _Size.y) * 0.5;
                float r = _OutlineThickness * 0.5;
                float dOut = SdRoundBox(p, halfSize, r);
                float dIn  = SdRoundBox(p, halfSize - _OutlineThickness, max(r - _OutlineThickness, 0.0));
                float band = max(dOut, -dIn);
                float aa = abs(ddy(band)) + abs(ddx(band));
                float cov = 1.0 - saturate(band / max(aa, 1e-6) + 0.5);
                return float4(_OutlineColor.rgb * _Color.rgb, _OutlineColor.a * cov * _Color.a);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
