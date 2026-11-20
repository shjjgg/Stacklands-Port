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
    uvec4 _m6;
    uvec4 _m7;
    vec2 _m8;
    vec2 _m9;
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
    precise float _96 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _96));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _78 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _78)));
}

void main()
{
    uint _108 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _113 = _108 + cb3.m.x;
    uint _114 = _113 << 3u;
    uint _115 = _113 * 7u;
    uint _120 = _114 + 1u;
    precise float _128 = POSITION.y * cb4.m[_120].x;
    precise float _129 = POSITION.y * cb4.m[_120].y;
    precise float _130 = POSITION.y * cb4.m[_120].z;
    precise float _131 = POSITION.y * cb4.m[_120].w;
    precise float _140 = fma(cb4.m[_114].x, POSITION.x, _128);
    precise float _141 = fma(cb4.m[_114].y, POSITION.x, _129);
    precise float _142 = fma(cb4.m[_114].z, POSITION.x, _130);
    precise float _143 = fma(cb4.m[_114].w, POSITION.x, _131);
    uint _144 = _114 + 2u;
    precise float _153 = fma(cb4.m[_144].x, POSITION.z, _140);
    precise float _154 = fma(cb4.m[_144].y, POSITION.z, _141);
    precise float _155 = fma(cb4.m[_144].z, POSITION.z, _142);
    precise float _156 = fma(cb4.m[_144].w, POSITION.z, _143);
    uint _157 = _114 + 3u;
    precise float _164 = _153 + cb4.m[_157].x;
    precise float _165 = _154 + cb4.m[_157].y;
    precise float _166 = _155 + cb4.m[_157].z;
    precise float _167 = _156 + cb4.m[_157].w;
    precise float _175 = fma(cb4.m[_157].x, POSITION.w, _153);
    precise float _176 = fma(cb4.m[_157].y, POSITION.w, _154);
    precise float _177 = fma(cb4.m[_157].z, POSITION.w, _155);
    precise float _185 = _165 * cb2._m18.x;
    precise float _186 = _165 * cb2._m18.y;
    precise float _187 = _165 * cb2._m18.z;
    precise float _188 = _165 * cb2._m18.w;
    precise float _195 = fma(cb2._m17.x, _164, _185);
    precise float _196 = fma(cb2._m17.y, _164, _186);
    precise float _197 = fma(cb2._m17.z, _164, _187);
    precise float _198 = fma(cb2._m17.w, _164, _188);
    precise float _205 = fma(cb2._m19.x, _166, _195);
    precise float _206 = fma(cb2._m19.y, _166, _196);
    precise float _207 = fma(cb2._m19.z, _166, _197);
    precise float _208 = fma(cb2._m19.w, _166, _198);
    precise float _215 = fma(cb2._m20.x, _167, _205);
    precise float _216 = fma(cb2._m20.y, _167, _206);
    precise float _217 = fma(cb2._m20.z, _167, _207);
    precise float _218 = fma(cb2._m20.w, _167, _208);
    gl_Position.x = _215;
    gl_Position.y = _216;
    gl_Position.z = _217;
    gl_Position.w = _218;
    TEXCOORD_1.x = fma(TEXCOORD.x, cb0._m8.x, cb0._m9.x);
    TEXCOORD_1.y = fma(TEXCOORD.y, cb0._m8.y, cb0._m9.y);
    vec3 _248 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _256 = dp3_f32(_248, vec3(cb4.m[_114 + 4u].xyz));
    float _264 = dp3_f32(_248, vec3(cb4.m[_114 + 5u].xyz));
    float _272 = dp3_f32(_248, vec3(cb4.m[_114 + 6u].xyz));
    vec3 _273 = vec3(_256, _264, _272);
    precise float _275 = inversesqrt(dp3_f32(_273, _273));
    precise float _276 = _275 * _256;
    precise float _277 = _275 * _264;
    precise float _278 = _275 * _272;
    TEXCOORD1.x = _276;
    TEXCOORD1.y = _277;
    TEXCOORD1.z = _278;
    TEXCOORD2.x = _175;
    TEXCOORD2.y = _176;
    TEXCOORD2.z = _177;
    precise float _285 = _277 * _277;
    precise float _287 = fma(_276, _276, -_285);
    precise float _288 = _277 * _276;
    precise float _289 = _278 * _277;
    precise float _290 = _278 * _278;
    precise float _291 = _276 * _278;
    vec4 _296 = vec4(_288, _289, _290, _291);
    uint _306 = _115 + 6u;
    precise float _322 = cb1._m4.x - _176;
    precise float _323 = cb1._m4.y - _176;
    precise float _324 = cb1._m4.z - _176;
    precise float _325 = cb1._m4.w - _176;
    precise float _326 = _277 * _322;
    precise float _327 = _277 * _323;
    precise float _328 = _277 * _324;
    precise float _329 = _277 * _325;
    precise float _330 = _322 * _322;
    precise float _331 = _323 * _323;
    precise float _332 = _324 * _324;
    precise float _333 = _325 * _325;
    precise float _340 = cb1._m3.x - _175;
    precise float _341 = cb1._m3.y - _175;
    precise float _342 = cb1._m3.z - _175;
    precise float _343 = cb1._m3.w - _175;
    precise float _350 = cb1._m5.x - _177;
    precise float _351 = cb1._m5.y - _177;
    precise float _352 = cb1._m5.z - _177;
    precise float _353 = cb1._m5.w - _177;
    precise float _370 = spvNMax(fma(_350, _350, fma(_340, _340, _330)), 9.9999999747524270787835121154785e-07);
    precise float _371 = spvNMax(fma(_351, _351, fma(_341, _341, _331)), 9.9999999747524270787835121154785e-07);
    precise float _372 = spvNMax(fma(_352, _352, fma(_342, _342, _332)), 9.9999999747524270787835121154785e-07);
    precise float _373 = spvNMax(fma(_353, _353, fma(_343, _343, _333)), 9.9999999747524270787835121154785e-07);
    precise float _388 = 1.0 / fma(_370, cb1._m6.x, 1.0);
    precise float _389 = 1.0 / fma(_371, cb1._m6.y, 1.0);
    precise float _390 = 1.0 / fma(_372, cb1._m6.z, 1.0);
    precise float _391 = 1.0 / fma(_373, cb1._m6.w, 1.0);
    precise float _392 = fma(_350, _278, fma(_340, _276, _326)) * inversesqrt(_370);
    precise float _393 = fma(_351, _278, fma(_341, _276, _327)) * inversesqrt(_371);
    precise float _394 = fma(_352, _278, fma(_342, _276, _328)) * inversesqrt(_372);
    precise float _395 = fma(_353, _278, fma(_343, _276, _329)) * inversesqrt(_373);
    precise float _400 = _388 * spvNMax(_392, 0.0);
    precise float _401 = _389 * spvNMax(_393, 0.0);
    precise float _402 = _390 * spvNMax(_394, 0.0);
    precise float _403 = _391 * spvNMax(_395, 0.0);
    precise float _410 = _401 * cb1._m9.x;
    precise float _411 = _401 * cb1._m9.y;
    precise float _412 = _401 * cb1._m9.z;
    precise float _437 = fma(cb5.m[_306].x, _287, dp4_f32(cb5.m[_115 + 3u], _296)) + fma(cb1._m13.x, _403, fma(cb1._m11.x, _402, fma(cb1._m7.x, _400, _410)));
    precise float _438 = fma(cb5.m[_306].y, _287, dp4_f32(cb5.m[_115 + 4u], _296)) + fma(cb1._m13.y, _403, fma(cb1._m11.y, _402, fma(cb1._m7.y, _400, _411)));
    precise float _439 = fma(cb5.m[_306].z, _287, dp4_f32(cb5.m[_115 + 5u], _296)) + fma(cb1._m13.z, _403, fma(cb1._m11.z, _402, fma(cb1._m7.z, _400, _412)));
    TEXCOORD3.x = _437;
    TEXCOORD3.y = _438;
    TEXCOORD3.z = _439;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
    TEXCOORD6.x = 0.0;
    TEXCOORD6.y = 0.0;
    TEXCOORD6.z = 0.0;
    TEXCOORD6.w = 0.0;
    SV_InstanceID = _108;
}

