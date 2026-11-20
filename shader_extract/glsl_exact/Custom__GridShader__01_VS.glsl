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
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
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
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
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
} cb2;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD5;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _69 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _69));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _51 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _51)));
}

void main()
{
    precise float _90 = POSITION.y * cb1._m1.x;
    precise float _91 = POSITION.y * cb1._m1.y;
    precise float _92 = POSITION.y * cb1._m1.z;
    precise float _93 = POSITION.y * cb1._m1.w;
    precise float _102 = fma(cb1._m0.x, POSITION.x, _90);
    precise float _103 = fma(cb1._m0.y, POSITION.x, _91);
    precise float _104 = fma(cb1._m0.z, POSITION.x, _92);
    precise float _105 = fma(cb1._m0.w, POSITION.x, _93);
    precise float _114 = fma(cb1._m2.x, POSITION.z, _102);
    precise float _115 = fma(cb1._m2.y, POSITION.z, _103);
    precise float _116 = fma(cb1._m2.z, POSITION.z, _104);
    precise float _117 = fma(cb1._m2.w, POSITION.z, _105);
    precise float _124 = _114 + cb1._m3.x;
    precise float _125 = _115 + cb1._m3.y;
    precise float _126 = _116 + cb1._m3.z;
    precise float _127 = _117 + cb1._m3.w;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _114);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _115);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _116);
    precise float _149 = _125 * cb2._m18.x;
    precise float _150 = _125 * cb2._m18.y;
    precise float _151 = _125 * cb2._m18.z;
    precise float _152 = _125 * cb2._m18.w;
    precise float _159 = fma(cb2._m17.x, _124, _149);
    precise float _160 = fma(cb2._m17.y, _124, _150);
    precise float _161 = fma(cb2._m17.z, _124, _151);
    precise float _162 = fma(cb2._m17.w, _124, _152);
    precise float _169 = fma(cb2._m19.x, _126, _159);
    precise float _170 = fma(cb2._m19.y, _126, _160);
    precise float _171 = fma(cb2._m19.z, _126, _161);
    precise float _172 = fma(cb2._m19.w, _126, _162);
    precise float _179 = fma(cb2._m20.x, _127, _169);
    precise float _180 = fma(cb2._m20.y, _127, _170);
    precise float _181 = fma(cb2._m20.z, _127, _171);
    precise float _182 = fma(cb2._m20.w, _127, _172);
    gl_Position.x = _179;
    gl_Position.y = _180;
    gl_Position.z = _181;
    gl_Position.w = _182;
    vec3 _193 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _197 = dp3_f32(_193, cb1._m4);
    float _200 = dp3_f32(_193, cb1._m6);
    float _203 = dp3_f32(_193, cb1._m8);
    vec3 _204 = vec3(_197, _200, _203);
    precise float _206 = inversesqrt(dp3_f32(_204, _204));
    precise float _207 = _206 * _197;
    precise float _208 = _206 * _200;
    precise float _209 = _206 * _203;
    TEXCOORD.x = _207;
    TEXCOORD.y = _208;
    TEXCOORD.z = _209;
    precise float _213 = _208 * _208;
    precise float _215 = fma(_207, _207, -_213);
    precise float _216 = _208 * _207;
    precise float _217 = _209 * _208;
    precise float _218 = _209 * _209;
    precise float _219 = _207 * _209;
    vec4 _223 = vec4(_216, _217, _218, _219);
    TEXCOORD2.x = fma(cb0._m45.x, _215, dp4_f32(cb0._m42, _223));
    TEXCOORD2.y = fma(cb0._m45.y, _215, dp4_f32(cb0._m43, _223));
    TEXCOORD2.z = fma(cb0._m45.z, _215, dp4_f32(cb0._m44, _223));
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

