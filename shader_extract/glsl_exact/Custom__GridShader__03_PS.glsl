#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, scalar) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    vec4 _m5;
    vec3 _m6;
    uint _m7;
    float _m8;
    vec2 _m9;
    float _m10;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    vec3 _m0;
    uint _m1;
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
    uvec4 _m46;
    vec4 _m47;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    vec3 _m0;
    uint _m1;
    vec3 _m2;
    float _m3;
    vec3 _m4;
    float _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    float _m12;
    vec4 _m13;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
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
} cb4;

layout(set = 0, binding = 5) uniform sampler s0;
layout(set = 0, binding = 6) uniform sampler s1;
layout(set = 0, binding = 7) uniform textureCube t0;
layout(set = 0, binding = 8) uniform textureCube t1;
layout(set = 0, binding = 9) uniform texture3D t2;

layout(location = 1, component = 0) in vec3 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _124 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _124));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _107 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _107)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _95 = a.x * b.x;
    return fma(a.y, b.y, _95);
}

void main()
{
    precise float _148 = cb1._m4.x - TEXCOORD1.x;
    precise float _149 = cb1._m4.y - TEXCOORD1.y;
    precise float _150 = cb1._m4.z - TEXCOORD1.z;
    vec3 _151 = vec3(_148, _149, _150);
    precise float _153 = inversesqrt(dp3_f32(_151, _151));
    precise float _154 = _153 * _148;
    precise float _155 = _153 * _149;
    precise float _156 = _153 * _150;
    precise float _163 = TEXCOORD1.x / cb0._m9.x;
    precise float _164 = TEXCOORD1.z / cb0._m9.y;
    precise float _167 = fract(_163) + 0.5;
    precise float _168 = fract(_164) + 0.5;
    precise float _172 = fract(_167);
    precise float _173 = fract(_168);
    float _176 = (_167 >= 0.0) ? _172 : (-_172);
    float _177 = (_168 >= 0.0) ? _173 : (-_173);
    precise float _181 = cb0._m8 - 0.00999999977648258209228515625;
    precise float _182 = _176 - _181;
    precise float _183 = _177 - _181;
    precise float _184 = _182 * 50.0;
    precise float _185 = _183 * 50.0;
    precise float _186 = spvNClamp(_184, 0.0, 1.0);
    precise float _187 = spvNClamp(_185, 0.0, 1.0);
    precise float _190 = _186 * _186;
    precise float _191 = _187 * _187;
    precise float _192 = _190 * fma(_186, -2.0, 3.0);
    precise float _193 = _191 * fma(_187, -2.0, 3.0);
    precise float _194 = _193 * _192;
    precise float _195 = _181 + _176;
    precise float _196 = _181 + _177;
    precise float _197 = 1.0 - _195;
    precise float _198 = 1.0 - _196;
    precise float _199 = _197 * 50.0;
    precise float _200 = _198 * 50.0;
    precise float _201 = spvNClamp(_199, 0.0, 1.0);
    precise float _202 = spvNClamp(_200, 0.0, 1.0);
    precise float _205 = _201 * _201;
    precise float _206 = _202 * _202;
    precise float _207 = _205 * fma(_201, -2.0, 3.0);
    precise float _208 = _206 * fma(_202, -2.0, 3.0);
    precise float _209 = _207 * _194;
    precise float _214 = fma(-_209, _208, 1.0) * cb0._m10;
    precise float _215 = _214 * 0.5;
    float _291;
    float _292;
    float _293;
    float _294;
    if (cb4._m0.x == 1.0)
    {
        bool _224 = cb4._m0.y == 1.0;
        precise float _230 = TEXCOORD1.y * cb4._m3.x;
        precise float _231 = TEXCOORD1.y * cb4._m3.y;
        precise float _232 = TEXCOORD1.y * cb4._m3.z;
        precise float _254 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _230)) + cb4._m7.x;
        precise float _255 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _231)) + cb4._m7.y;
        precise float _256 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _232)) + cb4._m7.z;
        precise float _265 = (_224 ? _254 : TEXCOORD1.x) - cb4._m11.x;
        precise float _266 = (_224 ? _255 : TEXCOORD1.y) - cb4._m11.y;
        precise float _267 = (_224 ? _256 : TEXCOORD1.z) - cb4._m11.z;
        precise float _273 = _265 * cb4._m9.x;
        precise float _274 = _266 * cb4._m9.y;
        precise float _275 = _267 * cb4._m9.z;
        vec4 _286 = texture(sampler3D(t2, s1), vec3(spvNMax(fma(_273, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _274, _275));
        _291 = _286.w;
        _292 = _286.z;
        _293 = _286.y;
        _294 = _286.x;
    }
    else
    {
        _291 = 1.0;
        _292 = 1.0;
        _293 = 1.0;
        _294 = 1.0;
    }
    precise float _301 = spvNClamp(dp4_f32(vec4(_294, _293, _292, _291), cb2._m47), 0.0, 1.0);
    precise float _304 = 1.0 - cb0._m5.x;
    precise float _305 = -_154;
    precise float _306 = -_155;
    precise float _307 = -_156;
    vec3 _315 = vec3(TEXCOORD.x, TEXCOORD.y, TEXCOORD.z);
    float _316 = dp3_f32(vec3(_305, _306, _307), _315);
    precise float _317 = _316 + _316;
    precise float _318 = -_317;
    precise float _319 = fma(TEXCOORD.x, _318, _305);
    precise float _320 = fma(TEXCOORD.y, _318, _306);
    precise float _321 = fma(TEXCOORD.z, _318, _307);
    precise float _327 = _301 * cb0._m2.x;
    precise float _328 = _301 * cb0._m2.y;
    precise float _329 = _301 * cb0._m2.z;
    vec3 _334 = vec3(_319, _320, _321);
    float _383;
    float _384;
    float _385;
    if (cb3._m5 > 0.0)
    {
        precise float _338 = inversesqrt(dp3_f32(_334, _334));
        precise float _339 = _338 * _319;
        precise float _340 = _338 * _320;
        precise float _341 = _338 * _321;
        precise float _347 = cb3._m0.x - TEXCOORD1.x;
        precise float _348 = cb3._m0.y - TEXCOORD1.y;
        precise float _349 = cb3._m0.z - TEXCOORD1.z;
        precise float _350 = _347 / _339;
        precise float _351 = _348 / _340;
        precise float _352 = _349 / _341;
        precise float _358 = cb3._m2.x - TEXCOORD1.x;
        precise float _359 = cb3._m2.y - TEXCOORD1.y;
        precise float _360 = cb3._m2.z - TEXCOORD1.z;
        precise float _361 = _358 / _339;
        precise float _362 = _359 / _340;
        precise float _363 = _360 / _341;
        precise float _371 = spvNMin((_341 > 0.0) ? _352 : _363, spvNMin((_340 > 0.0) ? _351 : _362, (_339 > 0.0) ? _350 : _361));
        precise float _377 = TEXCOORD1.x - cb3._m4.x;
        precise float _378 = TEXCOORD1.y - cb3._m4.y;
        precise float _379 = TEXCOORD1.z - cb3._m4.z;
        _383 = fma(_341, _371, _379);
        _384 = fma(_340, _371, _378);
        _385 = fma(_339, _371, _377);
    }
    else
    {
        _383 = _321;
        _384 = _320;
        _385 = _319;
    }
    precise float _388 = _304 * fma(-_304, 0.699999988079071044921875, 1.7000000476837158203125);
    precise float _389 = _388 * 6.0;
    vec4 _395 = textureLod(samplerCube(t0, s0), vec3(_385, _384, _383), _389);
    float _396 = _395.x;
    float _397 = _395.y;
    float _398 = _395.z;
    precise float _400 = _395.w - 1.0;
    precise float _407 = log2(fma(cb3._m6.w, _400, 1.0)) * cb3._m6.y;
    precise float _411 = exp2(_407) * cb3._m6.x;
    precise float _412 = _396 * _411;
    precise float _413 = _397 * _411;
    precise float _414 = _398 * _411;
    float _506;
    float _507;
    float _508;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _471;
        float _472;
        float _473;
        if (cb3._m12 > 0.0)
        {
            precise float _426 = inversesqrt(dp3_f32(_334, _334));
            precise float _427 = _319 * _426;
            precise float _428 = _320 * _426;
            precise float _429 = _321 * _426;
            precise float _435 = cb3._m7.x - TEXCOORD1.x;
            precise float _436 = cb3._m7.y - TEXCOORD1.y;
            precise float _437 = cb3._m7.z - TEXCOORD1.z;
            precise float _438 = _435 / _427;
            precise float _439 = _436 / _428;
            precise float _440 = _437 / _429;
            precise float _446 = cb3._m9.x - TEXCOORD1.x;
            precise float _447 = cb3._m9.y - TEXCOORD1.y;
            precise float _448 = cb3._m9.z - TEXCOORD1.z;
            precise float _449 = _446 / _427;
            precise float _450 = _447 / _428;
            precise float _451 = _448 / _429;
            precise float _459 = spvNMin((_429 > 0.0) ? _440 : _451, spvNMin((_428 > 0.0) ? _439 : _450, (_427 > 0.0) ? _438 : _449));
            precise float _465 = TEXCOORD1.x - cb3._m11.x;
            precise float _466 = TEXCOORD1.y - cb3._m11.y;
            precise float _467 = TEXCOORD1.z - cb3._m11.z;
            _471 = fma(_429, _459, _467);
            _472 = fma(_428, _459, _466);
            _473 = fma(_427, _459, _465);
        }
        else
        {
            _471 = _321;
            _472 = _320;
            _473 = _319;
        }
        vec4 _477 = textureLod(samplerCube(t1, s0), vec3(_473, _472, _471), _389);
        precise float _482 = _477.w - 1.0;
        precise float _489 = log2(fma(cb3._m13.w, _482, 1.0)) * cb3._m13.y;
        precise float _493 = exp2(_489) * cb3._m13.x;
        precise float _494 = _477.x * _493;
        precise float _495 = _477.y * _493;
        precise float _496 = _477.z * _493;
        _506 = fma(cb3._m3, fma(_411, _398, -_496), _496);
        _507 = fma(cb3._m3, fma(_411, _397, -_495), _495);
        _508 = fma(cb3._m3, fma(_411, _396, -_494), _494);
    }
    else
    {
        _506 = _414;
        _507 = _413;
        _508 = _412;
    }
    precise float _510 = inversesqrt(dp3_f32(_315, _315));
    precise float _511 = _510 * TEXCOORD.x;
    precise float _512 = _510 * TEXCOORD.y;
    precise float _513 = _510 * TEXCOORD.z;
    precise float _519 = cb0._m6.x - 0.039999999105930328369140625;
    precise float _520 = cb0._m6.y - 0.039999999105930328369140625;
    precise float _521 = cb0._m6.z - 0.039999999105930328369140625;
    precise float _524 = fma(cb0._m5.y, _519, 0.039999999105930328369140625);
    precise float _525 = fma(cb0._m5.y, _520, 0.039999999105930328369140625);
    precise float _526 = fma(cb0._m5.y, _521, 0.039999999105930328369140625);
    precise float _528 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _529 = _528 * cb0._m6.x;
    precise float _530 = _528 * cb0._m6.y;
    precise float _531 = _528 * cb0._m6.z;
    precise float _532 = _215 * _529;
    precise float _533 = _215 * _530;
    precise float _534 = _215 * _531;
    precise float _535 = 1.0 - _528;
    SV_Target.w = fma(_215, _528, _535);
    precise float _544 = fma(_148, _153, cb2._m0.x);
    precise float _545 = fma(_149, _153, cb2._m0.y);
    precise float _546 = fma(_150, _153, cb2._m0.z);
    vec3 _547 = vec3(_544, _545, _546);
    precise float _550 = inversesqrt(spvNMax(dp3_f32(_547, _547), 0.001000000047497451305389404296875));
    precise float _551 = _550 * _544;
    precise float _552 = _550 * _545;
    precise float _553 = _550 * _546;
    vec3 _554 = vec3(_511, _512, _513);
    precise float _558 = spvNClamp(dp3_f32(_554, cb2._m0), 0.0, 1.0);
    vec3 _559 = vec3(_551, _552, _553);
    precise float _561 = spvNClamp(dp3_f32(_554, _559), 0.0, 1.0);
    precise float _563 = spvNClamp(dp3_f32(cb2._m0, _559), 0.0, 1.0);
    precise float _564 = _563 * _563;
    precise float _568 = dp2_f32(vec2(_564), vec2(_304)) - 0.5;
    precise float _569 = 1.0 - _558;
    precise float _570 = _569 * _569;
    precise float _571 = _570 * _570;
    precise float _572 = _569 * _571;
    precise float _574 = abs(dp3_f32(_554, vec3(_154, _155, _156)));
    precise float _575 = 1.0 - _574;
    precise float _576 = _575 * _575;
    precise float _577 = _576 * _576;
    precise float _578 = _575 * _577;
    precise float _580 = fma(_568, _578, 1.0) * fma(_568, _572, 1.0);
    precise float _581 = _304 * _304;
    precise float _582 = spvNMax(_581, 0.00200000009499490261077880859375);
    precise float _583 = 1.0 - _582;
    precise float _586 = _574 * fma(_558, _583, _582);
    precise float _588 = fma(_558, fma(_574, _583, _582), _586) + 9.9999997473787516355514526367188e-06;
    precise float _589 = 0.5 / _588;
    precise float _590 = _582 * _582;
    precise float _593 = fma(fma(_561, _590, -_561), _561, 1.0);
    precise float _594 = _590 * 0.3183098733425140380859375;
    precise float _596 = _594 / fma(_593, _593, 1.0000000116860974230803549289703e-07);
    precise float _597 = _589 * _596;
    precise float _598 = _597 * 3.1415927410125732421875;
    precise float _599 = _558 * _580;
    precise float _600 = _558 * _598;
    precise float _603 = 1.0 / fma(_582, _582, 1.0);
    vec3 _604 = vec3(_524, _525, _526);
    precise float _608 = spvNMax(_600, 0.0) * ((dp3_f32(_604, _604) == 0.0) ? 0.0 : 1.0);
    precise float _609 = _535 + cb0._m5.x;
    precise float _610 = spvNClamp(_609, 0.0, 1.0);
    precise float _611 = _599 * _327;
    precise float _612 = _599 * _328;
    precise float _613 = _599 * _329;
    precise float _614 = _327 * _608;
    precise float _615 = _328 * _608;
    precise float _616 = _329 * _608;
    precise float _617 = 1.0 - _563;
    precise float _618 = _617 * _617;
    precise float _619 = _618 * _618;
    precise float _620 = _617 * _619;
    precise float _621 = 1.0 - _524;
    precise float _622 = 1.0 - _525;
    precise float _623 = 1.0 - _526;
    precise float _627 = fma(_621, _620, _524) * _614;
    precise float _628 = fma(_622, _620, _525) * _615;
    precise float _629 = fma(_623, _620, _526) * _616;
    precise float _633 = _508 * _603;
    precise float _634 = _507 * _603;
    precise float _635 = _506 * _603;
    precise float _636 = _610 - _524;
    precise float _637 = _610 - _525;
    precise float _638 = _610 - _526;
    SV_Target.x = fma(_633, fma(_578, _636, _524), fma(_532, _611, _627));
    SV_Target.y = fma(_634, fma(_578, _637, _525), fma(_533, _612, _628));
    SV_Target.z = fma(_635, fma(_578, _638, _526), fma(_534, _613, _629));
}

