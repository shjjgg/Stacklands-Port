#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    vec2 _m0;
    vec2 _m1;
    vec4 _m2;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    vec4 _m6;
} cb1;

layout(set = 0, binding = 2) uniform sampler s0;
layout(set = 0, binding = 3) uniform texture2D t0;

layout(location = 0, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _47 = a.x * b.x;
    return fma(a.y, b.y, _47);
}

void main()
{
    precise float _61 = cb1._m6.y / cb1._m6.x;
    precise float _62 = _61 * 0.5;
    precise float _74 = TEXCOORD.x + cb0._m1.x;
    precise float _75 = TEXCOORD.y + cb0._m1.y;
    precise float _76 = _61 * _75;
    precise float _77 = _74 - 0.5;
    precise float _78 = _76 - _62;
    vec4 _84 = texture(sampler2D(t0, s0), vec2(_74, _75));
    vec2 _89 = vec2(_77, _78);
    precise float _98 = _61 * cb0._m0.y;
    precise float _99 = 1.0 / _98;
    precise float _100 = _99 * fma(-cb0._m0.x, _61, sqrt(dp2_f32(_89, _89)));
    precise float _101 = spvNClamp(_100, 0.0, 1.0);
    precise float _103 = _101 * _101;
    precise float _105 = fma(-fma(_101, -2.0, 3.0), _103, 1.0);
    precise float _106 = _105 * _84.x;
    precise float _107 = _105 * _84.y;
    precise float _108 = _105 * _84.z;
    precise float _109 = _105 * _84.w;
    SV_Target.x = fma(cb0._m2.x, -_106, _106);
    SV_Target.y = fma(cb0._m2.x, -_107, _107);
    SV_Target.z = fma(cb0._m2.x, -_108, _108);
    SV_Target.w = fma(cb0._m2.x, -_109, _109);
}

