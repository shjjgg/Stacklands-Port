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
layout(set = 0, binding = 7) uniform sampler s2;
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform textureCube t1;
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
    precise float _117 = a.x * b.x;
    return fma(a.y, b.y, _117);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _100 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _100)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _85 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _85));
}

void main()
{
    precise float _127 = TEXCOORD1.x * 800.0;
    precise float _130 = sin(roundEven(_127)) * 43758.546875;
    precise float _132 = fract(_130) - 0.5;
    precise float _135 = fma(_132, 0.007000000216066837310791015625, TEXCOORD1.z);
    precise float _136 = _135 * 400.0;
    precise float _137 = _135 * 10.0;
    precise float _141 = sin(roundEven(_136)) * 43758.546875;
    precise float _143 = fract(_141) - 0.5;
    precise float _149 = roundEven(_137) + cb1.m.x;
    precise float _150 = _149 * 200.0;
    precise float _153 = sin(roundEven(_150)) * 43758.546875;
    precise float _155 = fract(_153) - 0.5;
    precise float _156 = fma(_155, 0.00999999977648258209228515625, fma(_143, 0.007000000216066837310791015625, TEXCOORD1.x));
    precise float _157 = _156 * 10.0;
    precise float _159 = roundEven(_157) + cb1.m.x;
    precise float _160 = _159 * 200.0;
    precise float _163 = sin(roundEven(_160)) * 43758.546875;
    precise float _165 = fract(_163) - 0.5;
    precise float _172 = _156 - cb3._m3.x;
    precise float _173 = fma(_165, 0.00999999977648258209228515625, _135) - cb3._m3.z;
    vec2 _188 = vec2(spvNMax(fma(-cb0._m14.x, 0.5, abs(_172)), 0.0), spvNMax(fma(-cb0._m14.y, 0.5, abs(_173)), 0.0));
    precise float _190 = sqrt(dp2_f32(_188, _188));
    precise float _195 = abs(dFdy(_190)) + abs(dFdx(_190));
    precise float _196 = -_195;
    precise float _199 = fma(_196, 0.5, cb0._m16.x);
    precise float _200 = _190 - _199;
    precise float _202 = fma(_195, 0.5, cb0._m16.x) - _199;
    precise float _203 = _200 / _202;
    precise float _204 = spvNClamp(_203, 0.0, 1.0);
    precise float _218 = cb0._m13.x - cb0._m12.x;
    precise float _219 = cb0._m13.y - cb0._m12.y;
    precise float _220 = cb0._m13.z - cb0._m12.z;
    precise float _221 = cb0._m13.w - cb0._m12.w;
    precise float _222 = fma(_204, _218, cb0._m12.x);
    precise float _223 = fma(_204, _219, cb0._m12.y);
    precise float _224 = fma(_204, _220, cb0._m12.z);
    precise float _225 = fma(_204, _221, cb0._m12.w);
    precise float _226 = cb0._m16.x + cb0._m16.x;
    precise float _227 = fma(_196, 0.5, _226);
    precise float _229 = _190 - _227;
    precise float _230 = fma(_195, 0.5, _226) - _227;
    precise float _231 = _229 / _230;
    precise float _232 = spvNClamp(_231, 0.0, 1.0);
    precise float _249 = TEXCOORD1.y * cb0._m6.x;
    precise float _250 = TEXCOORD1.y * cb0._m6.y;
    precise float _251 = TEXCOORD1.y * cb0._m6.z;
    precise float _273 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _249)) + cb0._m10.x;
    precise float _274 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _250)) + cb0._m10.y;
    precise float _275 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _251)) + cb0._m10.z;
    float _352;
    float _353;
    float _354;
    float _355;
    if (cb4._m0.x == 1.0)
    {
        bool _285 = cb4._m0.y == 1.0;
        precise float _291 = TEXCOORD1.y * cb4._m3.x;
        precise float _292 = TEXCOORD1.y * cb4._m3.y;
        precise float _293 = TEXCOORD1.y * cb4._m3.z;
        precise float _315 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _291)) + cb4._m7.x;
        precise float _316 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _292)) + cb4._m7.y;
        precise float _317 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _293)) + cb4._m7.z;
        precise float _326 = (_285 ? _315 : TEXCOORD1.x) - cb4._m11.x;
        precise float _327 = (_285 ? _316 : TEXCOORD1.y) - cb4._m11.y;
        precise float _328 = (_285 ? _317 : TEXCOORD1.z) - cb4._m11.z;
        precise float _334 = _326 * cb4._m9.x;
        precise float _335 = _327 * cb4._m9.y;
        precise float _336 = _328 * cb4._m9.z;
        vec4 _347 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_334, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _335, _336));
        _352 = _347.w;
        _353 = _347.z;
        _354 = _347.y;
        _355 = _347.x;
    }
    else
    {
        _352 = 1.0;
        _353 = 1.0;
        _354 = 1.0;
        _355 = 1.0;
    }
    vec3 _362 = vec3(_273, _274, _275);
    precise float _377 = texture(sampler2D(t0, s2), vec2(dp3_f32(_362, _362))).x * texture(samplerCube(t1, s1), _362).w;
    precise float _378 = spvNClamp(dp4_f32(vec4(_355, _354, _353, _352), cb2._m46), 0.0, 1.0) * _377;
    precise float _379 = fma(_232, -_222, _222) * _378;
    precise float _380 = fma(_232, -_223, _223) * _378;
    precise float _381 = fma(_232, -_224, _224) * _378;
    precise float _388 = _379 * cb0._m2.x;
    precise float _389 = _380 * cb0._m2.y;
    precise float _390 = _381 * cb0._m2.z;
    precise float _391 = fma(_232, -_225, _225) * cb0._m2.w;
    SV_Target.x = _388;
    SV_Target.y = _389;
    SV_Target.z = _390;
    SV_Target.w = _391;
}

