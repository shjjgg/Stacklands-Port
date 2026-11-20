// Stacklands 移植 - 光照核心(与 Unity Standard BRDF 同一套数学: BRDF1_Unity_PBS + SH 环境光)
// 供 Custom/FloorShader*、BoosterShader*、StatusBar、GenericCardShader 等 Standard 改编 shader 共用。
// 用法: 各 shader 在自己的 frag 里算好 albedo/smoothness/metallic, 调 SokpopFragLit。
#ifndef SOKPOP_LIT_INCLUDED
#define SOKPOP_LIT_INCLUDED

#include "UnityCG.cginc"
#include "UnityStandardBRDF.cginc"
#include "UnityStandardUtils.cginc"
#include "UnityLightingCommon.cginc"
#include "UnityShaderVariables.cginc"

struct SokpopAppdata
{
    float4 vertex : POSITION;
    float3 normal : NORMAL;
    float2 uv : TEXCOORD0;
    float4 color : COLOR;
};

struct SokpopV2f
{
    float4 pos : SV_POSITION;
    float3 worldNormal : TEXCOORD0;
    float3 worldPos : TEXCOORD1;
    float2 uv : TEXCOORD2;
    float4 color : TEXCOORD3;
    UNITY_FOG_COORDS(4)
};

inline SokpopV2f SokpopVert(SokpopAppdata v)
{
    SokpopV2f o;
    o.pos = UnityObjectToClipPos(v.vertex);
    o.worldNormal = UnityObjectToWorldNormal(v.normal);
    o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
    o.uv = v.uv;
    o.color = v.color;
    UNITY_TRANSFER_FOG(o, o.pos);
    return o;
}

// 主光 pass: 输入 albedo(线性)、smoothness、metallic、法线、视线
inline float4 SokpopShadeBase(float3 albedo, float smoothness, float metallic, float3 worldNormal, float3 worldPos)
{
    float3 viewDir = normalize(UnityWorldSpaceViewDir(worldPos));
    float3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));

    half oneMinusReflectivity;
    half3 specColor;
    half3 diffColor = DiffuseAndSpecularFromMetallic(albedo, metallic, specColor, oneMinusReflectivity);

    UnityLight light;
    light.color = _LightColor0.rgb;
    light.dir = lightDir;
    light.ndotl = DotClamped(worldNormal, lightDir);

    UnityIndirect indirect;
    indirect.diffuse = ShadeSH9(half4(worldNormal, 1.0));
    indirect.specular = indirect.diffuse * 0.25;

    return BRDF1_Unity_PBS(diffColor, specColor, oneMinusReflectivity, smoothness,
                           worldNormal, viewDir, light, indirect);
}

// 附加光 pass: 单盏点/聚光灯, 只做漫反射 + 简单高光
inline float4 SokpopShadeAdd(float3 albedo, float smoothness, float metallic, float3 worldNormal, float3 worldPos)
{
    float3 viewDir = normalize(UnityWorldSpaceViewDir(worldPos));
    float3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));

    half oneMinusReflectivity;
    half3 specColor;
    half3 diffColor = DiffuseAndSpecularFromMetallic(albedo, metallic, specColor, oneMinusReflectivity);

    UnityLight light;
    light.color = _LightColor0.rgb;
    light.dir = lightDir;
    light.ndotl = DotClamped(worldNormal, lightDir);

    UnityIndirect indirect;
    indirect.diffuse = 0;
    indirect.specular = 0;

    return BRDF1_Unity_PBS(diffColor, specColor, oneMinusReflectivity, smoothness,
                           worldNormal, viewDir, light, indirect);
}

#endif // SOKPOP_LIT_INCLUDED
