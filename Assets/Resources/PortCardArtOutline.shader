// 卡面美术 shader (v0.42) —— 描边 + 卡底色 + 互补墨色
//
// 实测事实(逐像素统计 Assets/Texture2D/*.png):
//   卡面贴图是 1024×1024 的「白色实心剪影 + 黑手绘描边」遮罩图:
//   中心像素 (255,255,255,255) 不透明白填充, 外沿 alpha=0,
//   不透明区 RGB 均值 173~188 灰, 其中 22%~28% 是暗像素(描边)。
//
// 原版呈现(对照 PC 实录截图):
//   深色卡(浆果灌木/岩石) → 白色描边 + 卡底色填充;
//   浅色卡(村民/木材/硬币) → 深色描边 + 卡底色填充。
//   即线条颜色 = 卡底色的互补色(1 - 卡底色), 白填充一律透明。
//
// 这里: mask = 1 - 亮度(白填充→0, 黑描边→1), 线条颜色由 _InkColor 给,
// _InkColor 由 C# 从卡框(Shapes Rect)的 MaterialPropertyBlock 读出卡底色后取反。
Shader "Port/CardArtOutline"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
        _InkColor ("Ink Color", Color) = (1,1,1,1)
        _Dark ("Dark Threshold (lum)", Range(0.0, 1.0)) = 0.55
        _Soft ("Softness", Range(0.0, 0.5)) = 0.22
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
            float4 _InkColor;
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
                // 黑描边 → mask 1, 白填充 → mask 0; 软阈值保住抗锯齿
                float mask = saturate((_Dark - lum) / max(_Soft, 1e-4));
                float a = mask * c.a * i.color.a;
                return float4(_InkColor.rgb * i.color.rgb, a);
            }
            ENDCG
        }
    }
    Fallback Off
}
