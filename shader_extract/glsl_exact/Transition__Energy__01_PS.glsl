#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
    vec4 _m6;
} cb0;

layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _40 = a.x * b.x;
    return fma(a.y, b.y, _40);
}

void main()
{
    precise float _53 = TEXCOORD.y - TEXCOORD.x;
    precise float _54 = _53 * 30.0;
    precise float _56 = fract(_54) - 0.5;
    vec2 _57 = vec2(_56);
    precise float _64 = 0.920000016689300537109375 - cb0._m6.x;
    precise float _65 = sqrt(dp2_f32(_57, _57)) - _64;
    precise float _66 = _65 * 12.5;
    precise float _67 = spvNClamp(_66, 0.0, 1.0);
    precise float _69 = _67 * _67;
    precise float _70 = _69 * fma(_67, -2.0, 3.0);
    SV_Target.w = spvNMin(_70, 0.89999997615814208984375);
    SV_Target.x = cb0._m4.x;
    SV_Target.y = cb0._m4.y;
    SV_Target.z = cb0._m4.z;
}

