#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_demote_to_helper_invocation : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
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
    vec4 _m10;
} cb0;

layout(location = 1, component = 0) in vec2 TEXCOORD1;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

void main()
{
    precise float _43 = TEXCOORD1.y * 150.0;
    precise float _47 = sin(roundEven(_43)) * 43758.546875;
    precise float _51 = fma(fract(_47), 0.004999999888241291046142578125, TEXCOORD1.x);
    precise float _52 = _51 * 150.0;
    precise float _53 = _51 * 10.0;
    precise float _56 = sin(roundEven(_52)) * 43758.546875;
    precise float _58 = fma(fract(_56), 0.004999999888241291046142578125, TEXCOORD1.y);
    precise float _59 = _58 * 10.0;
    precise float _64 = abs(fma(fract(_59), 2.0, -1.0)) - 0.5;
    precise float _65 = sin(_59) * _64;
    precise float _66 = fma(_65, 0.0199999995529651641845703125, _51);
    precise float _67 = _66 - 0.089776851236820220947265625;
    precise float _68 = 0.91022312641143798828125 - _66;
    precise float _77 = abs(dFdx(_51)) + abs(dFdy(_51));
    precise float _78 = abs(dFdx(_58)) + abs(dFdy(_58));
    precise float _79 = _67 / _77;
    precise float _81 = _68 / _77;
    precise float _83 = spvNClamp(_81, 0.0, 1.0) * spvNClamp(_79, 0.0, 1.0);
    precise float _88 = abs(fma(fract(_53), 2.0, -1.0)) - 0.5;
    precise float _89 = sin(_53) * _88;
    precise float _90 = fma(_89, 0.0199999995529651641845703125, _58);
    precise float _91 = _90 - 0.0030000000260770320892333984375;
    precise float _92 = 0.9969999790191650390625 - _90;
    precise float _93 = _92 / _78;
    precise float _94 = _91 / _78;
    precise float _97 = spvNClamp(_94, 0.0, 1.0) * _83;
    if ((fma(_97, spvNClamp(_93, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && (cb0._m10.y > 0.5))
    {
        demote;
    }
    SV_Target.x = 0.0;
    SV_Target.y = 0.0;
    SV_Target.z = 0.0;
    SV_Target.w = 0.0;
}

