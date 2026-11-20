#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    vec4 _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
    vec4 _m14;
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

layout(location = 1, component = 0) in vec2 TEXCOORD;
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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _135 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _135));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _118 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _118)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _106 = a.x * b.x;
    return fma(a.y, b.y, _106);
}

void main()
{
    precise float _159 = cb1._m4.x - TEXCOORD2.x;
    precise float _160 = cb1._m4.y - TEXCOORD2.y;
    precise float _161 = cb1._m4.z - TEXCOORD2.z;
    vec3 _162 = vec3(_159, _160, _161);
    precise float _164 = inversesqrt(dp3_f32(_162, _162));
    precise float _165 = _164 * _159;
    precise float _166 = _164 * _160;
    precise float _167 = _164 * _161;
    precise float _170 = TEXCOORD.y * 150.0;
    precise float _173 = sin(roundEven(_170)) * 43758.546875;
    precise float _175 = fract(_173) - 0.5;
    precise float _178 = fma(_175, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _179 = _178 * 150.0;
    precise float _182 = sin(roundEven(_179)) * 43758.546875;
    precise float _184 = fract(_182) - 0.5;
    precise float _185 = fma(_184, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _194 = abs(dFdx(_178)) + abs(dFdy(_178));
    precise float _195 = abs(dFdx(_185)) + abs(dFdy(_185));
    precise float _196 = _195 * 0.2666666805744171142578125;
    precise float _197 = _185 - 0.5;
    precise float _198 = _178 - 0.02999999932944774627685546875;
    precise float _200 = fma(-_198, 1.06382977962493896484375, 1.0);
    precise float _201 = _198 / _194;
    precise float _203 = 0.9700000286102294921875 - _178;
    precise float _204 = _203 / _194;
    precise float _206 = spvNClamp(_204, 0.0, 1.0) * spvNClamp(_201, 0.0, 1.0);
    precise float _209 = fma(_197, 0.2666666805744171142578125, 0.069999992847442626953125) / _196;
    precise float _211 = _206 * spvNClamp(_209, 0.0, 1.0);
    precise float _212 = 0.569999992847442626953125 - fma(_197, 0.2666666805744171142578125, 0.5);
    precise float _213 = _212 / _196;
    precise float _215 = _211 * spvNClamp(_213, 0.0, 1.0);
    precise float _227 = cb0._m8.x - cb0._m6.x;
    precise float _228 = cb0._m8.y - cb0._m6.y;
    precise float _229 = cb0._m8.z - cb0._m6.z;
    precise float _230 = fma(_215, _227, cb0._m6.x);
    precise float _231 = fma(_215, _228, cb0._m6.y);
    precise float _232 = fma(_215, _229, cb0._m6.z);
    float _238 = float(cb0._m14.x >= 0.5);
    precise float _249 = cb0._m12.x - cb0._m10.x;
    precise float _250 = cb0._m12.y - cb0._m10.y;
    precise float _251 = cb0._m12.z - cb0._m10.z;
    precise float _257 = _200 - cb0._m14.y;
    precise float _262 = abs(dFdy(_200)) + abs(dFdx(_200));
    precise float _263 = _257 / _262;
    float _266 = (_215 <= 0.0) ? 0.0 : spvNClamp(_263, 0.0, 1.0);
    precise float _267 = fma(_238, _249, cb0._m10.x) - _230;
    precise float _268 = fma(_238, _250, cb0._m10.y) - _231;
    precise float _269 = fma(_238, _251, cb0._m10.z) - _232;
    precise float _270 = fma(_266, _267, _230);
    precise float _271 = fma(_266, _268, _231);
    precise float _272 = fma(_266, _269, _232);
    float _348;
    float _349;
    float _350;
    float _351;
    if (cb4._m0.x == 1.0)
    {
        bool _281 = cb4._m0.y == 1.0;
        precise float _287 = TEXCOORD2.y * cb4._m3.x;
        precise float _288 = TEXCOORD2.y * cb4._m3.y;
        precise float _289 = TEXCOORD2.y * cb4._m3.z;
        precise float _311 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _287)) + cb4._m7.x;
        precise float _312 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _288)) + cb4._m7.y;
        precise float _313 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _289)) + cb4._m7.z;
        precise float _322 = (_281 ? _311 : TEXCOORD2.x) - cb4._m11.x;
        precise float _323 = (_281 ? _312 : TEXCOORD2.y) - cb4._m11.y;
        precise float _324 = (_281 ? _313 : TEXCOORD2.z) - cb4._m11.z;
        precise float _330 = _322 * cb4._m9.x;
        precise float _331 = _323 * cb4._m9.y;
        precise float _332 = _324 * cb4._m9.z;
        vec4 _343 = texture(sampler3D(t2, s1), vec3(spvNMax(fma(_330, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _331, _332));
        _348 = _343.w;
        _349 = _343.z;
        _350 = _343.y;
        _351 = _343.x;
    }
    else
    {
        _348 = 1.0;
        _349 = 1.0;
        _350 = 1.0;
        _351 = 1.0;
    }
    precise float _358 = spvNClamp(dp4_f32(vec4(_351, _350, _349, _348), cb2._m47), 0.0, 1.0);
    precise float _361 = 1.0 - cb0._m5.x;
    precise float _362 = -_165;
    precise float _363 = -_166;
    precise float _364 = -_167;
    vec3 _372 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _373 = dp3_f32(vec3(_362, _363, _364), _372);
    precise float _374 = _373 + _373;
    precise float _375 = -_374;
    precise float _376 = fma(TEXCOORD1.x, _375, _362);
    precise float _377 = fma(TEXCOORD1.y, _375, _363);
    precise float _378 = fma(TEXCOORD1.z, _375, _364);
    precise float _384 = _358 * cb0._m2.x;
    precise float _385 = _358 * cb0._m2.y;
    precise float _386 = _358 * cb0._m2.z;
    vec3 _391 = vec3(_376, _377, _378);
    float _440;
    float _441;
    float _442;
    if (cb3._m5 > 0.0)
    {
        precise float _395 = inversesqrt(dp3_f32(_391, _391));
        precise float _396 = _395 * _376;
        precise float _397 = _395 * _377;
        precise float _398 = _395 * _378;
        precise float _404 = cb3._m0.x - TEXCOORD2.x;
        precise float _405 = cb3._m0.y - TEXCOORD2.y;
        precise float _406 = cb3._m0.z - TEXCOORD2.z;
        precise float _407 = _404 / _396;
        precise float _408 = _405 / _397;
        precise float _409 = _406 / _398;
        precise float _415 = cb3._m2.x - TEXCOORD2.x;
        precise float _416 = cb3._m2.y - TEXCOORD2.y;
        precise float _417 = cb3._m2.z - TEXCOORD2.z;
        precise float _418 = _415 / _396;
        precise float _419 = _416 / _397;
        precise float _420 = _417 / _398;
        precise float _428 = spvNMin((_398 > 0.0) ? _409 : _420, spvNMin((_397 > 0.0) ? _408 : _419, (_396 > 0.0) ? _407 : _418));
        precise float _434 = TEXCOORD2.x - cb3._m4.x;
        precise float _435 = TEXCOORD2.y - cb3._m4.y;
        precise float _436 = TEXCOORD2.z - cb3._m4.z;
        _440 = fma(_398, _428, _436);
        _441 = fma(_397, _428, _435);
        _442 = fma(_396, _428, _434);
    }
    else
    {
        _440 = _378;
        _441 = _377;
        _442 = _376;
    }
    precise float _445 = fma(-_361, 0.699999988079071044921875, 1.7000000476837158203125) * _361;
    precise float _446 = _445 * 6.0;
    vec4 _452 = textureLod(samplerCube(t0, s0), vec3(_442, _441, _440), _446);
    float _453 = _452.x;
    float _454 = _452.y;
    float _455 = _452.z;
    precise float _457 = _452.w - 1.0;
    precise float _464 = log2(fma(cb3._m6.w, _457, 1.0)) * cb3._m6.y;
    precise float _468 = exp2(_464) * cb3._m6.x;
    precise float _469 = _453 * _468;
    precise float _470 = _454 * _468;
    precise float _471 = _455 * _468;
    float _563;
    float _564;
    float _565;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _528;
        float _529;
        float _530;
        if (cb3._m12 > 0.0)
        {
            precise float _483 = inversesqrt(dp3_f32(_391, _391));
            precise float _484 = _376 * _483;
            precise float _485 = _377 * _483;
            precise float _486 = _378 * _483;
            precise float _492 = cb3._m7.x - TEXCOORD2.x;
            precise float _493 = cb3._m7.y - TEXCOORD2.y;
            precise float _494 = cb3._m7.z - TEXCOORD2.z;
            precise float _495 = _492 / _484;
            precise float _496 = _493 / _485;
            precise float _497 = _494 / _486;
            precise float _503 = cb3._m9.x - TEXCOORD2.x;
            precise float _504 = cb3._m9.y - TEXCOORD2.y;
            precise float _505 = cb3._m9.z - TEXCOORD2.z;
            precise float _506 = _503 / _484;
            precise float _507 = _504 / _485;
            precise float _508 = _505 / _486;
            precise float _516 = spvNMin((_486 > 0.0) ? _497 : _508, spvNMin((_485 > 0.0) ? _496 : _507, (_484 > 0.0) ? _495 : _506));
            precise float _522 = TEXCOORD2.x - cb3._m11.x;
            precise float _523 = TEXCOORD2.y - cb3._m11.y;
            precise float _524 = TEXCOORD2.z - cb3._m11.z;
            _528 = fma(_486, _516, _524);
            _529 = fma(_485, _516, _523);
            _530 = fma(_484, _516, _522);
        }
        else
        {
            _528 = _378;
            _529 = _377;
            _530 = _376;
        }
        vec4 _534 = textureLod(samplerCube(t1, s0), vec3(_530, _529, _528), _446);
        precise float _539 = _534.w - 1.0;
        precise float _546 = log2(fma(cb3._m13.w, _539, 1.0)) * cb3._m13.y;
        precise float _550 = exp2(_546) * cb3._m13.x;
        precise float _551 = _534.x * _550;
        precise float _552 = _534.y * _550;
        precise float _553 = _534.z * _550;
        _563 = fma(cb3._m3, fma(_468, _455, -_553), _553);
        _564 = fma(cb3._m3, fma(_468, _454, -_552), _552);
        _565 = fma(cb3._m3, fma(_468, _453, -_551), _551);
    }
    else
    {
        _563 = _471;
        _564 = _470;
        _565 = _469;
    }
    precise float _567 = inversesqrt(dp3_f32(_372, _372));
    precise float _568 = _567 * TEXCOORD1.x;
    precise float _569 = _567 * TEXCOORD1.y;
    precise float _570 = _567 * TEXCOORD1.z;
    precise float _571 = _270 - 0.039999999105930328369140625;
    precise float _572 = _271 - 0.039999999105930328369140625;
    precise float _573 = _272 - 0.039999999105930328369140625;
    precise float _576 = fma(cb0._m5.y, _571, 0.039999999105930328369140625);
    precise float _577 = fma(cb0._m5.y, _572, 0.039999999105930328369140625);
    precise float _578 = fma(cb0._m5.y, _573, 0.039999999105930328369140625);
    precise float _580 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _581 = _580 * _270;
    precise float _582 = _580 * _271;
    precise float _583 = _580 * _272;
    precise float _589 = fma(_159, _164, cb2._m0.x);
    precise float _590 = fma(_160, _164, cb2._m0.y);
    precise float _591 = fma(_161, _164, cb2._m0.z);
    vec3 _592 = vec3(_589, _590, _591);
    precise float _595 = inversesqrt(spvNMax(dp3_f32(_592, _592), 0.001000000047497451305389404296875));
    precise float _596 = _595 * _589;
    precise float _597 = _595 * _590;
    precise float _598 = _595 * _591;
    vec3 _599 = vec3(_568, _569, _570);
    precise float _603 = spvNClamp(dp3_f32(_599, cb2._m0), 0.0, 1.0);
    vec3 _604 = vec3(_596, _597, _598);
    precise float _606 = spvNClamp(dp3_f32(_599, _604), 0.0, 1.0);
    precise float _608 = spvNClamp(dp3_f32(cb2._m0, _604), 0.0, 1.0);
    precise float _609 = _608 * _608;
    precise float _613 = dp2_f32(vec2(_609), vec2(_361)) - 0.5;
    precise float _614 = 1.0 - _603;
    precise float _615 = _614 * _614;
    precise float _616 = _615 * _615;
    precise float _617 = _614 * _616;
    precise float _619 = abs(dp3_f32(_599, vec3(_165, _166, _167)));
    precise float _620 = 1.0 - _619;
    precise float _621 = _620 * _620;
    precise float _622 = _621 * _621;
    precise float _623 = _620 * _622;
    precise float _625 = fma(_613, _623, 1.0) * fma(_613, _617, 1.0);
    precise float _626 = _361 * _361;
    precise float _627 = spvNMax(_626, 0.00200000009499490261077880859375);
    precise float _628 = 1.0 - _627;
    precise float _631 = _619 * fma(_603, _628, _627);
    precise float _633 = fma(_603, fma(_619, _628, _627), _631) + 9.9999997473787516355514526367188e-06;
    precise float _634 = 0.5 / _633;
    precise float _635 = _627 * _627;
    precise float _638 = fma(fma(_606, _635, -_606), _606, 1.0);
    precise float _639 = _635 * 0.3183098733425140380859375;
    precise float _641 = _639 / fma(_638, _638, 1.0000000116860974230803549289703e-07);
    precise float _642 = _634 * _641;
    precise float _643 = _642 * 3.1415927410125732421875;
    precise float _644 = _603 * _625;
    precise float _645 = _603 * _643;
    precise float _648 = 1.0 / fma(_627, _627, 1.0);
    vec3 _649 = vec3(_576, _577, _578);
    precise float _653 = spvNMax(_645, 0.0) * ((dp3_f32(_649, _649) == 0.0) ? 0.0 : 1.0);
    precise float _654 = 1.0 - _580;
    precise float _655 = _654 + cb0._m5.x;
    precise float _656 = spvNClamp(_655, 0.0, 1.0);
    precise float _657 = _644 * _384;
    precise float _658 = _644 * _385;
    precise float _659 = _644 * _386;
    precise float _660 = _384 * _653;
    precise float _661 = _385 * _653;
    precise float _662 = _386 * _653;
    precise float _663 = 1.0 - _608;
    precise float _664 = _663 * _663;
    precise float _665 = _664 * _664;
    precise float _666 = _663 * _665;
    precise float _667 = 1.0 - _576;
    precise float _668 = 1.0 - _577;
    precise float _669 = 1.0 - _578;
    precise float _673 = fma(_667, _666, _576) * _660;
    precise float _674 = fma(_668, _666, _577) * _661;
    precise float _675 = fma(_669, _666, _578) * _662;
    precise float _679 = _565 * _648;
    precise float _680 = _564 * _648;
    precise float _681 = _563 * _648;
    precise float _682 = _656 - _576;
    precise float _683 = _656 - _577;
    precise float _684 = _656 - _578;
    SV_Target.x = fma(_679, fma(_623, _682, _576), fma(_581, _657, _673));
    SV_Target.y = fma(_680, fma(_623, _683, _577), fma(_582, _658, _674));
    SV_Target.z = fma(_681, fma(_623, _684, _578), fma(_583, _659, _675));
    SV_Target.w = 1.0;
}

