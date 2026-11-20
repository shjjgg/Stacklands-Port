#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_ARB_shader_draw_parameters : require

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
    vec2 _m13;
    vec2 _m14;
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

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 m;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    vec4 m[4096];
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
{
    vec4 m[4096];
} cb4;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out vec3 TEXCOORD5;
layout(location = 6, component = 0) out uint SV_InstanceID;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _88 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _88));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _70 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _70)));
}

void main()
{
    uint _100 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _105 = _100 + cb2.m.x;
    uint _106 = _105 << 3u;
    uint _107 = _105 * 7u;
    uint _112 = _106 + 1u;
    precise float _120 = POSITION.y * cb3.m[_112].x;
    precise float _121 = POSITION.y * cb3.m[_112].y;
    precise float _122 = POSITION.y * cb3.m[_112].z;
    precise float _123 = POSITION.y * cb3.m[_112].w;
    precise float _132 = fma(cb3.m[_106].x, POSITION.x, _120);
    precise float _133 = fma(cb3.m[_106].y, POSITION.x, _121);
    precise float _134 = fma(cb3.m[_106].z, POSITION.x, _122);
    precise float _135 = fma(cb3.m[_106].w, POSITION.x, _123);
    uint _136 = _106 + 2u;
    precise float _145 = fma(cb3.m[_136].x, POSITION.z, _132);
    precise float _146 = fma(cb3.m[_136].y, POSITION.z, _133);
    precise float _147 = fma(cb3.m[_136].z, POSITION.z, _134);
    precise float _148 = fma(cb3.m[_136].w, POSITION.z, _135);
    uint _149 = _106 + 3u;
    precise float _156 = _145 + cb3.m[_149].x;
    precise float _157 = _146 + cb3.m[_149].y;
    precise float _158 = _147 + cb3.m[_149].z;
    precise float _159 = _148 + cb3.m[_149].w;
    TEXCOORD2.x = fma(cb3.m[_149].x, POSITION.w, _145);
    TEXCOORD2.y = fma(cb3.m[_149].y, POSITION.w, _146);
    TEXCOORD2.z = fma(cb3.m[_149].z, POSITION.w, _147);
    precise float _181 = _157 * cb1._m18.x;
    precise float _182 = _157 * cb1._m18.y;
    precise float _183 = _157 * cb1._m18.z;
    precise float _184 = _157 * cb1._m18.w;
    precise float _191 = fma(cb1._m17.x, _156, _181);
    precise float _192 = fma(cb1._m17.y, _156, _182);
    precise float _193 = fma(cb1._m17.z, _156, _183);
    precise float _194 = fma(cb1._m17.w, _156, _184);
    precise float _201 = fma(cb1._m19.x, _158, _191);
    precise float _202 = fma(cb1._m19.y, _158, _192);
    precise float _203 = fma(cb1._m19.z, _158, _193);
    precise float _204 = fma(cb1._m19.w, _158, _194);
    precise float _211 = fma(cb1._m20.x, _159, _201);
    precise float _212 = fma(cb1._m20.y, _159, _202);
    precise float _213 = fma(cb1._m20.z, _159, _203);
    precise float _214 = fma(cb1._m20.w, _159, _204);
    gl_Position.x = _211;
    gl_Position.y = _212;
    gl_Position.z = _213;
    gl_Position.w = _214;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    vec3 _243 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _251 = dp3_f32(_243, vec3(cb3.m[_106 + 4u].xyz));
    float _259 = dp3_f32(_243, vec3(cb3.m[_106 + 5u].xyz));
    float _267 = dp3_f32(_243, vec3(cb3.m[_106 + 6u].xyz));
    vec3 _268 = vec3(_251, _259, _267);
    precise float _270 = inversesqrt(dp3_f32(_268, _268));
    precise float _271 = _270 * _251;
    precise float _272 = _270 * _259;
    precise float _273 = _270 * _267;
    TEXCOORD1.x = _271;
    TEXCOORD1.y = _272;
    TEXCOORD1.z = _273;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
    precise float _281 = _272 * _272;
    precise float _283 = fma(_271, _271, -_281);
    precise float _284 = _272 * _271;
    precise float _285 = _273 * _272;
    precise float _286 = _273 * _273;
    precise float _287 = _271 * _273;
    vec4 _292 = vec4(_284, _285, _286, _287);
    uint _302 = _107 + 6u;
    TEXCOORD5.x = fma(cb4.m[_302].x, _283, dp4_f32(cb4.m[_107 + 3u], _292));
    TEXCOORD5.y = fma(cb4.m[_302].y, _283, dp4_f32(cb4.m[_107 + 4u], _292));
    TEXCOORD5.z = fma(cb4.m[_302].z, _283, dp4_f32(cb4.m[_107 + 5u], _292));
    SV_InstanceID = _100;
}

