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
        // v0.74: 图标/卡面插画在安卓包里可能位于图集, 只采 0..1 会采到整张图集(整卡被插画糊住)。
        // 这里补一个 UV 矩形(scale/offset), 由运行时按 IconRenderer.sprite 的真实矩形注入;
        // 独立贴图时恒为 (1,1,0,0), 行为与原版完全一致。
        _IconUV ("Icon UV xy=scale zw=offset", Vector) = (1,1,0,0)
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
            float _IconZoom; float4 _IconUV;
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

                // 3) 卡底: 42_PS 的 _366/_367 内框算式(逐指令直译, 常数照抄)
                //    _366 = clamp((u-0.11677685)/aaU,0,1)*clamp((0.88322314-u)/aaU,0,1)
                //           *clamp((v-0.03)/aaV,0,1)*clamp((0.97-v)/aaV,0,1)
                //    _367 = (1 - clamp((v-0.19)/aaV,0,1)*(1-clamp((v-0.21)/aaV,0,1))) * _366
                //    albedo = _m9 + _367*(face - _m9)  →  框外与顶部横带用框色(_BorderColor), 框内用纸色(_Color)
                float aaU = max(abs(ddx(jx)), 1e-5);
                float aaV = max(abs(ddy(jy)), 1e-5);
                float inner = saturate((jx - 0.1167768537998199) / aaU) *
                              saturate((0.8832231760025024 - jx) / aaU) *
                              saturate((jy - 0.0299999993294477) / aaV) *
                              saturate((0.9700000286102295 - jy) / aaV);
                float band = saturate((jy - 0.19) / aaV) * (1.0 - saturate((jy - 0.21) / aaV));
                float k367 = inner * (1.0 - band);
                // 纸色基准仍是 _Color(运行时 _MainTex 恒白), 框色在最后统一压上去, 与 42_PS 的 _418 同序
                float3 paper = _Color.rgb;

                // 4) 环状光晕 _277.._299: 图标空间半径 0.4004 的软环, 混到 _Color2
                float2 ringP = iconUv - 0.5;
                float ringD = (flagA > 0.5) ? max(abs(ringP.y), abs(ringP.x)) : length(ringP);
                float ringMask = 1.0 - saturate((ringD - 0.400390625) / gradX);
                float3 halo = lerp(_Color.rgb, _Color2.rgb, saturate(ringMask));

                // 5) 图标色 _321.._333: ink = lerp(_Color, _IconColor, 1 - t1.x*inside)
                float2 artUv = clamp(iconUv, 0.0, 1.0) * _IconUV.xy + _IconUV.zw;
                float4 icon = tex2D(_IconTex, artUv);
                float inkAmt = saturate(1.0 - icon.r * inside);
                float3 inkCol = lerp(_Color.rgb, _IconColor.rgb, inkAmt);
                float artA = saturate(icon.a) * inside;
                float3 albedo = lerp(halo, inkCol, artA);

                // 6) 副图标(_HasSecondaryIcon): 同算式, 叠在主图标之上
                if (_HasSecondaryIcon > 0.5)
                {
                    float4 sec = tex2D(_SecondaryTex, artUv);
                    float3 secInk = lerp(_Color.rgb, _IconColor.rgb, saturate(1.0 - sec.r * inside));
                    albedo = lerp(albedo, secInk, saturate(sec.a * inside));
                }
                // 4.5) 42_PS 的 _418: albedo = _m9 + _367*(albedo - _m9) —— 框外/顶部横带压成框色
                // v0.63: 暂缓 —— _BorderColor 近黑(边框实测约纸色 63%), 而我们还没有证据能确定
                // 42_PS 里的 _m9 到底是纸色还是框色。绑错方向的后果是整张卡被压成深色(截图可见),
                // 比"没有内框"严重得多。等靶场探针给出 _m9 的真实属性再启用这一行。
                // 原版 16_PS L333-336: albedo = fma(_435, art - cb0._m10.xyz, cb0._m10.xyz)
                //   _435 = 内框(0.1167/0.8832 × 0.03/0.97) 且不在顶部横带(0.19/0.21) 的掩码;
                //   cb0._m10 是掩码外露出的卡面底色 = 纸色(_Color, CardFront.mat=(0.7736,0.6430,0.1861))。
                //   此前用 _BorderColor(0,0,0) 会整卡变黑, 故 v0.63 注释掉; 现按原版槽位语义改为 _Color。
                //   这一行缺失时, 插画 alpha 铺满整张卡 → 岩石卡整面蓝灰、浆果卡整面橙。
                albedo = lerp(_Color.rgb, albedo, saturate(k367));

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

                    // v0.82: 原版 16_PS L300~L319 还有一段「破损裁边」, 我们一直没搬:
                    //   _436 = y*10 ; _442 = sin(_436)* (|frac(_436)*2-1| - 0.5)
                    //   _210 = x*10 ; _448 = sin(_210)* (|frac(_210)*2-1| - 0.5)
                    //   _449 = x + 0.02*_442 ; _450 = y + 0.02*_448
                    //   再取 0.08977685..0.91022313 / 0.003..0.997 的「内缩 10% 抖动方框」
                    //   fma(_464, clamp(_460), -0.1) < 0 → demote(即 discard)
                    // 也就是破损卡的边缘是被啃掉一圈的(撕裂边), 不是只压暗。这里照搬同一条判据。
                    float tA = jy * 10.0;
                    float sA = sin(tA) * (abs(frac(tA) * 2.0 - 1.0) - 0.5);
                    float tB = jx * 10.0;
                    float sB = sin(tB) * (abs(frac(tB) * 2.0 - 1.0) - 0.5);
                    float uxA = jx + sA * 0.02;
                    float uyA = jy + sB * 0.02;
                    float mxA = saturate((uxA - 0.0897768512) / aaU) * saturate((0.9102231264 - uxA) / aaU);
                    float myA = saturate((uyA - 0.003) / aaV) * saturate((0.9969999790 - uyA) / aaV);
                    if (mxA * myA - 0.1 < 0.0) discard;
                }

                // v0.78 删除两处无证据的自造:
                //  ① 9) "距边 1/40 涂 _BorderColor" —— 16_PS 全文没有这种 uv 边距算法, 边框完全由 _435 内框掩码
                //     外的 cb0._m10(_Color 纸色) 给出; 这段是我早期"原版实测"猜的, 只会把卡边缘压黑。
                //  ② 10) albedo *= 0.96*(1-_Metallic) —— 原版这一项是 DiffuseAndSpecularFromMetallic 的内联展开
                //     (_820 = 0.96*(1-Metallic), 乘在 diffColor 上), 而 BRDF1_Unity_PBS 内部已经做了同一步,
                //     我们再加一遍等于把纸色连乘两次 → 暗卡(岩石/木材)偏深、村民卡偏灰的直接来源之一。

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
