// 还原自 shader_extract/glsl_exact/Custom__GridShader__03_PS.glsl。
// 棋盘格地面: uv 空间按 _LineWidth 画网格线, 线与格子用 _Color 与其乘子色, 受环境光/主光影响,
// 混合为 One OneMinusSrcAlpha(premultiplied)。第二 pass 为 FORWARDADD(Blend One One) 逐光叠加。
Shader "Custom/GridShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Glossiness ("Smoothness", Range(0.0, 1.0)) = 0.5
        _Metallic ("Metallic", Range(0.0, 1.0)) = 0.0
        _LineWidth ("Line Width", Float) = 0.1
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }

        Pass
        {
            Tags { "LightMode"="FORWARDBASE" }
            ZTest LEqual
            ZWrite Off
            Blend One OneMinusSrcAlpha
            ColorMask GBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdbase
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ SHADOWS_SCREEN UNITY_HDR_ON

            float4 _Color;
            float _Glossiness;
            float _Metallic;
            float _LineWidth;

            struct appdata { float4 vertex : POSITION; float3 normal : NORMAL; float2 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 worldNormal : TEXCOORD1;
                float4 color : TEXCOORD2;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.color = v.color;
                return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                // 网格线: 取 uv 到最近整数边界的距离
                float2 g = abs(frac(i.uv) - 0.5);
                float2 d2 = (0.5 - g);
                float lineDist = min(d2.x, d2.y);
                float aa = max(abs(ddx(lineDist)), abs(ddy(lineDist)));
                float lineCov = 1.0 - saturate(lineDist / max(_LineWidth, 1e-4) * 1.0);

                // 格子填充色 (线内 _Color, 格子稍暗)
                float4 fill = _Color * (0.55 + 0.45 * saturate(lineDist * 2.0));

                // 主光方向漫反射 + 环境光 (SH)
                float3 n = normalize(i.worldNormal);
                float ndl = saturate(dot(n, normalize(_WorldSpaceLightPos0.xyz)));
                float3 amb = ShadeSH9(float4(n, 1.0));
                float3 lit = fill.rgb * (amb + _LightColor0.rgb * ndl * (0.5 + 0.5 * _Glossiness));

                float3 rgb = lit * i.color.rgb;
                float  a   = fill.a * max(lineCov, 0.35) * i.color.a;
                // premultiplied
                return float4(rgb * a, a);
            }
            ENDCG
        }

        Pass
        {
            Tags { "LightMode"="FORWARDADD" }
            ZTest LEqual
            ZWrite Off
            Blend One One
            ColorMask GBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON

            float4 _Color;
            float _Glossiness;
            float _Metallic;
            float _LineWidth;

            struct appdata { float4 vertex : POSITION; float3 normal : NORMAL; float2 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f { float4 pos : SV_POSITION; float2 uv : TEXCOORD0; float3 worldNormal : TEXCOORD1; float4 color : TEXCOORD2; };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.color = v.color;
                return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                float2 g = abs(frac(i.uv) - 0.5);
                float lineDist = min(0.5 - g.x, 0.5 - g.y);
                float3 n = normalize(i.worldNormal);
                float3 L = normalize(_WorldSpaceLightPos0.xyz);
                float atten = 1.0;
                #ifdef POINT
                    atten = 1.0 / (1.0 + 0.15 * dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz));
                #endif
                float ndl = saturate(dot(n, L));
                float3 add = _LightColor0.rgb * ndl * atten * _Color.rgb * i.color.rgb;
                float a = _Color.a * saturate(lineDist * 2.0) * i.color.a;
                return float4(add * a, 0.0);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
