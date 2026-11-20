#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec2 _m4;
    uvec2 _m5;
    vec2 _m6;
    uvec2 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec2 _m10;
    uvec2 _m11;
    uvec4 _m12;
    uvec4 _m13;
    vec2 _m14;
    vec2 _m15;
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
layout(location = 1, component = 2) out vec2 TEXCOORD3;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _56 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _56));
}

void main()
{
    precise float _78 = POSITION.y * cb1._m1.x;
    precise float _79 = POSITION.y * cb1._m1.y;
    precise float _80 = POSITION.y * cb1._m1.z;
    precise float _81 = POSITION.y * cb1._m1.w;
    precise float _90 = fma(cb1._m0.x, POSITION.x, _78);
    precise float _91 = fma(cb1._m0.y, POSITION.x, _79);
    precise float _92 = fma(cb1._m0.z, POSITION.x, _80);
    precise float _93 = fma(cb1._m0.w, POSITION.x, _81);
    precise float _102 = fma(cb1._m2.x, POSITION.z, _90);
    precise float _103 = fma(cb1._m2.y, POSITION.z, _91);
    precise float _104 = fma(cb1._m2.z, POSITION.z, _92);
    precise float _105 = fma(cb1._m2.w, POSITION.z, _93);
    precise float _112 = _102 + cb1._m3.x;
    precise float _113 = _103 + cb1._m3.y;
    precise float _114 = _104 + cb1._m3.z;
    precise float _115 = _105 + cb1._m3.w;
    precise float _123 = _113 * cb2._m18.x;
    precise float _124 = _113 * cb2._m18.y;
    precise float _125 = _113 * cb2._m18.z;
    precise float _126 = _113 * cb2._m18.w;
    precise float _133 = fma(cb2._m17.x, _112, _123);
    precise float _134 = fma(cb2._m17.y, _112, _124);
    precise float _135 = fma(cb2._m17.z, _112, _125);
    precise float _136 = fma(cb2._m17.w, _112, _126);
    precise float _143 = fma(cb2._m19.x, _114, _133);
    precise float _144 = fma(cb2._m19.y, _114, _134);
    precise float _145 = fma(cb2._m19.z, _114, _135);
    precise float _146 = fma(cb2._m19.w, _114, _136);
    precise float _153 = fma(cb2._m20.x, _115, _143);
    precise float _154 = fma(cb2._m20.y, _115, _144);
    precise float _155 = fma(cb2._m20.z, _115, _145);
    precise float _156 = fma(cb2._m20.w, _115, _146);
    gl_Position.x = _153;
    gl_Position.y = _154;
    gl_Position.z = _155;
    gl_Position.w = _156;
    precise float _170 = fma(cb1._m3.x, POSITION.w, _102);
    precise float _171 = fma(cb1._m3.y, POSITION.w, _103);
    precise float _172 = fma(cb1._m3.z, POSITION.w, _104);
    precise float _173 = fma(cb1._m3.w, POSITION.w, _105);
    TEXCOORD2.x = fma(cb1._m3.x, POSITION.w, _102);
    TEXCOORD2.y = fma(cb1._m3.y, POSITION.w, _103);
    TEXCOORD2.z = fma(cb1._m3.z, POSITION.w, _104);
    precise float _191 = _171 * cb0._m6.x;
    precise float _192 = _171 * cb0._m6.y;
    TEXCOORD3.x = fma(cb0._m10.x, _173, fma(cb0._m8.x, _172, fma(cb0._m4.x, _170, _191)));
    TEXCOORD3.y = fma(cb0._m10.y, _173, fma(cb0._m8.y, _172, fma(cb0._m4.y, _170, _192)));
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m14.x, cb0._m15.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m14.y, cb0._m15.y);
    vec3 _235 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _239 = dp3_f32(_235, cb1._m4);
    float _242 = dp3_f32(_235, cb1._m6);
    float _245 = dp3_f32(_235, cb1._m8);
    vec3 _246 = vec3(_239, _242, _245);
    precise float _248 = inversesqrt(dp3_f32(_246, _246));
    precise float _249 = _248 * _239;
    precise float _250 = _248 * _242;
    precise float _251 = _248 * _245;
    TEXCOORD1.x = _249;
    TEXCOORD1.y = _250;
    TEXCOORD1.z = _251;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
}

