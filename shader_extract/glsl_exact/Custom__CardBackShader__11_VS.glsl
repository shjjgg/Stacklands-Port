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

layout(set = 0, binding = 5, std140) uniform cb5_buf
{
    vec4 m[4096];
} cb5;

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
    precise float _93 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _93));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _75 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _75)));
}

void main()
{
    uint _105 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _110 = _105 + cb3.m.x;
    uint _111 = _110 << 3u;
    uint _112 = _110 * 7u;
    uint _117 = _111 + 1u;
    precise float _125 = POSITION.y * cb4.m[_117].x;
    precise float _126 = POSITION.y * cb4.m[_117].y;
    precise float _127 = POSITION.y * cb4.m[_117].z;
    precise float _128 = POSITION.y * cb4.m[_117].w;
    precise float _137 = fma(cb4.m[_111].x, POSITION.x, _125);
    precise float _138 = fma(cb4.m[_111].y, POSITION.x, _126);
    precise float _139 = fma(cb4.m[_111].z, POSITION.x, _127);
    precise float _140 = fma(cb4.m[_111].w, POSITION.x, _128);
    uint _141 = _111 + 2u;
    precise float _150 = fma(cb4.m[_141].x, POSITION.z, _137);
    precise float _151 = fma(cb4.m[_141].y, POSITION.z, _138);
    precise float _152 = fma(cb4.m[_141].z, POSITION.z, _139);
    precise float _153 = fma(cb4.m[_141].w, POSITION.z, _140);
    uint _154 = _111 + 3u;
    precise float _161 = _150 + cb4.m[_154].x;
    precise float _162 = _151 + cb4.m[_154].y;
    precise float _163 = _152 + cb4.m[_154].z;
    precise float _164 = _153 + cb4.m[_154].w;
    TEXCOORD2.x = fma(cb4.m[_154].x, POSITION.w, _150);
    TEXCOORD2.y = fma(cb4.m[_154].y, POSITION.w, _151);
    TEXCOORD2.z = fma(cb4.m[_154].z, POSITION.w, _152);
    precise float _186 = _162 * cb2._m18.x;
    precise float _187 = _162 * cb2._m18.y;
    precise float _188 = _162 * cb2._m18.z;
    precise float _189 = _162 * cb2._m18.w;
    precise float _196 = fma(cb2._m17.x, _161, _186);
    precise float _197 = fma(cb2._m17.y, _161, _187);
    precise float _198 = fma(cb2._m17.z, _161, _188);
    precise float _199 = fma(cb2._m17.w, _161, _189);
    precise float _206 = fma(cb2._m19.x, _163, _196);
    precise float _207 = fma(cb2._m19.y, _163, _197);
    precise float _208 = fma(cb2._m19.z, _163, _198);
    precise float _209 = fma(cb2._m19.w, _163, _199);
    precise float _216 = fma(cb2._m20.x, _164, _206);
    precise float _217 = fma(cb2._m20.y, _164, _207);
    precise float _218 = fma(cb2._m20.z, _164, _208);
    precise float _219 = fma(cb2._m20.w, _164, _209);
    gl_Position.x = _216;
    gl_Position.y = _217;
    gl_Position.z = _218;
    gl_Position.w = _219;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _248 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _256 = dp3_f32(_248, vec3(cb4.m[_111 + 4u].xyz));
    float _264 = dp3_f32(_248, vec3(cb4.m[_111 + 5u].xyz));
    float _272 = dp3_f32(_248, vec3(cb4.m[_111 + 6u].xyz));
    vec3 _273 = vec3(_256, _264, _272);
    precise float _275 = inversesqrt(dp3_f32(_273, _273));
    precise float _276 = _275 * _256;
    precise float _277 = _275 * _264;
    precise float _278 = _275 * _272;
    TEXCOORD1.x = _276;
    TEXCOORD1.y = _277;
    TEXCOORD1.z = _278;
    precise float _282 = _277 * _277;
    precise float _284 = fma(_276, _276, -_282);
    precise float _285 = _277 * _276;
    precise float _286 = _278 * _277;
    precise float _287 = _278 * _278;
    precise float _288 = _276 * _278;
    vec4 _293 = vec4(_285, _286, _287, _288);
    uint _303 = _112 + 6u;
    TEXCOORD3.x = fma(cb5.m[_303].x, _284, dp4_f32(cb5.m[_112 + 3u], _293));
    TEXCOORD3.y = fma(cb5.m[_303].y, _284, dp4_f32(cb5.m[_112 + 4u], _293));
    TEXCOORD3.z = fma(cb5.m[_303].z, _284, dp4_f32(cb5.m[_112 + 5u], _293));
    precise float _319 = _217 * cb1._m5.x;
    precise float _320 = _319 * 0.5;
    precise float _321 = _216 * 0.5;
    precise float _322 = _219 * 0.5;
    TEXCOORD5.z = _218;
    TEXCOORD5.w = _219;
    precise float _325 = _322 + _321;
    precise float _326 = _322 + _320;
    TEXCOORD5.x = _325;
    TEXCOORD5.y = _326;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _105;
}

