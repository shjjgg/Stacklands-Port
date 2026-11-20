// 还原自 dxbc_disasm: Sprites__BackgroundShader__00_VS/01_PS
// pass 状态: Cull Off / ZTest LEqual / ZWrite Off / Blend One OneMinusSrcAlpha
// PS 逐条: x = sin(uv.y*0.318319 + time*0.3) * pow(uv.y,1.4) * 0.02 + uv.x; sample(x, uv.y); 预乘 alpha
Shader "Sprites/BackgroundShader"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
        [Toggle] PixelSnap ("Pixel snap", Float) = 0
    }
    SubShader
    {
        Pass
        {
            Cull Off
            ZTest LEqual
            ZWrite Off
            Blend One OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_instancing
            #pragma multi_compile __ STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON UNITY_SINGLE_PASS_STEREO STEREO_CUBEMAP_RENDER_ON

            sampler2D _MainTex;
            float4 _Color;

            struct appdata { float4 vertex : POSITION; float4 color : COLOR; float2 uv : TEXCOORD0; };
            struct v2f { float4 pos : SV_POSITION; float4 color : COLOR; float2 uv : TEXCOORD0; };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.color = v.color * _Color;
                o.uv = v.uv;
                return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                float wave = sin(i.uv.y * 0.318319 + _Time.z * 0.3);
                float fall = pow(i.uv.y, 1.4);
                float2 uv = float2(wave * fall * 0.02 + i.uv.x, i.uv.y);
                float4 c = tex2D(_MainTex, uv) * i.color;
                c.rgb *= c.a;
                return c;
            }
            ENDCG
        }
    }
}
