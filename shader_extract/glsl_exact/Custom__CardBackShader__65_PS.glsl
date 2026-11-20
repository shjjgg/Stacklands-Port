#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec3 _m5;
    uint _m6;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
    vec3 _m1;
    uint _m2;
    vec3 _m3;
    uint _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 m;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    vec4 m[4096];
} cb3;

layout(set = 0, binding = 4) uniform sampler s0;
layout(set = 0, binding = 5) uniform sampler s1;
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 5, component = 0) in vec3 TEXCOORD5;
layout(location = 6, component = 0) flat in uint SV_InstanceID;
layout(location = 0, component = 0) out vec4 SV_Target;
layout(location = 1, component = 0) out vec4 SV_Target1;
layout(location = 2, component = 0) out vec4 SV_Target2;
layout(location = 3, component = 0) out vec4 SV_Target3;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp4_f32(vec4 a, vec4 b)
{
    precise float _80 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _80)));
}

void main()
{
    vec4 _104 = texture(sampler2D(t0, s1), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _115 = _104.x * cb0._m5.x;
    precise float _116 = _104.y * cb0._m5.y;
    precise float _117 = _104.z * cb0._m5.z;
    precise float _118 = TEXCOORD.y + TEXCOORD.x;
    precise float _119 = _118 * 10.0;
    precise float _122 = roundEven(fract(_119)) + 0.800000011920928955078125;
    precise float _123 = spvNMin(_122, 1.0);
    precise float _124 = _123 * _115;
    precise float _125 = _123 * _116;
    precise float _126 = _123 * _117;
    bool _134 = (((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _135 = _134 ? 0.0 : _124;
    float _136 = _134 ? 0.0 : _125;
    float _137 = _134 ? 0.0 : _126;
    vec4 _149 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _260;
    float _261;
    float _262;
    if (cb1._m0.x == 1.0)
    {
        bool _155 = cb1._m0.y == 1.0;
        precise float _163 = TEXCOORD2.y * cb1._m3.x;
        precise float _164 = TEXCOORD2.y * cb1._m3.y;
        precise float _165 = TEXCOORD2.y * cb1._m3.z;
        precise float _191 = fma(cb1._m5.x, TEXCOORD2.z, fma(cb1._m1.x, TEXCOORD2.x, _163)) + cb1._m7.x;
        precise float _192 = fma(cb1._m5.y, TEXCOORD2.z, fma(cb1._m1.y, TEXCOORD2.x, _164)) + cb1._m7.y;
        precise float _193 = fma(cb1._m5.z, TEXCOORD2.z, fma(cb1._m1.z, TEXCOORD2.x, _165)) + cb1._m7.z;
        precise float _202 = (_155 ? _191 : TEXCOORD2.x) - cb1._m11.x;
        precise float _203 = (_155 ? _192 : TEXCOORD2.y) - cb1._m11.y;
        precise float _204 = (_155 ? _193 : TEXCOORD2.z) - cb1._m11.z;
        precise float _210 = _202 * cb1._m9.x;
        precise float _211 = _203 * cb1._m9.y;
        precise float _212 = _204 * cb1._m9.z;
        precise float _213 = _210 * 0.25;
        precise float _216 = cb1._m0.z * 0.5;
        precise float _220 = spvNMin(fma(-cb1._m0.z, 0.5, 0.25), spvNMax(_213, _216));
        precise float _227 = _220 + 0.25;
        precise float _228 = _211 + 0.0;
        precise float _229 = _212 + 0.0;
        precise float _233 = _220 + 0.5;
        _260 = dp4_f32(texture(sampler3D(t1, s0), vec3(_233, _228, _229)), _149);
        _261 = dp4_f32(texture(sampler3D(t1, s0), vec3(_227, _228, _229)), _149);
        _262 = dp4_f32(texture(sampler3D(t1, s0), vec3(_220, _211, _212)), _149);
    }
    else
    {
        uint _246 = (cb2.m.x + SV_InstanceID) * 7u;
        _260 = dp4_f32(cb3.m[_246 + 2u], _149);
        _261 = dp4_f32(cb3.m[_246 + 1u], _149);
        _262 = dp4_f32(cb3.m[_246], _149);
    }
    precise float _269 = _262 + TEXCOORD5.x;
    precise float _270 = _261 + TEXCOORD5.y;
    precise float _271 = _260 + TEXCOORD5.z;
    precise float _275 = _135 - 0.039999999105930328369140625;
    precise float _276 = _136 - 0.039999999105930328369140625;
    precise float _277 = _137 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _275, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _276, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _277, 0.039999999105930328369140625);
    precise float _288 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _289 = _288 * _135;
    precise float _290 = _288 * _136;
    precise float _291 = _288 * _137;
    precise float _292 = spvNMax(_269, 0.0) * _289;
    precise float _293 = spvNMax(_270, 0.0) * _290;
    precise float _294 = spvNMax(_271, 0.0) * _291;
    SV_Target3.x = _292;
    SV_Target3.y = _293;
    SV_Target3.z = _294;
    SV_Target.x = _289;
    SV_Target.y = _290;
    SV_Target.z = _291;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

