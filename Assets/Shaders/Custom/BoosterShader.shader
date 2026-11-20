// 还原自 shader_extract/glsl_exact/Custom__BoosterShader__08_PS.glsl(pass0 主体)。
// 卡包正面: 贴图 uv 重映射 (x-0.5)*1.75+0.5 / (y-0.4)*1.75+0.4 (对应 _202.._205),
// 双层 hash 抖动(150 倍频, 幅度 0.005) 用于反光位移, _RainbowTex 按 sin/cos 扭曲(±0.02, 5/10/30 倍频),
// _IconTex 图标按 _IconColor 叠加, 圆点 _SmallCirclePosition/_SmallCircleSize 用 2D 圆 SDF,
// 边缘 _BorderColor。光照走 Unity Standard BRDF(Common/SokpopLit.cginc)。
// 注: DEFERRED pass 仅为与原版 pass 拓扑对齐(本项目 2D 正交相机只用 forward 路径)。
Shader "Custom/BoosterShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Color2 ("Color2", Color) = (1,1,1,1)
        _IconColor ("Icon Color", Color) = (1,1,1,1)
        _MainTex ("Albedo", 2D) = "white" {}
        _IconTex ("Icon", 2D) = "white" {}
        _RainbowTex ("Rainbow", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0.0,1.0)) = 0.5
        _Metallic ("Metallic", Range(0.0,1.0)) = 0.0
        _SparkleIntensity ("Sparkle Intensity", Float) = 1
        _SmallCirclePosition ("Small Circle Position", Vector) = (1,1,1,1)
        _SmallCircleSize ("Small Circle Size", Float) = 1
        _BorderColor ("Border Color", Color) = (1,1,1,1)
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

            float4 _Color; float4 _Color2; float4 _IconColor;
            sampler2D _MainTex; sampler2D _IconTex; sampler2D _RainbowTex;
            float _Glossiness; float _Metallic; float _SparkleIntensity;
            float4 _SmallCirclePosition; float _SmallCircleSize; float4 _BorderColor;

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
                o.uv = v.uv; o.color = v.color;
                UNITY_TRANSFER_FOG(o, o.pos);
                return o;
            }

            float Hash01(float x) { return frac(sin(round(x)) * 43758.546875); }

            float3 BoosterAlbedo(float2 uv)
            {
                // 双层抖动 (对应 _178.._191)
                float d1 = Hash01(uv.y * 150.0) - 0.5;
                float ux = uv.x + d1 * 0.005;
                float d2 = Hash01(ux * 150.0) - 0.5;
                float uy = uv.y + d2 * 0.005;

                // 卡面 uv 重映射 (对应 _202.._205)
                float2 packUv = float2((uv.x - 0.5) * 1.75 + 0.5, (uv.y - 0.4) * 1.75 + 0.4);

                float4 pack = tex2D(_MainTex, packUv);
                float inRange = step(0.0, packUv.x) * step(packUv.x, 1.0) * step(0.0, packUv.y) * step(packUv.y, 1.0);
                float masked = lerp(pack.a, 0.0, inRange) + (1.0 - inRange) * pack.a;

                // 彩虹膜扭曲 (对应 _241.._257)
                float3 viewDirW = normalize(UnityWorldSpaceViewDir(mul(unity_ObjectToWorld, float4(uv, 0, 1)).xyz));
                float warpA = (uy + ux) - viewDirW.x * 5.0;
                float warpB = (uy + uy) - viewDirW.z * 5.0;
                float warpU = warpA + sin(warpB * 10.0) * 0.02;
                float warpV = warpB + cos(warpU * 30.0) * 0.02;
                float4 rainbow = tex2D(_RainbowTex, float2(warpU, warpV));

                float3 baseCol = pack.rgb * _Color.rgb;
                float3 rainbowCol = rainbow.rgb * _Color2.rgb * masked * _SparkleIntensity;

                // 圆点 (对应 _261.._264, 半径 0.4*_SmallCircleSize)
                float2 cp = float2((uv.x - 0.5) * 1.75 - _SmallCirclePosition.x, (uv.y - 0.4) * 1.75 - _SmallCirclePosition.y);
                float circle = saturate(1.0 - (length(cp) - 0.4003 * _SmallCircleSize) * 2.0);
                float3 iconCol = tex2D(_IconTex, packUv).rgb * _IconColor.rgb * circle;

                // 边缘描边
                float2 ed = min(uv, 1.0 - uv);
                float edge = saturate(1.0 - min(ed.x, ed.y) * 12.0);

                float3 albedo = baseCol + rainbowCol + iconCol;
                albedo = lerp(albedo, _BorderColor.rgb, edge);
                return albedo;
            }

            float4 frag(v2f i) : SV_Target
            {
                float3 albedo = BoosterAlbedo(i.uv);
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

            float4 _Color; float4 _Color2; float4 _IconColor;
            sampler2D _MainTex;
            float _Glossiness; float _Metallic;

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
                float3 albedo = tex2D(_MainTex, i.uv).rgb * _Color.rgb;
                float4 col = SokpopShadeAdd(albedo, _Glossiness, _Metallic, normalize(i.worldNormal), i.worldPos);
                col.rgb *= i.color.rgb;
                col.a = 0.0;
                return col;
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
