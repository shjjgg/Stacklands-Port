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

            // PS 逐条对应权威反汇编 (dxbc_disasm, doitsujin/dxbc-spirv):
            //   mad   r0.x, v0.y, 20, cb1[0].z
            //   sincos r0.x, null, r0.x
            //   mul   r0.x, r0.x, cb0[2].x
            //   mad   r0.x, r0.x, 0.001, v0.x
            //   mad   r0.z, r0.x, 15, cb1[0].z
            //   sincos null, r0.z, r0.z
            //   mul   r0.z, r0.z, cb0[2].x
            //   mad   r0.y, r0.z, 0.001, v0.y
            //   sample o0, r0.xy, t0, s0
            float4 frag (v2f i) : SV_Target
            {
                float t = _Time.z;                 // cb1[0].z 相位
                float w = _Weight;                 // cb0[2].x
                float sx = sin(i.uv.y * 20.0 + t);
                float x2 = sx * w * 0.001 + i.uv.x;
                float sy = sin(x2 * 15.0 + t);
                float y2 = sy * w * 0.001 + i.uv.y;
                return tex2D(_MainTex, float2(x2, y2));
            }
            ENDCG
        }
    }
}
