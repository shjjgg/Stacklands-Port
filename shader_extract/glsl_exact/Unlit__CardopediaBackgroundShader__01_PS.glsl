#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    vec4 m;
} cb0;

layout(location = 2, component = 0) in vec4 TEXCOORD1;
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

void main()
{
    precise float _44 = TEXCOORD1.y / TEXCOORD1.w;
    precise float _45 = TEXCOORD1.x / TEXCOORD1.w;
    precise float _46 = _44 - 0.5;
    precise float _47 = _45 - 0.5;
    precise float _48 = abs(_47);
    precise float _50 = abs(_46);
    precise float _52 = 1.0 / spvNMax(_48, _50);
    precise float _54 = _52 * spvNMin(_48, _50);
    precise float _55 = _54 * _54;
    precise float _59 = fma(_55, fma(_55, fma(_55, fma(_55, 0.02083509974181652069091796875, -0.08513300120830535888671875), 0.1801410019397735595703125), -0.33029949665069580078125), 0.999866008758544921875);
    precise float _60 = _59 * _54;
    precise float _68 = ((_47 < 0.0) ? (-3.1415927410125732421875) : 0.0) + fma(_54, _59, (_48 < _50) ? fma(_60, -2.0, 1.57079637050628662109375) : 0.0);
    precise float _76 = (((spvNMax(_47, _46) >= 0.0) && (spvNMin(_47, _46) < 0.0)) ? (-_68) : _68) * 0.161812305450439453125;
    precise float _79 = fract(abs(_76));
    precise float _86 = cb0.m.y * 0.5;
    precise float _89 = sin(fma((_76 >= 0.0) ? _79 : (-_79), 74.15999603271484375, _86)) * 100.0;
    precise float _90 = spvNClamp(_89, 0.0, 1.0);
    precise float _92 = _90 * _90;
    precise float _93 = _92 * fma(_90, -2.0, 3.0);
    precise float _94 = fma(_93, 0.100000001490116119384765625, 0.0);
    SV_Target.x = _94;
    SV_Target.y = _94;
    SV_Target.z = _94;
    SV_Target.w = fma(_93, 0.0500000007450580596923828125, 0.5);
}

