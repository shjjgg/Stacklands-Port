// 还原自 shader_extract/glsl_exact/Custom__FloorShaderForest__08_PS.glsl(与 FloorShader 同骨架)。
// 差异: 森林地面铺 _EdgeColor 苔色权重更高(_EdgeColor 占 0.6→0.8), 石板纹理采样噪声放大到 0.006。
//   + 光照走 Unity Standard BRDF(与原始 Standard 改编一致, 见 Common/SokpopLit.cginc)。
// 石板: uv 映射到 _Rect 的 3D 圆角盒 SDF 得到格子与 _EdgeThickness 边缘环, 
// 贴图 _OffsetTex 做噪声位移采样得到纹理扰动, 石板色 _StoneColor/_StoneEdge, 边缘色 _EdgeColor。
Shader "Custom/FloorShaderForest"
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
            ZTest LEqual
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
                float py = p.y + n1 * 0.006;
                float n2 = Hash01(py * 300.0);
                float px = p.x + n2 * 0.006;
                float2 uvp = float2(px, py) * 1.5;

                float4 off = tex2D(_OffsetTex, uvp);

                // 石板/格线: 原版 SDF 在 **世界空间 XZ**(TEXCOORD1.xz - 棋盘中心), 半径由 _Rect 给出:
                //   half=(_Rect.x, _Rect.z), 圆角 r=|_Rect.w|, 世界单位下 dist<0 为板内。
                // 之前用 uv*1.5 当坐标, 而 _Rect.x=4.3, 永远 dist<0 ⇒ 边界环永远不出现, 这就是"卡牌场没有边框"。
                float3 wc3 = mul(unity_ObjectToWorld, float4(0,0,0,1)).xyz;
                float2 pw  = i.worldPos.xz - wc3.xz;
                float2 halfExt = float2(_Rect.x, _Rect.z);
                float  rr  = clamp(abs(_Rect.w), 0.0, min(halfExt.x, halfExt.y) - 0.01);
                float2 q   = abs(pw) - (halfExt - rr);
                float  dist = length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - rr;
                float  aa   = max(abs(ddx(dist)) + abs(ddy(dist)), 1e-5);
                float  insideMask = saturate(0.5 - dist / aa);
                float  tIn  = max(-dist, 0.0);
                float  bw   = max(_EdgeThickness * 1.5, 0.02);
                float  border = insideMask * saturate(1.0 - tIn / bw);

                float3 albedo = _Color.rgb;
                albedo = lerp(albedo, _EdgeColor.rgb, border);

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
            ZTest LEqual
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
