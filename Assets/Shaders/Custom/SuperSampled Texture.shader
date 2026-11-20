// 还原自 shader_extract/glsl_exact/Custom__SuperSampled_Texture__02_PS.glsl(逐条等价):
//   tex = texture(_MainTex, uv, bias=_Bias); out = tex * _Color * 顶点色。
// pass 状态逐字取自 pass_state.json: ZTest LEqual / ZWrite Off / Blend SrcAlpha OneMinusSrcAlpha /
// ColorMask 0 / Stencil{Ref 0 Comp Always ...} / ReadMask 0 WriteMask 0。
Shader "Custom/SuperSampled Texture"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _Bias ("Bias", Range(-16,16)) = 0
        _SuperSampling ("Super Sampling", Float) = 1
        _AAScale ("AA Scale", Range(0,4)) = 1
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
            ZTest LEqual
            ZWrite Off
            Blend SrcAlpha OneMinusSrcAlpha
            ColorMask 0
            Stencil
            {
                Ref 0
                Comp Always
                Pass Keep
                Fail Keep
                ZFail Keep
                ReadMask 0
                WriteMask 0
            }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON UNITY_SINGLE_PASS_STEREO STEREO_MULTIVIEW_ON STEREO_CUBEMAP_RENDER_ON INSTANCING_ON
            #pragma shader_feature _SUPERSAMPLING_2X2_RGSS _SUPERSAMPLING_8X_HALTON _SUPERSAMPLING_16X16_OGSS

            sampler2D _MainTex;
            float4 _Color;
            float _Bias;
            float _SuperSampling;
            float _AAScale;

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

            float4 frag(v2f i) : SV_Target
            {
                // 逐条等价: texture(t0, uv, bias=_Bias) 再 × _Color × 顶点色
                float4 tex = tex2Dbias(_MainTex, float4(i.uv, 0.0, _Bias));
                return tex * _Color * i.color;
            }
            ENDCG
        }
    }
}
