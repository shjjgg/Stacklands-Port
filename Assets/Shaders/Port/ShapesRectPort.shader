// Shapes/Rect Opaque — 依据原版 DXBC 机器码重建 (Shapes__Rect_Opaque__08..15_PS / 00..07_VS)
// 片元数学逐指令对齐:
//   q = abs(p) - size*0.5 ; sdf = length(max(q,0)) + min(max(q.x,q.y),0)
//   aa = max(length(float2(ddx(sdf), ddy(sdf)), 1e-5))
//   cov = 1 - saturate(sdf/aa + 0.5) ; if (cov*alpha < 0.000061) discard
// 颜色 = lerp(_Color, _ColorEnd, t), t 由 _FillType 决定(径向/线性/纯色)
// 圆角走 CORNER_RADIUS(逐角 _CornerRadii.x/y/z/w), 描边环走 BORDERED(_Thickness)
Shader "Shapes/Rect Opaque"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _ColorEnd ("Color End", Color) = (1,1,1,1)
        _Rect ("Rect", Vector) = (0,0,1,1)
        _ScaleMode ("Scale Mode", Float) = 0
        _Alignment ("Alignment", Vector) = (0,0,0,0)
        _FillType ("Fill Type", Float) = -1
        _FillSpace ("Fill Space", Float) = 0
        _FillStart ("Fill Start", Vector) = (0,0,0,0)
        _FillEnd ("Fill End", Vector) = (0,0,1,0)
        _CornerRadii ("Corner Radii", Vector) = (0,0,0,0)
        _Thickness ("Thickness", Float) = 0
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
            Offset [_ZOffsetFactor], [_ZOffsetUnits]

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile _ CORNER_RADIUS
            #pragma multi_compile _ BORDERED

            #include "UnityCG.cginc"

            float4 _Color;
            float4 _ColorEnd;
            float4 _Rect;
            float _ScaleMode;
            float4 _Alignment;
            float _FillType;
            float _FillSpace;
            float4 _FillStart;
            float4 _FillEnd;
            float4 _CornerRadii;
            float _Thickness;
            float _AA;

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float3 fill : TEXCOORD0;   // 原版 o1.xyz: 填充参考点(世界或局部)
                float4 p    : TEXCOORD1;   // xy = 矩形局部坐标, zw = 象限符号(逐角圆角选索引)
                float4 r    : TEXCOORD2;   // zw = 矩形全尺寸(与 p 同单位)
            };

            v2f vert (appdata v)
            {
                v2f o;
                float2 center = _Rect.xy;
                float2 size   = _Rect.zw;
                float2 uv01   = (v.vertex.xy + 1.0) * 0.5;

                // 原版用「四角→NDC」估像素留白, 但那份推导在透视相机 + 大 rect 下会算出上千单位的 pad,
                // 几何直接爆到 49152x32768(屏幕白板)。这里取 0 留白, 边缘抗锯齿交给片元的 ddx/ddy。
                float2 objScale = float2(length(unity_ObjectToWorld._m00_m10_m20),
                                         length(unity_ObjectToWorld._m01_m11_m21));
                float2 pad = float2(0.0, 0.0);

                // v0.64: 原来是 size*objScale*0.5, 而这个 prefab 的 objScale 高达 16384~32768,
                // 于是每个盒子几何都炸到 49152x32768 —— 就是卡包那一片灰板的来源。
                // _Rect.zw 本身就是矩形尺寸(世界单位), 不再乘缩放; 另加 100 单位硬上限防炸。
                float2 halfExt = min(size, float2(100.0, 100.0)) * 0.5 + pad;
                float2 local = uv01 * (halfExt * 2.0) - halfExt;      // 已乘物体缩放的局部坐标

                float3 wp = mul(unity_ObjectToWorld, float4(local / max(objScale, 1e-6), 0, 1)).xyz;
                o.pos = mul(unity_MatrixVP, float4(wp, 1.0));

                o.p = float4(local, sign(local));                     // zw: 象限符号
                o.r = float4(0, 0, abs(min(size, float2(100.0, 100.0))));

                // 填充参考: _FillType==-1 传 0(纯色); 否则传 参考点→_FillStart 的向量
                float3 refPos = _FillSpace > 0.5 ? wp : float3(local, 0);
                o.fill = _FillType < -0.5 ? float3(0, 0, 0) : refPos - _FillStart.xyz;
                return o;
            }

            float sdRect(float2 p, float2 h, float r)
            {
                float2 q = abs(p) - h + r;
                return length(max(q, 0.0)) + min(max(q.x, q.y), 0.0) - r;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float2 size = i.r.zw;
                float2 p = i.p.xy;
                float2 h = size * 0.5;

                // ---- 原版 08_PS 第 7~21 行: SDF + 屏幕导数抗锯齿 ----
                float r = 0.0;
                #ifdef CORNER_RADIUS
                    // 12_PS: 用局部坐标符号选角, 半径按 size 一半截断
                    float rr = 0.0;
                    rr = i.p.z > 0.0 ? (i.p.w > 0.0 ? _CornerRadii.z : _CornerRadii.w)
                                     : (i.p.w > 0.0 ? _CornerRadii.x : _CornerRadii.y);
                    r = min(min(size.x, size.y) * 0.5, rr);
                #endif

                float d = sdRect(p, h, r);

                #ifdef BORDERED
                    float t = max(_Thickness, 0.0);
                    float band = abs(d + t * 0.5) - abs(t) * 0.5;   // 10_PS 第 17~18 行
                    d = band;
                #endif

                float aa = max(length(float2(ddx(d), ddy(d))), 1e-5);
                float cov = 1.0 - saturate(d / aa + 0.5);

                // ---- 取色 (08_PS 第 22~43 行) ----
                float ft = saturate(_FillType);
                float3 col = _Color.rgb;
                float alpha = _Color.a;
                if (_FillType > -0.5)
                {
                    float g = 0.0;
                    if (ft < 0.5)
                        g = saturate(i.fill.x);                                  // 径向: 沿轴比例
                    else
                        g = saturate(length(i.fill) / max(length(_FillEnd.xyz - _FillStart.xyz), 1e-5));
                    float4 mixedCol = lerp(_Color, _ColorEnd, g);
                    col = mixedCol.rgb;
                    alpha = mixedCol.a;
                }

                // ---- 输出 (08_PS 第 44~47 行: 预乘 + 0.000061 偏置后 cutout) ----
                fixed4 outc;
                outc.rgb = col;
                outc.a = cov * alpha;
                if (cov * alpha - 0.000061 < 0.0) discard;
                return outc;
            }
            ENDHLSL
        }
    }
    Fallback Off
}
