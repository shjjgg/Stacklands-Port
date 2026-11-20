// 还原自 dxbc_disasm (doitsujin/dxbc-spirv) 的 Custom__SpiritTransitionEffect__00_VS/__01_PS。
// pass 状态取自 pass_state.json: Cull Off / ZTest Always / ZWrite Off / Blend One Zero / ColorMask RGBA / LOD 0
// 数学: 色散(色差)位移, 每个通道用不同 UV 偏移采样, alpha 取中心样本。
Shader "Custom/SpiritTransitionEffect"
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
            #pragma multi_compile __ STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON UNITY_SINGLE_PASS_STEREO STEREO_CUBEMAP_RENDER_ON

            sampler2D _MainTex;
            float _Weight;

            struct appdata { float4 vertex : POSITION; float2 uv : TEXCOORD0; };
            struct v2f { float4 pos : SV_POSITION; float2 uv : TEXCOORD0; };

            // VS: o0.xy = v1.xy; o1 = mul(cb1[17..20], mul(cb0[0..3], v0))
            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            // PS 逐条:
            //   mad r0.xy, w, (0.002385,0.009711), uv ; sample ; o.z = s.z
            //   sample center ; o.w = s.w
            //   mad r0.xyzw, w, (0.010000,0,0.007900,0.006131), uv.xyxy
            //   sample(r0.xy) -> o.x ;  sample(r0.zw) -> o.y
            float4 frag (v2f i) : SV_Target
            {
                float w = _Weight;
                float4 o;
                o.z = tex2D(_MainTex, i.uv + w * float2(0.002385, 0.009711)).z;
                o.w = tex2D(_MainTex, i.uv).w;
                o.x = tex2D(_MainTex, i.uv + w * float2(0.010000, 0)).x;
                o.y = tex2D(_MainTex, i.uv + w * float2(0.007900, 0.006131)).y;
                return o;
            }
            ENDCG
        }
    }
}
