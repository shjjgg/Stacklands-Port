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
    vec2 _m6;
    uvec2 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec4 _m10;
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
layout(set = 0, binding = 5) uniform texture3D t0;

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
    precise float _87 = a.x * b.x;
    return fma(a.y, b.y, _87);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _69 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _69)));
}

void main()
{
    precise float _97 = TEXCOORD1.x * 1000.0;
    precise float _100 = sin(roundEven(_97)) * 43758.546875;
    precise float _102 = fract(_100) - 0.5;
    precise float _107 = _102 * cb0._m10.w;
    precise float _110 = fma(_107, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _111 = _110 * 500.0;
    precise float _112 = _110 * 10.0;
    precise float _116 = sin(roundEven(_111)) * 43758.546875;
    precise float _118 = fract(_116) - 0.5;
    precise float _119 = _118 * cb0._m10.w;
    precise float _124 = roundEven(_112) + cb1.m.x;
    precise float _125 = _124 * 250.0;
    precise float _128 = sin(roundEven(_125)) * 43758.546875;
    precise float _130 = fract(_128) - 0.5;
    precise float _131 = fma(_130, 0.004999999888241291046142578125, fma(_119, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _132 = _131 * 10.0;
    precise float _134 = roundEven(_132) + cb1.m.x;
    precise float _135 = _134 * 250.0;
    precise float _138 = sin(roundEven(_135)) * 43758.546875;
    precise float _140 = fract(_138) - 0.5;
    precise float _141 = fma(_140, 0.004999999888241291046142578125, _110);
    precise float _151 = cb0._m8.x - cb0._m6.x;
    precise float _152 = cb0._m8.y - cb0._m6.y;
    vec2 _153 = vec2(_151, _152);
    float _154 = dp2_f32(_153, _153);
    precise float _155 = inversesqrt(_154);
    precise float _156 = _155 * _151;
    precise float _157 = _155 * _152;
    precise float _158 = 0.0 - _157;
    precise float _163 = fma(_151, _155, _158) * cb0._m10.z;
    precise float _164 = fma(_152, _155, _156) * cb0._m10.z;
    precise float _169 = fma(_151, _155, -_158) * cb0._m10.z;
    precise float _170 = fma(_152, _155, -_156) * cb0._m10.z;
    precise float _171 = _131 - cb0._m6.x;
    precise float _172 = _141 - cb0._m6.y;
    precise float _175 = dp2_f32(vec2(_171, _172), _153) / _154;
    precise float _177 = -spvNClamp(_175, 0.0, 1.0);
    vec2 _180 = vec2(fma(_177, _151, _171), fma(_177, _152, _172));
    precise float _182 = _131 - cb0._m8.x;
    precise float _183 = _141 - cb0._m8.y;
    vec2 _184 = vec2(_182, _183);
    precise float _185 = -_163;
    precise float _186 = -_164;
    vec2 _187 = vec2(_185, _186);
    precise float _190 = dp2_f32(_184, _187) / dp2_f32(_187, _187);
    precise float _192 = -spvNClamp(_190, 0.0, 1.0);
    vec2 _195 = vec2(fma(_192, _185, _182), fma(_192, _186, _183));
    precise float _200 = -_169;
    precise float _201 = -_170;
    vec2 _202 = vec2(_200, _201);
    precise float _205 = dp2_f32(_184, _202) / dp2_f32(_202, _202);
    precise float _207 = -spvNClamp(_205, 0.0, 1.0);
    vec2 _210 = vec2(fma(_207, _200, _182), fma(_207, _201, _183));
    precise float _213 = spvNMin(sqrt(dp2_f32(_210, _210)), spvNMin(sqrt(dp2_f32(_195, _195)), sqrt(dp2_f32(_180, _180))));
    precise float _218 = abs(dFdy(_213)) + abs(dFdx(_213));
    precise float _222 = fma(-_218, 0.5, cb0._m10.x);
    precise float _224 = _213 - _222;
    precise float _225 = fma(_218, 0.5, cb0._m10.x) - _222;
    precise float _226 = _224 / _225;
    precise float _227 = spvNClamp(_226, 0.0, 1.0);
    precise float _241 = cb0._m5.x - cb0._m4.x;
    precise float _242 = cb0._m5.y - cb0._m4.y;
    precise float _243 = cb0._m5.z - cb0._m4.z;
    precise float _244 = cb0._m5.w - cb0._m4.w;
    precise float _245 = fma(_227, _241, cb0._m4.x);
    precise float _246 = fma(_227, _242, cb0._m4.y);
    precise float _247 = fma(_227, _243, cb0._m4.z);
    precise float _248 = fma(_227, _244, cb0._m4.w);
    float _336;
    float _337;
    float _338;
    float _339;
    if (cb3._m0.x == 1.0)
    {
        bool _266 = cb3._m0.y == 1.0;
        precise float _275 = TEXCOORD1.y * cb3._m3.x;
        precise float _276 = TEXCOORD1.y * cb3._m3.y;
        precise float _277 = TEXCOORD1.y * cb3._m3.z;
        precise float _299 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _275)) + cb3._m7.x;
        precise float _300 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _276)) + cb3._m7.y;
        precise float _301 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _277)) + cb3._m7.z;
        precise float _310 = (_266 ? _299 : TEXCOORD1.x) - cb3._m11.x;
        precise float _311 = (_266 ? _300 : TEXCOORD1.y) - cb3._m11.y;
        precise float _312 = (_266 ? _301 : TEXCOORD1.z) - cb3._m11.z;
        precise float _318 = _310 * cb3._m9.x;
        precise float _319 = _311 * cb3._m9.y;
        precise float _320 = _312 * cb3._m9.z;
        vec4 _331 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_318, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _319, _320));
        _336 = _331.w;
        _337 = _331.z;
        _338 = _331.y;
        _339 = _331.x;
    }
    else
    {
        _336 = 1.0;
        _337 = 1.0;
        _338 = 1.0;
        _339 = 1.0;
    }
    precise float _345 = spvNClamp(dp4_f32(vec4(_339, _338, _337, _336), cb2._m46), 0.0, 1.0);
    precise float _346 = fma(_227, -_245, _245) * _345;
    precise float _347 = fma(_227, -_246, _246) * _345;
    precise float _348 = fma(_227, -_247, _247) * _345;
    precise float _355 = _346 * cb0._m2.x;
    precise float _356 = _347 * cb0._m2.y;
    precise float _357 = _348 * cb0._m2.z;
    precise float _358 = fma(_227, -_248, _248) * cb0._m2.w;
    SV_Target.x = _355;
    SV_Target.y = _356;
    SV_Target.z = _357;
    SV_Target.w = _358;
}

