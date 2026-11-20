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
    vec2 _m7;
    uvec2 _m8;
    vec4 _m9;
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
layout(set = 0, binding = 5) uniform texture3D t0;

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

float dp2_f32(vec2 a, vec2 b)
{
    precise float _94 = a.x * b.x;
    return fma(a.y, b.y, _94);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _76 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _76)));
}

void main()
{
    precise float _104 = TEXCOORD.y - 0.5;
    precise float _105 = _104 * 0.3333333432674407958984375;
    precise float _106 = _104 * 150.0;
    precise float _111 = abs(dFdy(_105)) + abs(dFdx(_105));
    precise float _114 = sin(roundEven(_106)) * 43758.546875;
    precise float _116 = fract(_114) - 0.5;
    precise float _119 = fma(_116, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _120 = _119 * 150.0;
    precise float _123 = sin(roundEven(_120)) * 43758.546875;
    precise float _125 = fract(_123) - 0.5;
    precise float _136 = cb0._m7.x - cb0._m9.x;
    precise float _137 = cb0._m7.y - cb0._m9.x;
    precise float _140 = abs(_119) - _136;
    precise float _141 = abs(fma(_125, 0.00166666670702397823333740234375, _105)) - _137;
    vec2 _144 = vec2(spvNMax(_140, 0.0), spvNMax(_141, 0.0));
    precise float _147 = sqrt(dp2_f32(_144, _144)) / _111;
    precise float _148 = spvNMin(_147, 1.0);
    precise float _158 = fma(_148, -cb0._m5.x, cb0._m5.x);
    precise float _159 = fma(_148, -cb0._m5.y, cb0._m5.y);
    precise float _160 = fma(_148, -cb0._m5.z, cb0._m5.z);
    vec4 _172 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _283;
    float _284;
    float _285;
    if (cb1._m0.x == 1.0)
    {
        bool _178 = cb1._m0.y == 1.0;
        precise float _186 = TEXCOORD2.y * cb1._m3.x;
        precise float _187 = TEXCOORD2.y * cb1._m3.y;
        precise float _188 = TEXCOORD2.y * cb1._m3.z;
        precise float _214 = fma(cb1._m5.x, TEXCOORD2.z, fma(cb1._m1.x, TEXCOORD2.x, _186)) + cb1._m7.x;
        precise float _215 = fma(cb1._m5.y, TEXCOORD2.z, fma(cb1._m1.y, TEXCOORD2.x, _187)) + cb1._m7.y;
        precise float _216 = fma(cb1._m5.z, TEXCOORD2.z, fma(cb1._m1.z, TEXCOORD2.x, _188)) + cb1._m7.z;
        precise float _225 = (_178 ? _214 : TEXCOORD2.x) - cb1._m11.x;
        precise float _226 = (_178 ? _215 : TEXCOORD2.y) - cb1._m11.y;
        precise float _227 = (_178 ? _216 : TEXCOORD2.z) - cb1._m11.z;
        precise float _233 = _225 * cb1._m9.x;
        precise float _234 = _226 * cb1._m9.y;
        precise float _235 = _227 * cb1._m9.z;
        precise float _236 = _233 * 0.25;
        precise float _239 = cb1._m0.z * 0.5;
        precise float _243 = spvNMin(fma(-cb1._m0.z, 0.5, 0.25), spvNMax(_236, _239));
        precise float _250 = _243 + 0.25;
        precise float _251 = _234 + 0.0;
        precise float _252 = _235 + 0.0;
        precise float _256 = _243 + 0.5;
        _283 = dp4_f32(texture(sampler3D(t0, s0), vec3(_256, _251, _252)), _172);
        _284 = dp4_f32(texture(sampler3D(t0, s0), vec3(_250, _251, _252)), _172);
        _285 = dp4_f32(texture(sampler3D(t0, s0), vec3(_243, _234, _235)), _172);
    }
    else
    {
        uint _269 = (cb2.m.x + SV_InstanceID) * 7u;
        _283 = dp4_f32(cb3.m[_269 + 2u], _172);
        _284 = dp4_f32(cb3.m[_269 + 1u], _172);
        _285 = dp4_f32(cb3.m[_269], _172);
    }
    precise float _292 = _285 + TEXCOORD5.x;
    precise float _293 = _284 + TEXCOORD5.y;
    precise float _294 = _283 + TEXCOORD5.z;
    precise float _298 = _158 - 0.039999999105930328369140625;
    precise float _299 = _159 - 0.039999999105930328369140625;
    precise float _300 = _160 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _298, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _299, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _300, 0.039999999105930328369140625);
    precise float _311 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _312 = _311 * _158;
    precise float _313 = _311 * _159;
    precise float _314 = _311 * _160;
    precise float _315 = spvNMax(_292, 0.0) * _312;
    precise float _316 = spvNMax(_293, 0.0) * _313;
    precise float _317 = spvNMax(_294, 0.0) * _314;
    SV_Target3.x = exp2(-_315);
    SV_Target3.y = exp2(-_316);
    SV_Target3.z = exp2(-_317);
    SV_Target.x = _312;
    SV_Target.y = _313;
    SV_Target.z = _314;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

