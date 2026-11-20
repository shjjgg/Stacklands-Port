// 还原自 shader_extract/glsl_exact/Unlit__CardopediaBackgroundShader__01_PS.glsl(逐条等价):
// 以屏幕 uv 求极角(atan 多项式逼近 _54.._68), 角度 × 0.1618 后取 fract, 
// 再 sin(angle*74.16 + _Time.y*0.5) 做放射条纹 -> smoothstep 平滑 (0.1 亮度, alpha 0.05 叠加 0.5)。
// pass: ZTest LessEqual / ZWrite On / Blend SrcAlpha OneMinusSrcAlpha。
Shader "Unlit/CardopediaBackgroundShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" "IgnoreProjector"="True" }

        Pass
        {
            ZTest LessEqual
            ZWrite On
            Blend SrcAlpha OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma multi_compile __ FOG_LINEAR FOG_EXP FOG_EXP2

            sampler2D _MainTex;

            struct appdata { float4 vertex:POSITION; float2 uv:TEXCOORD0; };
            struct v2f { float4 pos:SV_POSITION; float4 screenPos:TEXCOORD0; };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.screenPos = ComputeScreenPos(o.pos);
                return o;
            }

            // Horner 展开: r^8/r^6/r^4/r^2/常数 系数与 asm 完全一致
            float p5(float x)
            {
                return x * (x * (x * (x * 0.02083509974181652 - 0.08513300120830536) + 0.18014100193977356) - 0.3302994966506958) + 0.9998660087585449;
            }

            float4 frag(v2f i) : SV_Target
            {
                // 屏幕归一化 (-0.5 偏移)
                float2 s = i.screenPos.xy / i.screenPos.w;
                float y = s.y - 0.5;
                float x = s.x - 0.5;
                float ax = abs(x);
                float ay = abs(y);
                float r = min(ax, ay) / max(max(ax, ay), 1e-6);   // _54

                // atan 多项式逼近(与 asm 常数一致)
                float r2 = r * r;
                float p = p5(r2);
                // _68 = ((x<0)?-π:0) + fma(r,p, (ax<ay) ? (-2*r*p + 1.5708) : 0)
                float ang = ((ax < ay) ? (1.57079637 - r * p) : (r * p)) + ((x < 0.0) ? -3.14159265 : 0.0);

                if (max(x, y) >= 0.0 && min(x, y) < 0.0) ang = -ang;
                ang *= 0.16181230545043945;

                float f = frac(abs(ang));
                float a = (ang >= 0.0) ? f : -f;

                float t = sin(a * 74.15999603271484 + _Time.y * 0.5) * 100.0;
                float c = clamp(t, 0.0, 1.0);
                float sm = c * c * (c * -2.0 + 3.0);   // smoothstep
                return float4(sm * 0.1, sm * 0.1, sm * 0.1, sm * 0.05 + 0.5);
            }

            ENDCG
        }
    }
}
