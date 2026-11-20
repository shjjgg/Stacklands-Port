// 还原自 dxbc_disasm: Transition__Default__00_VS / __01_PS
// pass 状态取自 pass_state.json: Cull Off / ZTest Disabled / ZWrite On / Blend SrcAlpha OneMinusSrcAlpha / ColorMask 0
// PS 数学(逐条): d = frac((uv.y-uv.x)*30)-0.5; r = |d|*sqrt(2) - (0.92 - _TransitionAmount);
//   a = saturate(r*12.5); shape = 3-2a; out = a^2*shape  -> 抖动边缘的过渡遮罩
Shader "Transition/Default"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _TransitionTex ("Transition", 2D) = "white" {}
        _TransitionAmount ("Amount", Float) = 0


        _StencilComp ("Stencil Comparison", Float) = 0
        _Stencil ("Stencil ID", Float) = 0
        _StencilOp ("Stencil Operation", Float) = 0
        _StencilWriteMask ("Stencil Write Mask", Float) = 255
        _StencilReadMask ("Stencil Read Mask", Float) = 255
        _ColorMask ("Color Mask", Float) = 0
    }
    SubShader
    {
        Pass
        {
            Cull Off
            ZTest Disabled
            ZWrite On
            Blend SrcAlpha OneMinusSrcAlpha
            ColorMask 0

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON UNITY_SINGLE_PASS_STEREO STEREO_CUBEMAP_RENDER_ON

            sampler2D _MainTex;
            sampler2D _TransitionTex;
            float _TransitionAmount;
            float4 _TransitionColor;

            struct appdata { float4 vertex : POSITION; float2 uv : TEXCOORD0; };
            struct v2f { float4 pos : SV_POSITION; float2 uv : TEXCOORD2; };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                float d = frac((i.uv.y - i.uv.x) * 30.0) - 0.5;
                float r = sqrt(d * d + d * d);
                float edge = 0.92 - _TransitionAmount;
                float a = saturate((r - edge) * 12.5);
                float shape = 3.0 - 2.0 * a;
                float4 col = float4(0, 0, 0, a * a * shape);
                return col;
            }
            ENDCG
        }
    }
}
