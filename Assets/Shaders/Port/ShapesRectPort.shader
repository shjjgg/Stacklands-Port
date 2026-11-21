// 替代 AssetRipper 导出的 Dummy Shader (原版 Shapes "Rect Opaque*" 只有编译后的 DXBC,
// 直接导出会退化成"整块实心四边形", 卡片/盒子框会糊成一整片白块)。
// 本 shader 用 SDF 还原 Shapes 矩形的语义: 圆角 + 描边环(BORDERED) + AA,
// 尺寸从物体矩阵的世界缩放推出(Shapes 的 rect 网格是 [-1,1] 单位四边形),
// 圆角/描边宽度优先取 Shapes 通过 MaterialPropertyBlock 下发的 _CornerRadii/_Thickness。
Shader "Shapes/Rect Opaque"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Thickness ("Thickness", Float) = 0.022
        _CornerRadii ("Corner Radii", Vector) = (0,0,0,0)
        _AA ("AA", Float) = 0.6
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilOpPass ("Stencil Op", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Comp", Float) = 8
        _StencilID ("Stencil ID", Float) = 0
        _StencilReadMask ("Stencil Read Mask", Float) = 255
        _StencilWriteMask ("Stencil Write Mask", Float) = 255
        _ZOffsetFactor ("ZOffset Factor", Float) = 0
        _ZOffsetUnits ("ZOffset Units", Float) = 0
    }

    SubShader
    {
		Tags { "Queue"="AlphaTest" "RenderType"="TransparentCutout" "IgnoreProjector"="true" "DisableBatching"="true" }
		Cull Off
		ZTest [_ZTest]
		ZWrite On
		AlphaToMask On
		Stencil {
			Ref [_StencilID]
			Comp [_StencilComp]
			Pass [_StencilOpPass]
			ReadMask [_StencilReadMask]
			WriteMask [_StencilWriteMask]
		}

        Pass
        {
            ZTest [_ZTest]
            Offset [_ZOffsetFactor], [_ZOffsetUnits]
            Stencil
            {
                Ref [_StencilID]
                Comp [_StencilComp]
                Pass [_StencilOpPass]
                ReadMask [_StencilReadMask]
                WriteMask [_StencilWriteMask]
            }

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile _ CORNER_RADIUS
            #pragma multi_compile _ BORDERED

            #include "UnityCG.cginc"

            float4 _Color;
            float _Thickness;
            float4 _CornerRadii;
            float _AA;

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 p   : TEXCOORD0;   // 物体空间位置(单位: 世界单位, 已乘半尺寸)
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                // 网格是 [-1,1] 的四边形, 世界半尺寸 = 物体矩阵两个轴的长度
                float2 halfSize = float2(
                    length(float2(unity_ObjectToWorld._m00, unity_ObjectToWorld._m10)),
                    length(float2(unity_ObjectToWorld._m01, unity_ObjectToWorld._m11)));
                o.p = v.vertex.xy * halfSize;
                return o;
            }

            float sdRoundRect(float2 p, float2 h, float r)
            {
                float2 q = abs(p) - h + r;
                return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float2 h = float2(
                    length(float2(unity_ObjectToWorld._m00, unity_ObjectToWorld._m10)),
                    length(float2(unity_ObjectToWorld._m01, unity_ObjectToWorld._m11)));

                // 世界半尺寸在片元里再用一次, 保证 SDF 与顶点位置一致(方便非等比缩放)
                // 由于 v2f 只传了位置, 这里用屏幕导数近似出 AA 宽度
                float r = 0.0;
                #ifdef CORNER_RADIUS
                    r = max(max(_CornerRadii.x, _CornerRadii.y), max(_CornerRadii.z, _CornerRadii.w));
                    r = min(r, min(h.x, h.y));
                #endif

                float d = sdRoundRect(i.p, h, r);
                float aa = max(fwidth(d) * _AA, 1e-5);

                float outer = smoothstep(aa, -aa, d);
                #ifdef BORDERED
                    float t = max(_Thickness, 0.0);
                    float inner = smoothstep(aa, -aa, d + t);
                    float a = saturate(outer - inner);
                #else
                    float a = outer;
                #endif

                fixed4 c = _Color;
                c.a *= a;
                return c;
            }
            ENDHLSL
        }
    }
    Fallback Off
}
