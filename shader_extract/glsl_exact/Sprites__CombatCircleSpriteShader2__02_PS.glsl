#version 450
#extension GL_EXT_buffer_reference2 : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec4 _m4;
} cb0;

layout(set = 0, binding = 1) uniform sampler s0;
layout(set = 0, binding = 2) uniform texture2D t0;

layout(location = 1, component = 0) in vec4 COLOR;
layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    vec4 _45 = texture(sampler2D(t0, s0), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _58 = _45.x * COLOR.x;
    precise float _59 = _45.y * COLOR.y;
    precise float _60 = _45.z * COLOR.z;
    precise float _61 = _45.w * COLOR.w;
    precise float _62 = _58 * 0.699999988079071044921875;
    precise float _63 = _59 * 0.699999988079071044921875;
    precise float _64 = _60 * 0.699999988079071044921875;
    precise float _69 = _62 * cb0._m4.x;
    precise float _70 = _63 * cb0._m4.x;
    precise float _71 = _64 * cb0._m4.x;
    precise float _76 = _61 * fma(_58, 0.300000011920928955078125, _69);
    precise float _77 = _61 * fma(_59, 0.300000011920928955078125, _70);
    precise float _78 = _61 * fma(_60, 0.300000011920928955078125, _71);
    SV_Target.x = _76;
    SV_Target.y = _77;
    SV_Target.z = _78;
    SV_Target.w = _61;
}

