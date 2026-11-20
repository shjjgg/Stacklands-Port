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
    precise float _90 = a.x * b.x;
    return fma(a.y, b.y, _90);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _72 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _72)));
}

void main()
{
    precise float _100 = TEXCOORD1.x * 800.0;
    precise float _103 = sin(roundEven(_100)) * 43758.546875;
    precise float _105 = fract(_103) - 0.5;
    precise float _108 = fma(_105, 0.007000000216066837310791015625, TEXCOORD1.z);
    precise float _109 = _108 * 400.0;
    precise float _110 = _108 * 10.0;
    precise float _114 = sin(roundEven(_109)) * 43758.546875;
    precise float _116 = fract(_114) - 0.5;
    precise float _122 = roundEven(_110) + cb1.m.x;
    precise float _123 = _122 * 200.0;
    precise float _126 = sin(roundEven(_123)) * 43758.546875;
    precise float _128 = fract(_126) - 0.5;
    precise float _129 = fma(_128, 0.00999999977648258209228515625, fma(_116, 0.007000000216066837310791015625, TEXCOORD1.x));
    precise float _130 = _129 * 10.0;
    precise float _132 = roundEven(_130) + cb1.m.x;
    precise float _133 = _132 * 200.0;
    precise float _136 = sin(roundEven(_133)) * 43758.546875;
    precise float _138 = fract(_136) - 0.5;
    precise float _145 = _129 - cb3._m3.x;
    precise float _146 = fma(_138, 0.00999999977648258209228515625, _108) - cb3._m3.z;
    vec2 _161 = vec2(spvNMax(fma(-cb0._m6.x, 0.5, abs(_145)), 0.0), spvNMax(fma(-cb0._m6.y, 0.5, abs(_146)), 0.0));
    precise float _163 = sqrt(dp2_f32(_161, _161));
    precise float _168 = abs(dFdy(_163)) + abs(dFdx(_163));
    precise float _169 = -_168;
    precise float _172 = fma(_169, 0.5, cb0._m8.x);
    precise float _173 = _163 - _172;
    precise float _175 = fma(_168, 0.5, cb0._m8.x) - _172;
    precise float _176 = _173 / _175;
    precise float _177 = spvNClamp(_176, 0.0, 1.0);
    precise float _191 = cb0._m5.x - cb0._m4.x;
    precise float _192 = cb0._m5.y - cb0._m4.y;
    precise float _193 = cb0._m5.z - cb0._m4.z;
    precise float _194 = cb0._m5.w - cb0._m4.w;
    precise float _195 = fma(_177, _191, cb0._m4.x);
    precise float _196 = fma(_177, _192, cb0._m4.y);
    precise float _197 = fma(_177, _193, cb0._m4.z);
    precise float _198 = fma(_177, _194, cb0._m4.w);
    precise float _199 = cb0._m8.x + cb0._m8.x;
    precise float _200 = fma(_169, 0.5, _199);
    precise float _202 = _163 - _200;
    precise float _203 = fma(_168, 0.5, _199) - _200;
    precise float _204 = _202 / _203;
    precise float _205 = spvNClamp(_204, 0.0, 1.0);
    float _293;
    float _294;
    float _295;
    float _296;
    if (cb4._m0.x == 1.0)
    {
        bool _223 = cb4._m0.y == 1.0;
        precise float _232 = TEXCOORD1.y * cb4._m3.x;
        precise float _233 = TEXCOORD1.y * cb4._m3.y;
        precise float _234 = TEXCOORD1.y * cb4._m3.z;
        precise float _256 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _232)) + cb4._m7.x;
        precise float _257 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _233)) + cb4._m7.y;
        precise float _258 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _234)) + cb4._m7.z;
        precise float _267 = (_223 ? _256 : TEXCOORD1.x) - cb4._m11.x;
        precise float _268 = (_223 ? _257 : TEXCOORD1.y) - cb4._m11.y;
        precise float _269 = (_223 ? _258 : TEXCOORD1.z) - cb4._m11.z;
        precise float _275 = _267 * cb4._m9.x;
        precise float _276 = _268 * cb4._m9.y;
        precise float _277 = _269 * cb4._m9.z;
        vec4 _288 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_275, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _276, _277));
        _293 = _288.w;
        _294 = _288.z;
        _295 = _288.y;
        _296 = _288.x;
    }
    else
    {
        _293 = 1.0;
        _294 = 1.0;
        _295 = 1.0;
        _296 = 1.0;
    }
    precise float _302 = spvNClamp(dp4_f32(vec4(_296, _295, _294, _293), cb2._m46), 0.0, 1.0);
    precise float _303 = fma(_205, -_195, _195) * _302;
    precise float _304 = fma(_205, -_196, _196) * _302;
    precise float _305 = fma(_205, -_197, _197) * _302;
    precise float _312 = _303 * cb0._m2.x;
    precise float _313 = _304 * cb0._m2.y;
    precise float _314 = _305 * cb0._m2.z;
    precise float _315 = fma(_205, -_198, _198) * cb0._m2.w;
    SV_Target.x = _312;
    SV_Target.y = _313;
    SV_Target.z = _314;
    SV_Target.w = _315;
}

