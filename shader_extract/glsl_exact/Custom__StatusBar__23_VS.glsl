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
    vec2 _m10;
    vec2 _m11;
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
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out vec3 TEXCOORD5;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _79 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _79));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _61 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _61)));
}

void main()
{
    precise float _100 = POSITION.y * cb2._m1.x;
    precise float _101 = POSITION.y * cb2._m1.y;
    precise float _102 = POSITION.y * cb2._m1.z;
    precise float _103 = POSITION.y * cb2._m1.w;
    precise float _112 = fma(cb2._m0.x, POSITION.x, _100);
    precise float _113 = fma(cb2._m0.y, POSITION.x, _101);
    precise float _114 = fma(cb2._m0.z, POSITION.x, _102);
    precise float _115 = fma(cb2._m0.w, POSITION.x, _103);
    precise float _124 = fma(cb2._m2.x, POSITION.z, _112);
    precise float _125 = fma(cb2._m2.y, POSITION.z, _113);
    precise float _126 = fma(cb2._m2.z, POSITION.z, _114);
    precise float _127 = fma(cb2._m2.w, POSITION.z, _115);
    precise float _134 = _124 + cb2._m3.x;
    precise float _135 = _125 + cb2._m3.y;
    precise float _136 = _126 + cb2._m3.z;
    precise float _137 = _127 + cb2._m3.w;
    TEXCOORD2.x = fma(cb2._m3.x, POSITION.w, _124);
    TEXCOORD2.y = fma(cb2._m3.y, POSITION.w, _125);
    TEXCOORD2.z = fma(cb2._m3.z, POSITION.w, _126);
    precise float _159 = _135 * cb3._m18.x;
    precise float _160 = _135 * cb3._m18.y;
    precise float _161 = _135 * cb3._m18.z;
    precise float _162 = _135 * cb3._m18.w;
    precise float _169 = fma(cb3._m17.x, _134, _159);
    precise float _170 = fma(cb3._m17.y, _134, _160);
    precise float _171 = fma(cb3._m17.z, _134, _161);
    precise float _172 = fma(cb3._m17.w, _134, _162);
    precise float _179 = fma(cb3._m19.x, _136, _169);
    precise float _180 = fma(cb3._m19.y, _136, _170);
    precise float _181 = fma(cb3._m19.z, _136, _171);
    precise float _182 = fma(cb3._m19.w, _136, _172);
    precise float _189 = fma(cb3._m20.x, _137, _179);
    precise float _190 = fma(cb3._m20.y, _137, _180);
    precise float _191 = fma(cb3._m20.z, _137, _181);
    precise float _192 = fma(cb3._m20.w, _137, _182);
    gl_Position.x = _189;
    gl_Position.y = _190;
    gl_Position.z = _191;
    gl_Position.w = _192;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m10.x, cb0._m11.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m10.y, cb0._m11.y);
    vec3 _221 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _225 = dp3_f32(_221, cb2._m4);
    float _228 = dp3_f32(_221, cb2._m6);
    float _231 = dp3_f32(_221, cb2._m8);
    vec3 _232 = vec3(_225, _228, _231);
    precise float _234 = inversesqrt(dp3_f32(_232, _232));
    precise float _235 = _234 * _225;
    precise float _236 = _234 * _228;
    precise float _237 = _234 * _231;
    TEXCOORD1.x = _235;
    TEXCOORD1.y = _236;
    TEXCOORD1.z = _237;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
    precise float _245 = _236 * _236;
    precise float _247 = fma(_235, _235, -_245);
    precise float _248 = _236 * _235;
    precise float _249 = _237 * _236;
    precise float _250 = _237 * _237;
    precise float _251 = _235 * _237;
    vec4 _255 = vec4(_248, _249, _250, _251);
    TEXCOORD5.x = fma(cb1._m45.x, _247, dp4_f32(cb1._m42, _255));
    TEXCOORD5.y = fma(cb1._m45.y, _247, dp4_f32(cb1._m43, _255));
    TEXCOORD5.z = fma(cb1._m45.z, _247, dp4_f32(cb1._m44, _255));
}

