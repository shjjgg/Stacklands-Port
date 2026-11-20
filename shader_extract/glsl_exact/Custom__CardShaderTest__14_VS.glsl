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
    precise float _71 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _71));
}

void main()
{
    uint _84 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _89 = _84 + cb3.m.x;
    uint _90 = _89 << 3u;
    uint _95 = _90 + 1u;
    precise float _103 = POSITION.y * cb4.m[_95].x;
    precise float _104 = POSITION.y * cb4.m[_95].y;
    precise float _105 = POSITION.y * cb4.m[_95].z;
    precise float _106 = POSITION.y * cb4.m[_95].w;
    precise float _115 = fma(cb4.m[_90].x, POSITION.x, _103);
    precise float _116 = fma(cb4.m[_90].y, POSITION.x, _104);
    precise float _117 = fma(cb4.m[_90].z, POSITION.x, _105);
    precise float _118 = fma(cb4.m[_90].w, POSITION.x, _106);
    uint _119 = _90 + 2u;
    precise float _128 = fma(cb4.m[_119].x, POSITION.z, _115);
    precise float _129 = fma(cb4.m[_119].y, POSITION.z, _116);
    precise float _130 = fma(cb4.m[_119].z, POSITION.z, _117);
    precise float _131 = fma(cb4.m[_119].w, POSITION.z, _118);
    uint _132 = _90 + 3u;
    precise float _139 = _128 + cb4.m[_132].x;
    precise float _140 = _129 + cb4.m[_132].y;
    precise float _141 = _130 + cb4.m[_132].z;
    precise float _142 = _131 + cb4.m[_132].w;
    TEXCOORD2.x = fma(cb4.m[_132].x, POSITION.w, _128);
    TEXCOORD2.y = fma(cb4.m[_132].y, POSITION.w, _129);
    TEXCOORD2.z = fma(cb4.m[_132].z, POSITION.w, _130);
    precise float _164 = _140 * cb2._m18.x;
    precise float _165 = _140 * cb2._m18.y;
    precise float _166 = _140 * cb2._m18.z;
    precise float _167 = _140 * cb2._m18.w;
    precise float _174 = fma(cb2._m17.x, _139, _164);
    precise float _175 = fma(cb2._m17.y, _139, _165);
    precise float _176 = fma(cb2._m17.z, _139, _166);
    precise float _177 = fma(cb2._m17.w, _139, _167);
    precise float _184 = fma(cb2._m19.x, _141, _174);
    precise float _185 = fma(cb2._m19.y, _141, _175);
    precise float _186 = fma(cb2._m19.z, _141, _176);
    precise float _187 = fma(cb2._m19.w, _141, _177);
    precise float _194 = fma(cb2._m20.x, _142, _184);
    precise float _195 = fma(cb2._m20.y, _142, _185);
    precise float _196 = fma(cb2._m20.z, _142, _186);
    precise float _197 = fma(cb2._m20.w, _142, _187);
    gl_Position.x = _194;
    gl_Position.y = _195;
    gl_Position.z = _196;
    gl_Position.w = _197;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    vec3 _226 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _234 = dp3_f32(_226, vec3(cb4.m[_90 + 4u].xyz));
    float _242 = dp3_f32(_226, vec3(cb4.m[_90 + 5u].xyz));
    float _250 = dp3_f32(_226, vec3(cb4.m[_90 + 6u].xyz));
    vec3 _251 = vec3(_234, _242, _250);
    precise float _253 = inversesqrt(dp3_f32(_251, _251));
    precise float _254 = _253 * _234;
    precise float _255 = _253 * _242;
    precise float _256 = _253 * _250;
    TEXCOORD1.x = _254;
    TEXCOORD1.y = _255;
    TEXCOORD1.z = _256;
    precise float _264 = _195 * cb1._m5.x;
    precise float _265 = _264 * 0.5;
    precise float _266 = _194 * 0.5;
    precise float _267 = _197 * 0.5;
    TEXCOORD5.z = _196;
    TEXCOORD5.w = _197;
    precise float _270 = _267 + _266;
    precise float _271 = _267 + _265;
    TEXCOORD5.x = _270;
    TEXCOORD5.y = _271;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _84;
}

