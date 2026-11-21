// 还原自 dxbc_disasm: Sprites__SpriteOnTop__00_VS/01_VS(PIXELSNAP_ON)/02_PS/03_PS
// pass 状态: Cull Off / ZTest Always / ZWrite Off / Blend One OneMinusSrcAlpha  (预乘 alpha)
// PS: col = tex * vertexColor;  rgb *= a;  a 原样输出
Shader "Sprites/SpriteOnTop"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
        [Toggle] PixelSnap ("Pixel snap", Float) = 0
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" }
        Pass
        {
            Cull Off
            ZTest Always
            ZWrite Off
            Blend One OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ PIXELSNAP_ON
            #pragma multi_compile __ STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON UNITY_SINGLE_PASS_STEREO STEREO_CUBEMAP_RENDER_ON

            sampler2D _MainTex;
            float4 _Color;

            struct appdata { float4 vertex : POSITION; float4 color : COLOR; float2 uv : TEXCOORD0; };
            struct v2f { float4 pos : SV_POSITION; float4 color : COLOR; float2 uv : TEXCOORD0; };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
            #ifdef PIXELSNAP_ON
                o.pos = UnityPixelSnap(o.pos);
            #endif
                o.color = v.color * _Color;
                o.uv = v.uv;
                return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                float4 c = tex2D(_MainTex, i.uv) * i.color;
                c.rgb *= c.a;
                return c;
            }
            ENDCG
        }
    }
}
