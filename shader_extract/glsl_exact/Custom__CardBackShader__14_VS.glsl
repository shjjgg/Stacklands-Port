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

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    uvec4 m;
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
layout(location = 4, component = 0) out vec4 TEXCOORD5;
layout(location = 5, component = 0) out vec4 TEXCOORD6;
layout(location = 6, component = 0) out uint SV_InstanceID;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _70 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _70));
}

void main()
{
    uint _83 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _88 = _83 + cb3.m.x;
    uint _89 = _88 << 3u;
    uint _94 = _89 + 1u;
    precise float _102 = POSITION.y * cb4.m[_94].x;
    precise float _103 = POSITION.y * cb4.m[_94].y;
    precise float _104 = POSITION.y * cb4.m[_94].z;
    precise float _105 = POSITION.y * cb4.m[_94].w;
    precise float _114 = fma(cb4.m[_89].x, POSITION.x, _102);
    precise float _115 = fma(cb4.m[_89].y, POSITION.x, _103);
    precise float _116 = fma(cb4.m[_89].z, POSITION.x, _104);
    precise float _117 = fma(cb4.m[_89].w, POSITION.x, _105);
    uint _118 = _89 + 2u;
    precise float _127 = fma(cb4.m[_118].x, POSITION.z, _114);
    precise float _128 = fma(cb4.m[_118].y, POSITION.z, _115);
    precise float _129 = fma(cb4.m[_118].z, POSITION.z, _116);
    precise float _130 = fma(cb4.m[_118].w, POSITION.z, _117);
    uint _131 = _89 + 3u;
    precise float _138 = _127 + cb4.m[_131].x;
    precise float _139 = _128 + cb4.m[_131].y;
    precise float _140 = _129 + cb4.m[_131].z;
    precise float _141 = _130 + cb4.m[_131].w;
    TEXCOORD2.x = fma(cb4.m[_131].x, POSITION.w, _127);
    TEXCOORD2.y = fma(cb4.m[_131].y, POSITION.w, _128);
    TEXCOORD2.z = fma(cb4.m[_131].z, POSITION.w, _129);
    precise float _163 = _139 * cb2._m18.x;
    precise float _164 = _139 * cb2._m18.y;
    precise float _165 = _139 * cb2._m18.z;
    precise float _166 = _139 * cb2._m18.w;
    precise float _173 = fma(cb2._m17.x, _138, _163);
    precise float _174 = fma(cb2._m17.y, _138, _164);
    precise float _175 = fma(cb2._m17.z, _138, _165);
    precise float _176 = fma(cb2._m17.w, _138, _166);
    precise float _183 = fma(cb2._m19.x, _140, _173);
    precise float _184 = fma(cb2._m19.y, _140, _174);
    precise float _185 = fma(cb2._m19.z, _140, _175);
    precise float _186 = fma(cb2._m19.w, _140, _176);
    precise float _193 = fma(cb2._m20.x, _141, _183);
    precise float _194 = fma(cb2._m20.y, _141, _184);
    precise float _195 = fma(cb2._m20.z, _141, _185);
    precise float _196 = fma(cb2._m20.w, _141, _186);
    gl_Position.x = _193;
    gl_Position.y = _194;
    gl_Position.z = _195;
    gl_Position.w = _196;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _225 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _233 = dp3_f32(_225, vec3(cb4.m[_89 + 4u].xyz));
    float _241 = dp3_f32(_225, vec3(cb4.m[_89 + 5u].xyz));
    float _249 = dp3_f32(_225, vec3(cb4.m[_89 + 6u].xyz));
    vec3 _250 = vec3(_233, _241, _249);
    precise float _252 = inversesqrt(dp3_f32(_250, _250));
    precise float _253 = _252 * _233;
    precise float _254 = _252 * _241;
    precise float _255 = _252 * _249;
    TEXCOORD1.x = _253;
    TEXCOORD1.y = _254;
    TEXCOORD1.z = _255;
    precise float _263 = _194 * cb1._m5.x;
    precise float _264 = _263 * 0.5;
    precise float _265 = _193 * 0.5;
    precise float _266 = _196 * 0.5;
    TEXCOORD5.z = _195;
    TEXCOORD5.w = _196;
    precise float _269 = _266 + _265;
    precise float _270 = _266 + _264;
    TEXCOORD5.x = _269;
    TEXCOORD5.y = _270;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _83;
}

