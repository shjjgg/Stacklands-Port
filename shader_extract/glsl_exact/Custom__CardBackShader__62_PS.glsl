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
} cb0;

layout(set = 0, binding = 1) uniform sampler s0;
layout(set = 0, binding = 2) uniform texture2D t0;

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

void main()
{
    precise float _55 = TEXCOORD.y + TEXCOORD.x;
    precise float _56 = _55 * 10.0;
    precise float _60 = roundEven(fract(_56)) + 0.800000011920928955078125;
    precise float _61 = spvNMin(_60, 1.0);
    vec4 _67 = texture(sampler2D(t0, s0), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _78 = _67.x * cb0._m5.x;
    precise float _79 = _67.y * cb0._m5.y;
    precise float _80 = _67.z * cb0._m5.z;
    precise float _81 = _61 * _78;
    precise float _82 = _61 * _79;
    precise float _83 = _61 * _80;
    bool _91 = (((TEXCOORD.x < 0.13677684962749481201171875) || (TEXCOORD.x > 0.863223135471343994140625)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _92 = _91 ? 0.0 : _81;
    float _93 = _91 ? 0.0 : _82;
    float _94 = _91 ? 0.0 : _83;
    precise float _99 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _100 = _99 * _92;
    precise float _101 = _99 * _93;
    precise float _102 = _99 * _94;
    SV_Target.x = _100;
    SV_Target.y = _101;
    SV_Target.z = _102;
    precise float _107 = _92 - 0.039999999105930328369140625;
    precise float _108 = _93 - 0.039999999105930328369140625;
    precise float _109 = _94 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _107, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _108, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _109, 0.039999999105930328369140625);
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.x = 1.0;
    SV_Target3.y = 1.0;
    SV_Target3.z = 1.0;
    SV_Target3.w = 1.0;
}

