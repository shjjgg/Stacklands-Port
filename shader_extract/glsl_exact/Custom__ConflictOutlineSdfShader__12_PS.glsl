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
    vec4 _m12;
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
layout(set = 0, binding = 7) uniform sampler s2;
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform texture2D t1;
layout(set = 0, binding = 10) uniform texture3D t2;

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
    precise float _122 = TEXCOORD1.x * 800.0;
    precise float _125 = sin(roundEven(_122)) * 43758.546875;
    precise float _127 = fract(_125) - 0.5;
    precise float _130 = fma(_127, 0.007000000216066837310791015625, TEXCOORD1.z);
    precise float _131 = _130 * 400.0;
    precise float _132 = _130 * 10.0;
    precise float _136 = sin(roundEven(_131)) * 43758.546875;
    precise float _138 = fract(_136) - 0.5;
    precise float _144 = roundEven(_132) + cb1.m.x;
    precise float _145 = _144 * 200.0;
    precise float _148 = sin(roundEven(_145)) * 43758.546875;
    precise float _150 = fract(_148) - 0.5;
    precise float _151 = fma(_150, 0.00999999977648258209228515625, fma(_138, 0.007000000216066837310791015625, TEXCOORD1.x));
    precise float _152 = _151 * 10.0;
    precise float _154 = roundEven(_152) + cb1.m.x;
    precise float _155 = _154 * 200.0;
    precise float _158 = sin(roundEven(_155)) * 43758.546875;
    precise float _160 = fract(_158) - 0.5;
    precise float _167 = _151 - cb3._m3.x;
    precise float _168 = fma(_160, 0.00999999977648258209228515625, _130) - cb3._m3.z;
    vec2 _183 = vec2(spvNMax(fma(-cb0._m10.x, 0.5, abs(_167)), 0.0), spvNMax(fma(-cb0._m10.y, 0.5, abs(_168)), 0.0));
    precise float _185 = sqrt(dp2_f32(_183, _183));
    precise float _190 = abs(dFdy(_185)) + abs(dFdx(_185));
    precise float _191 = -_190;
    precise float _194 = fma(_191, 0.5, cb0._m12.x);
    precise float _195 = _185 - _194;
    precise float _197 = fma(_190, 0.5, cb0._m12.x) - _194;
    precise float _198 = _195 / _197;
    precise float _199 = spvNClamp(_198, 0.0, 1.0);
    precise float _213 = cb0._m9.x - cb0._m8.x;
    precise float _214 = cb0._m9.y - cb0._m8.y;
    precise float _215 = cb0._m9.z - cb0._m8.z;
    precise float _216 = cb0._m9.w - cb0._m8.w;
    precise float _217 = fma(_199, _213, cb0._m8.x);
    precise float _218 = fma(_199, _214, cb0._m8.y);
    precise float _219 = fma(_199, _215, cb0._m8.z);
    precise float _220 = fma(_199, _216, cb0._m8.w);
    precise float _221 = cb0._m12.x + cb0._m12.x;
    precise float _222 = fma(_191, 0.5, _221);
    precise float _224 = _185 - _222;
    precise float _225 = fma(_190, 0.5, _221) - _222;
    precise float _226 = _224 / _225;
    precise float _227 = spvNClamp(_226, 0.0, 1.0);
    precise float _244 = TEXCOORD1.y * cb0._m5.x;
    precise float _245 = TEXCOORD1.y * cb0._m5.y;
    precise float _246 = TEXCOORD1.y * cb0._m5.z;
    precise float _247 = TEXCOORD1.y * cb0._m5.w;
    precise float _274 = fma(cb0._m6.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _244)) + cb0._m7.x;
    precise float _275 = fma(cb0._m6.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _245)) + cb0._m7.y;
    precise float _276 = fma(cb0._m6.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _246)) + cb0._m7.z;
    precise float _277 = fma(cb0._m6.w, TEXCOORD1.z, fma(cb0._m4.w, TEXCOORD1.x, _247)) + cb0._m7.w;
    float _355;
    float _356;
    float _357;
    float _358;
    if (cb4._m0.x == 1.0)
    {
        bool _287 = cb4._m0.y == 1.0;
        precise float _294 = TEXCOORD1.y * cb4._m3.x;
        precise float _295 = TEXCOORD1.y * cb4._m3.y;
        precise float _296 = TEXCOORD1.y * cb4._m3.z;
        precise float _318 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _294)) + cb4._m7.x;
        precise float _319 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _295)) + cb4._m7.y;
        precise float _320 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _296)) + cb4._m7.z;
        precise float _329 = (_287 ? _318 : TEXCOORD1.x) - cb4._m11.x;
        precise float _330 = (_287 ? _319 : TEXCOORD1.y) - cb4._m11.y;
        precise float _331 = (_287 ? _320 : TEXCOORD1.z) - cb4._m11.z;
        precise float _337 = _329 * cb4._m9.x;
        precise float _338 = _330 * cb4._m9.y;
        precise float _339 = _331 * cb4._m9.z;
        vec4 _350 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_337, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _338, _339));
        _355 = _350.w;
        _356 = _350.z;
        _357 = _350.y;
        _358 = _350.x;
    }
    else
    {
        _355 = 1.0;
        _356 = 1.0;
        _357 = 1.0;
        _358 = 1.0;
    }
    precise float _367 = _274 / _277;
    precise float _368 = _275 / _277;
    precise float _369 = _367 + 0.5;
    precise float _370 = _368 + 0.5;
    precise float _378 = float(_276 > 0.0) * texture(sampler2D(t0, s1), vec2(_369, _370)).w;
    vec3 _379 = vec3(_274, _275, _276);
    precise float _387 = _378 * texture(sampler2D(t1, s2), vec2(dp3_f32(_379, _379))).x;
    precise float _388 = spvNClamp(dp4_f32(vec4(_358, _357, _356, _355), cb2._m46), 0.0, 1.0) * _387;
    precise float _389 = fma(_227, -_217, _217) * _388;
    precise float _390 = fma(_227, -_218, _218) * _388;
    precise float _391 = fma(_227, -_219, _219) * _388;
    precise float _398 = _389 * cb0._m2.x;
    precise float _399 = _390 * cb0._m2.y;
    precise float _400 = _391 * cb0._m2.z;
    precise float _401 = fma(_227, -_220, _220) * cb0._m2.w;
    SV_Target.x = _398;
    SV_Target.y = _399;
    SV_Target.z = _400;
    SV_Target.w = _401;
}

