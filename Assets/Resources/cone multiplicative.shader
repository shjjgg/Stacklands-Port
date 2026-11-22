Shader "Shapes/Cone Multiplicative" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_Color2 ("Color 2", Color) = (1,1,1,1)
		_Thickness ("Thickness", Range(0, 2)) = 0.1
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("Z Test", Float) = 4
		_ZOffsetFactor ("Z Offset Factor", Float) = 0
		_ZOffsetUnits ("Z Offset Units", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Comparison", Float) = 8
		[Enum(UnityEngine.Rendering.StencilOp)] _StencilOpPass ("Stencil Operation Pass", Float) = 0
		_StencilID ("Stencil ID", Float) = 0
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
	}
	//PortShapeFallback: 原始 Shapes shader 在 AssetRipper 导出后只剩顶点变换 + return float4(1,1,1,1),
	//这里用同一 GUID 重建一个「按顶点色/材质色填充 + 透明混合」的基础实现, 保证 Shader.Find 拿到可用材质。
	SubShader {
		Tags { "Queue"="Transparent" "RenderType"="Transparent" "IgnoreProjector"="true" "DisableBatching"="true" }
		Cull Off
		ZTest [_ZTest]
		ZWrite Off
		Blend DstColor Zero
		Stencil {
			Ref [_StencilID]
			Comp [_StencilComp]
			Pass [_StencilOpPass]
			ReadMask [_StencilReadMask]
			WriteMask [_StencilWriteMask]
		}
		Pass {
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			struct appdata {
				float4 vertex : POSITION;
				float4 color : COLOR;
				float2 uv : TEXCOORD0;
			};

			struct v2f {
				float4 pos : SV_POSITION;
				float4 color : COLOR;
				float2 uv : TEXCOORD0;
			};

			float4 _Color;
			float4 _Color2;
			float _Thickness;

			v2f vert (appdata v) {
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.color = v.color;
				o.uv = v.uv;
				return o;
			}

			float4 frag (v2f i) : SV_Target {
				// 顶点色为白时直接用材质色; 形状网格本身带渐变顶点色时保留渐变
				float4 vc = i.color;
				float4 tint = _Color;
				float4 c = vc * tint;
				if (vc.a <= 0.0) c.a = tint.a;
				return c;
			}
			ENDHLSL
		}
	}
	Fallback "Unlit/Color"
}
