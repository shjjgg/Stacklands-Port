// 还原自 shader_extract/glsl_exact/Custom__FloorShader__08_PS.glsl(基础/Stone 计算) 
//   + 光照走 Unity Standard BRDF(与原始 Standard 改编一致, 见 Common/SokpopLit.cginc)。
// 石板: uv 映射到 _Rect 的 3D 圆角盒 SDF 得到格子与 _EdgeThickness 边缘环, 
// 贴图 _OffsetTex 做噪声位移采样得到纹理扰动, 石板色 _StoneColor/_StoneEdge, 边缘色 _EdgeColor。
Shader "Custom/FloorShader"
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
        _Glossiness ("Smoothness", Range(0.0,1.0)) = 0.5
        _Metallic ("Metallic", Range(0.0,1.0)) = 0.0
        _Rect ("Rect", Vector) = (0,0,0,0)
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

            float4 _Color;
            float4 _Color2;
            sampler2D _OffsetTex;
            float4 _StoneColor;
            float4 _StoneEdge;
            float4 _EdgeColor;
            float _EdgeThickness;
            sampler2D _MainTex;
            float _Glossiness;
            float _Metallic;
            float4 _Rect;

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

            float4 frag(v2f i) : SV_Target
            {
                // 对应 _134.._152: uv 两次哈希位移
                float2 p = i.uv;
                float n1 = Hash01(p.y * 600.0);
                float py = p.y + n1 * 0.005;
                float n2 = Hash01(py * 300.0);
                float px = p.x + n2 * 0.005;
                float2 uvp = float2(px, py) * 1.5;

                float4 off = tex2D(_OffsetTex, uvp);

                // 3D 盒 SDF(uvx, uvy, uvz) -> 石板与边缘环
                float3 b = float3(_Rect.x + _EdgeThickness, _Rect.y, _Rect.z + _EdgeThickness * 0.58);
                float3 t3 = float3(i.uv.x * 1.5, i.uv.y * 1.5, 0.0);
                float3 d3 = abs(t3) - b;
                float dOut = length(max(d3, 0.0)) - _Rect.w;
                float inside = 1.0 - dOut;

                float3 b2 = b + 0.03;
                float3 d3b = abs(t3) - b2;
                float dOut2 = length(max(d3b, 0.0)) - (_Rect.w + 0.03);
                float inside2 = 1.0 - dOut2;

                float aa = abs(ddy(inside)) + abs(ddx(inside));
                float cov = saturate((inside - 0.5) / max(aa, 1e-6) + 0.5);

                // 石板色/边缘色
                float3 stone = lerp(_StoneEdge.rgb, _StoneColor.rgb, saturate(inside2));
                float3 edge  = _EdgeColor.rgb;
                float  edgeMask = (1.0 - saturate(inside2)) ;
                float3 albedo = lerp(stone, edge * saturate(off.rgb * 1.6), edgeMask * 0.6);
                albedo *= lerp(_Color.rgb, _Color2.rgb, saturate(dOut));

                float4 mainTex = tex2D(_MainTex, i.uv);
                albedo *= lerp(float3(1,1,1), mainTex.rgb, 0.25);

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

            float4 _Color;
            float4 _Color2;
            sampler2D _OffsetTex;
            float4 _StoneColor;
            float4 _StoneEdge;
            float4 _EdgeColor;
            float _EdgeThickness;
            sampler2D _MainTex;
            float _Glossiness;
            float _Metallic;
            float4 _Rect;

            struct appdata { float4 vertex:POSITION; float3 normal:NORMAL; float2 uv:TEXCOORD0; float4 color:COLOR; };
            struct v2f { float4 pos:SV_POSITION; float3 worldNormal:TEXCOORD0; float3 worldPos:TEXCOORD1; float2 uv:TEXCOORD2; float4 color:TEXCOORD3; UNITY_FOG_COORDS(4) };

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

            float4 frag(v2f i) : SV_Target
            {
                float3 albedo = lerp(_StoneEdge.rgb, _StoneColor.rgb, saturate(1.0 - _Rect.y));
                albedo *= _Color.rgb;
                albedo *= tex2D(_MainTex, i.uv).rgb;
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
