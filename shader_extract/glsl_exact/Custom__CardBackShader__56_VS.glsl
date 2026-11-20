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

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD_1;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD4;
layout(location = 5, component = 0) out uint SV_InstanceID;

float dp3_f32(vec3 a, vec3 b)
{
    precise float _63 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _63));
}

void main()
{
    uint _76 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _81 = _76 + cb2.m.x;
    uint _82 = _81 << 3u;
    uint _87 = _82 + 1u;
    precise float _95 = POSITION.y * cb3.m[_87].x;
    precise float _96 = POSITION.y * cb3.m[_87].y;
    precise float _97 = POSITION.y * cb3.m[_87].z;
    precise float _98 = POSITION.y * cb3.m[_87].w;
    precise float _107 = fma(cb3.m[_82].x, POSITION.x, _95);
    precise float _108 = fma(cb3.m[_82].y, POSITION.x, _96);
    precise float _109 = fma(cb3.m[_82].z, POSITION.x, _97);
    precise float _110 = fma(cb3.m[_82].w, POSITION.x, _98);
    uint _111 = _82 + 2u;
    precise float _120 = fma(cb3.m[_111].x, POSITION.z, _107);
    precise float _121 = fma(cb3.m[_111].y, POSITION.z, _108);
    precise float _122 = fma(cb3.m[_111].z, POSITION.z, _109);
    precise float _123 = fma(cb3.m[_111].w, POSITION.z, _110);
    uint _124 = _82 + 3u;
    precise float _131 = _120 + cb3.m[_124].x;
    precise float _132 = _121 + cb3.m[_124].y;
    precise float _133 = _122 + cb3.m[_124].z;
    precise float _134 = _123 + cb3.m[_124].w;
    TEXCOORD2.x = fma(cb3.m[_124].x, POSITION.w, _120);
    TEXCOORD2.y = fma(cb3.m[_124].y, POSITION.w, _121);
    TEXCOORD2.z = fma(cb3.m[_124].z, POSITION.w, _122);
    precise float _156 = _132 * cb1._m18.x;
    precise float _157 = _132 * cb1._m18.y;
    precise float _158 = _132 * cb1._m18.z;
    precise float _159 = _132 * cb1._m18.w;
    precise float _166 = fma(cb1._m17.x, _131, _156);
    precise float _167 = fma(cb1._m17.y, _131, _157);
    precise float _168 = fma(cb1._m17.z, _131, _158);
    precise float _169 = fma(cb1._m17.w, _131, _159);
    precise float _176 = fma(cb1._m19.x, _133, _166);
    precise float _177 = fma(cb1._m19.y, _133, _167);
    precise float _178 = fma(cb1._m19.z, _133, _168);
    precise float _179 = fma(cb1._m19.w, _133, _169);
    precise float _186 = fma(cb1._m20.x, _134, _176);
    precise float _187 = fma(cb1._m20.y, _134, _177);
    precise float _188 = fma(cb1._m20.z, _134, _178);
    precise float _189 = fma(cb1._m20.w, _134, _179);
    gl_Position.x = _186;
    gl_Position.y = _187;
    gl_Position.z = _188;
    gl_Position.w = _189;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _218 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _226 = dp3_f32(_218, vec3(cb3.m[_82 + 4u].xyz));
    float _234 = dp3_f32(_218, vec3(cb3.m[_82 + 5u].xyz));
    float _242 = dp3_f32(_218, vec3(cb3.m[_82 + 6u].xyz));
    vec3 _243 = vec3(_226, _234, _242);
    precise float _245 = inversesqrt(dp3_f32(_243, _243));
    precise float _246 = _245 * _226;
    precise float _247 = _245 * _234;
    precise float _248 = _245 * _242;
    TEXCOORD1.x = _246;
    TEXCOORD1.y = _247;
    TEXCOORD1.z = _248;
    TEXCOORD4.x = 0.0;
    TEXCOORD4.y = 0.0;
    TEXCOORD4.z = 0.0;
    TEXCOORD4.w = 0.0;
    SV_InstanceID = _76;
}

