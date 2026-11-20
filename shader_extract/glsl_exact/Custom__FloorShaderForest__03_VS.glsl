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
    vec4 _m5;
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
    vec4 _m39;
    vec4 _m40;
    vec4 _m41;
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
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out vec4 TEXCOORD5;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _81 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _81));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _63 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _63)));
}

void main()
{
    precise float _102 = POSITION.y * cb2._m1.x;
    precise float _103 = POSITION.y * cb2._m1.y;
    precise float _104 = POSITION.y * cb2._m1.z;
    precise float _105 = POSITION.y * cb2._m1.w;
    precise float _114 = fma(cb2._m0.x, POSITION.x, _102);
    precise float _115 = fma(cb2._m0.y, POSITION.x, _103);
    precise float _116 = fma(cb2._m0.z, POSITION.x, _104);
    precise float _117 = fma(cb2._m0.w, POSITION.x, _105);
    precise float _126 = fma(cb2._m2.x, POSITION.z, _114);
    precise float _127 = fma(cb2._m2.y, POSITION.z, _115);
    precise float _128 = fma(cb2._m2.z, POSITION.z, _116);
    precise float _129 = fma(cb2._m2.w, POSITION.z, _117);
    precise float _136 = _126 + cb2._m3.x;
    precise float _137 = _127 + cb2._m3.y;
    precise float _138 = _128 + cb2._m3.z;
    precise float _139 = _129 + cb2._m3.w;
    TEXCOORD1.x = fma(cb2._m3.x, POSITION.w, _126);
    TEXCOORD1.y = fma(cb2._m3.y, POSITION.w, _127);
    TEXCOORD1.z = fma(cb2._m3.z, POSITION.w, _128);
    precise float _161 = _137 * cb3._m18.x;
    precise float _162 = _137 * cb3._m18.y;
    precise float _163 = _137 * cb3._m18.z;
    precise float _164 = _137 * cb3._m18.w;
    precise float _171 = fma(cb3._m17.x, _136, _161);
    precise float _172 = fma(cb3._m17.y, _136, _162);
    precise float _173 = fma(cb3._m17.z, _136, _163);
    precise float _174 = fma(cb3._m17.w, _136, _164);
    precise float _181 = fma(cb3._m19.x, _138, _171);
    precise float _182 = fma(cb3._m19.y, _138, _172);
    precise float _183 = fma(cb3._m19.z, _138, _173);
    precise float _184 = fma(cb3._m19.w, _138, _174);
    precise float _191 = fma(cb3._m20.x, _139, _181);
    precise float _192 = fma(cb3._m20.y, _139, _182);
    precise float _193 = fma(cb3._m20.z, _139, _183);
    precise float _194 = fma(cb3._m20.w, _139, _184);
    gl_Position.x = _191;
    gl_Position.y = _192;
    gl_Position.z = _193;
    gl_Position.w = _194;
    vec3 _205 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _209 = dp3_f32(_205, cb2._m4);
    float _212 = dp3_f32(_205, cb2._m6);
    float _215 = dp3_f32(_205, cb2._m8);
    vec3 _216 = vec3(_209, _212, _215);
    precise float _218 = inversesqrt(dp3_f32(_216, _216));
    precise float _219 = _218 * _209;
    precise float _220 = _218 * _212;
    precise float _221 = _218 * _215;
    TEXCOORD.x = _219;
    TEXCOORD.y = _220;
    TEXCOORD.z = _221;
    precise float _225 = _220 * _220;
    precise float _227 = fma(_219, _219, -_225);
    precise float _228 = _220 * _219;
    precise float _229 = _221 * _220;
    precise float _230 = _221 * _221;
    precise float _231 = _219 * _221;
    vec4 _235 = vec4(_228, _229, _230, _231);
    vec4 _253 = vec4(_219, _220, _221, 1.0);
    precise float _261 = fma(cb1._m45.x, _227, dp4_f32(cb1._m42, _235)) + dp4_f32(cb1._m39, _253);
    precise float _262 = fma(cb1._m45.y, _227, dp4_f32(cb1._m43, _235)) + dp4_f32(cb1._m40, _253);
    precise float _263 = fma(cb1._m45.z, _227, dp4_f32(cb1._m44, _235)) + dp4_f32(cb1._m41, _253);
    TEXCOORD2.x = _261;
    TEXCOORD2.y = _262;
    TEXCOORD2.z = _263;
    precise float _271 = _192 * cb0._m5.x;
    precise float _272 = _191 * 0.5;
    precise float _273 = _194 * 0.5;
    precise float _274 = _271 * 0.5;
    TEXCOORD4.z = _193;
    TEXCOORD4.w = _194;
    precise float _277 = _273 + _272;
    precise float _278 = _273 + _274;
    TEXCOORD4.x = _277;
    TEXCOORD4.y = _278;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

