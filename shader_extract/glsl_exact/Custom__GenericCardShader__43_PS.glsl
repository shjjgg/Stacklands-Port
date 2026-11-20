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
    uvec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    uvec4 _m20;
    uvec4 _m21;
    uvec4 _m22;
    uvec4 _m23;
    uvec4 _m24;
    uvec4 _m25;
    uvec4 _m26;
    uvec4 _m27;
    uvec4 _m28;
    uvec4 _m29;
    uvec4 _m30;
    uvec4 _m31;
    uvec4 _m32;
    uvec4 _m33;
    uvec4 _m34;
    uvec4 _m35;
    uvec4 _m36;
    uvec4 _m37;
    uvec4 _m38;
    vec4 _m39;
    vec4 _m40;
    vec4 _m41;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
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
} cb2;

layout(set = 0, binding = 3) uniform sampler s0;
layout(set = 0, binding = 4) uniform texture3D t0;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 5, component = 0) in vec3 TEXCOORD5;
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
    precise float _90 = a.x * b.x;
    return fma(a.y, b.y, _90);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _72 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _72)));
}

void main()
{
    precise float _100 = TEXCOORD.y - 0.5;
    precise float _101 = _100 * 0.3333333432674407958984375;
    precise float _102 = _100 * 150.0;
    precise float _107 = abs(dFdy(_101)) + abs(dFdx(_101));
    precise float _110 = sin(roundEven(_102)) * 43758.546875;
    precise float _112 = fract(_110) - 0.5;
    precise float _115 = fma(_112, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _116 = _115 * 150.0;
    precise float _119 = sin(roundEven(_116)) * 43758.546875;
    precise float _121 = fract(_119) - 0.5;
    precise float _132 = cb0._m7.x - cb0._m9.x;
    precise float _133 = cb0._m7.y - cb0._m9.x;
    precise float _136 = abs(_115) - _132;
    precise float _137 = abs(fma(_121, 0.00166666670702397823333740234375, _101)) - _133;
    vec2 _140 = vec2(spvNMax(_136, 0.0), spvNMax(_137, 0.0));
    precise float _143 = sqrt(dp2_f32(_140, _140)) / _107;
    precise float _144 = spvNMin(_143, 1.0);
    precise float _154 = fma(_144, -cb0._m5.x, cb0._m5.x);
    precise float _155 = fma(_144, -cb0._m5.y, cb0._m5.y);
    precise float _156 = fma(_144, -cb0._m5.z, cb0._m5.z);
    vec4 _168 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _270;
    float _271;
    float _272;
    if (cb2._m0.x == 1.0)
    {
        bool _174 = cb2._m0.y == 1.0;
        precise float _182 = TEXCOORD2.y * cb2._m3.x;
        precise float _183 = TEXCOORD2.y * cb2._m3.y;
        precise float _184 = TEXCOORD2.y * cb2._m3.z;
        precise float _210 = fma(cb2._m5.x, TEXCOORD2.z, fma(cb2._m1.x, TEXCOORD2.x, _182)) + cb2._m7.x;
        precise float _211 = fma(cb2._m5.y, TEXCOORD2.z, fma(cb2._m1.y, TEXCOORD2.x, _183)) + cb2._m7.y;
        precise float _212 = fma(cb2._m5.z, TEXCOORD2.z, fma(cb2._m1.z, TEXCOORD2.x, _184)) + cb2._m7.z;
        precise float _221 = (_174 ? _210 : TEXCOORD2.x) - cb2._m11.x;
        precise float _222 = (_174 ? _211 : TEXCOORD2.y) - cb2._m11.y;
        precise float _223 = (_174 ? _212 : TEXCOORD2.z) - cb2._m11.z;
        precise float _229 = _221 * cb2._m9.x;
        precise float _230 = _222 * cb2._m9.y;
        precise float _231 = _223 * cb2._m9.z;
        precise float _232 = _229 * 0.25;
        precise float _235 = cb2._m0.z * 0.5;
        precise float _239 = spvNMin(fma(-cb2._m0.z, 0.5, 0.25), spvNMax(_232, _235));
        precise float _246 = _239 + 0.25;
        precise float _247 = _230 + 0.0;
        precise float _248 = _231 + 0.0;
        precise float _252 = _239 + 0.5;
        _270 = dp4_f32(texture(sampler3D(t0, s0), vec3(_252, _247, _248)), _168);
        _271 = dp4_f32(texture(sampler3D(t0, s0), vec3(_246, _247, _248)), _168);
        _272 = dp4_f32(texture(sampler3D(t0, s0), vec3(_239, _230, _231)), _168);
    }
    else
    {
        _270 = dp4_f32(cb1._m41, _168);
        _271 = dp4_f32(cb1._m40, _168);
        _272 = dp4_f32(cb1._m39, _168);
    }
    precise float _279 = _272 + TEXCOORD5.x;
    precise float _280 = _271 + TEXCOORD5.y;
    precise float _281 = _270 + TEXCOORD5.z;
    precise float _285 = _154 - 0.039999999105930328369140625;
    precise float _286 = _155 - 0.039999999105930328369140625;
    precise float _287 = _156 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _285, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _286, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _287, 0.039999999105930328369140625);
    precise float _298 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _299 = _298 * _154;
    precise float _300 = _298 * _155;
    precise float _301 = _298 * _156;
    precise float _302 = spvNMax(_279, 0.0) * _299;
    precise float _303 = spvNMax(_280, 0.0) * _300;
    precise float _304 = spvNMax(_281, 0.0) * _301;
    SV_Target3.x = exp2(-_302);
    SV_Target3.y = exp2(-_303);
    SV_Target3.z = exp2(-_304);
    SV_Target.x = _299;
    SV_Target.y = _300;
    SV_Target.z = _301;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

