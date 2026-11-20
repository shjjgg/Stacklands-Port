#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec4 _m4;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    vec4 _m6;
} cb1;

layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _46 = a.x * b.x;
    return fma(a.y, b.y, _46);
}

void main()
{
    precise float _60 = cb1._m6.x / cb1._m6.y;
    precise float _64 = TEXCOORD.y - 0.5;
    precise float _65 = _64 / _60;
    precise float _66 = _65 + 0.5;
    precise float _69 = cb1._m0.z + cb1._m0.z;
    precise float _74 = fma(sin(fma(_66, 40.0, _69)), 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _78 = _74 - 0.5;
    precise float _79 = fma(sin(fma(_74, 60.0, _69)), 0.00999999977648258209228515625, _66) - 0.5;
    vec2 _80 = vec2(_78, _79);
    precise float _86 = 0.99800002574920654296875 - cb0._m4.x;
    precise float _87 = sqrt(dp2_f32(_80, _80)) - _86;
    precise float _88 = _87 * 499.999969482421875;
    precise float _89 = spvNClamp(_88, 0.0, 1.0);
    precise float _91 = _89 * _89;
    precise float _92 = _91 * fma(_89, -2.0, 3.0);
    SV_Target.w = _92;
    SV_Target.x = 0.0;
    SV_Target.y = 0.0;
    SV_Target.z = 0.0;
}

