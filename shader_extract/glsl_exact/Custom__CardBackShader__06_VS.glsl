#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    vec2 _m6;
    vec2 _m7;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    vec4 _m5;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
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
    uvec4 _m10;
    uvec4 _m11;
    uvec4 _m12;
    uvec4 _m13;
    uvec4 _m14;
    uvec4 _m15;
    uvec4 _m16;
    vec4 _m17;
    vec4 _m18;
    vec4 _m19;
    vec4 _m20;
} cb3;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD5;
layout(location = 5, component = 0) out vec4 TEXCOORD6;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _60 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _60));
}

void main()
{
    precise float _82 = POSITION.y * cb2._m1.x;
    precise float _83 = POSITION.y * cb2._m1.y;
    precise float _84 = POSITION.y * cb2._m1.z;
    precise float _85 = POSITION.y * cb2._m1.w;
    precise float _94 = fma(cb2._m0.x, POSITION.x, _82);
    precise float _95 = fma(cb2._m0.y, POSITION.x, _83);
    precise float _96 = fma(cb2._m0.z, POSITION.x, _84);
    precise float _97 = fma(cb2._m0.w, POSITION.x, _85);
    precise float _106 = fma(cb2._m2.x, POSITION.z, _94);
    precise float _107 = fma(cb2._m2.y, POSITION.z, _95);
    precise float _108 = fma(cb2._m2.z, POSITION.z, _96);
    precise float _109 = fma(cb2._m2.w, POSITION.z, _97);
    precise float _116 = _106 + cb2._m3.x;
    precise float _117 = _107 + cb2._m3.y;
    precise float _118 = _108 + cb2._m3.z;
    precise float _119 = _109 + cb2._m3.w;
    TEXCOORD2.x = fma(cb2._m3.x, POSITION.w, _106);
    TEXCOORD2.y = fma(cb2._m3.y, POSITION.w, _107);
    TEXCOORD2.z = fma(cb2._m3.z, POSITION.w, _108);
    precise float _141 = _117 * cb3._m18.x;
    precise float _142 = _117 * cb3._m18.y;
    precise float _143 = _117 * cb3._m18.z;
    precise float _144 = _117 * cb3._m18.w;
    precise float _151 = fma(cb3._m17.x, _116, _141);
    precise float _152 = fma(cb3._m17.y, _116, _142);
    precise float _153 = fma(cb3._m17.z, _116, _143);
    precise float _154 = fma(cb3._m17.w, _116, _144);
    precise float _161 = fma(cb3._m19.x, _118, _151);
    precise float _162 = fma(cb3._m19.y, _118, _152);
    precise float _163 = fma(cb3._m19.z, _118, _153);
    precise float _164 = fma(cb3._m19.w, _118, _154);
    precise float _171 = fma(cb3._m20.x, _119, _161);
    precise float _172 = fma(cb3._m20.y, _119, _162);
    precise float _173 = fma(cb3._m20.z, _119, _163);
    precise float _174 = fma(cb3._m20.w, _119, _164);
    gl_Position.x = _171;
    gl_Position.y = _172;
    gl_Position.z = _173;
    gl_Position.w = _174;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _203 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _207 = dp3_f32(_203, cb2._m4);
    float _210 = dp3_f32(_203, cb2._m6);
    float _213 = dp3_f32(_203, cb2._m8);
    vec3 _214 = vec3(_207, _210, _213);
    precise float _216 = inversesqrt(dp3_f32(_214, _214));
    precise float _217 = _216 * _207;
    precise float _218 = _216 * _210;
    precise float _219 = _216 * _213;
    TEXCOORD1.x = _217;
    TEXCOORD1.y = _218;
    TEXCOORD1.z = _219;
    precise float _227 = _172 * cb1._m5.x;
    precise float _228 = _171 * 0.5;
    precise float _229 = _174 * 0.5;
    precise float _230 = _227 * 0.5;
    TEXCOORD5.z = _173;
    TEXCOORD5.w = _174;
    precise float _233 = _229 + _228;
    precise float _234 = _229 + _230;
    TEXCOORD5.x = _233;
    TEXCOORD5.y = _234;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
}

