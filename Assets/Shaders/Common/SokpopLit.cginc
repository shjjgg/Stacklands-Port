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


// Unity 标准环境反射(与 UnityStandardCore 的 forward base 同一段代码):
//   box projection: cb3._m7/_m9/_m11 = BoxMin/ProbePos/BoxMax, cb3._m12 = 开关
//   HDR 解码: cb3._m6 / cb3._m13; 双探针混合系数 = cb3._m3(即 unity_SpecCube0_BoxMin.w)
inline half3 SokpopEnvSpecular(half3 normalWorld, half3 viewDir, float3 posWorld, half smoothness)
{
#if defined(UNITY_SPECCUBE_BOX_PROJECTION)
    half3 reflUVW = BoxProjectedCubemapDirection(normalWorld, posWorld,
                                                 unity_SpecCube0_ProbePosition,
                                                 unity_SpecCube0_BoxMin,
                                                 unity_SpecCube0_BoxMax);
#else
    half3 reflUVW = reflect(-viewDir, normalWorld);
#endif
    half4 hdr = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflUVW, (1.0 - smoothness) * 6.0);
    half3 env0 = DecodeHDR(hdr, unity_SpecCube0_HDR);
#if defined(UNITY_SPECCUBE_BLENDING)
    half blend = unity_SpecCube0_BoxMin.w;      // 原版 cb3._m3
    if (blend < 0.99999)
    {
        half4 hdr1 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube1, reflUVW, (1.0 - smoothness) * 6.0);
        half3 env1 = DecodeHDR(hdr1, unity_SpecCube1_HDR);
        env0 = lerp(env1, env0, blend);
    }
#endif
    return env0;
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
    // v0.77: 原版尾部是 Unity 标准环境反射(探针盒投影 + 双探针混合), 不是"SH×0.25"这种自造近似。
    // 场景 SampleScene 的 Lighting 里确实挂了 m_CustomReflection(Assets/Cubemap/Cubemap.png),
    // 所以这个采样在 PC 上是真在出图的; 我们此前用 ShadeSH9*0.25 顶掉, 卡面/场地的高光与空气感因此偏平。
    indirect.specular = SokpopEnvSpecular(worldNormal, viewDir, worldPos, smoothness);

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
