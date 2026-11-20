#version 450
#extension GL_EXT_buffer_reference2 : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
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
    vec4 _m17;
    vec4 _m18;
    vec4 _m19;
    vec4 _m20;
} cb1;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD5;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _44 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _44));
}

void main()
{
    precise float _66 = POSITION.y * cb0._m1.x;
    precise float _67 = POSITION.y * cb0._m1.y;
    precise float _68 = POSITION.y * cb0._m1.z;
    precise float _69 = POSITION.y * cb0._m1.w;
    precise float _78 = fma(cb0._m0.x, POSITION.x, _66);
    precise float _79 = fma(cb0._m0.y, POSITION.x, _67);
    precise float _80 = fma(cb0._m0.z, POSITION.x, _68);
    precise float _81 = fma(cb0._m0.w, POSITION.x, _69);
    precise float _90 = fma(cb0._m2.x, POSITION.z, _78);
    precise float _91 = fma(cb0._m2.y, POSITION.z, _79);
    precise float _92 = fma(cb0._m2.z, POSITION.z, _80);
    precise float _93 = fma(cb0._m2.w, POSITION.z, _81);
    precise float _100 = _90 + cb0._m3.x;
    precise float _101 = _91 + cb0._m3.y;
    precise float _102 = _92 + cb0._m3.z;
    precise float _103 = _93 + cb0._m3.w;
    TEXCOORD1.x = fma(cb0._m3.x, POSITION.w, _90);
    TEXCOORD1.y = fma(cb0._m3.y, POSITION.w, _91);
    TEXCOORD1.z = fma(cb0._m3.z, POSITION.w, _92);
    precise float _125 = _101 * cb1._m18.x;
    precise float _126 = _101 * cb1._m18.y;
    precise float _127 = _101 * cb1._m18.z;
    precise float _128 = _101 * cb1._m18.w;
    precise float _135 = fma(cb1._m17.x, _100, _125);
    precise float _136 = fma(cb1._m17.y, _100, _126);
    precise float _137 = fma(cb1._m17.z, _100, _127);
    precise float _138 = fma(cb1._m17.w, _100, _128);
    precise float _145 = fma(cb1._m19.x, _102, _135);
    precise float _146 = fma(cb1._m19.y, _102, _136);
    precise float _147 = fma(cb1._m19.z, _102, _137);
    precise float _148 = fma(cb1._m19.w, _102, _138);
    precise float _155 = fma(cb1._m20.x, _103, _145);
    precise float _156 = fma(cb1._m20.y, _103, _146);
    precise float _157 = fma(cb1._m20.z, _103, _147);
    precise float _158 = fma(cb1._m20.w, _103, _148);
    gl_Position.x = _155;
    gl_Position.y = _156;
    gl_Position.z = _157;
    gl_Position.w = _158;
    vec3 _169 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _173 = dp3_f32(_169, cb0._m4);
    float _176 = dp3_f32(_169, cb0._m6);
    float _179 = dp3_f32(_169, cb0._m8);
    vec3 _180 = vec3(_173, _176, _179);
    precise float _182 = inversesqrt(dp3_f32(_180, _180));
    precise float _183 = _182 * _173;
    precise float _184 = _182 * _176;
    precise float _185 = _182 * _179;
    TEXCOORD.x = _183;
    TEXCOORD.y = _184;
    TEXCOORD.z = _185;
    TEXCOORD2.x = 0.0;
    TEXCOORD2.y = 0.0;
    TEXCOORD2.z = 0.0;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

