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
    vec3 _m0;
    float _m1;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    vec4 _m5;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
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
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
{
    uvec4 m;
} cb4;

layout(set = 0, binding = 5, std140) uniform cb5_buf
{
    vec4 m[4096];
} cb5;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 3, component = 0) in vec2 TEXCOORD;
layout(location = 1, component = 0) out vec2 TEXCOORD1;
layout(location = 2, component = 0) out vec3 TEXCOORD2;
layout(location = 3, component = 0) out uint SV_InstanceID;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _72 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _72));
}

void main()
{
    uint _85 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _90 = _85 + cb4.m.x;
    TEXCOORD1.x = fma(TEXCOORD.x, cb0._m13.x, cb0._m14.x);
    TEXCOORD1.y = fma(TEXCOORD.y, cb0._m13.y, cb0._m14.y);
    uint _111 = _90 << 3u;
    uint _115 = _111 + 1u;
    precise float _122 = POSITION.y * cb5.m[_115].x;
    precise float _123 = POSITION.y * cb5.m[_115].y;
    precise float _124 = POSITION.y * cb5.m[_115].z;
    uint _135 = _111 + 2u;
    uint _146 = _111 + 3u;
    TEXCOORD2.x = fma(cb5.m[_146].x, POSITION.w, fma(cb5.m[_135].x, POSITION.z, fma(cb5.m[_111].x, POSITION.x, _122)));
    TEXCOORD2.y = fma(cb5.m[_146].y, POSITION.w, fma(cb5.m[_135].y, POSITION.z, fma(cb5.m[_111].y, POSITION.x, _123)));
    TEXCOORD2.z = fma(cb5.m[_146].z, POSITION.w, fma(cb5.m[_135].z, POSITION.z, fma(cb5.m[_111].z, POSITION.x, _124)));
    precise float _168 = POSITION.y * cb5.m[_115].x;
    precise float _169 = POSITION.y * cb5.m[_115].y;
    precise float _170 = POSITION.y * cb5.m[_115].z;
    precise float _171 = POSITION.y * cb5.m[_115].w;
    precise float _183 = fma(cb5.m[_111].w, POSITION.x, _171);
    precise float _195 = fma(cb5.m[_135].w, POSITION.z, _183);
    precise float _204 = fma(cb5.m[_146].x, POSITION.w, fma(cb5.m[_135].x, POSITION.z, fma(cb5.m[_111].x, POSITION.x, _168)));
    precise float _205 = fma(cb5.m[_146].y, POSITION.w, fma(cb5.m[_135].y, POSITION.z, fma(cb5.m[_111].y, POSITION.x, _169)));
    precise float _206 = fma(cb5.m[_146].z, POSITION.w, fma(cb5.m[_135].z, POSITION.z, fma(cb5.m[_111].z, POSITION.x, _170)));
    precise float _207 = fma(cb5.m[_146].w, POSITION.w, _195);
    float _287;
    float _288;
    float _289;
    if (cb2._m5.z != 0.0)
    {
        vec3 _222 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
        float _230 = dp3_f32(_222, vec3(cb5.m[_111 + 4u].xyz));
        float _238 = dp3_f32(_222, vec3(cb5.m[_111 + 5u].xyz));
        float _246 = dp3_f32(_222, vec3(cb5.m[_111 + 6u].xyz));
        vec3 _247 = vec3(_230, _238, _246);
        precise float _249 = inversesqrt(dp3_f32(_247, _247));
        precise float _250 = _249 * _230;
        precise float _251 = _249 * _238;
        precise float _252 = _249 * _246;
        precise float _265 = fma(-_204, cb1._m1, cb1._m0.x);
        precise float _266 = fma(-_205, cb1._m1, cb1._m0.y);
        precise float _267 = fma(-_206, cb1._m1, cb1._m0.z);
        vec3 _268 = vec3(_265, _266, _267);
        precise float _270 = inversesqrt(dp3_f32(_268, _268));
        precise float _271 = _270 * _265;
        precise float _272 = _270 * _266;
        precise float _273 = _270 * _267;
        float _276 = dp3_f32(vec3(_250, _251, _252), vec3(_271, _272, _273));
        precise float _280 = sqrt(fma(-_276, _276, 1.0)) * cb2._m5.z;
        _287 = fma(-_252, _280, _206);
        _288 = fma(-_250, _280, _204);
        _289 = fma(-_251, _280, _205);
    }
    else
    {
        _287 = _206;
        _288 = _204;
        _289 = _205;
    }
    precise float _297 = _289 * cb3._m18.x;
    precise float _298 = _289 * cb3._m18.y;
    precise float _299 = _289 * cb3._m18.z;
    precise float _300 = _289 * cb3._m18.w;
    precise float _307 = fma(cb3._m17.x, _288, _297);
    precise float _308 = fma(cb3._m17.y, _288, _298);
    precise float _309 = fma(cb3._m17.z, _288, _299);
    precise float _310 = fma(cb3._m17.w, _288, _300);
    precise float _317 = fma(cb3._m19.x, _287, _307);
    precise float _318 = fma(cb3._m19.y, _287, _308);
    precise float _319 = fma(cb3._m19.z, _287, _309);
    precise float _320 = fma(cb3._m19.w, _287, _310);
    precise float _327 = fma(cb3._m20.x, _207, _317);
    precise float _328 = fma(cb3._m20.y, _207, _318);
    precise float _329 = fma(cb3._m20.z, _207, _319);
    precise float _330 = fma(cb3._m20.w, _207, _320);
    precise float _331 = spvNMin(_330, _329);
    precise float _332 = _331 - _329;
    precise float _335 = fma(cb2._m5.y, _332, _329);
    gl_Position.z = _335;
    gl_Position.x = _327;
    gl_Position.y = _328;
    gl_Position.w = _330;
    SV_InstanceID = _85;
}

