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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _62 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _62));
}

void main()
{
    uint _75 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
    uint _80 = _75 + cb3.m.x;
    uint _81 = _80 << 3u;
    uint _86 = _81 + 1u;
    precise float _93 = POSITION.y * cb4.m[_86].x;
    precise float _94 = POSITION.y * cb4.m[_86].y;
    precise float _95 = POSITION.y * cb4.m[_86].z;
    uint _106 = _81 + 2u;
    uint _117 = _81 + 3u;
    TEXCOORD1.x = fma(cb4.m[_117].x, POSITION.w, fma(cb4.m[_106].x, POSITION.z, fma(cb4.m[_81].x, POSITION.x, _93)));
    TEXCOORD1.y = fma(cb4.m[_117].y, POSITION.w, fma(cb4.m[_106].y, POSITION.z, fma(cb4.m[_81].y, POSITION.x, _94)));
    TEXCOORD1.z = fma(cb4.m[_117].z, POSITION.w, fma(cb4.m[_106].z, POSITION.z, fma(cb4.m[_81].z, POSITION.x, _95)));
    precise float _140 = POSITION.y * cb4.m[_86].x;
    precise float _141 = POSITION.y * cb4.m[_86].y;
    precise float _142 = POSITION.y * cb4.m[_86].z;
    precise float _143 = POSITION.y * cb4.m[_86].w;
    precise float _155 = fma(cb4.m[_81].w, POSITION.x, _143);
    precise float _167 = fma(cb4.m[_106].w, POSITION.z, _155);
    precise float _176 = fma(cb4.m[_117].x, POSITION.w, fma(cb4.m[_106].x, POSITION.z, fma(cb4.m[_81].x, POSITION.x, _140)));
    precise float _177 = fma(cb4.m[_117].y, POSITION.w, fma(cb4.m[_106].y, POSITION.z, fma(cb4.m[_81].y, POSITION.x, _141)));
    precise float _178 = fma(cb4.m[_117].z, POSITION.w, fma(cb4.m[_106].z, POSITION.z, fma(cb4.m[_81].z, POSITION.x, _142)));
    precise float _179 = fma(cb4.m[_117].w, POSITION.w, _167);
    float _259;
    float _260;
    float _261;
    if (cb1._m5.z != 0.0)
    {
        vec3 _194 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
        float _202 = dp3_f32(_194, vec3(cb4.m[_81 + 4u].xyz));
        float _210 = dp3_f32(_194, vec3(cb4.m[_81 + 5u].xyz));
        float _218 = dp3_f32(_194, vec3(cb4.m[_81 + 6u].xyz));
        vec3 _219 = vec3(_202, _210, _218);
        precise float _221 = inversesqrt(dp3_f32(_219, _219));
        precise float _222 = _221 * _202;
        precise float _223 = _221 * _210;
        precise float _224 = _221 * _218;
        precise float _237 = fma(-_176, cb0._m1, cb0._m0.x);
        precise float _238 = fma(-_177, cb0._m1, cb0._m0.y);
        precise float _239 = fma(-_178, cb0._m1, cb0._m0.z);
        vec3 _240 = vec3(_237, _238, _239);
        precise float _242 = inversesqrt(dp3_f32(_240, _240));
        precise float _243 = _242 * _237;
        precise float _244 = _242 * _238;
        precise float _245 = _242 * _239;
        float _248 = dp3_f32(vec3(_222, _223, _224), vec3(_243, _244, _245));
        precise float _252 = sqrt(fma(-_248, _248, 1.0)) * cb1._m5.z;
        _259 = fma(-_224, _252, _178);
        _260 = fma(-_222, _252, _176);
        _261 = fma(-_223, _252, _177);
    }
    else
    {
        _259 = _178;
        _260 = _176;
        _261 = _177;
    }
    precise float _269 = _261 * cb2._m18.x;
    precise float _270 = _261 * cb2._m18.y;
    precise float _271 = _261 * cb2._m18.z;
    precise float _272 = _261 * cb2._m18.w;
    precise float _279 = fma(cb2._m17.x, _260, _269);
    precise float _280 = fma(cb2._m17.y, _260, _270);
    precise float _281 = fma(cb2._m17.z, _260, _271);
    precise float _282 = fma(cb2._m17.w, _260, _272);
    precise float _289 = fma(cb2._m19.x, _259, _279);
    precise float _290 = fma(cb2._m19.y, _259, _280);
    precise float _291 = fma(cb2._m19.z, _259, _281);
    precise float _292 = fma(cb2._m19.w, _259, _282);
    precise float _299 = fma(cb2._m20.x, _179, _289);
    precise float _300 = fma(cb2._m20.y, _179, _290);
    precise float _301 = fma(cb2._m20.z, _179, _291);
    precise float _302 = fma(cb2._m20.w, _179, _292);
    precise float _303 = spvNMin(_302, _301);
    precise float _304 = _303 - _301;
    precise float _307 = fma(cb1._m5.y, _304, _301);
    gl_Position.z = _307;
    gl_Position.x = _299;
    gl_Position.y = _300;
    gl_Position.w = _302;
    SV_InstanceID = _75;
}

