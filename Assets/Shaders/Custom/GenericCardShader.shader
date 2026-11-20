// 还原自 shader_extract/glsl_exact/Custom__GenericCardShader__08_PS.glsl。
// 通用卡面: 以 _Size.xy 为半尺寸的圆角矩形 (_Size.z 为圆角半径) 作为卡体 alpha/边框,
// _BorderThickness 宽的边框填 _Color, 卡体内部由顶点色着色。pass: FORWARDBASE/FORWARDADD/DEFERRED/SHADOWCASTER。
Shader "Custom/GenericCardShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Size ("Size", Vector) = (0,0,0,0)
        _BorderThickness ("Border Thickness", Float) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            Tags { "LightMode"="FORWARDBASE" }
            ZTest LEqual
            ZWrite On

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color; float4 _Size; float _BorderThickness;

            struct appdata { float4 vertex:POSITION; float3 normal:NORMAL; float2 uv:TEXCOORD0; float4 color:COLOR; };
            struct v2f { float4 pos:SV_POSITION; float3 worldNormal:TEXCOORD0; float3 worldPos:TEXCOORD1; float2 uv:TEXCOORD2; float4 color:TEXCOORD3; };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.uv = v.uv; o.color = v.color;
                return o;
            }

            float SdRoundBox(float2 p, float2 b, float r)
            {
                float2 q = abs(p) - b + r;
                return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;
            }

            float4 frag(v2f i) : SV_Target
            {
                // 卡片 uv 空间: (uv-0.5)*size -> 半尺寸坐标
                float2 p = (i.uv - 0.5) * float2(_Size.x, _Size.y);
                float2 halfSize = float2(_Size.x, _Size.y) * 0.5;
                float r = max(_Size.z, 0.0001);
                float d = SdRoundBox(p, halfSize, r);

                float aa = abs(ddy(d)) + abs(ddx(d));
                float body = saturate(-d / max(aa, 1e-6) + 0.5);

                // 内缩边框
                float dIn = SdRoundBox(p, halfSize - _BorderThickness, max(r - _BorderThickness, 0.0));
                float border = saturate((dIn - d) / max(aa, 1e-6));

                float3 albedo = lerp(i.color.rgb, _Color.rgb, border);
                // 简易漫反射(环境 SH + 主光)
                float3 n = normalize(i.worldNormal);
                float3 amb = ShadeSH9(float4(n, 1.0));
                float ndl = saturate(dot(n, normalize(UnityWorldSpaceLightDir(i.worldPos))));
                float3 lit = albedo * (amb + _LightColor0.rgb * ndl);
                return float4(lit, 1.0);
            }
            ENDCG
        }

        Pass
        {
            Tags { "LightMode"="FORWARDADD" }
            ZTest LEqual
            ZWrite Off
            Blend One One

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color; float4 _Size; float _BorderThickness;

            struct appdata { float4 vertex:POSITION; float3 normal:NORMAL; float2 uv:TEXCOORD0; float4 color:COLOR; };
            struct v2f { float4 pos:SV_POSITION; float3 worldNormal:TEXCOORD0; float3 worldPos:TEXCOORD1; float2 uv:TEXCOORD2; float4 color:TEXCOORD3; };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.uv = v.uv; o.color = v.color;
                return o;
            }

            float4 frag(v2f i) : SV_Target
            {
                float3 albedo = lerp(i.color.rgb, _Color.rgb, saturate(_BorderThickness));
                float3 n = normalize(i.worldNormal);
                float ndl = saturate(dot(n, normalize(UnityWorldSpaceLightDir(i.worldPos))));
                return float4(_LightColor0.rgb * ndl * albedo, 0.0);
            }
            ENDCG
        }

        Pass
        {
            Tags { "LightMode"="DEFERRED" }
            ZTest LEqual
            ZWrite On
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            struct appdata { float4 vertex:POSITION; };
            struct v2f { float4 pos:SV_POSITION; };
            v2f vert(appdata v) { v2f o; o.pos = UnityObjectToClipPos(v.vertex); return o; }
            float4 frag(v2f i) : SV_Target { return 0; }
            ENDCG
        }

        Pass
        {
            Tags { "LightMode"="SHADOWCASTER" }
            ZTest LEqual
            ZWrite On
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            struct appdata { float4 vertex:POSITION; float3 normal:NORMAL; };
            struct v2f { float4 pos:SV_POSITION; };
            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityClipSpaceShadowCasterPos(v.vertex, v.normal);
                o.pos = UnityApplyLinearShadowBias(o.pos);
                return o;
            }
            float4 frag(v2f i) : SV_Target { return 0; }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
