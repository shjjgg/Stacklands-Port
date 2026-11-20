#version 450
#extension GL_EXT_buffer_reference2 : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 m;
} cb1;

layout(set = 0, binding = 2) uniform sampler s0;
layout(set = 0, binding = 3) uniform texture2D t0;

layout(location = 0, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    precise float _49 = sin(fma(TEXCOORD.y, 20.0, cb1.m.z)) * cb0._m2.x;
    precise float _52 = fma(_49, 0.001000000047497451305389404296875, TEXCOORD.x);
    precise float _55 = cos(fma(_52, 15.0, cb1.m.z)) * cb0._m2.x;
    vec4 _62 = texture(sampler2D(t0, s0), vec2(_52, fma(_55, 0.001000000047497451305389404296875, TEXCOORD.y)));
    SV_Target.x = _62.x;
    SV_Target.y = _62.y;
    SV_Target.z = _62.z;
    SV_Target.w = _62.w;
}

