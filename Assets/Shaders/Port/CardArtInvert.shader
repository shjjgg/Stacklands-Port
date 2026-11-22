// 卡面美术反相 shader (v0.40)
// 现场证据: 原版卡面美术贴图是「反相存法」(白填充 + 黑描边), PC 版由卡面 shader 反相后
// 才显示成「白描边 + 暗填充」。我们用内置 Sprites/Default 直接采样, 于是卡面黑白颠倒。
// 这里只给 GameCard/CardIcon 换这一个材质, 其它 sprite(树/草/UI)完全不受影响。
Shader "Port/CardArtInvert"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "Queue"="Transparent" "RenderType"="Transparent" "IgnoreProjector"="true" }
        Cull Off
        ZWrite Off
        Blend SrcAlpha OneMinusSrcAlpha
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

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
                float4 c = tex2D(_MainTex, i.uv);
                c.rgb = 1.0 - c.rgb;          // 反相 RGB, alpha 保持
                c.rgb *= i.color.rgb;         // 顶点色/材质色仍然生效
                c.a *= i.color.a;
                return c;
            }
            ENDCG
        }
    }
    Fallback Off
}
