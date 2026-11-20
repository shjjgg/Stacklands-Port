// 还原自 dxbc_disasm: Postprocess__SokpopIntro__01_PS
// pass 状态: Cull Off / ZTest Always / ZWrite Off
// PS: 圆形遮罩 + 软化; color *= (1 - shape) ; o = color - _Darkness*color
Shader "Postprocess/SokpopIntro"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _CircleSize ("Circle Size", Float) = 0.5
        _CircleDelta ("Circle Delta", Float) = 0.1
        _XOffset ("X Offset", Float) = 0
        _YOffset ("Y Offset", Float) = 0
        _Darkness ("Darkness", Float) = 0
    }
    SubShader
    {
        Pass
        {
            Cull Off
            ZTest Always
            ZWrite Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON UNITY_SINGLE_PASS_STEREO STEREO_CUBEMAP_RENDER_ON

            sampler2D _MainTex;
            float _CircleSize, _CircleDelta, _XOffset, _YOffset, _Darkness;

            struct appdata { float4 vertex : POSITION; float2 uv : TEXCOORD0; };
            struct v2f { float4 pos : SV_POSITION; float2 uv : TEXCOORD0; };

            v2f vert (appdata v)
            {
                v2f o; o.pos = UnityObjectToClipPos(v.vertex); o.uv = v.uv; return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                float aspect = _ScreenParams.y / _ScreenParams.x;   // cb1[6].y/cb1[6].x
                float2 uv = i.uv + float2(_XOffset, _YOffset);        // cb0[0].zw
                float2 p = float2(uv.x - 0.5, aspect * uv.y - aspect * 0.5);
                float4 src = tex2D(_MainTex, uv);
                float d = sqrt(p.x * p.x + p.y * p.y);
                d -= _CircleSize * aspect;                            // cb0[0].x
                float a = saturate(d / (aspect * _CircleDelta));       // cb0[0].y
                float shape = (3.0 - 2.0 * a) * a * a;
                float k = 1.0 - shape;
                float4 col = k * src;
                return col - _Darkness * col;                          // cb0[1].x
            }
            ENDCG
        }
    }
}
