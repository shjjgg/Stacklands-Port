// 还原自 shader_extract/glsl_exact/Custom__FloorShaderIsland__08_PS.glsl。
// 岛屿地面: 与 FloorShader 相同的 3D 圆角盒 SDF 石板, 额外用 _SdfTex 做海浪位移(时间相位 0.2),
// 由位移后的距离场叠出 水面(_WaterColor)/描边(_OutlineColor,_OutlineWidth)/岛面(_FaceColor) 三层,
// _IslandDownsize 控制岛体缩小系数。光照走 Unity Standard BRDF(Common/SokpopLit.cginc)。
Shader "Custom/FloorShaderIsland"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Color2 ("Color2", Color) = (1,1,1,1)
        _OffsetTex ("Offset", 2D) = "white" {}
        _StoneColor ("Stone Color", Color) = (1,1,1,1)
        _StoneEdge ("Stone Edge", Color) = (1,1,1,1)
        _EdgeColor ("Edge Color", Color) = (1,1,1,1)
        _EdgeThickness ("Edge Thickness", Float) = 0.1
        _MainTex ("Albedo", 2D) = "white" {}
        _SdfTex ("SDF", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0.0,1.0)) = 0.5
        _Metallic ("Metallic", Range(0.0,1.0)) = 0.0
        _WaterColor ("Water Color", Color) = (1,1,1,1)
        _OutlineWidth ("Outline Width", Float) = 1
        _OutlineColor ("Outline Color", Color) = (1,1,1,1)
        _FaceColor ("Face Color", Color) = (1,1,1,1)
        _Rect ("Rect", Vector) = (0,0,0,0)
        _IslandDownsize ("Island Downsize", Float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            Tags { "LightMode"="FORWARDBASE" }
            ZTest LessEqual
            ZWrite On

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "../Common/SokpopLit.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color; float4 _Color2;
            sampler2D _OffsetTex;
            float4 _StoneColor; float4 _StoneEdge; float4 _EdgeColor;
            float _EdgeThickness;
            sampler2D _MainTex;
            sampler2D _SdfTex;
            float _Glossiness; float _Metallic;
            float4 _WaterColor; float _OutlineWidth; float4 _OutlineColor; float4 _FaceColor;
            float4 _Rect; float _IslandDownsize;

            struct appdata { float4 vertex:POSITION; float3 normal:NORMAL; float2 uv:TEXCOORD0; float4 color:COLOR; };
            struct v2f
            {
                float4 pos:SV_POSITION;
                float3 worldNormal:TEXCOORD0;
                float3 worldPos:TEXCOORD1;
                float2 uv:TEXCOORD2;
                float4 color:TEXCOORD3;
                UNITY_FOG_COORDS(4)
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.uv = v.uv;
                o.color = v.color;
                UNITY_TRANSFER_FOG(o, o.pos);
                return o;
            }

            float Hash01(float x) { return frac(sin(round(x)) * 43758.546875) - 0.5; }
            float SdBox(float3 p, float3 b, float r)
            {
                float3 q = abs(p) - b;
                return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0) - r;
            }

            float4 frag(v2f i) : SV_Target
            {
                // ---- 与 FloorShader 一致的噪声位移 uv (对应 _140.._155) ----
                float2 p = i.uv;
                float n1 = Hash01(p.y * 600.0);
                float py = p.y + n1 * 0.005;
                float n2 = Hash01(py * 300.0);
                float px = p.x + n2 * 0.005;

                // ---- 石板 SDF (对应 _160.._190) ----
                float3 halfB = float3(_Rect.x + _EdgeThickness, _Rect.y, _Rect.z + _EdgeThickness * 0.58);
                float3 t3 = float3(px, i.uv.y, 0.0);
                float dOut  = SdBox(t3, halfB, _Rect.w);
                float dOut2 = SdBox(t3, halfB + 0.03, _Rect.w + 0.03);
                float inside  = 1.0 - dOut;
                float inside2 = 1.0 - dOut2;

                // ---- SdfTex 海浪位移 (时间相位 fma(cb1.m.x,0.2,uv) ) ----
                float2 waveUv = float2(px * 0.1 + _Time.y * 0.2, py * 0.1 + _Time.y * 0.2);
                float4 wave = tex2D(_SdfTex, waveUv);
                float3 wp = float3(px + (wave.x * 2.0 - 1.0) * 0.1, i.uv.y, py + (wave.y * 2.0 - 1.0) * 0.1);

                // ---- 三层: 水面 / 岛面 / 描边环 (对应 _220.._295) ----
                float dWater = SdBox(wp, float3(halfB.x + 1.0, halfB.y, halfB.z + 1.0), 0.5);
                float isWater = step(dWater, 0.3) * _IslandDownsize;
                float dFace  = SdBox(wp, float3(halfB.x + 0.7, halfB.y, halfB.z + 0.7), 0.5);
                float isFace = step(dFace, 0.5) * _IslandDownsize;

                // 外描边环 (半径 _OutlineWidth)
                float dOutline = SdBox(wp, float3(halfB.x + 0.6, halfB.y, halfB.z + 0.6), 0.5);

                float3 albedo = _WaterColor.rgb * isWater;
                albedo = lerp(albedo, _OutlineColor.rgb, saturate(step(dOutline, _OutlineWidth * 0.5) * (1.0 - isFace)));
                albedo = lerp(albedo, _FaceColor.rgb, saturate(isFace));

                // 石板与边缘色并入岛面 (同 Floor 的 lerp 权重)
                float aa = abs(ddy(inside)) + abs(ddx(inside));
                float cov = saturate((inside - 0.5) / max(aa, 1e-6) + 0.5);
                float3 stone = lerp(_StoneEdge.rgb, _StoneColor.rgb, saturate(inside2));
                albedo = lerp(albedo, stone, saturate(isFace) * cov * 0.85);
                albedo *= lerp(_Color.rgb, _Color2.rgb, saturate(dOut));
                albedo *= lerp(float3(1,1,1), tex2D(_MainTex, i.uv).rgb, 0.25);

                float4 col = SokpopShadeBase(albedo, _Glossiness, _Metallic, normalize(i.worldNormal), i.worldPos);
                col.rgb *= i.color.rgb;
                col.a = 1.0;
                return col;
            }
            ENDCG
        }

        Pass
        {
            Tags { "LightMode"="FORWARDADD" }
            ZTest LessEqual
            ZWrite Off
            Blend One One

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "../Common/SokpopLit.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color; float4 _Color2;
            sampler2D _MainTex; sampler2D _SdfTex; sampler2D _OffsetTex;
            float4 _StoneColor; float4 _StoneEdge; float4 _EdgeColor;
            float _EdgeThickness; float _Glossiness; float _Metallic;
            float4 _WaterColor; float _OutlineWidth; float4 _OutlineColor; float4 _FaceColor;
            float4 _Rect; float _IslandDownsize;

            struct appdata { float4 vertex:POSITION; float3 normal:NORMAL; float2 uv:TEXCOORD0; float4 color:COLOR; };
            struct v2f { float4 pos:SV_POSITION; float3 worldNormal:TEXCOORD0; float3 worldPos:TEXCOORD1; float2 uv:TEXCOORD2; float4 color:TEXCOORD3; UNITY_FOG_COORDS(4) };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                o.uv = v.uv; o.color = v.color;
                UNITY_TRANSFER_FOG(o, o.pos);
                return o;
            }

            float4 frag(v2f i) : SV_Target
            {
                float3 albedo = _FaceColor.rgb * _Color.rgb * tex2D(_MainTex, i.uv).rgb;
                float4 col = SokpopShadeAdd(albedo, _Glossiness, _Metallic, normalize(i.worldNormal), i.worldPos);
                col.rgb *= i.color.rgb;
                col.a = 0.0;
                return col;
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
