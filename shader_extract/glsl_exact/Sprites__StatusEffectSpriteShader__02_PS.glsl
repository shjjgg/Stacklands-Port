#version 450
#extension GL_EXT_buffer_reference2 : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
    vec4 _m4;
    vec4 _m5;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 m;
} cb1;

layout(set = 0, binding = 2) uniform sampler s0;
layout(set = 0, binding = 3) uniform texture2D t0;

layout(location = 1, component = 0) in vec4 COLOR;
layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    float _60 = (cb0._m5.x >= fma(sin(fma(TEXCOORD.x, 10.0, cb1.m.z)), 0.0199999995529651641845703125, TEXCOORD.y)) ? 0.0 : 1.0;
    precise float _68 = 1.0 - texture(sampler2D(t0, s0), vec2(TEXCOORD.x, TEXCOORD.y)).x;
    precise float _82 = cb0._m4.x - cb0._m3.x;
    precise float _83 = cb0._m4.y - cb0._m3.y;
    precise float _84 = cb0._m4.z - cb0._m3.z;
    precise float _85 = cb0._m4.w - cb0._m3.w;
    precise float _98 = fma(_68, _82, cb0._m3.x) * COLOR.x;
    precise float _99 = fma(_68, _83, cb0._m3.y) * COLOR.y;
    precise float _100 = fma(_68, _84, cb0._m3.z) * COLOR.z;
    precise float _101 = fma(_68, _85, cb0._m3.w) * COLOR.w;
    precise float _102 = _98 * (-0.699999988079071044921875);
    precise float _103 = _99 * (-0.699999988079071044921875);
    precise float _104 = _100 * (-0.699999988079071044921875);
    precise float _108 = _101 * fma(_60, _102, _98);
    precise float _109 = _101 * fma(_60, _103, _99);
    precise float _110 = _101 * fma(_60, _104, _100);
    SV_Target.x = _108;
    SV_Target.y = _109;
    SV_Target.z = _110;
    SV_Target.w = _101;
}

