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
    vec4 _m8;
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
layout(set = 0, binding = 6) uniform texture3D t0;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
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
    precise float _91 = a.x * b.x;
    return fma(a.y, b.y, _91);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _73 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _73)));
}

void main()
{
    precise float _101 = TEXCOORD1.x * 800.0;
    precise float _104 = sin(roundEven(_101)) * 43758.546875;
    precise float _106 = fract(_104) - 0.5;
    precise float _109 = fma(_106, 0.007000000216066837310791015625, TEXCOORD1.z);
    precise float _110 = _109 * 400.0;
    precise float _111 = _109 * 10.0;
    precise float _115 = sin(roundEven(_110)) * 43758.546875;
    precise float _117 = fract(_115) - 0.5;
    precise float _123 = roundEven(_111) + cb1.m.x;
    precise float _124 = _123 * 200.0;
    precise float _127 = sin(roundEven(_124)) * 43758.546875;
    precise float _129 = fract(_127) - 0.5;
    precise float _130 = fma(_129, 0.00999999977648258209228515625, fma(_117, 0.007000000216066837310791015625, TEXCOORD1.x));
    precise float _131 = _130 * 10.0;
    precise float _133 = roundEven(_131) + cb1.m.x;
    precise float _134 = _133 * 200.0;
    precise float _137 = sin(roundEven(_134)) * 43758.546875;
    precise float _139 = fract(_137) - 0.5;
    precise float _146 = _130 - cb3._m3.x;
    precise float _147 = fma(_139, 0.00999999977648258209228515625, _109) - cb3._m3.z;
    vec2 _162 = vec2(spvNMax(fma(-cb0._m6.x, 0.5, abs(_146)), 0.0), spvNMax(fma(-cb0._m6.y, 0.5, abs(_147)), 0.0));
    precise float _164 = sqrt(dp2_f32(_162, _162));
    precise float _169 = abs(dFdy(_164)) + abs(dFdx(_164));
    precise float _170 = -_169;
    precise float _173 = fma(_170, 0.5, cb0._m8.x);
    precise float _174 = _164 - _173;
    precise float _176 = fma(_169, 0.5, cb0._m8.x) - _173;
    precise float _177 = _174 / _176;
    precise float _178 = spvNClamp(_177, 0.0, 1.0);
    precise float _192 = cb0._m5.x - cb0._m4.x;
    precise float _193 = cb0._m5.y - cb0._m4.y;
    precise float _194 = cb0._m5.z - cb0._m4.z;
    precise float _195 = cb0._m5.w - cb0._m4.w;
    precise float _196 = fma(_178, _192, cb0._m4.x);
    precise float _197 = fma(_178, _193, cb0._m4.y);
    precise float _198 = fma(_178, _194, cb0._m4.z);
    precise float _199 = fma(_178, _195, cb0._m4.w);
    precise float _200 = cb0._m8.x + cb0._m8.x;
    precise float _201 = fma(_170, 0.5, _200);
    precise float _203 = _164 - _201;
    precise float _204 = fma(_169, 0.5, _200) - _201;
    precise float _205 = _203 / _204;
    precise float _206 = spvNClamp(_205, 0.0, 1.0);
    precise float _211 = fma(_206, -_196, _196);
    precise float _212 = fma(_206, -_197, _197);
    precise float _213 = fma(_206, -_198, _198);
    float _294;
    float _295;
    float _296;
    float _297;
    if (cb4._m0.x == 1.0)
    {
        bool _224 = cb4._m0.y == 1.0;
        precise float _233 = TEXCOORD1.y * cb4._m3.x;
        precise float _234 = TEXCOORD1.y * cb4._m3.y;
        precise float _235 = TEXCOORD1.y * cb4._m3.z;
        precise float _257 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _233)) + cb4._m7.x;
        precise float _258 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _234)) + cb4._m7.y;
        precise float _259 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _235)) + cb4._m7.z;
        precise float _268 = (_224 ? _257 : TEXCOORD1.x) - cb4._m11.x;
        precise float _269 = (_224 ? _258 : TEXCOORD1.y) - cb4._m11.y;
        precise float _270 = (_224 ? _259 : TEXCOORD1.z) - cb4._m11.z;
        precise float _276 = _268 * cb4._m9.x;
        precise float _277 = _269 * cb4._m9.y;
        precise float _278 = _270 * cb4._m9.z;
        vec4 _289 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_276, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _277, _278));
        _294 = _289.w;
        _295 = _289.z;
        _296 = _289.y;
        _297 = _289.x;
    }
    else
    {
        _294 = 1.0;
        _295 = 1.0;
        _296 = 1.0;
        _297 = 1.0;
    }
    precise float _303 = spvNClamp(dp4_f32(vec4(_297, _296, _295, _294), cb2._m46), 0.0, 1.0);
    precise float _310 = _211 * TEXCOORD2.x;
    precise float _311 = _212 * TEXCOORD2.y;
    precise float _312 = _213 * TEXCOORD2.z;
    precise float _313 = _211 * _303;
    precise float _314 = _212 * _303;
    precise float _315 = _213 * _303;
    SV_Target.x = fma(_313, cb0._m2.x, _310);
    SV_Target.y = fma(_314, cb0._m2.y, _311);
    SV_Target.z = fma(_315, cb0._m2.z, _312);
    SV_Target.w = fma(fma(_206, -_199, _199), cb0._m2.w, 0.0);
}

