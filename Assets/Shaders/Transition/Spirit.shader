// 还原自 dxbc_disasm: Transition__Spirit__00_VS / __01_PS
// pass 状态: Cull Off / ZTest Disabled / ZWrite On / Blend SrcAlpha OneMinusSrcAlpha / ColorMask 0
// PS 逐条: aspect=y 归一化 -> sin 扭曲 (40, 60 两段) -> 半径阈值 0.998-_TransitionAmount -> 500 倍软化
Shader "Transition/Spirit"
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
                // cb1[6].x / cb1[6].y = _ScreenParams.xy
                float aspect = _ScreenParams.x / _ScreenParams.y;
                float2 uv = i.uv;
                float y = (uv.y - 0.5) / aspect + 0.5;
                float t2 = _Time.z * 2.0;
                float px = uv.x + sin(y * 40.0 + t2) * 0.01;
                float py = sin(px * 60.0 + t2) * 0.01 + y;
                float r = sqrt((px - 0.5) * (px - 0.5) + (py - 0.5) * (py - 0.5));
                float edge = 0.998 - _TransitionAmount;
                float a = saturate((r - edge) * 499.999969);
                return float4(0, 0, 0, a * a * (3.0 - 2.0 * a));
            }
            ENDCG
        }
    }
}
