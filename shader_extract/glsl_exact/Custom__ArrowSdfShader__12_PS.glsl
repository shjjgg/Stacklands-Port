#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
    vec2 _m10;
    uvec2 _m11;
    vec2 _m12;
    uvec2 _m13;
    vec4 _m14;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 m;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    uvec4 _m6;
    uvec4 _m7;
    uvec4 _m8;
    uvec4 _m9;
    uvec4 _m10;
    uvec4 _m11;
    uvec4 _m12;
    uvec4 _m13;
    uvec4 _m14;
    uvec4 _m15;
    uvec4 _m16;
    uvec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    uvec4 _m20;
    uvec4 _m21;
    uvec4 _m22;
    uvec4 _m23;
    uvec4 _m24;
    uvec4 _m25;
    uvec4 _m26;
    uvec4 _m27;
    uvec4 _m28;
    uvec4 _m29;
    uvec4 _m30;
    uvec4 _m31;
    uvec4 _m32;
    uvec4 _m33;
    uvec4 _m34;
    uvec4 _m35;
    uvec4 _m36;
    uvec4 _m37;
    uvec4 _m38;
    uvec4 _m39;
    uvec4 _m40;
    uvec4 _m41;
    uvec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    vec4 _m46;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    vec4 _m0;
    vec3 _m1;
    uint _m2;
    vec3 _m3;
    uint _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
} cb3;

layout(set = 0, binding = 4) uniform sampler s0;
layout(set = 0, binding = 5) uniform sampler s1;
layout(set = 0, binding = 6) uniform sampler s2;
layout(set = 0, binding = 7) uniform texture2D t0;
layout(set = 0, binding = 8) uniform texture2D t1;
layout(set = 0, binding = 9) uniform texture3D t2;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _111 = a.x * b.x;
    return fma(a.y, b.y, _111);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _94 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _94)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _79 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _79));
}

void main()
{
    precise float _121 = TEXCOORD1.x * 1000.0;
    precise float _124 = sin(roundEven(_121)) * 43758.546875;
    precise float _126 = fract(_124) - 0.5;
    precise float _131 = _126 * cb0._m14.w;
    precise float _134 = fma(_131, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _135 = _134 * 500.0;
    precise float _136 = _134 * 10.0;
    precise float _140 = sin(roundEven(_135)) * 43758.546875;
    precise float _142 = fract(_140) - 0.5;
    precise float _143 = _142 * cb0._m14.w;
    precise float _148 = roundEven(_136) + cb1.m.x;
    precise float _149 = _148 * 250.0;
    precise float _152 = sin(roundEven(_149)) * 43758.546875;
    precise float _154 = fract(_152) - 0.5;
    precise float _155 = fma(_154, 0.004999999888241291046142578125, fma(_143, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _156 = _155 * 10.0;
    precise float _158 = roundEven(_156) + cb1.m.x;
    precise float _159 = _158 * 250.0;
    precise float _162 = sin(roundEven(_159)) * 43758.546875;
    precise float _164 = fract(_162) - 0.5;
    precise float _165 = fma(_164, 0.004999999888241291046142578125, _134);
    precise float _175 = cb0._m12.x - cb0._m10.x;
    precise float _176 = cb0._m12.y - cb0._m10.y;
    vec2 _177 = vec2(_175, _176);
    float _178 = dp2_f32(_177, _177);
    precise float _179 = inversesqrt(_178);
    precise float _180 = _179 * _175;
    precise float _181 = _179 * _176;
    precise float _182 = 0.0 - _181;
    precise float _187 = fma(_175, _179, _182) * cb0._m14.z;
    precise float _188 = fma(_176, _179, _180) * cb0._m14.z;
    precise float _193 = fma(_175, _179, -_182) * cb0._m14.z;
    precise float _194 = fma(_176, _179, -_180) * cb0._m14.z;
    precise float _195 = _155 - cb0._m10.x;
    precise float _196 = _165 - cb0._m10.y;
    precise float _199 = dp2_f32(vec2(_195, _196), _177) / _178;
    precise float _201 = -spvNClamp(_199, 0.0, 1.0);
    vec2 _204 = vec2(fma(_201, _175, _195), fma(_201, _176, _196));
    precise float _206 = _155 - cb0._m12.x;
    precise float _207 = _165 - cb0._m12.y;
    vec2 _208 = vec2(_206, _207);
    precise float _209 = -_187;
    precise float _210 = -_188;
    vec2 _211 = vec2(_209, _210);
    precise float _214 = dp2_f32(_208, _211) / dp2_f32(_211, _211);
    precise float _216 = -spvNClamp(_214, 0.0, 1.0);
    vec2 _219 = vec2(fma(_216, _209, _206), fma(_216, _210, _207));
    precise float _224 = -_193;
    precise float _225 = -_194;
    vec2 _226 = vec2(_224, _225);
    precise float _229 = dp2_f32(_208, _226) / dp2_f32(_226, _226);
    precise float _231 = -spvNClamp(_229, 0.0, 1.0);
    vec2 _234 = vec2(fma(_231, _224, _206), fma(_231, _225, _207));
    precise float _237 = spvNMin(sqrt(dp2_f32(_234, _234)), spvNMin(sqrt(dp2_f32(_219, _219)), sqrt(dp2_f32(_204, _204))));
    precise float _242 = abs(dFdy(_237)) + abs(dFdx(_237));
    precise float _247 = cb0._m14.y + cb0._m14.x;
    precise float _248 = -_242;
    precise float _249 = fma(_248, 0.5, _247);
    precise float _250 = _237 - _249;
    precise float _252 = fma(_242, 0.5, _247) - _249;
    precise float _253 = _250 / _252;
    precise float _254 = spvNClamp(_253, 0.0, 1.0);
    precise float _268 = cb0._m9.x - cb0._m8.x;
    precise float _269 = cb0._m9.y - cb0._m8.y;
    precise float _270 = cb0._m9.z - cb0._m8.z;
    precise float _271 = cb0._m9.w - cb0._m8.w;
    precise float _272 = fma(_254, _268, cb0._m8.x);
    precise float _273 = fma(_254, _269, cb0._m8.y);
    precise float _274 = fma(_254, _270, cb0._m8.z);
    precise float _275 = fma(_254, _271, cb0._m8.w);
    precise float _276 = fma(cb0._m14.y, 2.0, cb0._m14.x);
    precise float _277 = fma(_248, 0.5, _276);
    precise float _279 = _237 - _277;
    precise float _280 = fma(_242, 0.5, _276) - _277;
    precise float _281 = _279 / _280;
    precise float _282 = spvNClamp(_281, 0.0, 1.0);
    precise float _299 = TEXCOORD1.y * cb0._m5.x;
    precise float _300 = TEXCOORD1.y * cb0._m5.y;
    precise float _301 = TEXCOORD1.y * cb0._m5.z;
    precise float _302 = TEXCOORD1.y * cb0._m5.w;
    precise float _329 = fma(cb0._m6.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _299)) + cb0._m7.x;
    precise float _330 = fma(cb0._m6.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _300)) + cb0._m7.y;
    precise float _331 = fma(cb0._m6.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _301)) + cb0._m7.z;
    precise float _332 = fma(cb0._m6.w, TEXCOORD1.z, fma(cb0._m4.w, TEXCOORD1.x, _302)) + cb0._m7.w;
    float _410;
    float _411;
    float _412;
    float _413;
    if (cb3._m0.x == 1.0)
    {
        bool _342 = cb3._m0.y == 1.0;
        precise float _349 = TEXCOORD1.y * cb3._m3.x;
        precise float _350 = TEXCOORD1.y * cb3._m3.y;
        precise float _351 = TEXCOORD1.y * cb3._m3.z;
        precise float _373 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _349)) + cb3._m7.x;
        precise float _374 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _350)) + cb3._m7.y;
        precise float _375 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _351)) + cb3._m7.z;
        precise float _384 = (_342 ? _373 : TEXCOORD1.x) - cb3._m11.x;
        precise float _385 = (_342 ? _374 : TEXCOORD1.y) - cb3._m11.y;
        precise float _386 = (_342 ? _375 : TEXCOORD1.z) - cb3._m11.z;
        precise float _392 = _384 * cb3._m9.x;
        precise float _393 = _385 * cb3._m9.y;
        precise float _394 = _386 * cb3._m9.z;
        vec4 _405 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_392, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _393, _394));
        _410 = _405.w;
        _411 = _405.z;
        _412 = _405.y;
        _413 = _405.x;
    }
    else
    {
        _410 = 1.0;
        _411 = 1.0;
        _412 = 1.0;
        _413 = 1.0;
    }
    precise float _422 = _329 / _332;
    precise float _423 = _330 / _332;
    precise float _424 = _422 + 0.5;
    precise float _425 = _423 + 0.5;
    precise float _433 = float(_331 > 0.0) * texture(sampler2D(t0, s1), vec2(_424, _425)).w;
    vec3 _434 = vec3(_329, _330, _331);
    precise float _442 = _433 * texture(sampler2D(t1, s2), vec2(dp3_f32(_434, _434))).x;
    precise float _443 = spvNClamp(dp4_f32(vec4(_413, _412, _411, _410), cb2._m46), 0.0, 1.0) * _442;
    precise float _444 = fma(_282, -_272, _272) * _443;
    precise float _445 = fma(_282, -_273, _273) * _443;
    precise float _446 = fma(_282, -_274, _274) * _443;
    precise float _453 = _444 * cb0._m2.x;
    precise float _454 = _445 * cb0._m2.y;
    precise float _455 = _446 * cb0._m2.z;
    precise float _456 = fma(_282, -_275, _275) * cb0._m2.w;
    SV_Target.x = _453;
    SV_Target.y = _454;
    SV_Target.z = _455;
    SV_Target.w = _456;
}

