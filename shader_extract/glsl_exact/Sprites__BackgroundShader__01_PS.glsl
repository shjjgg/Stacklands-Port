#version 450
#extension GL_EXT_buffer_reference2 : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    vec4 m;
} cb0;

layout(set = 0, binding = 1) uniform sampler s0;
layout(set = 0, binding = 2) uniform texture2D t0;

layout(location = 1, component = 0) in vec4 COLOR;
layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    precise float _37 = cb0.m.z * 0.300000011920928955078125;
    precise float _45 = log2(TEXCOORD.y) * 1.39999997615814208984375;
    precise float _47 = exp2(_45) * sin(fma(TEXCOORD.y, 0.318319261074066162109375, _37));
    vec4 _56 = texture(sampler2D(t0, s0), vec2(fma(_47, 0.0199999995529651641845703125, TEXCOORD.x), TEXCOORD.y));
    precise float _69 = _56.x * COLOR.x;
    precise float _70 = _56.y * COLOR.y;
    precise float _71 = _56.z * COLOR.z;
    precise float _72 = _56.w * COLOR.w;
    precise float _73 = _72 * _69;
    precise float _74 = _72 * _70;
    precise float _75 = _72 * _71;
    SV_Target.x = _73;
    SV_Target.y = _74;
    SV_Target.z = _75;
    SV_Target.w = _72;
}

