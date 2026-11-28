// 还原自 shader_extract/glsl_exact/Custom__BoosterShader__08_PS.glsl(pass0 主体)。
// 卡包正面: 贴图 uv 重映射 (x-0.5)*1.75+0.5 / (y-0.4)*1.75+0.4 (对应 _202.._205),
// 双层 hash 抖动(150 倍频, 幅度 0.005) 用于反光位移, _RainbowTex 按 sin/cos 扭曲(±0.02, 5/10/30 倍频),
// 贴图 R 通道是填充/描边掩码: albedo=lerp(_Color,_IconColor,1-R*inRect), 圆点固定 r=0.400390625,
// 边框为 0.11677685/0.88322314 × 0.03/0.97 硬裁切(L303~317)。光照走 Unity Standard BRDF。
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

            float4 _Color; float4 _Color2; float4 _IconColor;
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

                float2 packUv = float2((uv.x - 0.5) * 1.75 + 0.5, (uv.y - 0.4) * 1.75 + 0.4);
                float  inX = step(0.0, packUv.x) * step(packUv.x, 1.0);
                float  inRect = step(0.0, packUv.y) * inX * step(packUv.y, 1.0);

                float4 pack = tex2D(_MainTex, packUv);
                float  masked = pack.a * inRect;                 // L232

                // 视野方向(世界空间)
                float3 Vw = normalize(worldPos - _WorldSpaceCameraPos);
                float  rA = (uv.y + uv.x) - Vw.z * 5.0;          // L241/L246
                float  rB = (uv.y + uv.y) - Vw.x * 5.0;          // L242
                float  rU = rA + sin(rB * 10.0) * 0.02;
                float  rV = rB + cos(rU * 30.0) * 0.02;
                // v0.68: 原版这里采的是 t1 —— 属性顺序是 _MainTex(t0) / _IconTex(t1) / _RainbowTex(t2),
                // 所以扭曲采样该用 _IconTex(卡包内容图标), 不是 _RainbowTex。
                // 证据: spec 属性表顺序 + Boosterpack.cs L115 propBlock.SetTexture("_IconTex", PackData.Icon.texture)。
                // 端口此前声明了 _IconTex 却从未采样(审计 0 次), 卡包内容因此永远拿不到图。
                // v0.78: 与正面同一处修正 —— 我们的 t1 是 sprite 所在贴图(图标只占中间矩形),
                // 照搬 (u+v)-Vz*5 的大位移会采到大片透明区, 而导出 PNG 透明区留着白色 RGB, ×0.5 抬亮整面。
                // 改为只在 sprite 矩形内按 0..1 采一次, 并把透明区 RGB 归零(原版 DXT5 透明区为黑)。
                float4 rain = tex2D(_IconTex, saturate(uv) * _IconUV.xy + _IconUV.zw);
                rain.rgb *= rain.a;

                // 圆点
                float2 cp = float2((uv.x - 0.5) * 1.75, (uv.y - 0.4) * 1.75 - 0.1);
                float  circle = 1.0 - saturate((length(cp) - 0.400390625) / aaU);

                float3 glow = lerp(_Color.rgb, _Color2.rgb, circle);          // L279~284
                float  inkT = 1.0 - pack.r * inRect;                          // L285
                float3 ink  = lerp(_Color.rgb, _IconColor.rgb, inkT);         // L291~299
                float3 albedo = glow + masked * (ink - glow) + rain.rgb * 0.5; // L318~320

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
