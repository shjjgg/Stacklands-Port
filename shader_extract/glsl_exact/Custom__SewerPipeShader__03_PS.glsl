#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    float _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec2 _m9;
    uvec2 _m10;
    vec4 _m11;
    uvec4 _m12;
    vec4 _m13;
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
    uvec4 _m39;
    uvec4 _m40;
    uvec4 _m41;
    uvec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    vec4 _m46;
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

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 0, component = 0) out vec4 SV_Target;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);
spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _96 = a.x * b.x;
    return fma(a.y, b.y, _96);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _78 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _78)));
}

void main()
{
    precise float _106 = TEXCOORD1.x * 1000.0;
    precise float _109 = sin(roundEven(_106)) * 43758.546875;
    precise float _111 = fract(_109) - 0.5;
    precise float _116 = _111 * cb0._m13.z;
    precise float _119 = fma(_116, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _120 = _119 * 500.0;
    precise float _123 = sin(roundEven(_120)) * 43758.546875;
    precise float _125 = fract(_123) - 0.5;
    precise float _126 = _125 * cb0._m13.z;
    precise float _127 = fma(_126, 0.004999999888241291046142578125, TEXCOORD1.x);
    precise float _132 = cb0._m11.x - cb0._m9.x;
    precise float _133 = fma(_132, 0.5, cb0._m9.x);
    float _139;
    float _144;
    _139 = 0.0;
    _144 = 100000.0;
    float _140;
    precise float _143;
    float _145;
    uint _147;
    float _142 = 0.0;
    uint _146 = 0u;
    for (;;)
    {
        if (int(_146) >= 3)
        {
            break;
        }
        bool _161 = _146 == 0u;
        float _167 = _161 ? cb0._m9.x : (((_146 >= 1u) && (_146 < 3u)) ? _133 : cb0._m11.x);
        float _168 = _161 ? cb0._m9.y : ((_146 == 1u) ? cb0._m9.y : cb0._m11.y);
        _147 = _146 + 1u;
        precise float _175 = (((_147 < 3u) && (_147 >= 1u)) ? _133 : cb0._m11.x) - _167;
        precise float _176 = ((_147 == 1u) ? cb0._m9.y : cb0._m11.y) - _168;
        precise float _177 = _127 - _167;
        precise float _178 = _119 - _168;
        vec2 _179 = vec2(_177, _178);
        vec2 _180 = vec2(_175, _176);
        float _182 = dp2_f32(_180, _180);
        precise float _183 = dp2_f32(_179, _180) / _182;
        precise float _184 = spvNClamp(_183, 0.0, 1.0);
        precise float _190 = -_184;
        vec2 _193 = vec2(fma(_190, _175, _177), fma(_190, _176, _178));
        precise float _196 = sqrt(dp2_f32(_193, _193)) * ((dp2_f32(vec2(_176, -_175), _179) > 0.0) ? 1.0 : (-1.0));
        precise float _197 = sqrt(_182);
        bool _200 = abs(_196) < abs(_144);
        _140 = _200 ? fma(_184, _197, _142) : _139;
        _145 = _200 ? _196 : _144;
        _143 = _142 + _197;
        _139 = _140;
        _142 = _143;
        _144 = _145;
        _146 = _147;
        continue;
    }
    precise float _202 = abs(_144);
    precise float _207 = abs(dFdx(_202)) + abs(dFdy(_202));
    precise float _208 = _139 * 3.5;
    bool _210 = fract(_208) > 0.800000011920928955078125;
    precise float _211 = _202 * 0.800000011920928955078125;
    float _213 = _210 ? _211 : _202;
    precise float _218 = cb0._m13.y + cb0._m13.x;
    precise float _219 = -_207;
    precise float _220 = fma(_219, 0.5, _218);
    precise float _221 = _213 - _220;
    precise float _223 = fma(_207, 0.5, _218) - _220;
    precise float _224 = _221 / _223;
    precise float _225 = spvNClamp(_224, 0.0, 1.0);
    float _237 = _210 ? cb0._m7.x : cb0._m4.x;
    float _238 = _210 ? cb0._m7.y : cb0._m4.y;
    float _239 = _210 ? cb0._m7.z : cb0._m4.z;
    precise float _240 = _218 * 0.300000011920928955078125;
    precise float _241 = _218 * 0.800000011920928955078125;
    precise float _242 = _218 * 0.5;
    precise float _243 = _218 * 1.10000002384185791015625;
    precise float _244 = -_144;
    precise float _253 = _237 * cb0._m13.w;
    precise float _254 = _238 * cb0._m13.w;
    precise float _255 = _239 * cb0._m13.w;
    bool _258 = (_210 && ((_244 < _243) && (_242 < _244))) || (((_240 < _244) && (_244 < _241)) && (!_210));
    float _259 = _258 ? _253 : _237;
    float _260 = _258 ? _254 : _238;
    float _261 = _258 ? _255 : _239;
    precise float _271 = cb0._m6.x - _259;
    precise float _272 = cb0._m6.y - _260;
    precise float _273 = cb0._m6.z - _261;
    precise float _274 = cb0._m6.w - cb0._m5;
    precise float _275 = fma(_225, _271, _259);
    precise float _276 = fma(_225, _272, _260);
    precise float _277 = fma(_225, _273, _261);
    precise float _278 = fma(_225, _274, cb0._m5);
    precise float _279 = fma(cb0._m13.y, 2.0, cb0._m13.x);
    precise float _280 = fma(_219, 0.5, _279);
    precise float _282 = _213 - _280;
    precise float _283 = fma(_207, 0.5, _279) - _280;
    precise float _284 = _282 / _283;
    precise float _285 = spvNClamp(_284, 0.0, 1.0);
    precise float _290 = fma(_285, -_275, _275);
    precise float _291 = fma(_285, -_276, _276);
    precise float _292 = fma(_285, -_277, _277);
    float _371;
    float _372;
    float _373;
    float _374;
    if (cb2._m0.x == 1.0)
    {
        bool _302 = cb2._m0.y == 1.0;
        precise float _310 = TEXCOORD1.y * cb2._m3.x;
        precise float _311 = TEXCOORD1.y * cb2._m3.y;
        precise float _312 = TEXCOORD1.y * cb2._m3.z;
        precise float _334 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _310)) + cb2._m7.x;
        precise float _335 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _311)) + cb2._m7.y;
        precise float _336 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _312)) + cb2._m7.z;
        precise float _345 = (_302 ? _334 : TEXCOORD1.x) - cb2._m11.x;
        precise float _346 = (_302 ? _335 : TEXCOORD1.y) - cb2._m11.y;
        precise float _347 = (_302 ? _336 : TEXCOORD1.z) - cb2._m11.z;
        precise float _353 = _345 * cb2._m9.x;
        precise float _354 = _346 * cb2._m9.y;
        precise float _355 = _347 * cb2._m9.z;
        vec4 _366 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_353, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _354, _355));
        _371 = _366.w;
        _372 = _366.z;
        _373 = _366.y;
        _374 = _366.x;
    }
    else
    {
        _371 = 1.0;
        _372 = 1.0;
        _373 = 1.0;
        _374 = 1.0;
    }
    precise float _380 = spvNClamp(dp4_f32(vec4(_374, _373, _372, _371), cb1._m46), 0.0, 1.0);
    precise float _387 = _290 * TEXCOORD2.x;
    precise float _388 = _291 * TEXCOORD2.y;
    precise float _389 = _292 * TEXCOORD2.z;
    precise float _390 = _290 * _380;
    precise float _391 = _291 * _380;
    precise float _392 = _292 * _380;
    SV_Target.x = fma(_390, cb0._m2.x, _387);
    SV_Target.y = fma(_391, cb0._m2.y, _388);
    SV_Target.z = fma(_392, cb0._m2.z, _389);
    SV_Target.w = fma(fma(_285, -_278, _278), cb0._m2.w, 0.0);
}

