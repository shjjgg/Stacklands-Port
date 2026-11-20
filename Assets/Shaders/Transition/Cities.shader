// 还原自 shader_extract/glsl_exact/Transition__Cities__01_PS.glsl。
// 场景转场(城市): _MainTex 做两级域扭曲(0.2×2 步, 幅度 0.05/0.03), 
// 以 _TransitionAmount 生成城市轮廓 SDF 链(每级用 h=clamp((a-b)*25+0.5) 的 0.02 平滑并集),
// 轮廓内填 _Color2; 阈値 0.09 之外 α=0, |sdf|<0.1 处 α=1 形成描边带。
// pass: Cull Off / ZTest Always / ZWrite On / Blend SrcAlpha OneMinusSrcAlpha / ColorMask 0
//       / Stencil{Ref _Stencil Comp _StencilComp ...}
Shader "Transition/Cities"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _TransitionTex ("Transition", 2D) = "white" {}
        _TransitionAmount ("Transition Amount", Float) = 0
        _Color2 ("Color2", Color) = (1,1,1,1)
        _NoiseTex ("Noise", 2D) = "white" {}
        _StencilComp ("Stencil Comparison", Float) = 8
        _Stencil ("Stencil ID", Float) = 0
        _StencilOp ("Stencil Operation", Float) = 0
        _StencilWriteMask ("Stencil Write Mask", Float) = 255
        _StencilReadMask ("Stencil Read Mask", Float) = 255
        _ColorMask ("Color Mask", Float) = 15
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" "IgnoreProjector"="True" }

        Pass
        {
            Cull Off
            ZTest Always
            ZWrite On
            Blend SrcAlpha OneMinusSrcAlpha
            ColorMask 0
            Stencil
            {
                Ref [_Stencil]
                Comp [_StencilComp]
                Pass Keep
                Fail Keep
                ZFail Keep
                ReadMask [_StencilReadMask]
                WriteMask [_StencilWriteMask]
            }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON

            sampler2D _MainTex;
            sampler2D _TransitionTex;
            float _TransitionAmount;
            float4 _Color2;
            sampler2D _NoiseTex;
            float4 _MainTex_TexelSize;

            struct appdata { float4 vertex:POSITION; float2 uv:TEXCOORD0; float4 color:COLOR; };
            struct v2f { float4 pos:SV_POSITION; float2 uv:TEXCOORD0; float4 color:COLOR; };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                o.color = v.color;
                return o;
            }

            float SmMerge(float a, float b)
            {
                float h = clamp((a - b) * 25.0 + 0.5, 0.0, 1.0);
                return lerp(b, a, h) - 0.02 * h * (1.0 - h);
            }
            // 2D 圆 SDF
            float SdCircle(float2 p, float2 c, float r) { return length(p - c) - r; }

            float4 frag(v2f i) : SV_Target
            {
                // 宽高比压缩 (对应 _83/_87.._89)
                float aspect = _MainTex_TexelSize.x / max(_MainTex_TexelSize.y, 1e-6);
                float sy = (i.uv.y - 0.5) / max(aspect, 1e-6) + 0.5;
                float t = _Time.y * 0.2;

                // 两级域扭曲 (0.05 / 0.03)
                float4 d1 = tex2D(_MainTex, float2(i.uv.x * 0.2 + t, sy * 0.2 + t));
                float2 p1 = float2(i.uv.x + d1.x * 0.05, sy + d1.y * 0.05);
                float4 d2 = tex2D(_MainTex, float2(p1.x * 0.2 + t, p1.y * 0.2 + t));
                float2 p = float2(p1.x + d2.x * 0.03, p1.y + d2.y * 0.03);

                // 城市轮廓链 (以 _TransitionAmount 拉伸高度, 半径 r = a*0.4-0.1)
                float k = _TransitionAmount;
                float r  = k * 0.4 - 0.1;
                float yb = k * 0.0875 + 0.85;      // 基线
                float top = 0.2 + k * 0.075;
                float c1 = SdCircle(p, float2(top, yb), r);
                float c2 = SdCircle(p, float2(0.1 + k * 0.1, yb), r);
                float c3 = SdCircle(p, float2(0.9 - k * 0.1, 0.25 + k * 0.0625), r);
                float c4 = SdCircle(p, float2(1.0 - k * 0.125, yb), r);
                float c5 = SdCircle(p, float2(0.95 - k * 0.1125, yb), r);

                float d = SmMerge(c1, c2);
                d = SmMerge(d, c3);
                d = SmMerge(d, c4);
                d = SmMerge(d, c5);

                float hidden = step(0.09, d);
                float3 rgb = _Color2.rgb * hidden;
                float a = (d < 0.1 && d > -0.1) ? 1.0 : 0.0;
                return float4(rgb, a);
            }
            ENDCG
        }
    }
}
