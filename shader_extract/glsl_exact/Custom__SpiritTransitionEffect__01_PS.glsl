#version 450
#extension GL_EXT_buffer_reference2 : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
} cb0;

layout(set = 0, binding = 1) uniform sampler s0;
layout(set = 0, binding = 2) uniform texture2D t0;

layout(location = 0, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    SV_Target.z = texture(sampler2D(t0, s0), vec2(fma(cb0._m2.x, 0.0023847599513828754425048828125, TEXCOORD.x), fma(cb0._m2.x, 0.00971148349344730377197265625, TEXCOORD.y))).z;
    SV_Target.w = texture(sampler2D(t0, s0), vec2(TEXCOORD.x, TEXCOORD.y)).w;
    SV_Target.y = texture(sampler2D(t0, s0), vec2(fma(cb0._m2.x, 0.007899922318756580352783203125, TEXCOORD.x), fma(cb0._m2.x, 0.0061311684548854827880859375, TEXCOORD.y))).y;
    SV_Target.x = texture(sampler2D(t0, s0), vec2(fma(cb0._m2.x, 0.00999999977648258209228515625, TEXCOORD.x), fma(cb0._m2.x, 0.0, TEXCOORD.y))).x;
}

