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
    precise float _65 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _65));
}

void main()
{
    uint _78 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _83 = _78 + cb2.m.x;
    uint _84 = _83 << 3u;
    uint _89 = _84 + 1u;
    precise float _97 = POSITION.y * cb3.m[_89].x;
    precise float _98 = POSITION.y * cb3.m[_89].y;
    precise float _99 = POSITION.y * cb3.m[_89].z;
    precise float _100 = POSITION.y * cb3.m[_89].w;
    precise float _109 = fma(cb3.m[_84].x, POSITION.x, _97);
    precise float _110 = fma(cb3.m[_84].y, POSITION.x, _98);
    precise float _111 = fma(cb3.m[_84].z, POSITION.x, _99);
    precise float _112 = fma(cb3.m[_84].w, POSITION.x, _100);
    uint _113 = _84 + 2u;
    precise float _122 = fma(cb3.m[_113].x, POSITION.z, _109);
    precise float _123 = fma(cb3.m[_113].y, POSITION.z, _110);
    precise float _124 = fma(cb3.m[_113].z, POSITION.z, _111);
    precise float _125 = fma(cb3.m[_113].w, POSITION.z, _112);
    uint _126 = _84 + 3u;
    precise float _133 = _122 + cb3.m[_126].x;
    precise float _134 = _123 + cb3.m[_126].y;
    precise float _135 = _124 + cb3.m[_126].z;
    precise float _136 = _125 + cb3.m[_126].w;
    TEXCOORD2.x = fma(cb3.m[_126].x, POSITION.w, _122);
    TEXCOORD2.y = fma(cb3.m[_126].y, POSITION.w, _123);
    TEXCOORD2.z = fma(cb3.m[_126].z, POSITION.w, _124);
    precise float _158 = _134 * cb1._m18.x;
    precise float _159 = _134 * cb1._m18.y;
    precise float _160 = _134 * cb1._m18.z;
    precise float _161 = _134 * cb1._m18.w;
    precise float _168 = fma(cb1._m17.x, _133, _158);
    precise float _169 = fma(cb1._m17.y, _133, _159);
    precise float _170 = fma(cb1._m17.z, _133, _160);
    precise float _171 = fma(cb1._m17.w, _133, _161);
    precise float _178 = fma(cb1._m19.x, _135, _168);
    precise float _179 = fma(cb1._m19.y, _135, _169);
    precise float _180 = fma(cb1._m19.z, _135, _170);
    precise float _181 = fma(cb1._m19.w, _135, _171);
    precise float _188 = fma(cb1._m20.x, _136, _178);
    precise float _189 = fma(cb1._m20.y, _136, _179);
    precise float _190 = fma(cb1._m20.z, _136, _180);
    precise float _191 = fma(cb1._m20.w, _136, _181);
    gl_Position.x = _188;
    gl_Position.y = _189;
    gl_Position.z = _190;
    gl_Position.w = _191;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    vec3 _220 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _228 = dp3_f32(_220, vec3(cb3.m[_84 + 4u].xyz));
    float _236 = dp3_f32(_220, vec3(cb3.m[_84 + 5u].xyz));
    float _244 = dp3_f32(_220, vec3(cb3.m[_84 + 6u].xyz));
    vec3 _245 = vec3(_228, _236, _244);
    precise float _247 = inversesqrt(dp3_f32(_245, _245));
    precise float _248 = _247 * _228;
    precise float _249 = _247 * _236;
    precise float _250 = _247 * _244;
    TEXCOORD1.x = _248;
    TEXCOORD1.y = _249;
    TEXCOORD1.z = _250;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _78;
}

