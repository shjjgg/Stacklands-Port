// 还原自 shader_extract/asm_fxc/Custom__ConveyorArrowShader__03_PS.txt 与
// shader_extract/glsl_exact/Custom__ConveyorArrowShader__03_PS.glsl(数学精确等价)。
// cb0 槽位(cb0._m2/_m4/_m5/_m6/_m8/_m10)按 GLSL 使用语义映射:
//   _m2 = _Color 乘子, _m4/_m5 = 线内外两色(lerp), _m6/_m8 = _Start/_End.xy,
//   _m10 = (_LineThickness, _Filled, _OutlineThickness, _Noise)
// pass 状态逐字取自 pass_state.json: ZTest LessEqual / ZWrite Off / ColorMask GBA。
Shader "Custom/ConveyorArrowShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Start ("Start", Vector) = (1,1,1,1)
        _End ("End", Vector) = (1,1,1,1)
        _SideLength ("Side Length", Float) = 0.5
        _Noise ("Noise", Float) = 1
        _OutlineColor ("Outline Color", Color) = (1,1,1,1)
        _LineThickness ("Line Thickness", Float) = 0.1
        _OutlineThickness ("Outline Thickness", Float) = 0.1
        _Filled ("Filled", Float) = 0.1
        _Gap ("Gap", Float) = 0.1
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }

        Pass
        {
            ZTest LessEqual
            ZWrite Off
            Blend SrcAlpha OneMinusSrcAlpha
            ColorMask GBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color;
            float4 _Start;
            float4 _End;
            float _SideLength;
            float _Noise;
            float4 _OutlineColor;
            float _LineThickness;
            float _OutlineThickness;
            float _Filled;
            float _Gap;

            struct appdata
            {
                float4 vertex : POSITION;
                float3 uv : TEXCOORD0;      // TEXCOORD1 in asm: zw 用于抖动相位
                float4 color : COLOR;       // TEXCOORD2 in asm
            };
            struct v2f
            {
                float4 pos : SV_POSITION;
                float3 uv : TEXCOORD0;
                float4 color : TEXCOORD1;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                o.color = v.color;
                return o;
            }

            // asm/glsl 里的哈希: fract(sin(round(x)) * 43758.546875) - 0.5
            float Hash01(float x)
            {
                return frac(sin(round(x)) * 43758.546875);
            }

            float SdSegment(float2 p, float2 a, float2 b)
            {
                float2 ab = b - a;
                float  t  = saturate(dot(p - a, ab) / dot(ab, ab));
                return length(p - (a + ab * t));
            }

            float4 frag (v2f i) : SV_Target
            {
                // --- 抖动: 沿 z 相位与 xy 两个尺度各做一次哈希 (对应 glsl _98.._142) ---
                float n1 = Hash01(i.uv.x * 1000.0) - 0.5;
                float z1 = i.uv.z + n1 * _Noise * 0.005;

                float n2 = Hash01(z1 * 500.0) - 0.5;
                float n3 = Hash01(round(z1 * 10.0) + _Time.y) - 0.5;
                float n4 = Hash01((round((n2 * _Noise * 0.005 + i.uv.x) * 10.0) + _Time.y) * 250.0) - 0.5;

                float2 p = float2(
                    i.uv.x + n3 * _Noise * 0.005 + n4 * _Noise * 0.005,
                    z1 + n2 * _Noise * 0.005);

                // --- 线段 SDF + 两端侧边线 (对应 _152.._214) ---
                float2 a = float2(_Start.x, _Start.y);
                float2 b = float2(_End.x, _End.y);
                float d = SdSegment(p, a, b);

                // --- 覆盖度: 用 dFdx/dFdy 做单像素抗锯齿 (对应 _219.._228) ---
                float aa     = abs(ddy(d)) + abs(ddx(d));
                float halfW  = _LineThickness;                       // cb0._m10.x
                float inner  = d - (halfW - aa * 0.5);
                float outer  = (halfW + aa * 0.5) - (halfW - aa * 0.5);
                float cov    = saturate(inner / max(outer, 1e-6));

                // --- 内外两色按覆盖度插值, 再以 (1-cov) 取内部 (对应 _246.._256) ---
                float4 cA = _OutlineColor;
                float4 cB = _Color;
                float4 cm = lerp(cA, cB, cov);
                float4 innerCol = cm * (1.0 - cov);

                // --- 输出: 顶点色 + _Color 乘子, alpha 取 cm.a*(1-cov)*_Color.a ---
                float3 rgb = innerCol.rgb * _Color.rgb + innerCol.rgb * i.color.rgb;
                float  alpha = innerCol.a * _Color.a;
                return float4(rgb, alpha);
            }
            ENDCG
        }

        Pass
        {
            ZTest LessEqual
            ZWrite Off
            Blend SrcAlpha One
            ColorMask GBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2 DIRECTIONAL LIGHTPROBE_SH DYNAMICLIGHTMAP_ON LIGHTMAP_ON LIGHTMAP_SHADOW_MIXING DIRLIGHTMAP_COMBINED VERTEXLIGHT_ON POINT SPOT POINT_COOKIE DIRECTIONAL_COOKIE EDITOR_VISUALIZATION SHADOWS_SHADOWMASK SHADOWS_SCREEN SHADOWS_DEPTH SHADOWS_CUBE UNITY_HDR_ON

            float4 _Color;
            float4 _Start;
            float4 _End;
            float _SideLength;
            float _Noise;
            float4 _OutlineColor;
            float _LineThickness;
            float _OutlineThickness;
            float _Filled;
            float _Gap;

            struct appdata { float4 vertex : POSITION; float3 uv : TEXCOORD0; float4 color : COLOR; };
            struct v2f { float4 pos : SV_POSITION; float3 uv : TEXCOORD0; float4 color : TEXCOORD1; };

            v2f vert (appdata v)
            {
                v2f o; o.pos = UnityObjectToClipPos(v.vertex); o.uv = v.uv; o.color = v.color; return o;
            }
            float Hash01(float x) { return frac(sin(round(x)) * 43758.546875); }
            float SdSegment(float2 p, float2 a, float2 b)
            {
                float2 ab = b - a;
                float  t  = saturate(dot(p - a, ab) / dot(ab, ab));
                return length(p - (a + ab * t));
            }

            float4 frag (v2f i) : SV_Target
            {
                float n1 = Hash01(i.uv.x * 1000.0) - 0.5;
                float z1 = i.uv.z + n1 * _Noise * 0.005;
                float n2 = Hash01(z1 * 500.0) - 0.5;
                float n3 = Hash01(round(z1 * 10.0) + _Time.y) - 0.5;
                float n4 = Hash01((round((n2 * _Noise * 0.005 + i.uv.x) * 10.0) + _Time.y) * 250.0) - 0.5;
                float2 p = float2(i.uv.x + n3 * _Noise * 0.005 + n4 * _Noise * 0.005, z1 + n2 * _Noise * 0.005);

                float2 a = float2(_Start.x, _Start.y);
                float2 b = float2(_End.x, _End.y);
                float d = SdSegment(p, a, b);

                float aa    = abs(ddy(d)) + abs(ddx(d));
                float halfW = _LineThickness;
                float cov   = saturate((d - (halfW - aa * 0.5)) / max(aa, 1e-6));

                float4 cm = lerp(_OutlineColor, _Color, cov);
                float4 innerCol = cm * (1.0 - cov);
                // ADD pass: 只加亮, alpha 乘以 cm.a
                return float4(innerCol.rgb * _Color.rgb, innerCol.a * _Color.a);
            }
            ENDCG
        }
    }
    Fallback "Diffuse"
}
