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
layout(location = 4, component = 0) out vec3 TEXCOORD3;
layout(location = 5, component = 0) out vec4 TEXCOORD5;
layout(location = 6, component = 0) out vec4 TEXCOORD6;
layout(location = 7, component = 0) out uint SV_InstanceID;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _87));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _69 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _69)));
}

void main()
{
    uint _99 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _104 = _99 + cb2.m.x;
    uint _105 = _104 << 3u;
    uint _106 = _104 * 7u;
    uint _111 = _105 + 1u;
    precise float _119 = POSITION.y * cb3.m[_111].x;
    precise float _120 = POSITION.y * cb3.m[_111].y;
    precise float _121 = POSITION.y * cb3.m[_111].z;
    precise float _122 = POSITION.y * cb3.m[_111].w;
    precise float _131 = fma(cb3.m[_105].x, POSITION.x, _119);
    precise float _132 = fma(cb3.m[_105].y, POSITION.x, _120);
    precise float _133 = fma(cb3.m[_105].z, POSITION.x, _121);
    precise float _134 = fma(cb3.m[_105].w, POSITION.x, _122);
    uint _135 = _105 + 2u;
    precise float _144 = fma(cb3.m[_135].x, POSITION.z, _131);
    precise float _145 = fma(cb3.m[_135].y, POSITION.z, _132);
    precise float _146 = fma(cb3.m[_135].z, POSITION.z, _133);
    precise float _147 = fma(cb3.m[_135].w, POSITION.z, _134);
    uint _148 = _105 + 3u;
    precise float _155 = _144 + cb3.m[_148].x;
    precise float _156 = _145 + cb3.m[_148].y;
    precise float _157 = _146 + cb3.m[_148].z;
    precise float _158 = _147 + cb3.m[_148].w;
    TEXCOORD2.x = fma(cb3.m[_148].x, POSITION.w, _144);
    TEXCOORD2.y = fma(cb3.m[_148].y, POSITION.w, _145);
    TEXCOORD2.z = fma(cb3.m[_148].z, POSITION.w, _146);
    precise float _180 = _156 * cb1._m18.x;
    precise float _181 = _156 * cb1._m18.y;
    precise float _182 = _156 * cb1._m18.z;
    precise float _183 = _156 * cb1._m18.w;
    precise float _190 = fma(cb1._m17.x, _155, _180);
    precise float _191 = fma(cb1._m17.y, _155, _181);
    precise float _192 = fma(cb1._m17.z, _155, _182);
    precise float _193 = fma(cb1._m17.w, _155, _183);
    precise float _200 = fma(cb1._m19.x, _157, _190);
    precise float _201 = fma(cb1._m19.y, _157, _191);
    precise float _202 = fma(cb1._m19.z, _157, _192);
    precise float _203 = fma(cb1._m19.w, _157, _193);
    precise float _210 = fma(cb1._m20.x, _158, _200);
    precise float _211 = fma(cb1._m20.y, _158, _201);
    precise float _212 = fma(cb1._m20.z, _158, _202);
    precise float _213 = fma(cb1._m20.w, _158, _203);
    gl_Position.x = _210;
    gl_Position.y = _211;
    gl_Position.z = _212;
    gl_Position.w = _213;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _242 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _250 = dp3_f32(_242, vec3(cb3.m[_105 + 4u].xyz));
    float _258 = dp3_f32(_242, vec3(cb3.m[_105 + 5u].xyz));
    float _266 = dp3_f32(_242, vec3(cb3.m[_105 + 6u].xyz));
    vec3 _267 = vec3(_250, _258, _266);
    precise float _269 = inversesqrt(dp3_f32(_267, _267));
    precise float _270 = _269 * _250;
    precise float _271 = _269 * _258;
    precise float _272 = _269 * _266;
    TEXCOORD1.x = _270;
    TEXCOORD1.y = _271;
    TEXCOORD1.z = _272;
    precise float _276 = _271 * _271;
    precise float _278 = fma(_270, _270, -_276);
    precise float _279 = _271 * _270;
    precise float _280 = _272 * _271;
    precise float _281 = _272 * _272;
    precise float _282 = _270 * _272;
    vec4 _287 = vec4(_279, _280, _281, _282);
    uint _297 = _106 + 6u;
    TEXCOORD3.x = fma(cb4.m[_297].x, _278, dp4_f32(cb4.m[_106 + 3u], _287));
    TEXCOORD3.y = fma(cb4.m[_297].y, _278, dp4_f32(cb4.m[_106 + 4u], _287));
    TEXCOORD3.z = fma(cb4.m[_297].z, _278, dp4_f32(cb4.m[_106 + 5u], _287));
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _99;
}

