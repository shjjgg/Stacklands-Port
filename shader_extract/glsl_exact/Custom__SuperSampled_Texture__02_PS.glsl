#version 450
#extension GL_EXT_buffer_reference2 : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    vec4 _m3;
} cb0;

layout(set = 0, binding = 1) uniform sampler s0;
layout(set = 0, binding = 2) uniform texture2D t0;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec4 COLOR;
layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    vec4 _46 = texture(sampler2D(t0, s0), vec2(TEXCOORD.x, TEXCOORD.y), cb0._m2.x);
    precise float _58 = _46.x * cb0._m3.x;
    precise float _59 = _46.y * cb0._m3.y;
    precise float _60 = _46.z * cb0._m3.z;
    precise float _61 = _46.w * cb0._m3.w;
    precise float _70 = _58 * COLOR.x;
    precise float _71 = _59 * COLOR.y;
    precise float _72 = _60 * COLOR.z;
    precise float _73 = _61 * COLOR.w;
    SV_Target.x = _70;
    SV_Target.y = _71;
    SV_Target.z = _72;
    SV_Target.w = _73;
}

