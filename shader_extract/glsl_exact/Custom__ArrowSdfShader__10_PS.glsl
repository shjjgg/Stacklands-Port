#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    vec4 _m12;
    vec4 _m13;
    vec2 _m14;
    uvec2 _m15;
    vec2 _m16;
    uvec2 _m17;
    vec4 _m18;
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
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

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
    precise float _112 = a.x * b.x;
    return fma(a.y, b.y, _112);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _95 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _95)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _80 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _80));
}

void main()
{
    precise float _122 = TEXCOORD1.x * 1000.0;
    precise float _125 = sin(roundEven(_122)) * 43758.546875;
    precise float _127 = fract(_125) - 0.5;
    precise float _132 = _127 * cb0._m18.w;
    precise float _135 = fma(_132, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _136 = _135 * 500.0;
    precise float _137 = _135 * 10.0;
    precise float _141 = sin(roundEven(_136)) * 43758.546875;
    precise float _143 = fract(_141) - 0.5;
    precise float _144 = _143 * cb0._m18.w;
    precise float _149 = roundEven(_137) + cb1.m.x;
    precise float _150 = _149 * 250.0;
    precise float _153 = sin(roundEven(_150)) * 43758.546875;
    precise float _155 = fract(_153) - 0.5;
    precise float _156 = fma(_155, 0.004999999888241291046142578125, fma(_144, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _157 = _156 * 10.0;
    precise float _159 = roundEven(_157) + cb1.m.x;
    precise float _160 = _159 * 250.0;
    precise float _163 = sin(roundEven(_160)) * 43758.546875;
    precise float _165 = fract(_163) - 0.5;
    precise float _166 = fma(_165, 0.004999999888241291046142578125, _135);
    precise float _176 = cb0._m16.x - cb0._m14.x;
    precise float _177 = cb0._m16.y - cb0._m14.y;
    vec2 _178 = vec2(_176, _177);
    float _179 = dp2_f32(_178, _178);
    precise float _180 = inversesqrt(_179);
    precise float _181 = _180 * _176;
    precise float _182 = _180 * _177;
    precise float _183 = 0.0 - _182;
    precise float _188 = fma(_176, _180, _183) * cb0._m18.z;
    precise float _189 = fma(_177, _180, _181) * cb0._m18.z;
    precise float _194 = fma(_176, _180, -_183) * cb0._m18.z;
    precise float _195 = fma(_177, _180, -_181) * cb0._m18.z;
    precise float _196 = _156 - cb0._m14.x;
    precise float _197 = _166 - cb0._m14.y;
    precise float _200 = dp2_f32(vec2(_196, _197), _178) / _179;
    precise float _202 = -spvNClamp(_200, 0.0, 1.0);
    vec2 _205 = vec2(fma(_202, _176, _196), fma(_202, _177, _197));
    precise float _207 = _156 - cb0._m16.x;
    precise float _208 = _166 - cb0._m16.y;
    vec2 _209 = vec2(_207, _208);
    precise float _210 = -_188;
    precise float _211 = -_189;
    vec2 _212 = vec2(_210, _211);
    precise float _215 = dp2_f32(_209, _212) / dp2_f32(_212, _212);
    precise float _217 = -spvNClamp(_215, 0.0, 1.0);
    vec2 _220 = vec2(fma(_217, _210, _207), fma(_217, _211, _208));
    precise float _225 = -_194;
    precise float _226 = -_195;
    vec2 _227 = vec2(_225, _226);
    precise float _230 = dp2_f32(_209, _227) / dp2_f32(_227, _227);
    precise float _232 = -spvNClamp(_230, 0.0, 1.0);
    vec2 _235 = vec2(fma(_232, _225, _207), fma(_232, _226, _208));
    precise float _238 = spvNMin(sqrt(dp2_f32(_235, _235)), spvNMin(sqrt(dp2_f32(_220, _220)), sqrt(dp2_f32(_205, _205))));
    precise float _243 = abs(dFdy(_238)) + abs(dFdx(_238));
    precise float _248 = cb0._m18.y + cb0._m18.x;
    precise float _249 = -_243;
    precise float _250 = fma(_249, 0.5, _248);
    precise float _251 = _238 - _250;
    precise float _253 = fma(_243, 0.5, _248) - _250;
    precise float _254 = _251 / _253;
    precise float _255 = spvNClamp(_254, 0.0, 1.0);
    precise float _269 = cb0._m13.x - cb0._m12.x;
    precise float _270 = cb0._m13.y - cb0._m12.y;
    precise float _271 = cb0._m13.z - cb0._m12.z;
    precise float _272 = cb0._m13.w - cb0._m12.w;
    precise float _273 = fma(_255, _269, cb0._m12.x);
    precise float _274 = fma(_255, _270, cb0._m12.y);
    precise float _275 = fma(_255, _271, cb0._m12.z);
    precise float _276 = fma(_255, _272, cb0._m12.w);
    precise float _277 = fma(cb0._m18.y, 2.0, cb0._m18.x);
    precise float _278 = fma(_249, 0.5, _277);
    precise float _280 = _238 - _278;
    precise float _281 = fma(_243, 0.5, _277) - _278;
    precise float _282 = _280 / _281;
    precise float _283 = spvNClamp(_282, 0.0, 1.0);
    precise float _300 = TEXCOORD1.y * cb0._m6.x;
    precise float _301 = TEXCOORD1.y * cb0._m6.y;
    precise float _302 = TEXCOORD1.y * cb0._m6.z;
    precise float _324 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _300)) + cb0._m10.x;
    precise float _325 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _301)) + cb0._m10.y;
    precise float _326 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _302)) + cb0._m10.z;
    float _403;
    float _404;
    float _405;
    float _406;
    if (cb3._m0.x == 1.0)
    {
        bool _336 = cb3._m0.y == 1.0;
        precise float _342 = TEXCOORD1.y * cb3._m3.x;
        precise float _343 = TEXCOORD1.y * cb3._m3.y;
        precise float _344 = TEXCOORD1.y * cb3._m3.z;
        precise float _366 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _342)) + cb3._m7.x;
        precise float _367 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _343)) + cb3._m7.y;
        precise float _368 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _344)) + cb3._m7.z;
        precise float _377 = (_336 ? _366 : TEXCOORD1.x) - cb3._m11.x;
        precise float _378 = (_336 ? _367 : TEXCOORD1.y) - cb3._m11.y;
        precise float _379 = (_336 ? _368 : TEXCOORD1.z) - cb3._m11.z;
        precise float _385 = _377 * cb3._m9.x;
        precise float _386 = _378 * cb3._m9.y;
        precise float _387 = _379 * cb3._m9.z;
        vec4 _398 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_385, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _386, _387));
        _403 = _398.w;
        _404 = _398.z;
        _405 = _398.y;
        _406 = _398.x;
    }
    else
    {
        _403 = 1.0;
        _404 = 1.0;
        _405 = 1.0;
        _406 = 1.0;
    }
    vec3 _413 = vec3(_324, _325, _326);
    precise float _422 = spvNClamp(dp4_f32(vec4(_406, _405, _404, _403), cb2._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_413, _413))).x;
    precise float _423 = fma(_283, -_273, _273) * _422;
    precise float _424 = fma(_283, -_274, _274) * _422;
    precise float _425 = fma(_283, -_275, _275) * _422;
    precise float _432 = _423 * cb0._m2.x;
    precise float _433 = _424 * cb0._m2.y;
    precise float _434 = _425 * cb0._m2.z;
    precise float _435 = fma(_283, -_276, _276) * cb0._m2.w;
    SV_Target.x = _432;
    SV_Target.y = _433;
    SV_Target.z = _434;
    SV_Target.w = _435;
}

