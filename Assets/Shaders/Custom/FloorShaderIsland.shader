// 还原自 shader_extract/glsl_exact/Custom__FloorShaderIsland__08_PS.glsl。
// 岛屿地面: 与 FloorShader 相同的 3D 圆角盒 SDF 石板, 额外用 _SdfTex 做海浪位移(时间相位 0.2),
// 由位移后的距离场叠出 水面(_WaterColor)/描边(_OutlineColor,_OutlineWidth)/岛面(_FaceColor) 三层,
// _IslandDownsize 控制岛体缩小系数。光照走 Unity Standard BRDF(Common/SokpopLit.cginc)。
Shader "Custom/FloorShaderIsland"
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
        _SdfTex ("SDF", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0.0,1.0)) = 0.5
        _Metallic ("Metallic", Range(0.0,1.0)) = 0.0
        _WaterColor ("Water Color", Color) = (1,1,1,1)
        _OutlineWidth ("Outline Width", Float) = 1
        _OutlineColor ("Outline Color", Color) = (1,1,1,1)
        _FaceColor ("Face Color", Color) = (1,1,1,1)
        _Rect ("Rect", Vector) = (0,0,0,0)
        _IslandDownsize ("Island Downsize", Float) = 1
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
            sampler2D _OffsetTex;
            float4 _StoneColor; float4 _StoneEdge; float4 _EdgeColor;
            float _EdgeThickness;
            sampler2D _MainTex;
            sampler2D _SdfTex;
            float _Glossiness; float _Metallic;
            float4 _WaterColor; float _OutlineWidth; float4 _OutlineColor; float4 _FaceColor;
            float4 _Rect; float _IslandDownsize;

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
            float SdBox(float3 p, float3 b, float r)
            {
                float3 q = abs(p) - b;
                return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0) - r;
            }

            float4 frag(v2f i) : SV_Target
            {
                // ============ 按 Custom__FloorShaderIsland__08_PS 逐条直译 ============
                // 世界空间 XZ (L147/L148), 原点取物体位移
                float3 oc  = mul(unity_ObjectToWorld, float4(0,0,0,1)).xyz;
                float2 pW  = i.worldPos.xz - oc.xz;
                float2 p   = i.uv;
                float  h1  = Hash01(p.y * 600.0);                    // L149
                float  py  = p.y + h1 * 0.005;                       // L152
                float  h2  = Hash01(py * 300.0);                     // L154
                float  px  = p.x + h2 * 0.005;                       // L156

                // L145/L146: 半尺寸 = _Rect.xz + 尺寸偏移(_0.58 是原版常数)
                float2 halfB = float2(_Rect.x + _IslandDownsize, _Rect.z + _IslandDownsize * 0.58);
                float2 q0    = max(abs(pW) - halfB, 0.0);
                float  d0    = length(q0) - _Rect.w;                 // L164
                float  s0    = 1.0 - d0;                             // L174
                float2 q1    = max(abs(pW) - (halfB + 0.03), 0.0);
                float  d1    = length(q1) - (_Rect.w + 0.03);        // L173/L188
                float  s1    = 1.0 - d1;                             // L190

                // L183: 海浪位移纹理, uv = 世界*0.1 + 时间*0.2
                float4 wave = tex2D(_SdfTex, float2(px + _Time.y * 0.2, py + _Time.y * 0.2));
                // L187/L188: |世界 + (tex*2-1)*0.1|
                float  wx   = abs(pW.x + (wave.y * 2.0 - 1.0) * 0.1);
                float  wz   = abs(pW.y + (wave.x * 2.0 - 1.0) * 0.1);

                // 三层向外扩张的 SDF: 水面(外圈) / 白线 / 岛面
                float a1 = length(max(float2(wx - halfB.x - 1.0, wz - halfB.y - 1.0), 0.0));
                float b1 = step(a1, 0.8);                            // L194/L195: (len-0.5)<=0.3
                float a2 = length(max(float2(wx - halfB.x - 0.7, wz - halfB.y - 0.7), 0.0));
                float b2 = step(a2, 1.0);                            // L205
                float a3 = length(max(float2(wx - halfB.x - 0.6, wz - halfB.y - 0.6), 0.0));
                float b3 = step(a3, 1.0);                            // L217

                float3 c = lerp(float3(1,1,1), _WaterColor.rgb, b1);  // L196~L199 (_m20)
                c = lerp(c, float3(1,1,1), b2);                       // L206~L211
                c = lerp(c, _FaceColor.rgb, b3);                       // L218~L223 (_m7)
                float outside = step(1.0 - s1, 0.5);                   // L225 (_289)
                c = lerp(c, float3(1,1,1), outside);                   // L229~L231

                float aa0  = max(abs(ddx(s0)) + abs(ddy(s0)), 1e-5);   // L232/L300
                float mid0 = 0.5 - aa0 * 0.5;                          // L234
                float k0   = saturate((s0 - mid0) / aa0);               // L237/L238
                c = lerp(c, _FaceColor.rgb, k0);                        // L239~L244

                // ---- L245~L249: 板缝, 线在 halfZ-0.9, 带 0.89/0.91 ----
                float seamT  = halfB.y - 0.9;
                float inPl   = step(0.5, s0);                          // L248 (_321)
                float m322   = inPl * step(seamT, pW.y);
                c = lerp(c, _EdgeColor.rgb, m322);                     // L250~L255 (_m11)
                float aaX    = max(abs(ddx(pW.x)) + abs(ddy(pW.x)), 1e-5);  // L256
                float sb1    = saturate((pW.y - (seamT - 0.01)) / aaX);    // L257/L259
                float sb2    = saturate((pW.y - (seamT + 0.01)) / aaX);    // L258/L260
                float sBand  = inPl * sb1 * (1.0 - sb2);                    // L261~L263
                c *= (1.0 - sBand);                                        // L264~L266

                // ---- L267~L281: 内圈环, 半径 0.5 - _m17.x (=_EdgeThickness) ----
                float ringIn = 0.5 - _EdgeThickness;                   // L267 (_356)
                float ringLo = ringIn - aa0 * 0.5;                      // L268
                float rr1    = saturate((s0 - ringLo) / aa0)
                             * saturate(((1.0 - s0) - ringLo) / aa0);   // L271/L274/L275
                c = lerp(c, _OutlineColor.rgb, rr1);                    // L276~L281 (_m9)

                if (all(c == float3(1.0, 0.0, 0.0))) discard;           // L282~L285 demote

                // L318~L327: 原版是 c*(vcol + _Color2) 的加法项, 3D 贴图路径关闭时 _Color2 为 0
                float3 albedo = c * i.color.rgb;
                albedo *= lerp(float3(1,1,1), tex2D(_MainTex, i.uv).rgb, 0.25);
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

            float4 _Color; float4 _Color2;
            sampler2D _MainTex; sampler2D _SdfTex; sampler2D _OffsetTex;
            float4 _StoneColor; float4 _StoneEdge; float4 _EdgeColor;
            float _EdgeThickness; float _Glossiness; float _Metallic;
            float4 _WaterColor; float _OutlineWidth; float4 _OutlineColor; float4 _FaceColor;
            float4 _Rect; float _IslandDownsize;

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
                float3 albedo = _FaceColor.rgb * _Color.rgb * tex2D(_MainTex, i.uv).rgb;
                float4 col = SokpopShadeAdd(albedo, _Glossiness, _Metallic, normalize(i.worldNormal), i.worldPos);
                col.a = 0.0;
                return col;
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
