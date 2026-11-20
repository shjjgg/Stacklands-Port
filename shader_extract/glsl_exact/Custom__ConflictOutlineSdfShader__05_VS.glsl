#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _46 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _46));
}

void main()
{
    precise float _68 = POSITION.y * cb1._m1.x;
    precise float _69 = POSITION.y * cb1._m1.y;
    precise float _70 = POSITION.y * cb1._m1.z;
    precise float _71 = POSITION.y * cb1._m1.w;
    precise float _80 = fma(cb1._m0.x, POSITION.x, _68);
    precise float _81 = fma(cb1._m0.y, POSITION.x, _69);
    precise float _82 = fma(cb1._m0.z, POSITION.x, _70);
    precise float _83 = fma(cb1._m0.w, POSITION.x, _71);
    precise float _92 = fma(cb1._m2.x, POSITION.z, _80);
    precise float _93 = fma(cb1._m2.y, POSITION.z, _81);
    precise float _94 = fma(cb1._m2.z, POSITION.z, _82);
    precise float _95 = fma(cb1._m2.w, POSITION.z, _83);
    precise float _102 = _92 + cb1._m3.x;
    precise float _103 = _93 + cb1._m3.y;
    precise float _104 = _94 + cb1._m3.z;
    precise float _105 = _95 + cb1._m3.w;
    precise float _113 = _103 * cb2._m18.x;
    precise float _114 = _103 * cb2._m18.y;
    precise float _115 = _103 * cb2._m18.z;
    precise float _116 = _103 * cb2._m18.w;
    precise float _123 = fma(cb2._m17.x, _102, _113);
    precise float _124 = fma(cb2._m17.y, _102, _114);
    precise float _125 = fma(cb2._m17.z, _102, _115);
    precise float _126 = fma(cb2._m17.w, _102, _116);
    precise float _133 = fma(cb2._m19.x, _104, _123);
    precise float _134 = fma(cb2._m19.y, _104, _124);
    precise float _135 = fma(cb2._m19.z, _104, _125);
    precise float _136 = fma(cb2._m19.w, _104, _126);
    precise float _143 = fma(cb2._m20.x, _105, _133);
    precise float _144 = fma(cb2._m20.y, _105, _134);
    precise float _145 = fma(cb2._m20.z, _105, _135);
    precise float _146 = fma(cb2._m20.w, _105, _136);
    gl_Position.x = _143;
    gl_Position.y = _144;
    gl_Position.z = _145;
    gl_Position.w = _146;
    vec3 _158 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _162 = dp3_f32(_158, cb1._m4);
    float _165 = dp3_f32(_158, cb1._m6);
    float _168 = dp3_f32(_158, cb1._m8);
    vec3 _169 = vec3(_162, _165, _168);
    precise float _171 = inversesqrt(dp3_f32(_169, _169));
    precise float _172 = _171 * _162;
    precise float _173 = _171 * _165;
    precise float _174 = _171 * _168;
    TEXCOORD.x = _172;
    TEXCOORD.y = _173;
    TEXCOORD.z = _174;
    TEXCOORD1.x = fma(cb1._m3.x, POSITION.w, _92);
    TEXCOORD1.y = fma(cb1._m3.y, POSITION.w, _93);
    TEXCOORD1.z = fma(cb1._m3.z, POSITION.w, _94);
    precise float _197 = fma(cb1._m3.x, POSITION.w, _92);
    precise float _198 = fma(cb1._m3.y, POSITION.w, _93);
    precise float _199 = fma(cb1._m3.z, POSITION.w, _94);
    precise float _200 = fma(cb1._m3.w, POSITION.w, _95);
    precise float _207 = _198 * cb0._m6.x;
    precise float _208 = _198 * cb0._m6.y;
    precise float _209 = _198 * cb0._m6.z;
    TEXCOORD2.x = fma(cb0._m10.x, _200, fma(cb0._m8.x, _199, fma(cb0._m4.x, _197, _207)));
    TEXCOORD2.y = fma(cb0._m10.y, _200, fma(cb0._m8.y, _199, fma(cb0._m4.y, _197, _208)));
    TEXCOORD2.z = fma(cb0._m10.z, _200, fma(cb0._m8.z, _199, fma(cb0._m4.z, _197, _209)));
}

