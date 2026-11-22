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
        _MainTex ("Albedo", 2D) = "white" {}
        _IconTex ("Icon", 2D) = "white" {}
        _FlipIcon ("Flip Icon V", Float) = 0
        _IconZoom ("Icon Zoom", Float) = 1.0
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
            float _HasSecondaryIcon; float _HasOutputDir;
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
                float2 uv = i.uv;
                float3 viewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));

                // ---- 卡底 ----
                float3 albedo = tex2D(_MainTex, uv).rgb * _Color.rgb;

                // ---- 图标 (含副图标) ----
                // 卡面美术贴图是「白色实心剪影 + 黑手绘描边」的遮罩图(实测不透明区 RGB 均值 173~188 灰,
                // 2~3 成是暗描边, 中心像素 255,255,255,255)。原版=白填充透出卡底色、线条用调色板 Icon 色,
                // 所以这里按亮度取反算遮罩, 不能用 icon.a 直接铺白。
                // 原版 DXBC 里图标采样带缩放(cb0[12].z 决定 1.75/2.0, 围绕 uv 0.5 放大), 这里做成可调参数 _IconZoom,
                // 默认 1.0 保持现状; HUD 可切 1.75/2.0 做 A/B。
                float2 iconUv = uv;
                iconUv = (iconUv - 0.5) * _IconZoom + 0.5;
                if (_FlipIcon > 0.5) iconUv = float2(iconUv.x, 1.0 - iconUv.y);
                float4 icon = tex2D(_IconTex, iconUv);
                float iconLum = dot(icon.rgb, float3(0.299, 0.587, 0.114));
                float iconMask = saturate((0.55 - iconLum) / 0.22) * icon.a;
                albedo = lerp(albedo, _IconColor.rgb, iconMask);
                if (_HasSecondaryIcon > 0.5)
                {
                    float4 sec = tex2D(_SecondaryTex, uv);
                    albedo = lerp(albedo, sec.rgb * _Color2.rgb, sec.a);
                }

                // ---- 闪膜: sin/cos 扭曲 (±0.02, 5/10/30 倍频同 asm) ----
                float wobA = uv.x + uv.y - viewDir.x * 5.0;
                float wobB = uv.y * 2.0 - viewDir.z * 5.0;
                float2 rw = float2(wobA + sin(wobB * 10.0) * 0.02, wobB + cos((wobA + sin(wobB * 10.0) * 0.02) * 30.0) * 0.02);
                float4 rainbow = tex2D(_RainbowTex, rw);
                albedo += rainbow.rgb * _Color2.rgb * (0.35 + _Foil) * _SparkleIntensity;

                // ---- 高光条: 对角 uv 上的窄带 ----
                float dShine = abs(frac(uv.x - uv.y) - 0.5);
                float shine = saturate(1.0 - dShine * 12.0) * _ShineStrength * 0.25;
                float bigShine = saturate(1.0 - dShine * 4.0) * _BigShineStrength * 0.12;
                albedo += (shine + bigShine) * _Color2.rgb;

                // ---- 破损覆盖 ----
                if (_Damaged > 0.5)
                {
                    float4 dmg = tex2D(_DamagedTex, uv);
                    albedo = lerp(albedo, dmg.rgb * _DamagedBorderColor.rgb, dmg.a * _Damaged);
                }

                // ---- 边框: uv 距边 < 1/24 视为边框 ----
                float2 ed = min(uv, 1.0 - uv);
                float edge = saturate(1.0 - min(ed.x, ed.y) * 24.0);
                float4 borderCol = (_Damaged > 0.5) ? _DamagedBorderColor : _BorderColor;
                albedo = lerp(albedo, borderCol.rgb, edge);

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
