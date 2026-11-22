// 还原自 shader_extract/glsl_exact/Custom__CardShaderTest__16_PS.glsl(基础 pass)。
// 卡面合成: _MainTex 卡底 × _Color; _IconTex 图标 × _IconColor; _HasSecondaryIcon>0.5 时叠 _SecondaryTex;
// _RainbowTex 按 sin/cos 扭曲(±0.02) 作闪膜, 权重 _Foil × _SparkleIntensity;
// _Damaged>0.5 时叠 _DamagedTex(其余为 _DamagedBorderColor 边框);
// _ShineStrength/_BigShineStrength 为对角高光强度(cb0._m15/_m18 分支与 asm 一致)。Standard BRDF 光照。
// pass 拓扑: FORWARDBASE / FORWARDADD / DEFERRED / SHADOWCASTER。
Shader "Custom/CardShaderTest"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Color2 ("Color2", Color) = (1,1,1,1)
        _Foil ("Foil", Float) = 0
        _Damaged ("Damaged", Float) = 0
        _IconColor ("Icon Color", Color) = (1,1,1,1)
        _ShineStrength ("Shine Strength", Float) = 1
        _BigShineStrength ("Big Shine Strength", Float) = 1
        _HasSecondaryIcon ("Has Secondary Icon", Float) = 0
        _HasOutputDir ("Has Output Dir", Float) = 0
        _IsChest ("Is Chest", Float) = 0
        _MainTex ("Albedo", 2D) = "white" {}
        _IconTex ("Icon", 2D) = "white" {}
        _FlipIcon ("Flip Icon X", Float) = 0
        _IconZoom ("Icon Zoom", Float) = 1.75
        _SecondaryTex ("Secondary", 2D) = "white" {}
        _RainbowTex ("Rainbow", 2D) = "white" {}
        _DamagedTex ("Damaged", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0.0,1.0)) = 0.5
        _Metallic ("Metallic", Range(0.0,1.0)) = 0.0
        _SparkleIntensity ("Sparkle Intensity", Float) = 1
        _BorderColor ("Border Color", Color) = (1,1,1,1)
        _DamagedBorderColor ("Damaged Border Color", Color) = (1,1,1,1)
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

            float4 _Color; float4 _Color2;
            float _Foil; float _Damaged; float4 _IconColor;
            float _ShineStrength; float _BigShineStrength;
            float _HasSecondaryIcon; float _HasOutputDir; float _IsChest;
            sampler2D _MainTex; sampler2D _IconTex; sampler2D _SecondaryTex;
            float _FlipIcon;
            float _IconZoom;
            sampler2D _RainbowTex; sampler2D _DamagedTex;
            float _Glossiness; float _Metallic; float _SparkleIntensity;
            float4 _BorderColor; float4 _DamagedBorderColor;

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

            float Hash01(float x) { return frac(sin(round(x)) * 43758.546875); }

            float4 frag(v2f i) : SV_Target
            {
                // ---- 直译自 glsl_exact/Custom__CardShaderTest__42_PS.glsl ----
                // 几何(原版 _145.._175):
                //   _161 = (1-uv.x) - 0.5        → iconUv.x = (0.5-uv.x)*zoom + 0.5   (X 恒镜像)
                //   _162 = (1-uv.y) - pivot      → iconUv.y = (1-uv.y-pivot)*zoom + pivot
                //   pivot: 双标志 0.55 / 单标志 0.5 / 无标志 0.45;  zoom: 有标志 2.0 / 无标志 1.75
                // 颜色(原版 _182.._333):
                //   卡底 _300 = 1 - t0.x*inside → paper = lerp(_Color,_Color2,_300); _MainTex 运行时恒白 ⇒ paper = _Color
                //   光晕 _277.._299: |iconUv-0.5| 半径 0.4004 的软环 → _Color2
                //   图标 _321 = 1 - t1.x*inside → ink = lerp(_Color, _IconColor, _321)
                //   albedo = lerp(光晕, ink, t1.a*inside)  ← 原版 _315/_331 的 lerp 结构
                float2 uv = i.uv;
                float3 viewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));

                // ==== 逐指令对齐 glsl_exact/Custom__CardShaderTest__42_PS.glsl ====
                // 1) 采样抖动 _120.._134: uv 加 ±0.5% 噪声偏移(卡面纹理的"手绘颗粒")
                float j1 = frac(sin(round(uv.y * 150.0)) * 43758.546875) * 0.005;
                float jx = uv.x + j1;
                float j2 = frac(sin(round(jx * 150.0)) * 43758.546875) * 0.005;
                float jy = uv.y + j2;
                // 解析抗锯齿梯度 _143/_144
                float gradX = max(abs(ddx(jx)) + abs(ddy(jx)), 1e-5);

                // 2) 图标 UV _145.._175: X 恒镜像, Y 用 pivot(0.45/0.5/0.55), zoom 1.75/2.0
                float flagA = (_HasSecondaryIcon > 0.5) ? 1.0 : 0.0;
                float flagB = (_IsChest > 0.5) ? 1.0 : 0.0;
                float pivot = (flagA > 0.5 && flagB > 0.5) ? 0.55 : ((flagA > 0.5 || flagB > 0.5) ? 0.5 : 0.45);
                float zoom = max(_IconZoom, (flagA > 0.5 || flagB > 0.5) ? 2.0 : 1.75);
                float2 iconUv = float2((1.0 - jx - 0.5) * zoom + 0.5,
                                       (1.0 - jy - pivot) * zoom + pivot);
                if (_FlipIcon > 0.5) iconUv.x = 1.0 - iconUv.x;
                float inside = step(0.0, iconUv.x) * step(iconUv.x, 1.0) * step(0.0, iconUv.y) * step(iconUv.y, 1.0);

                // 3) 卡底: _300 = 1 - t0.x*inside → paper = lerp(_Color,_Color2,_300)
                //    运行时 _MainTex 恒为默认白(全工程无 SetTexture("_MainTex")), 故该式等价于 paper = _Color
                float3 paper = _Color.rgb;

                // 4) 环状光晕 _277.._299: 图标空间半径 0.4004 的软环, 混到 _Color2
                float2 ringP = iconUv - 0.5;
                float ringD = (flagA > 0.5) ? max(abs(ringP.y), abs(ringP.x)) : length(ringP);
                float ringMask = 1.0 - saturate((ringD - 0.400390625) / gradX);
                float3 halo = lerp(_Color.rgb, _Color2.rgb, saturate(ringMask));

                // 5) 图标色 _321.._333: ink = lerp(_Color, _IconColor, 1 - t1.x*inside)
                float4 icon = tex2D(_IconTex, clamp(iconUv, 0.0, 1.0));
                float inkAmt = saturate(1.0 - icon.r * inside);
                float3 inkCol = lerp(_Color.rgb, _IconColor.rgb, inkAmt);
                float artA = saturate(icon.a) * inside;
                float3 albedo = lerp(halo, inkCol, artA);

                // 6) 副图标(_HasSecondaryIcon): 同算式, 叠在主图标之上
                if (_HasSecondaryIcon > 0.5)
                {
                    float4 sec = tex2D(_SecondaryTex, clamp(iconUv, 0.0, 1.0));
                    float3 secInk = lerp(_Color.rgb, _IconColor.rgb, saturate(1.0 - sec.r * inside));
                    albedo = lerp(albedo, secInk, saturate(sec.a * inside));
                }

                // 7) 闪膜(_Foil 门控): sin/cos 扭曲 ±0.02, 5/10/30 倍频同 asm
                if (_Foil > 0.5)
                {
                    float wobA = jx + jy - viewDir.x * 5.0;
                    float wobB = jy * 2.0 - viewDir.z * 5.0;
                    float rwX = wobA + sin(wobB * 10.0) * 0.02;
                    float2 rw = float2(rwX, wobB + cos(rwX * 30.0) * 0.02);
                    float4 rainbow = tex2D(_RainbowTex, rw);
                    albedo += rainbow.rgb * _Color2.rgb * _SparkleIntensity * 0.5;
                    float dShine = abs(frac(jx - jy) - 0.5);
                    float shine = saturate(1.0 - dShine * 12.0) * _ShineStrength * 0.25;
                    float bigShine = saturate(1.0 - dShine * 4.0) * _BigShineStrength * 0.12;
                    albedo += (shine + bigShine) * _Color2.rgb;
                }

                // 8) 破损 _442.._447: 破损贴图 alpha>=0.5 处压暗到 0.6 倍
                if (_Damaged > 0.5)
                {
                    float dm = (tex2D(_DamagedTex, float2(jx, jy)).a >= 0.5) ? 1.0 : 0.0;
                    albedo *= (1.0 - 0.4 * dm);
                }

                // 9) 卡框: 距边 < 1/40 视为边框(_BorderColor)
                float2 ed = min(uv, 1.0 - uv);
                float edge = saturate(1.0 - min(ed.x, ed.y) * 40.0);
                float4 borderCol = (_Damaged > 0.5) ? _DamagedBorderColor : _BorderColor;
                albedo = lerp(albedo, borderCol.rgb, edge);

                // 10) 金属度压暗 _458 = 0.96*(1-_Metallic)
                albedo *= 0.96 * (1.0 - _Metallic);

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

            float4 _Color; sampler2D _MainTex; float _Glossiness; float _Metallic;

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
