// 还原自 shader_extract/glsl_exact/Custom__BoosterShaderTop__08_PS.glsl(与 BoosterShader 同骨架)。
// 差异: 新增 _Foil(封膜强度), 彩虹膜权重 = _SparkleIntensity*(0.35+_Foil)。
// 卡包正面: 贴图 uv 重映射 (x-0.5)*1.75+0.5 / (y-0.4)*1.75+0.4 (对应 _202.._205),
// 双层 hash 抖动(150 倍频, 幅度 0.005) 用于反光位移, _RainbowTex 按 sin/cos 扭曲(±0.02, 5/10/30 倍频),
// v0.77 定案: 正面 = lerp(_Color,_Color2,圆点) + 0.5×图标, 再乘内框掩码; 不再用 _IconColor/_MainTex。
// 边框为 0.11677685/0.88322314 × 0.03/0.97 硬裁切(L303~317)。光照走 Unity Standard BRDF。
// 注: DEFERRED pass 仅为与原版 pass 拓扑对齐(本项目 2D 正交相机只用 forward 路径)。
Shader "Custom/BoosterShaderTop"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Color2 ("Color2", Color) = (1,1,1,1)
        _Foil ("Foil", Float) = 0
        _IconColor ("Icon Color", Color) = (1,1,1,1)
        _MainTex ("Albedo", 2D) = "white" {}
        _IconTex ("Icon", 2D) = "white" {}
        // v0.71: 图标在 PC 上是独立贴图, 安卓包里是 Sprite 图集的子矩形。
        // 直接按 0..1 采样会采到整张图集(肉眼=整面 0.5 灰 + 角落一个小图), 这里补 UV 矩形。
        _IconUV ("Icon UV xy=scale zw=offset", Vector) = (1,1,0,0)
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

            float4 _Color; float4 _Color2; float _Foil; float4 _IconColor;
            sampler2D _MainTex; float4 _IconUV; sampler2D _IconTex; sampler2D _RainbowTex;
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

            // 逐指令还原 Custom__BoosterShader__08_PS.glsl L178~L322
            //   L202~205 卡包 uv 重映射: ((u-0.5)*1.75+0.5, (v-0.4)*1.75+0.4)
            //   L217~232 区域掩码: inRect=(u<=1)*(u>=0)*(v>=0)*(v<=1); masked=a*inRect  ← 只保留区域内
            //   L233~250 视野相关彩虹扭曲: (u+v)-Vz*5, (2v)-Vx*5, sin(10x)*0.02, cos(30y)*0.02 → _RainbowTex
            //   L261~267 圆点(_Color2): cp=((u-0.5)*1.75, (v-0.4)*1.75-0.1), r=0.400390625, 用 u 的解析 AA 归一
            //   L279~284 glow = lerp(_Color,_Color2,circle)
            //   L285~299 ink = lerp(_Color,_IconColor,1-R*inRect)  ← 贴图 R 通道是"填充/描边"掩码
            //   L318 albedo = glow + masked*(ink-glow) + rainbow*0.5
            //   L303~317 边框裁切: 0.11677685/0.88322314 × 0.03/0.97 四边钳制相乘 → 框外为 0
            float3 BoosterAlbedo(float2 uv, float3 worldPos)
            {
                float d1 = Hash01(uv.y * 150.0) - 0.5;
                float ux = uv.x + d1 * 0.005;
                float d2 = Hash01(ux * 150.0) - 0.5;
                float uy = uv.y + d2 * 0.005;

                float aaU = max(abs(ddx(ux)) + abs(ddy(ux)), 1e-5);
                float aaV = max(abs(ddx(uy)) + abs(ddy(uy)), 1e-5);

                // v0.77: Top 版没有「t0 alpha 填充」那一项(Top 08_PS 里 _232 是视线分量, 不是 alpha),
                // 所以这里不再采样 _MainTex, 也不再算 inRect/masked —— 底层 BoosterShader 才需要它们。

                // v0.77 采样位置:
                //   原版 t1 是一张「卡包图标」独立贴图, 用它算出的 uv = (u+v)-Vz*5 ± 0.02 会横向重复 5 次,
                //   在原版里就是卡面上那排重复的小图案。我们的 t1 是 sprite 所在的贴图(1024x1024, 图标只占中间一块),
                //   直接照搬那个大位移会采到大片透明区 —— 而导出 PNG 在透明区仍留着白色 RGB,
                //   ×0.5 后整面被抬成灰白(真机的「灰面板」), 深色描边反而成了剪影。
                //   这里两件事: ①只在 sprite 矩形内按 0..1 取一次图标  ②把透明区的 RGB 归零(原版 DXT5 透明区为黑)
                float4 rain = tex2D(_IconTex, saturate(uv) * _IconUV.xy + _IconUV.zw);
                rain.rgb *= rain.a;

                // 圆点
                float2 cp = float2((uv.x - 0.5) * 1.75, (uv.y - 0.4) * 1.75 - 0.1);
                float  circle = 1.0 - saturate((length(cp) - 0.400390625) / aaU);

                // v0.77: 正面(Top)的算式与底层 BoosterShader 不同, 原版 Top 08_PS:
                //   _222 = _213 * cb0._m6            (t0 权重 × 底色; 卡包 _MainTex 为 null ⇒ 权重≈1)
                //   _261 = 圆点掩码(r=0.400390625, 中心 (0.5,0.35))
                //   _291 = 0.5*t1.rgb + fma(_261, cb0._m8 - _222, _222)
                //   即「底色 → _Color2」按圆点混合, 再加 0.5×插画; 全程不碰 _IconColor/_m11。
                // 我们之前把底层 shader 的 _m6→_m11(_IconColor=白) 那一段也搬进来, 于是整面被涂成白灰,
                // 只剩插画的深色描边 → 真机上就是「灰面板+深色剪影」。Booster2.mat 实测 _Color2=(0,0,0)。
                float3 glow = lerp(_Color.rgb, _Color2.rgb, circle);          // _222/_291
                float3 albedo = glow + rain.rgb * 0.5;                        // _291~_296

                float frame = saturate((ux - 0.11677685) / aaU) * saturate((0.88322314 - ux) / aaU)
                            * saturate((uy - 0.03)       / aaV) * saturate((0.97 - uy)        / aaV);
                return albedo * frame;
            }

            float4 frag(v2f i) : SV_Target
            {
                float3 albedo = BoosterAlbedo(i.uv, i.worldPos);
                float4 col = SokpopShadeBase(albedo, _Glossiness, _Metallic, normalize(i.worldNormal), i.worldPos);
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

            float4 _Color; float4 _Color2; float _Foil; float4 _IconColor;
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
