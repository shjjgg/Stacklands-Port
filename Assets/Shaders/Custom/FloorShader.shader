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
            ZTest LEqual
            ZWrite On

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "../Common/SokpopLit.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float _WorldSizeIncrease;
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

                // 石板/格线: 原版 SDF 在 **世界空间 XZ**(TEXCOORD1.xz - 棋盘中心), 半径由 _Rect 给出:
                //   half=(_Rect.x, _Rect.z), 圆角 r=|_Rect.w|, 世界单位下 dist<0 为板内。
                // 之前用 uv*1.5 当坐标, 而 _Rect.x=4.3, 永远 dist<0 ⇒ 边界环永远不出现, 这就是"卡牌场没有边框"。
                float3 wc3 = mul(unity_ObjectToWorld, float4(0,0,0,1)).xyz;
                float2 pw  = i.worldPos.xz - wc3.xz;
                // 原版 08_PS L120/L123: 半尺寸随世界的 _WorldSizeIncrease 一起长
                //   halfX = _Rect.x + _WorldSizeIncrease
                //   halfZ = _Rect.z + _WorldSizeIncrease * 0.58   ← 0.57999998 是原版常量
                float  wsi     = _WorldSizeIncrease;
                float2 halfExt = float2(_Rect.x + wsi, _Rect.z + wsi * 0.58);
                float  rr  = clamp(abs(_Rect.w), 0.0, min(halfExt.x, halfExt.y) - 0.01);
                // ---- 按 08_PS L152~L229 逐条直译(石板 SDF / 双层膨胀 / 贴图混合) ----
                // 原版用三分量 max(|x|-halfX, |y|-_Rect.y, |z|-halfZ), 地板 y 恒为 0 且 _Rect.y=0
                // 故退化成 2D: q = max(|pw|-halfExt, 0), dist = length(q) + _Rect.w   (L184)
                float2 q   = max(abs(pw) - halfExt, 0.0);
                float  d2  = length(q) + _Rect.w;          // L184: length(...) - cb0._m16.w
                float  s185 = 1.0 - d2;                    // L185
                // L161~L200: 第二层 SDF, 三个轴与圆角统一 +0.03 膨胀
                float2 qb  = max(abs(pw) - (halfExt + 0.03), 0.0);
                float  dB  = length(qb) + (_Rect.w + 0.03);
                float  s200 = 1.0 - dB;
                float  inOuter = step(0.5, s200);           // L176/L212: (1-s200)<=0.5 ⇒ 内侧
                // L177~L182: _212 选色 —— 外侧 _m6, 内侧白(交给贴图乘)
                float3 stoneBase = lerp(_StoneColor.rgb, float3(1,1,1), inOuter);
                // L183~L189: 解析 AA
                float  aa185 = max(abs(ddx(s185)) + abs(ddy(s185)), 1e-5);
                float  mid185 = 0.5 - aa185 * 0.5;         // L231
                float  k237 = saturate((s185 - mid185) / aa185);  // L236/L237
                // L190~L192: 贴图混入, _StoneEdge 当作贴图强度色
                float3 texc = saturate(tex2D(_OffsetTex, float2(px, py) * 1.5).rgb);
                float3 albedo = lerp(stoneBase, _StoneEdge.rgb * texc, k237);

                // ---- L193~L214: 板缝 (_123-0.9 线 + 0.89/0.91 带解析 AA) ----
                float  inStone = step(0.5, s185);          // L196: _258
                float  wz = pw.y;                          // L173: _207 ≈ worldZ(+0.002 抖动)
                float  wx = pw.x;                          // L174: _208 ≈ worldX
                float  seamT = halfExt.y - 0.9;            // L193: _123 - 0.9
                float  m259 = inStone * step(seamT, wz);    // L197
                albedo = lerp(albedo, _EdgeColor.rgb, m259);           // L201~L203 (_m12)
                float  aaX  = max(abs(ddx(wx)) + abs(ddy(wx)), 1e-5);  // L204/L275
                float  b1   = saturate((wz - (seamT - 0.01)) / aaX);   // L205/L278 (0.91 带)
                float  b2   = saturate((wz - (seamT + 0.01)) / aaX);   // L206/L279 (0.89 带)
                float  band = inStone * b1 * (1.0 - b2);               // L210/L211/L284
                albedo *= (1.0 - band);                                // L212~L214: 压到黑

                // ---- L215~L229: 内圈环 (_m18.x 无名槽 → 用 _EdgeThickness 顶替) ----
                float  ringIn = 0.5 - _EdgeThickness;      // L215: _293
                float  ringLo = ringIn - aa185 * 0.5;      // L216
                float  m298 = (s185 - ringLo) / aa185;      // L219
                float  m302 = ((1.0 - s185) - ringLo) / aa185;  // L222
                float  ring = saturate(m298) * saturate(m302);  // L223
                albedo = lerp(albedo, _EdgeColor.rgb, ring);   // L227~L229 (_m10)

                float4 mainTex = tex2D(_MainTex, i.uv);
                albedo *= lerp(float3(1,1,1), mainTex.rgb, 0.25);

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
                col.a = 0.0;
                return col;
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
