// 由 DXBC 反汇编还原: 504 段里 Custom__SpiritImageEffect__00_VS / __01_PS。
// pass 状态逐字取自 shader_extract/pass_state.json:
//   Cull Off / ZTest Always / ZWrite Off / Blend One Zero / ColorMask RGBA / LOD 0
// 已知不确定项: 分量掩码无法从 token 解出(见 docs/13), 通道顺序按签名与语义推定。
Shader "Custom/SpiritImageEffect"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Weight ("Weight", Float) = 0
    }
    SubShader
    {
        Pass
        {
            Cull Off
            ZTest Always
            ZWrite Off
            Blend One Zero
            ColorMask RGBA

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            // 原 shader 的关键字集(platform_forced)逐字保留, 共计 4 个立体声关键字
            #pragma multi_compile __ STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON UNITY_SINGLE_PASS_STEREO STEREO_CUBEMAP_RENDER_ON

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _Weight;

            struct appdata { float4 vertex : POSITION; float2 uv : TEXCOORD0; };
            struct v2f { float4 pos : SV_POSITION; float2 uv : TEXCOORD0; };

            // VS asm:
            //   MOV  o0, v.uv
            //   MUL/MAD/MAD/ADD t0, cb0[0..3], v.vertex   (M)
            //   MUL/MAD/MAD/MAD o1, cb1[17..20], t0       (VP)  => UnityObjectToClipPos
            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            // PS asm (逐条对应):
            //   MAD   t0, uv, 20, 0
            //   SINCOS t0 = sin(t0)
            //   MUL   t0 *= cb0[2]
            //   MAD   t0 = t0*0.001
            //   MAD   t0 = t0*15
            //   SINCOS t0 = sin(t0)
            //   MUL   t0 *= cb0[2]
            //   MAD   t0 = t0*0.001
            //   SAMPLE o, uv + t0, sampler0
            float4 frag (v2f i) : SV_Target
            {
                float2 d = sin(sin(i.uv * 20.0) * _Weight) * 0.001 * 15.0;
                d = sin(d) * _Weight * 0.001;
                return tex2D(_MainTex, i.uv + d);
            }
            ENDCG
        }
    }
}
