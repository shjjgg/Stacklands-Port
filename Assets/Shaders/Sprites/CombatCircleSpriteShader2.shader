// 还原自 dxbc_disasm: Sprites__CombatCircleSpriteShader2__03_PS
// pass 状态: Cull Off / ZTest LEqual / ZWrite Off / Blend One OneMinusSrcAlpha
// PS: col = tex*顶点色; rgb *= (0.3 + 0.7*_FillAmount); 预乘 alpha
Shader "Sprites/CombatCircleSpriteShader2"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
        _FillAmount ("Fill", Range(0,1)) = 0.6
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
            #pragma multi_compile __ PIXELSNAP_ON STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON UNITY_SINGLE_PASS_STEREO STEREO_CUBEMAP_RENDER_ON

            sampler2D _MainTex;
            float4 _Color;
            float _FillAmount;

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
                float4 c = tex2D(_MainTex, i.uv) * i.color;
                c.rgb *= (0.3 + 0.7 * _FillAmount);
                c.rgb *= c.a;
                return c;
            }
            ENDCG
        }
    }
}
