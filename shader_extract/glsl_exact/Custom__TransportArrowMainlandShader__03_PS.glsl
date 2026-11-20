#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec2 _m7;
    uvec2 _m8;
    vec2 _m9;
    uvec2 _m10;
    vec2 _m11;
    uvec2 _m12;
    vec4 _m13;
    vec4 _m14;
    vec4 _m15;
    vec4 _m16;
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

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);
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
    float _129;
    float _134;
    _129 = 0.0;
    _134 = 100000.0;
    float _130;
    precise float _133;
    float _135;
    precise float _137;
    float _132 = 0.0;
    float _136 = 0.0;
    for (;;)
    {
        if (_136 > 1.0)
        {
            break;
        }
        precise float _144 = spvNMin(_136, 1.0);
        precise float _145 = 1.0 - _144;
        precise float _146 = _145 * _145;
        float _149 = dp2_f32(vec2(_144), vec2(_145));
        precise float _155 = _149 * cb0._m11.x;
        precise float _156 = _149 * cb0._m11.y;
        precise float _163 = _144 * _144;
        precise float _168 = fma(_163, cb0._m9.x, fma(_146, cb0._m7.x, _155));
        precise float _169 = fma(_163, cb0._m9.y, fma(_146, cb0._m7.y, _156));
        _137 = _136 + 0.100000001490116119384765625;
        precise float _170 = spvNMin(_137, 1.0);
        precise float _171 = 1.0 - _170;
        precise float _172 = _171 * _171;
        float _175 = dp2_f32(vec2(_170), vec2(_171));
        precise float _176 = _175 * cb0._m11.x;
        precise float _177 = _175 * cb0._m11.y;
        precise float _180 = _170 * _170;
        precise float _183 = fma(_180, cb0._m9.x, fma(_172, cb0._m7.x, _176)) - _168;
        precise float _184 = fma(_180, cb0._m9.y, fma(_172, cb0._m7.y, _177)) - _169;
        precise float _185 = _127 - _168;
        precise float _186 = _119 - _169;
        vec2 _187 = vec2(_185, _186);
        vec2 _188 = vec2(_183, _184);
        float _190 = dp2_f32(_188, _188);
        precise float _191 = dp2_f32(_187, _188) / _190;
        precise float _192 = spvNClamp(_191, 0.0, 1.0);
        precise float _198 = -_192;
        vec2 _201 = vec2(fma(_198, _183, _185), fma(_198, _184, _186));
        precise float _204 = sqrt(dp2_f32(_201, _201)) * ((dp2_f32(vec2(_184, -_183), _187) > 0.0) ? 1.0 : (-1.0));
        precise float _205 = sqrt(_190);
        bool _208 = abs(_204) < abs(_134);
        _130 = _208 ? fma(_192, _205, _132) : _129;
        _135 = _208 ? _204 : _134;
        _133 = _205 + _132;
        _129 = _130;
        _132 = _133;
        _134 = _135;
        _136 = _137;
        continue;
    }
    precise float _210 = abs(_134);
    precise float _215 = abs(dFdy(_210)) + abs(dFdx(_210));
    bool _218 = cb0._m14.y > 0.5;
    precise float _236 = _134 * 125.0;
    precise float _237 = _129 * 125.0;
    precise float _238 = _134 * 31250.0;
    precise float _241 = sin(roundEven(_238)) * 43758.546875;
    precise float _243 = fract(_241) - 0.5;
    precise float _246 = _243 * cb0._m14.x;
    precise float _247 = fma(_246, 0.004999999888241291046142578125, _237);
    precise float _248 = _247 * 250.0;
    precise float _251 = sin(roundEven(_248)) * 43758.546875;
    precise float _253 = fract(_251) - 0.5;
    precise float _254 = _253 * cb0._m14.x;
    precise float _256 = fma(_254, 0.004999999888241291046142578125, _236) * 0.800000011920928955078125;
    precise float _259 = sin(_247) * sin(_256);
    bool _260 = _259 > 0.1500000059604644775390625;
    float _271 = _260 ? (_218 ? cb0._m15.x : cb0._m6.x) : (_218 ? cb0._m15.x : cb0._m4.x);
    float _272 = _260 ? (_218 ? cb0._m15.y : cb0._m6.y) : (_218 ? cb0._m15.y : cb0._m4.y);
    float _273 = _260 ? (_218 ? cb0._m15.z : cb0._m6.z) : (_218 ? cb0._m15.z : cb0._m4.z);
    float _274 = _260 ? (_218 ? cb0._m15.w : cb0._m6.w) : (_218 ? cb0._m15.w : cb0._m4.w);
    precise float _279 = cb0._m13.y + cb0._m13.x;
    precise float _280 = -_215;
    precise float _281 = fma(_280, 0.5, _279);
    precise float _283 = fma(_215, 0.5, _279) - _281;
    precise float _284 = _210 - _281;
    precise float _285 = _284 / _283;
    precise float _286 = spvNClamp(_285, 0.0, 1.0);
    precise float _303 = (_218 ? cb0._m16.x : cb0._m5.x) - _271;
    precise float _304 = (_218 ? cb0._m16.y : cb0._m5.y) - _272;
    precise float _305 = (_218 ? cb0._m16.z : cb0._m5.z) - _273;
    precise float _306 = (_218 ? cb0._m16.w : cb0._m5.w) - _274;
    precise float _307 = fma(_286, _303, _271);
    precise float _308 = fma(_286, _304, _272);
    precise float _309 = fma(_286, _305, _273);
    precise float _310 = fma(_286, _306, _274);
    precise float _311 = fma(cb0._m13.y, 2.0, cb0._m13.x);
    precise float _312 = fma(_280, 0.5, _311);
    precise float _314 = fma(_215, 0.5, _311) - _312;
    precise float _315 = _210 - _312;
    precise float _316 = _315 / _314;
    precise float _317 = spvNClamp(_316, 0.0, 1.0);
    precise float _322 = fma(_317, -_307, _307);
    precise float _323 = fma(_317, -_308, _308);
    precise float _324 = fma(_317, -_309, _309);
    float _404;
    float _405;
    float _406;
    float _407;
    if (cb2._m0.x == 1.0)
    {
        bool _334 = cb2._m0.y == 1.0;
        precise float _343 = TEXCOORD1.y * cb2._m3.x;
        precise float _344 = TEXCOORD1.y * cb2._m3.y;
        precise float _345 = TEXCOORD1.y * cb2._m3.z;
        precise float _367 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _343)) + cb2._m7.x;
        precise float _368 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _344)) + cb2._m7.y;
        precise float _369 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _345)) + cb2._m7.z;
        precise float _378 = (_334 ? _367 : TEXCOORD1.x) - cb2._m11.x;
        precise float _379 = (_334 ? _368 : TEXCOORD1.y) - cb2._m11.y;
        precise float _380 = (_334 ? _369 : TEXCOORD1.z) - cb2._m11.z;
        precise float _386 = _378 * cb2._m9.x;
        precise float _387 = _379 * cb2._m9.y;
        precise float _388 = _380 * cb2._m9.z;
        vec4 _399 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_386, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _387, _388));
        _404 = _399.w;
        _405 = _399.z;
        _406 = _399.y;
        _407 = _399.x;
    }
    else
    {
        _404 = 1.0;
        _405 = 1.0;
        _406 = 1.0;
        _407 = 1.0;
    }
    precise float _413 = spvNClamp(dp4_f32(vec4(_407, _406, _405, _404), cb1._m46), 0.0, 1.0);
    precise float _420 = _322 * TEXCOORD2.x;
    precise float _421 = _323 * TEXCOORD2.y;
    precise float _422 = _324 * TEXCOORD2.z;
    precise float _423 = _322 * _413;
    precise float _424 = _323 * _413;
    precise float _425 = _324 * _413;
    SV_Target.x = fma(_423, cb0._m2.x, _420);
    SV_Target.y = fma(_424, cb0._m2.y, _421);
    SV_Target.z = fma(_425, cb0._m2.z, _422);
    SV_Target.w = fma(fma(_317, -_310, _310), cb0._m2.w, 0.0);
}

