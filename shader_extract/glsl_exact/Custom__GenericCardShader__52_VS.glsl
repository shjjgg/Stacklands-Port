#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_ARB_shader_draw_parameters : require
#extension GL_EXT_spirv_intrinsics : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    vec3 _m0;
    float _m1;
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
layout(location = 1, component = 0) out vec3 TEXCOORD1;
layout(location = 2, component = 0) out uint SV_InstanceID;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _64 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _64));
}

void main()
{
    uint _77 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _82 = _77 + cb3.m.x;
    uint _83 = _82 << 3u;
    uint _88 = _83 + 1u;
    precise float _95 = POSITION.y * cb4.m[_88].x;
    precise float _96 = POSITION.y * cb4.m[_88].y;
    precise float _97 = POSITION.y * cb4.m[_88].z;
    uint _108 = _83 + 2u;
    uint _119 = _83 + 3u;
    TEXCOORD1.x = fma(cb4.m[_119].x, POSITION.w, fma(cb4.m[_108].x, POSITION.z, fma(cb4.m[_83].x, POSITION.x, _95)));
    TEXCOORD1.y = fma(cb4.m[_119].y, POSITION.w, fma(cb4.m[_108].y, POSITION.z, fma(cb4.m[_83].y, POSITION.x, _96)));
    TEXCOORD1.z = fma(cb4.m[_119].z, POSITION.w, fma(cb4.m[_108].z, POSITION.z, fma(cb4.m[_83].z, POSITION.x, _97)));
    precise float _142 = POSITION.y * cb4.m[_88].x;
    precise float _143 = POSITION.y * cb4.m[_88].y;
    precise float _144 = POSITION.y * cb4.m[_88].z;
    precise float _145 = POSITION.y * cb4.m[_88].w;
    precise float _157 = fma(cb4.m[_83].w, POSITION.x, _145);
    precise float _169 = fma(cb4.m[_108].w, POSITION.z, _157);
    precise float _178 = fma(cb4.m[_119].x, POSITION.w, fma(cb4.m[_108].x, POSITION.z, fma(cb4.m[_83].x, POSITION.x, _142)));
    precise float _179 = fma(cb4.m[_119].y, POSITION.w, fma(cb4.m[_108].y, POSITION.z, fma(cb4.m[_83].y, POSITION.x, _143)));
    precise float _180 = fma(cb4.m[_119].z, POSITION.w, fma(cb4.m[_108].z, POSITION.z, fma(cb4.m[_83].z, POSITION.x, _144)));
    precise float _181 = fma(cb4.m[_119].w, POSITION.w, _169);
    float _261;
    float _262;
    float _263;
    if (cb1._m5.z != 0.0)
    {
        vec3 _196 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
        float _204 = dp3_f32(_196, vec3(cb4.m[_83 + 4u].xyz));
        float _212 = dp3_f32(_196, vec3(cb4.m[_83 + 5u].xyz));
        float _220 = dp3_f32(_196, vec3(cb4.m[_83 + 6u].xyz));
        vec3 _221 = vec3(_204, _212, _220);
        precise float _223 = inversesqrt(dp3_f32(_221, _221));
        precise float _224 = _223 * _204;
        precise float _225 = _223 * _212;
        precise float _226 = _223 * _220;
        precise float _239 = fma(-_178, cb0._m1, cb0._m0.x);
        precise float _240 = fma(-_179, cb0._m1, cb0._m0.y);
        precise float _241 = fma(-_180, cb0._m1, cb0._m0.z);
        vec3 _242 = vec3(_239, _240, _241);
        precise float _244 = inversesqrt(dp3_f32(_242, _242));
        precise float _245 = _244 * _239;
        precise float _246 = _244 * _240;
        precise float _247 = _244 * _241;
        float _250 = dp3_f32(vec3(_224, _225, _226), vec3(_245, _246, _247));
        precise float _254 = sqrt(fma(-_250, _250, 1.0)) * cb1._m5.z;
        _261 = fma(-_226, _254, _180);
        _262 = fma(-_224, _254, _178);
        _263 = fma(-_225, _254, _179);
    }
    else
    {
        _261 = _180;
        _262 = _178;
        _263 = _179;
    }
    precise float _271 = _263 * cb2._m18.x;
    precise float _272 = _263 * cb2._m18.y;
    precise float _273 = _263 * cb2._m18.z;
    precise float _274 = _263 * cb2._m18.w;
    precise float _281 = fma(cb2._m17.x, _262, _271);
    precise float _282 = fma(cb2._m17.y, _262, _272);
    precise float _283 = fma(cb2._m17.z, _262, _273);
    precise float _284 = fma(cb2._m17.w, _262, _274);
    precise float _291 = fma(cb2._m19.x, _261, _281);
    precise float _292 = fma(cb2._m19.y, _261, _282);
    precise float _293 = fma(cb2._m19.z, _261, _283);
    precise float _294 = fma(cb2._m19.w, _261, _284);
    precise float _301 = fma(cb2._m20.x, _181, _291);
    precise float _302 = fma(cb2._m20.y, _181, _292);
    precise float _303 = fma(cb2._m20.z, _181, _293);
    precise float _304 = fma(cb2._m20.w, _181, _294);
    precise float _307 = cb1._m5.x / _304;
    precise float _308 = spvNMin(_307, 0.0);
    precise float _309 = spvNMax(_308, -1.0);
    precise float _310 = _303 + _309;
    precise float _311 = spvNMin(_304, _310);
    precise float _312 = _311 - _310;
    precise float _315 = fma(cb1._m5.y, _312, _310);
    gl_Position.z = _315;
    gl_Position.x = _301;
    gl_Position.y = _302;
    gl_Position.w = _304;
    SV_InstanceID = _77;
}

