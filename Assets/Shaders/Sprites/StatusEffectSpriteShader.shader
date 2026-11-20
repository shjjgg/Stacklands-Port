// 还原自 dxbc_disasm: Sprites__StatusEffectSpriteShader__03_PS (另有 02_PS 变体)
// pass 状态: Cull Off / ZTest LessEqual / ZWrite Off / Blend One OneMinusSrcAlpha
// PS 逐条: y波 = sin(uv.x*10 + t)*0.02 + uv.y; flag = (_FillAmount >= y波) ? 0 : 1;
//         col = lerp(_ColorA,_ColorB, 1-tex.x) * 顶点色;  rgb = col.rgb*(1-0.7*flag)
Shader "Sprites/StatusEffectSpriteShader"
{
    Properties
    {
        _MainTex ("Sprite Texture", 2D) = "white" {}
        _Color ("Tint", Color) = (1,1,1,1)
        _FillAmount ("Fill", Range(0,1)) = 0.5
        [Toggle] PixelSnap ("Pixel snap", Float) = 0
        _ColorA ("Color A", Color) = (1,1,1,1)
        _ColorB ("Color B", Color) = (1,1,1,1)
    }
    SubShader
    {
        Pass
        {
            Cull Off
            ZTest LessEqual
            ZWrite Off
            Blend One OneMinusSrcAlpha

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile __ PIXELSNAP_ON STEREO_INSTANCING_ON STEREO_MULTIVIEW_ON UNITY_SINGLE_PASS_STEREO STEREO_CUBEMAP_RENDER_ON

            sampler2D _MainTex;
            float4 _Color, _ColorA, _ColorB;
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
                float yWave = sin(i.uv.x * 10.0 + _Time.z) * 0.02 + i.uv.y;
                float flag = (_FillAmount >= yWave) ? 0.0 : 1.0;
                float4 tex = tex2D(_MainTex, i.uv);
                float4 col = lerp(_ColorA, _ColorB, 1.0 - tex.x) * i.color;
                col.rgb *= (1.0 - 0.7 * flag);
                col.rgb *= col.a;
                return col;
            }
            ENDCG
        }
    }
}
