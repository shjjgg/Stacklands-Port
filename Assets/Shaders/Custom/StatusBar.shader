// 还原自 shader_extract/glsl_exact/Custom__StatusBar__08_PS.glsl。
// 状态条: uv.x 与 _FillAmount 比较切出填充区, 填充区用 _Color→_Color2→_Color3 三段渐变,
// 空槽用暗色; _Pause 时叠 _PauseColor 斜纹。贴图 _MainTex 作为遮罩。Standard BRDF 光照。
// pass 拓扑: FORWARDBASE / FORWARDADD / DEFERRED / SHADOWCASTER。
Shader "Custom/StatusBar"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Color2 ("Color2", Color) = (1,1,1,1)
        _Color3 ("Color3", Color) = (1,1,1,1)
        _PauseColor ("Pause Color", Color) = (1,1,1,1)
        _FillAmount ("Fill Amount", Float) = 0.5
        _Pause ("Pause", Float) = 0.5
        _MainTex ("Mask", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0.0,1.0)) = 0.5
        _Metallic ("Metallic", Range(0.0,1.0)) = 0.0
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

            float4 _Color; float4 _Color2; float4 _Color3; float4 _PauseColor;
            float _FillAmount; float _Pause;
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

            // v0.73 按 Custom__StatusBar__08_PS.glsl 逐指令重写:
            //   双 hash 抖动(x±0.01, y±0.05) → ddx/ddy → 竖向窄带 mask _215(不是横向渐变!)
            //   _200 = 1-(x-0.03)*1.0638 为"剩余量", 与 _FillAmount 做解析 AA 比较得到填充掩码 _266
            //   _230 = lerp(_Color,_Color2,_215) 竖带渐变;  _267 用暂停位选 _Color3 / _PauseColor
            //   albedo = lerp(竖带渐变, 填充色, 掩码)
            float4 frag(v2f i) : SV_Target
            {
                float x = i.uv.x, y = i.uv.y;

                float h1 = frac(sin(round(y * 150.0)) * 43758.546875) - 0.5;   // _175
                float xs = x + h1 * 0.01;                                       // _178
                float h2 = frac(sin(round(xs * 150.0)) * 43758.546875) - 0.5;   // _184
                float ys = y + h2 * 0.05;                                       // _185

                float dx = abs(ddx(xs)) + abs(ddy(xs));                          // _194
                float dy = abs(ddx(ys)) + abs(ddy(ys));                          // _195
                float bandW = max(dy * 0.26666668, 1e-6);                        // _196

                float yy = ys - 0.5;                                             // _197
                float xx = xs - 0.029999999;                                     // _198
                float rem = 1.0 - xx * 1.06382978;                               // _200

                float horiz = clamp((0.97000003 - xs) / max(dx,1e-6), 0.0, 1.0)
                            * clamp(xx / max(dx,1e-6), 0.0, 1.0);                // _206
                float t1 = clamp((yy * 0.26666668 + 0.069999993) / bandW, 0.0, 1.0); // _209
                float t2 = clamp((0.56999999 - (yy * 0.26666668 + 0.5)) / bandW, 0.0, 1.0); // _213
                float band = horiz * t1 * t2;                                    // _215

                float3 grad = lerp(_Color.rgb, _Color2.rgb, band);               // _230.._232
                float aaRem = max(abs(ddy(rem)) + abs(ddx(rem)), 1e-6);          // _262
                float fill = band <= 0.0 ? 0.0
                           : clamp((rem - _FillAmount) / aaRem, 0.0, 1.0);        // _266
                float3 fillCol = _Pause >= 0.5 ? _PauseColor.rgb : _Color3.rgb;   // _m12 / _m10
                float3 albedo = lerp(grad, fillCol, fill);                       // _270.._272

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

            float4 _Color; float4 _Color2; float4 _Color3; float4 _PauseColor;
            float _FillAmount; float _Pause;
            sampler2D _MainTex; float _Glossiness; float _Metallic;

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
                float3 albedo = _Color.rgb * tex2D(_MainTex, i.uv).a;
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
