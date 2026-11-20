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
    vec4 _m9;
    vec4 _m10;
    vec4 _m11;
    vec4 _m12;
    uvec4 _m13;
    uvec4 _m14;
    vec2 _m15;
    vec2 _m16;
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
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD3;
layout(location = 5, component = 0) out vec4 TEXCOORD4;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _58 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _58));
}

void main()
{
    precise float _80 = POSITION.y * cb1._m1.x;
    precise float _81 = POSITION.y * cb1._m1.y;
    precise float _82 = POSITION.y * cb1._m1.z;
    precise float _83 = POSITION.y * cb1._m1.w;
    precise float _92 = fma(cb1._m0.x, POSITION.x, _80);
    precise float _93 = fma(cb1._m0.y, POSITION.x, _81);
    precise float _94 = fma(cb1._m0.z, POSITION.x, _82);
    precise float _95 = fma(cb1._m0.w, POSITION.x, _83);
    precise float _104 = fma(cb1._m2.x, POSITION.z, _92);
    precise float _105 = fma(cb1._m2.y, POSITION.z, _93);
    precise float _106 = fma(cb1._m2.z, POSITION.z, _94);
    precise float _107 = fma(cb1._m2.w, POSITION.z, _95);
    precise float _114 = _104 + cb1._m3.x;
    precise float _115 = _105 + cb1._m3.y;
    precise float _116 = _106 + cb1._m3.z;
    precise float _117 = _107 + cb1._m3.w;
    precise float _125 = _115 * cb2._m18.x;
    precise float _126 = _115 * cb2._m18.y;
    precise float _127 = _115 * cb2._m18.z;
    precise float _128 = _115 * cb2._m18.w;
    precise float _135 = fma(cb2._m17.x, _114, _125);
    precise float _136 = fma(cb2._m17.y, _114, _126);
    precise float _137 = fma(cb2._m17.z, _114, _127);
    precise float _138 = fma(cb2._m17.w, _114, _128);
    precise float _145 = fma(cb2._m19.x, _116, _135);
    precise float _146 = fma(cb2._m19.y, _116, _136);
    precise float _147 = fma(cb2._m19.z, _116, _137);
    precise float _148 = fma(cb2._m19.w, _116, _138);
    precise float _155 = fma(cb2._m20.x, _117, _145);
    precise float _156 = fma(cb2._m20.y, _117, _146);
    precise float _157 = fma(cb2._m20.z, _117, _147);
    precise float _158 = fma(cb2._m20.w, _117, _148);
    gl_Position.x = _155;
    gl_Position.y = _156;
    gl_Position.z = _157;
    gl_Position.w = _158;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m15.x, cb0._m16.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m15.y, cb0._m16.y);
    vec3 _188 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _192 = dp3_f32(_188, cb1._m4);
    float _195 = dp3_f32(_188, cb1._m6);
    float _198 = dp3_f32(_188, cb1._m8);
    vec3 _199 = vec3(_192, _195, _198);
    precise float _201 = inversesqrt(dp3_f32(_199, _199));
    precise float _202 = _201 * _192;
    precise float _203 = _201 * _195;
    precise float _204 = _201 * _198;
    TEXCOORD1.x = _202;
    TEXCOORD1.y = _203;
    TEXCOORD1.z = _204;
    TEXCOORD2.x = fma(cb1._m3.x, POSITION.w, _104);
    TEXCOORD2.y = fma(cb1._m3.y, POSITION.w, _105);
    TEXCOORD2.z = fma(cb1._m3.z, POSITION.w, _106);
    precise float _227 = fma(cb1._m3.x, POSITION.w, _104);
    precise float _228 = fma(cb1._m3.y, POSITION.w, _105);
    precise float _229 = fma(cb1._m3.z, POSITION.w, _106);
    precise float _230 = fma(cb1._m3.w, POSITION.w, _107);
    precise float _237 = _228 * cb0._m10.x;
    precise float _238 = _228 * cb0._m10.y;
    precise float _239 = _228 * cb0._m10.z;
    precise float _240 = _228 * cb0._m10.w;
    TEXCOORD3.x = fma(cb0._m12.x, _230, fma(cb0._m11.x, _229, fma(cb0._m9.x, _227, _237)));
    TEXCOORD3.y = fma(cb0._m12.y, _230, fma(cb0._m11.y, _229, fma(cb0._m9.y, _227, _238)));
    TEXCOORD3.z = fma(cb0._m12.z, _230, fma(cb0._m11.z, _229, fma(cb0._m9.z, _227, _239)));
    TEXCOORD3.w = fma(cb0._m12.w, _230, fma(cb0._m11.w, _229, fma(cb0._m9.w, _227, _240)));
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
}

