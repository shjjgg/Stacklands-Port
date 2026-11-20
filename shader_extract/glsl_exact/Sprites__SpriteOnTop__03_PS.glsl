#version 450
#extension GL_EXT_buffer_reference2 : require

layout(set = 0, binding = 0) uniform sampler s0;
layout(set = 0, binding = 1) uniform texture2D t0;

layout(location = 1, component = 0) in vec4 COLOR;
layout(location = 2, component = 0) in vec2 TEXCOORD;
layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    vec4 _36 = texture(sampler2D(t0, s0), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _49 = _36.x * COLOR.x;
    precise float _50 = _36.y * COLOR.y;
    precise float _51 = _36.z * COLOR.z;
    precise float _52 = _36.w * COLOR.w;
    precise float _53 = _52 * _49;
    precise float _54 = _52 * _50;
    precise float _55 = _52 * _51;
    SV_Target.x = _53;
    SV_Target.y = _54;
    SV_Target.z = _55;
    SV_Target.w = _52;
}

