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
    vec4 _m16;
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
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
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
} cb4;

layout(set = 0, binding = 5) uniform sampler s0;
layout(set = 0, binding = 6) uniform sampler s1;
layout(set = 0, binding = 7) uniform texture2D t0;
layout(set = 0, binding = 8) uniform texture3D t1;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 0, component = 0) out vec4 SV_Target;

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
    precise float _113 = a.x * b.x;
    return fma(a.y, b.y, _113);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _96 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _96)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _81 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _81));
}

void main()
{
    precise float _123 = TEXCOORD1.x * 800.0;
    precise float _126 = sin(roundEven(_123)) * 43758.546875;
    precise float _128 = fract(_126) - 0.5;
    precise float _131 = fma(_128, 0.007000000216066837310791015625, TEXCOORD1.z);
    precise float _132 = _131 * 400.0;
    precise float _133 = _131 * 10.0;
    precise float _137 = sin(roundEven(_132)) * 43758.546875;
    precise float _139 = fract(_137) - 0.5;
    precise float _145 = roundEven(_133) + cb1.m.x;
    precise float _146 = _145 * 200.0;
    precise float _149 = sin(roundEven(_146)) * 43758.546875;
    precise float _151 = fract(_149) - 0.5;
    precise float _152 = fma(_151, 0.00999999977648258209228515625, fma(_139, 0.007000000216066837310791015625, TEXCOORD1.x));
    precise float _153 = _152 * 10.0;
    precise float _155 = roundEven(_153) + cb1.m.x;
    precise float _156 = _155 * 200.0;
    precise float _159 = sin(roundEven(_156)) * 43758.546875;
    precise float _161 = fract(_159) - 0.5;
    precise float _168 = _152 - cb3._m3.x;
    precise float _169 = fma(_161, 0.00999999977648258209228515625, _131) - cb3._m3.z;
    vec2 _184 = vec2(spvNMax(fma(-cb0._m14.x, 0.5, abs(_168)), 0.0), spvNMax(fma(-cb0._m14.y, 0.5, abs(_169)), 0.0));
    precise float _186 = sqrt(dp2_f32(_184, _184));
    precise float _191 = abs(dFdy(_186)) + abs(dFdx(_186));
    precise float _192 = -_191;
    precise float _195 = fma(_192, 0.5, cb0._m16.x);
    precise float _196 = _186 - _195;
    precise float _198 = fma(_191, 0.5, cb0._m16.x) - _195;
    precise float _199 = _196 / _198;
    precise float _200 = spvNClamp(_199, 0.0, 1.0);
    precise float _214 = cb0._m13.x - cb0._m12.x;
    precise float _215 = cb0._m13.y - cb0._m12.y;
    precise float _216 = cb0._m13.z - cb0._m12.z;
    precise float _217 = cb0._m13.w - cb0._m12.w;
    precise float _218 = fma(_200, _214, cb0._m12.x);
    precise float _219 = fma(_200, _215, cb0._m12.y);
    precise float _220 = fma(_200, _216, cb0._m12.z);
    precise float _221 = fma(_200, _217, cb0._m12.w);
    precise float _222 = cb0._m16.x + cb0._m16.x;
    precise float _223 = fma(_192, 0.5, _222);
    precise float _225 = _186 - _223;
    precise float _226 = fma(_191, 0.5, _222) - _223;
    precise float _227 = _225 / _226;
    precise float _228 = spvNClamp(_227, 0.0, 1.0);
    precise float _245 = TEXCOORD1.y * cb0._m6.x;
    precise float _246 = TEXCOORD1.y * cb0._m6.y;
    precise float _247 = TEXCOORD1.y * cb0._m6.z;
    precise float _269 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _245)) + cb0._m10.x;
    precise float _270 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _246)) + cb0._m10.y;
    precise float _271 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _247)) + cb0._m10.z;
    float _348;
    float _349;
    float _350;
    float _351;
    if (cb4._m0.x == 1.0)
    {
        bool _281 = cb4._m0.y == 1.0;
        precise float _287 = TEXCOORD1.y * cb4._m3.x;
        precise float _288 = TEXCOORD1.y * cb4._m3.y;
        precise float _289 = TEXCOORD1.y * cb4._m3.z;
        precise float _311 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _287)) + cb4._m7.x;
        precise float _312 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _288)) + cb4._m7.y;
        precise float _313 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _289)) + cb4._m7.z;
        precise float _322 = (_281 ? _311 : TEXCOORD1.x) - cb4._m11.x;
        precise float _323 = (_281 ? _312 : TEXCOORD1.y) - cb4._m11.y;
        precise float _324 = (_281 ? _313 : TEXCOORD1.z) - cb4._m11.z;
        precise float _330 = _322 * cb4._m9.x;
        precise float _331 = _323 * cb4._m9.y;
        precise float _332 = _324 * cb4._m9.z;
        vec4 _343 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_330, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _331, _332));
        _348 = _343.w;
        _349 = _343.z;
        _350 = _343.y;
        _351 = _343.x;
    }
    else
    {
        _348 = 1.0;
        _349 = 1.0;
        _350 = 1.0;
        _351 = 1.0;
    }
    vec3 _358 = vec3(_269, _270, _271);
    precise float _367 = spvNClamp(dp4_f32(vec4(_351, _350, _349, _348), cb2._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_358, _358))).x;
    precise float _368 = fma(_228, -_218, _218) * _367;
    precise float _369 = fma(_228, -_219, _219) * _367;
    precise float _370 = fma(_228, -_220, _220) * _367;
    precise float _377 = _368 * cb0._m2.x;
    precise float _378 = _369 * cb0._m2.y;
    precise float _379 = _370 * cb0._m2.z;
    precise float _380 = fma(_228, -_221, _221) * cb0._m2.w;
    SV_Target.x = _377;
    SV_Target.y = _378;
    SV_Target.z = _379;
    SV_Target.w = _380;
}

