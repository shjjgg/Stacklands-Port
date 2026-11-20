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
    uvec4 _m6;
    uvec4 _m7;
    uvec4 _m8;
    uvec4 _m9;
    uvec4 _m10;
    vec2 _m11;
    vec2 _m12;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
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
    uvec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    uvec4 _m20;
    uvec4 _m21;
    uvec4 _m22;
    uvec4 _m23;
    uvec4 _m24;
    uvec4 _m25;
    uvec4 _m26;
    uvec4 _m27;
    uvec4 _m28;
    uvec4 _m29;
    uvec4 _m30;
    uvec4 _m31;
    uvec4 _m32;
    uvec4 _m33;
    uvec4 _m34;
    uvec4 _m35;
    uvec4 _m36;
    uvec4 _m37;
    uvec4 _m38;
    uvec4 _m39;
    uvec4 _m40;
    uvec4 _m41;
    vec4 _m42;
    vec4 _m43;
    vec4 _m44;
    vec3 _m45;
    uint _m46;
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
layout(location = 4, component = 0) out vec3 TEXCOORD3;
layout(location = 5, component = 0) out vec4 TEXCOORD5;
layout(location = 6, component = 0) out vec4 TEXCOORD6;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _80 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _80));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _62 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _62)));
}

void main()
{
    precise float _101 = POSITION.y * cb2._m1.x;
    precise float _102 = POSITION.y * cb2._m1.y;
    precise float _103 = POSITION.y * cb2._m1.z;
    precise float _104 = POSITION.y * cb2._m1.w;
    precise float _113 = fma(cb2._m0.x, POSITION.x, _101);
    precise float _114 = fma(cb2._m0.y, POSITION.x, _102);
    precise float _115 = fma(cb2._m0.z, POSITION.x, _103);
    precise float _116 = fma(cb2._m0.w, POSITION.x, _104);
    precise float _125 = fma(cb2._m2.x, POSITION.z, _113);
    precise float _126 = fma(cb2._m2.y, POSITION.z, _114);
    precise float _127 = fma(cb2._m2.z, POSITION.z, _115);
    precise float _128 = fma(cb2._m2.w, POSITION.z, _116);
    precise float _135 = _125 + cb2._m3.x;
    precise float _136 = _126 + cb2._m3.y;
    precise float _137 = _127 + cb2._m3.z;
    precise float _138 = _128 + cb2._m3.w;
    TEXCOORD2.x = fma(cb2._m3.x, POSITION.w, _125);
    TEXCOORD2.y = fma(cb2._m3.y, POSITION.w, _126);
    TEXCOORD2.z = fma(cb2._m3.z, POSITION.w, _127);
    precise float _160 = _136 * cb3._m18.x;
    precise float _161 = _136 * cb3._m18.y;
    precise float _162 = _136 * cb3._m18.z;
    precise float _163 = _136 * cb3._m18.w;
    precise float _170 = fma(cb3._m17.x, _135, _160);
    precise float _171 = fma(cb3._m17.y, _135, _161);
    precise float _172 = fma(cb3._m17.z, _135, _162);
    precise float _173 = fma(cb3._m17.w, _135, _163);
    precise float _180 = fma(cb3._m19.x, _137, _170);
    precise float _181 = fma(cb3._m19.y, _137, _171);
    precise float _182 = fma(cb3._m19.z, _137, _172);
    precise float _183 = fma(cb3._m19.w, _137, _173);
    precise float _190 = fma(cb3._m20.x, _138, _180);
    precise float _191 = fma(cb3._m20.y, _138, _181);
    precise float _192 = fma(cb3._m20.z, _138, _182);
    precise float _193 = fma(cb3._m20.w, _138, _183);
    gl_Position.x = _190;
    gl_Position.y = _191;
    gl_Position.z = _192;
    gl_Position.w = _193;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m11.x, cb0._m12.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m11.y, cb0._m12.y);
    vec3 _222 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _226 = dp3_f32(_222, cb2._m4);
    float _229 = dp3_f32(_222, cb2._m6);
    float _232 = dp3_f32(_222, cb2._m8);
    vec3 _233 = vec3(_226, _229, _232);
    precise float _235 = inversesqrt(dp3_f32(_233, _233));
    precise float _236 = _235 * _226;
    precise float _237 = _235 * _229;
    precise float _238 = _235 * _232;
    TEXCOORD1.x = _236;
    TEXCOORD1.y = _237;
    TEXCOORD1.z = _238;
    precise float _242 = _237 * _237;
    precise float _244 = fma(_236, _236, -_242);
    precise float _245 = _237 * _236;
    precise float _246 = _238 * _237;
    precise float _247 = _238 * _238;
    precise float _248 = _236 * _238;
    vec4 _252 = vec4(_245, _246, _247, _248);
    TEXCOORD3.x = fma(cb1._m45.x, _244, dp4_f32(cb1._m42, _252));
    TEXCOORD3.y = fma(cb1._m45.y, _244, dp4_f32(cb1._m43, _252));
    TEXCOORD3.z = fma(cb1._m45.z, _244, dp4_f32(cb1._m44, _252));
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
}

