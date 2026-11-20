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

layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _37 = a.x * b.x;
    return fma(a.y, b.y, _37);
}

void main()
{
    precise float _50 = TEXCOORD.y - TEXCOORD.x;
    precise float _51 = _50 * 30.0;
    precise float _53 = fract(_51) - 0.5;
    vec2 _54 = vec2(_53);
    precise float _61 = 0.920000016689300537109375 - cb0._m4.x;
    precise float _62 = sqrt(dp2_f32(_54, _54)) - _61;
    precise float _63 = _62 * 12.5;
    precise float _64 = spvNClamp(_63, 0.0, 1.0);
    precise float _66 = _64 * _64;
    precise float _67 = _66 * fma(_64, -2.0, 3.0);
    SV_Target.w = _67;
    SV_Target.x = 0.0;
    SV_Target.y = 0.0;
    SV_Target.z = 0.0;
}

