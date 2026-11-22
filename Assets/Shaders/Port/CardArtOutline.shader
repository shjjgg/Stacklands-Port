// 卡面美术「白描边」shader (v0.41)
//
// 现场取证(逐像素统计, 不是猜):
//   Assets/Texture2D/Bush/Tree/Rock.png 都是 1024×1024, alpha 覆盖 3~4 成,
//   不透明区 RGB 均值 ≈ 173~188 灰, 其中 22%~28% 是暗像素(描边), 其余是不透明的白填充。
//   即贴图本身是「白色实心剪影 + 黑色手绘描边」, 是给卡面 shader 当遮罩用的,
//   不是可以直接贴到卡上的成品图。
//
// 原版的呈现是「白描边 + 卡底色透出来」。所以这里按亮度取反算遮罩:
//   白填充(亮) -> alpha 0, 露出卡框底色; 黑描边(暗) -> alpha 1, 画成白色描边。
// 只给 GameCard/CardIcon 换材质, 树/草/UI 等其它 sprite 完全不受影响。
Shader "Port/CardArtOutline"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
        _StrokeColor ("Stroke Color", Color) = (1,1,1,1)
        _Dark ("Dark Threshold (lum)", Range(0.0, 1.0)) = 0.62
        _Soft ("Softness", Range(0.0, 0.5)) = 0.18
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
            float4 _StrokeColor;
            float _Dark;
            float _Soft;

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
                float lum = dot(c.rgb, float3(0.299, 0.587, 0.114));
                // 暗 -> 1, 亮 -> 0; 用软阈值保住抗锯齿边缘
                float mask = saturate((_Dark - lum) / max(_Soft, 1e-4));
                // 贴图自身的剪影 alpha 参与, 让轮廓外沿保留 AA
                float a = mask * c.a * i.color.a;
                float3 rgb = _StrokeColor.rgb * i.color.rgb;
                return float4(rgb, a);
            }
            ENDCG
        }
    }
    Fallback Off
}
