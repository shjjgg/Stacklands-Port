#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_ARB_shader_draw_parameters : require
#extension GL_EXT_spirv_intrinsics : require

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
    vec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    vec3 _m13;
    uint _m14;
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

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _95 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _95));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _77 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _77)));
}

void main()
{
    uint _107 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _112 = _107 + cb3.m.x;
    uint _113 = _112 << 3u;
    uint _114 = _112 * 7u;
    uint _119 = _113 + 1u;
    precise float _127 = POSITION.y * cb4.m[_119].x;
    precise float _128 = POSITION.y * cb4.m[_119].y;
    precise float _129 = POSITION.y * cb4.m[_119].z;
    precise float _130 = POSITION.y * cb4.m[_119].w;
    precise float _139 = fma(cb4.m[_113].x, POSITION.x, _127);
    precise float _140 = fma(cb4.m[_113].y, POSITION.x, _128);
    precise float _141 = fma(cb4.m[_113].z, POSITION.x, _129);
    precise float _142 = fma(cb4.m[_113].w, POSITION.x, _130);
    uint _143 = _113 + 2u;
    precise float _152 = fma(cb4.m[_143].x, POSITION.z, _139);
    precise float _153 = fma(cb4.m[_143].y, POSITION.z, _140);
    precise float _154 = fma(cb4.m[_143].z, POSITION.z, _141);
    precise float _155 = fma(cb4.m[_143].w, POSITION.z, _142);
    uint _156 = _113 + 3u;
    precise float _163 = _152 + cb4.m[_156].x;
    precise float _164 = _153 + cb4.m[_156].y;
    precise float _165 = _154 + cb4.m[_156].z;
    precise float _166 = _155 + cb4.m[_156].w;
    precise float _174 = fma(cb4.m[_156].x, POSITION.w, _152);
    precise float _175 = fma(cb4.m[_156].y, POSITION.w, _153);
    precise float _176 = fma(cb4.m[_156].z, POSITION.w, _154);
    precise float _184 = _164 * cb2._m18.x;
    precise float _185 = _164 * cb2._m18.y;
    precise float _186 = _164 * cb2._m18.z;
    precise float _187 = _164 * cb2._m18.w;
    precise float _194 = fma(cb2._m17.x, _163, _184);
    precise float _195 = fma(cb2._m17.y, _163, _185);
    precise float _196 = fma(cb2._m17.z, _163, _186);
    precise float _197 = fma(cb2._m17.w, _163, _187);
    precise float _204 = fma(cb2._m19.x, _165, _194);
    precise float _205 = fma(cb2._m19.y, _165, _195);
    precise float _206 = fma(cb2._m19.z, _165, _196);
    precise float _207 = fma(cb2._m19.w, _165, _197);
    precise float _214 = fma(cb2._m20.x, _166, _204);
    precise float _215 = fma(cb2._m20.y, _166, _205);
    precise float _216 = fma(cb2._m20.z, _166, _206);
    precise float _217 = fma(cb2._m20.w, _166, _207);
    gl_Position.x = _214;
    gl_Position.y = _215;
    gl_Position.z = _216;
    gl_Position.w = _217;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m6.x, cb0._m7.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m6.y, cb0._m7.y);
    vec3 _247 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _255 = dp3_f32(_247, vec3(cb4.m[_113 + 4u].xyz));
    float _263 = dp3_f32(_247, vec3(cb4.m[_113 + 5u].xyz));
    float _271 = dp3_f32(_247, vec3(cb4.m[_113 + 6u].xyz));
    vec3 _272 = vec3(_255, _263, _271);
    precise float _274 = inversesqrt(dp3_f32(_272, _272));
    precise float _275 = _274 * _255;
    precise float _276 = _274 * _263;
    precise float _277 = _274 * _271;
    TEXCOORD1.x = _275;
    TEXCOORD1.y = _276;
    TEXCOORD1.z = _277;
    TEXCOORD2.x = _174;
    TEXCOORD2.y = _175;
    TEXCOORD2.z = _176;
    precise float _284 = _276 * _276;
    precise float _286 = fma(_275, _275, -_284);
    precise float _287 = _276 * _275;
    precise float _288 = _277 * _276;
    precise float _289 = _277 * _277;
    precise float _290 = _275 * _277;
    vec4 _295 = vec4(_287, _288, _289, _290);
    uint _305 = _114 + 6u;
    precise float _321 = cb1._m4.x - _175;
    precise float _322 = cb1._m4.y - _175;
    precise float _323 = cb1._m4.z - _175;
    precise float _324 = cb1._m4.w - _175;
    precise float _325 = _276 * _321;
    precise float _326 = _276 * _322;
    precise float _327 = _276 * _323;
    precise float _328 = _276 * _324;
    precise float _329 = _321 * _321;
    precise float _330 = _322 * _322;
    precise float _331 = _323 * _323;
    precise float _332 = _324 * _324;
    precise float _339 = cb1._m3.x - _174;
    precise float _340 = cb1._m3.y - _174;
    precise float _341 = cb1._m3.z - _174;
    precise float _342 = cb1._m3.w - _174;
    precise float _349 = cb1._m5.x - _176;
    precise float _350 = cb1._m5.y - _176;
    precise float _351 = cb1._m5.z - _176;
    precise float _352 = cb1._m5.w - _176;
    precise float _369 = spvNMax(fma(_349, _349, fma(_339, _339, _329)), 9.9999999747524270787835121154785e-07);
    precise float _370 = spvNMax(fma(_350, _350, fma(_340, _340, _330)), 9.9999999747524270787835121154785e-07);
    precise float _371 = spvNMax(fma(_351, _351, fma(_341, _341, _331)), 9.9999999747524270787835121154785e-07);
    precise float _372 = spvNMax(fma(_352, _352, fma(_342, _342, _332)), 9.9999999747524270787835121154785e-07);
    precise float _387 = 1.0 / fma(_369, cb1._m6.x, 1.0);
    precise float _388 = 1.0 / fma(_370, cb1._m6.y, 1.0);
    precise float _389 = 1.0 / fma(_371, cb1._m6.z, 1.0);
    precise float _390 = 1.0 / fma(_372, cb1._m6.w, 1.0);
    precise float _391 = fma(_349, _277, fma(_339, _275, _325)) * inversesqrt(_369);
    precise float _392 = fma(_350, _277, fma(_340, _275, _326)) * inversesqrt(_370);
    precise float _393 = fma(_351, _277, fma(_341, _275, _327)) * inversesqrt(_371);
    precise float _394 = fma(_352, _277, fma(_342, _275, _328)) * inversesqrt(_372);
    precise float _399 = _387 * spvNMax(_391, 0.0);
    precise float _400 = _388 * spvNMax(_392, 0.0);
    precise float _401 = _389 * spvNMax(_393, 0.0);
    precise float _402 = _390 * spvNMax(_394, 0.0);
    precise float _409 = _400 * cb1._m9.x;
    precise float _410 = _400 * cb1._m9.y;
    precise float _411 = _400 * cb1._m9.z;
    precise float _436 = fma(cb5.m[_305].x, _286, dp4_f32(cb5.m[_114 + 3u], _295)) + fma(cb1._m13.x, _402, fma(cb1._m11.x, _401, fma(cb1._m7.x, _399, _409)));
    precise float _437 = fma(cb5.m[_305].y, _286, dp4_f32(cb5.m[_114 + 4u], _295)) + fma(cb1._m13.y, _402, fma(cb1._m11.y, _401, fma(cb1._m7.y, _399, _410)));
    precise float _438 = fma(cb5.m[_305].z, _286, dp4_f32(cb5.m[_114 + 5u], _295)) + fma(cb1._m13.z, _402, fma(cb1._m11.z, _401, fma(cb1._m7.z, _399, _411)));
    TEXCOORD3.x = _436;
    TEXCOORD3.y = _437;
    TEXCOORD3.z = _438;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _107;
}

