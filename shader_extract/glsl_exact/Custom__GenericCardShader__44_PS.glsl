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
    vec3 _m5;
    uint _m6;
    vec2 _m7;
    uvec2 _m8;
    vec4 _m9;
} cb0;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 0, component = 0) out vec4 SV_Target;
layout(location = 1, component = 0) out vec4 SV_Target1;
layout(location = 2, component = 0) out vec4 SV_Target2;
layout(location = 3, component = 0) out vec4 SV_Target3;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _50 = a.x * b.x;
    return fma(a.y, b.y, _50);
}

void main()
{
    precise float _61 = TEXCOORD.y - 0.5;
    precise float _62 = _61 * 0.3333333432674407958984375;
    precise float _63 = _61 * 150.0;
    precise float _66 = sin(roundEven(_63)) * 43758.546875;
    precise float _68 = fract(_66) - 0.5;
    precise float _71 = fma(_68, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _72 = _71 * 150.0;
    precise float _75 = sin(roundEven(_72)) * 43758.546875;
    precise float _77 = fract(_75) - 0.5;
    precise float _88 = cb0._m7.x - cb0._m9.x;
    precise float _89 = cb0._m7.y - cb0._m9.x;
    precise float _92 = abs(_71) - _88;
    precise float _93 = abs(fma(_77, 0.00166666670702397823333740234375, _62)) - _89;
    vec2 _96 = vec2(spvNMax(_92, 0.0), spvNMax(_93, 0.0));
    precise float _103 = abs(dFdy(_62)) + abs(dFdx(_62));
    precise float _104 = sqrt(dp2_f32(_96, _96)) / _103;
    precise float _105 = spvNMin(_104, 1.0);
    precise float _115 = fma(_105, -cb0._m5.x, cb0._m5.x);
    precise float _116 = fma(_105, -cb0._m5.y, cb0._m5.y);
    precise float _117 = fma(_105, -cb0._m5.z, cb0._m5.z);
    precise float _121 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _122 = _121 * _115;
    precise float _123 = _121 * _116;
    precise float _124 = _121 * _117;
    SV_Target.x = _122;
    SV_Target.y = _123;
    SV_Target.z = _124;
    precise float _129 = _115 - 0.039999999105930328369140625;
    precise float _130 = _116 - 0.039999999105930328369140625;
    precise float _131 = _117 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _129, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _130, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _131, 0.039999999105930328369140625);
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.x = 0.0;
    SV_Target3.y = 0.0;
    SV_Target3.z = 0.0;
    SV_Target3.w = 1.0;
}

