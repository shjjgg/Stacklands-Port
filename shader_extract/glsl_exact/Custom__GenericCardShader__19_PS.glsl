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
    vec2 _m8;
    uvec2 _m9;
    vec4 _m10;
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
    vec4 _m40;
    vec4 _m41;
    vec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    uvec4 _m46;
    vec4 _m47;
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
    uvec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    uvec4 _m20;
    uvec4 _m21;
    uvec4 _m22;
    uvec4 _m23;
    vec4 _m24;
    vec3 _m25;
    float _m26;
} cb3;

layout(set = 0, binding = 4, std140) uniform cb4_buf
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
    vec4 _m9;
    vec4 _m10;
    vec4 _m11;
} cb4;

layout(set = 0, binding = 5, std140) uniform cb5_buf
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
} cb5;

layout(set = 0, binding = 6, std140) uniform cb6_buf
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
} cb6;

layout(set = 0, binding = 7) uniform sampler s0;
layout(set = 0, binding = 8) uniform sampler s1;
layout(set = 0, binding = 9) uniform sampler s2;
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform textureCube t1;
layout(set = 0, binding = 12) uniform textureCube t2;
layout(set = 0, binding = 13) uniform texture3D t3;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
layout(location = 5, component = 0) in vec4 TEXCOORD5;
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
    precise float _152 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _152));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _141 = a.x * b.x;
    return fma(a.y, b.y, _141);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _123 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _123)));
}

void main()
{
    precise float _176 = cb1._m4.x - TEXCOORD2.x;
    precise float _177 = cb1._m4.y - TEXCOORD2.y;
    precise float _178 = cb1._m4.z - TEXCOORD2.z;
    vec3 _179 = vec3(_176, _177, _178);
    precise float _181 = inversesqrt(dp3_f32(_179, _179));
    precise float _182 = _181 * _176;
    precise float _183 = _181 * _177;
    precise float _184 = _181 * _178;
    precise float _187 = TEXCOORD.y - 0.5;
    precise float _188 = _187 * 0.3333333432674407958984375;
    precise float _189 = _187 * 150.0;
    precise float _194 = abs(dFdx(_188)) + abs(dFdy(_188));
    precise float _197 = sin(roundEven(_189)) * 43758.546875;
    precise float _199 = fract(_197) - 0.5;
    precise float _202 = fma(_199, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _203 = _202 * 150.0;
    precise float _206 = sin(roundEven(_203)) * 43758.546875;
    precise float _208 = fract(_206) - 0.5;
    precise float _219 = cb0._m8.x - cb0._m10.x;
    precise float _220 = cb0._m8.y - cb0._m10.x;
    precise float _223 = abs(_202) - _219;
    precise float _224 = abs(fma(_208, 0.00166666670702397823333740234375, _188)) - _220;
    vec2 _227 = vec2(spvNMax(_223, 0.0), spvNMax(_224, 0.0));
    precise float _230 = sqrt(dp2_f32(_227, _227)) / _194;
    precise float _231 = spvNMin(_230, 1.0);
    precise float _240 = fma(_231, -cb0._m6.x, cb0._m6.x);
    precise float _241 = fma(_231, -cb0._m6.y, cb0._m6.y);
    precise float _242 = fma(_231, -cb0._m6.z, cb0._m6.z);
    float _251 = dp3_f32(_179, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _258 = TEXCOORD2.x - cb3._m25.x;
    precise float _259 = TEXCOORD2.y - cb3._m25.y;
    precise float _260 = TEXCOORD2.z - cb3._m25.z;
    vec3 _261 = vec3(_258, _259, _260);
    precise float _264 = sqrt(dp3_f32(_261, _261)) - _251;
    bool _277 = cb6._m0.x == 1.0;
    float _350;
    float _351;
    float _352;
    float _353;
    if (_277)
    {
        bool _285 = cb6._m0.y == 1.0;
        precise float _291 = TEXCOORD2.y * cb6._m3.x;
        precise float _292 = TEXCOORD2.y * cb6._m3.y;
        precise float _293 = TEXCOORD2.y * cb6._m3.z;
        precise float _315 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _291)) + cb6._m7.x;
        precise float _316 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _292)) + cb6._m7.y;
        precise float _317 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _293)) + cb6._m7.z;
        precise float _326 = (_285 ? _315 : TEXCOORD2.x) - cb6._m11.x;
        precise float _327 = (_285 ? _316 : TEXCOORD2.y) - cb6._m11.y;
        precise float _328 = (_285 ? _317 : TEXCOORD2.z) - cb6._m11.z;
        precise float _334 = _326 * cb6._m9.x;
        precise float _335 = _327 * cb6._m9.y;
        precise float _336 = _328 * cb6._m9.z;
        vec4 _345 = texture(sampler3D(t3, s1), vec3(spvNMax(fma(_334, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _335, _336));
        _350 = _345.w;
        _351 = _345.z;
        _352 = _345.y;
        _353 = _345.x;
    }
    else
    {
        _350 = 1.0;
        _351 = 1.0;
        _352 = 1.0;
        _353 = 1.0;
    }
    precise float _367 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _368 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _374 = texture(sampler2D(t0, s2), vec2(_367, _368));
    float _375 = _374.x;
    precise float _376 = spvNClamp(dp4_f32(vec4(_353, _352, _351, _350), cb2._m47), 0.0, 1.0) - _375;
    precise float _377 = fma(spvNClamp(fma(fma(cb3._m26, _264, _251), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _376, _375);
    precise float _380 = 1.0 - cb0._m5.x;
    precise float _381 = -_182;
    precise float _382 = -_183;
    precise float _383 = -_184;
    vec3 _391 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _392 = dp3_f32(vec3(_381, _382, _383), _391);
    precise float _393 = _392 + _392;
    precise float _394 = -_393;
    precise float _395 = fma(TEXCOORD1.x, _394, _381);
    precise float _396 = fma(TEXCOORD1.y, _394, _382);
    precise float _397 = fma(TEXCOORD1.z, _394, _383);
    precise float _403 = _377 * cb0._m2.x;
    precise float _404 = _377 * cb0._m2.y;
    precise float _405 = _377 * cb0._m2.z;
    vec4 _406 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _497;
    float _498;
    float _499;
    if (_277)
    {
        bool _412 = cb6._m0.y == 1.0;
        precise float _418 = TEXCOORD2.y * cb6._m3.x;
        precise float _419 = TEXCOORD2.y * cb6._m3.y;
        precise float _420 = TEXCOORD2.y * cb6._m3.z;
        precise float _442 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _418)) + cb6._m7.x;
        precise float _443 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _419)) + cb6._m7.y;
        precise float _444 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _420)) + cb6._m7.z;
        precise float _453 = (_412 ? _442 : TEXCOORD2.x) - cb6._m11.x;
        precise float _454 = (_412 ? _443 : TEXCOORD2.y) - cb6._m11.y;
        precise float _455 = (_412 ? _444 : TEXCOORD2.z) - cb6._m11.z;
        precise float _461 = _453 * cb6._m9.x;
        precise float _462 = _454 * cb6._m9.y;
        precise float _463 = _455 * cb6._m9.z;
        precise float _464 = _461 * 0.25;
        precise float _467 = cb6._m0.z * 0.5;
        precise float _471 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_464, _467));
        precise float _475 = _471 + 0.25;
        precise float _476 = _462 + 0.0;
        precise float _477 = _463 + 0.0;
        precise float _481 = _471 + 0.5;
        _497 = dp4_f32(texture(sampler3D(t3, s1), vec3(_481, _476, _477)), _406);
        _498 = dp4_f32(texture(sampler3D(t3, s1), vec3(_475, _476, _477)), _406);
        _499 = dp4_f32(texture(sampler3D(t3, s1), vec3(_471, _462, _463)), _406);
    }
    else
    {
        _497 = dp4_f32(cb2._m42, _406);
        _498 = dp4_f32(cb2._m41, _406);
        _499 = dp4_f32(cb2._m40, _406);
    }
    precise float _506 = _499 + TEXCOORD3.x;
    precise float _507 = _498 + TEXCOORD3.y;
    precise float _508 = _497 + TEXCOORD3.z;
    vec3 _516 = vec3(_395, _396, _397);
    float _565;
    float _566;
    float _567;
    if (cb5._m5 > 0.0)
    {
        precise float _520 = inversesqrt(dp3_f32(_516, _516));
        precise float _521 = _520 * _395;
        precise float _522 = _520 * _396;
        precise float _523 = _520 * _397;
        precise float _529 = cb5._m0.x - TEXCOORD2.x;
        precise float _530 = cb5._m0.y - TEXCOORD2.y;
        precise float _531 = cb5._m0.z - TEXCOORD2.z;
        precise float _532 = _529 / _521;
        precise float _533 = _530 / _522;
        precise float _534 = _531 / _523;
        precise float _540 = cb5._m2.x - TEXCOORD2.x;
        precise float _541 = cb5._m2.y - TEXCOORD2.y;
        precise float _542 = cb5._m2.z - TEXCOORD2.z;
        precise float _543 = _540 / _521;
        precise float _544 = _541 / _522;
        precise float _545 = _542 / _523;
        precise float _553 = spvNMin((_523 > 0.0) ? _534 : _545, spvNMin((_522 > 0.0) ? _533 : _544, (_521 > 0.0) ? _532 : _543));
        precise float _559 = TEXCOORD2.x - cb5._m4.x;
        precise float _560 = TEXCOORD2.y - cb5._m4.y;
        precise float _561 = TEXCOORD2.z - cb5._m4.z;
        _565 = fma(_523, _553, _561);
        _566 = fma(_522, _553, _560);
        _567 = fma(_521, _553, _559);
    }
    else
    {
        _565 = _397;
        _566 = _396;
        _567 = _395;
    }
    precise float _570 = fma(-_380, 0.699999988079071044921875, 1.7000000476837158203125) * _380;
    precise float _571 = _570 * 6.0;
    vec4 _577 = textureLod(samplerCube(t1, s0), vec3(_567, _566, _565), _571);
    float _578 = _577.x;
    float _579 = _577.y;
    float _580 = _577.z;
    precise float _582 = _577.w - 1.0;
    precise float _589 = log2(fma(cb5._m6.w, _582, 1.0)) * cb5._m6.y;
    precise float _593 = exp2(_589) * cb5._m6.x;
    precise float _594 = _578 * _593;
    precise float _595 = _579 * _593;
    precise float _596 = _580 * _593;
    float _688;
    float _689;
    float _690;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _653;
        float _654;
        float _655;
        if (cb5._m12 > 0.0)
        {
            precise float _608 = inversesqrt(dp3_f32(_516, _516));
            precise float _609 = _395 * _608;
            precise float _610 = _396 * _608;
            precise float _611 = _397 * _608;
            precise float _617 = cb5._m7.x - TEXCOORD2.x;
            precise float _618 = cb5._m7.y - TEXCOORD2.y;
            precise float _619 = cb5._m7.z - TEXCOORD2.z;
            precise float _620 = _617 / _609;
            precise float _621 = _618 / _610;
            precise float _622 = _619 / _611;
            precise float _628 = cb5._m9.x - TEXCOORD2.x;
            precise float _629 = cb5._m9.y - TEXCOORD2.y;
            precise float _630 = cb5._m9.z - TEXCOORD2.z;
            precise float _631 = _628 / _609;
            precise float _632 = _629 / _610;
            precise float _633 = _630 / _611;
            precise float _641 = spvNMin((_611 > 0.0) ? _622 : _633, spvNMin((_610 > 0.0) ? _621 : _632, (_609 > 0.0) ? _620 : _631));
            precise float _647 = TEXCOORD2.x - cb5._m11.x;
            precise float _648 = TEXCOORD2.y - cb5._m11.y;
            precise float _649 = TEXCOORD2.z - cb5._m11.z;
            _653 = fma(_611, _641, _649);
            _654 = fma(_610, _641, _648);
            _655 = fma(_609, _641, _647);
        }
        else
        {
            _653 = _397;
            _654 = _396;
            _655 = _395;
        }
        vec4 _659 = textureLod(samplerCube(t2, s0), vec3(_655, _654, _653), _571);
        precise float _664 = _659.w - 1.0;
        precise float _671 = log2(fma(cb5._m13.w, _664, 1.0)) * cb5._m13.y;
        precise float _675 = exp2(_671) * cb5._m13.x;
        precise float _676 = _659.x * _675;
        precise float _677 = _659.y * _675;
        precise float _678 = _659.z * _675;
        _688 = fma(cb5._m3, fma(_593, _580, -_678), _678);
        _689 = fma(cb5._m3, fma(_593, _579, -_677), _677);
        _690 = fma(cb5._m3, fma(_593, _578, -_676), _676);
    }
    else
    {
        _688 = _596;
        _689 = _595;
        _690 = _594;
    }
    precise float _692 = inversesqrt(dp3_f32(_391, _391));
    precise float _693 = _692 * TEXCOORD1.x;
    precise float _694 = _692 * TEXCOORD1.y;
    precise float _695 = _692 * TEXCOORD1.z;
    precise float _696 = _240 - 0.039999999105930328369140625;
    precise float _697 = _241 - 0.039999999105930328369140625;
    precise float _698 = _242 - 0.039999999105930328369140625;
    precise float _701 = fma(cb0._m5.y, _696, 0.039999999105930328369140625);
    precise float _702 = fma(cb0._m5.y, _697, 0.039999999105930328369140625);
    precise float _703 = fma(cb0._m5.y, _698, 0.039999999105930328369140625);
    precise float _705 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _706 = _705 * _240;
    precise float _707 = _705 * _241;
    precise float _708 = _705 * _242;
    precise float _714 = fma(_176, _181, cb2._m0.x);
    precise float _715 = fma(_177, _181, cb2._m0.y);
    precise float _716 = fma(_178, _181, cb2._m0.z);
    vec3 _717 = vec3(_714, _715, _716);
    precise float _720 = inversesqrt(spvNMax(dp3_f32(_717, _717), 0.001000000047497451305389404296875));
    precise float _721 = _720 * _714;
    precise float _722 = _720 * _715;
    precise float _723 = _720 * _716;
    vec3 _724 = vec3(_693, _694, _695);
    precise float _728 = spvNClamp(dp3_f32(_724, cb2._m0), 0.0, 1.0);
    vec3 _729 = vec3(_721, _722, _723);
    precise float _731 = spvNClamp(dp3_f32(_724, _729), 0.0, 1.0);
    precise float _733 = spvNClamp(dp3_f32(cb2._m0, _729), 0.0, 1.0);
    precise float _734 = _733 * _733;
    precise float _738 = dp2_f32(vec2(_734), vec2(_380)) - 0.5;
    precise float _739 = 1.0 - _728;
    precise float _740 = _739 * _739;
    precise float _741 = _740 * _740;
    precise float _742 = _739 * _741;
    precise float _744 = abs(dp3_f32(_724, vec3(_182, _183, _184)));
    precise float _745 = 1.0 - _744;
    precise float _746 = _745 * _745;
    precise float _747 = _746 * _746;
    precise float _748 = _745 * _747;
    precise float _750 = fma(_738, _748, 1.0) * fma(_738, _742, 1.0);
    precise float _751 = _380 * _380;
    precise float _752 = spvNMax(_751, 0.00200000009499490261077880859375);
    precise float _753 = 1.0 - _752;
    precise float _756 = _744 * fma(_728, _753, _752);
    precise float _758 = fma(_728, fma(_744, _753, _752), _756) + 9.9999997473787516355514526367188e-06;
    precise float _759 = 0.5 / _758;
    precise float _760 = _752 * _752;
    precise float _763 = fma(fma(_731, _760, -_731), _731, 1.0);
    precise float _764 = _760 * 0.3183098733425140380859375;
    precise float _766 = _764 / fma(_763, _763, 1.0000000116860974230803549289703e-07);
    precise float _767 = _759 * _766;
    precise float _768 = _767 * 3.1415927410125732421875;
    precise float _769 = _728 * _750;
    precise float _770 = _728 * _768;
    precise float _773 = 1.0 / fma(_752, _752, 1.0);
    vec3 _774 = vec3(_701, _702, _703);
    precise float _778 = spvNMax(_770, 0.0) * ((dp3_f32(_774, _774) == 0.0) ? 0.0 : 1.0);
    precise float _779 = cb0._m5.x - _705;
    precise float _780 = _779 + 1.0;
    precise float _781 = spvNClamp(_780, 0.0, 1.0);
    precise float _785 = _403 * _778;
    precise float _786 = _404 * _778;
    precise float _787 = _405 * _778;
    precise float _788 = 1.0 - _733;
    precise float _789 = _788 * _788;
    precise float _790 = _789 * _789;
    precise float _791 = _788 * _790;
    precise float _792 = 1.0 - _701;
    precise float _793 = 1.0 - _702;
    precise float _794 = 1.0 - _703;
    precise float _798 = fma(_792, _791, _701) * _785;
    precise float _799 = fma(_793, _791, _702) * _786;
    precise float _800 = fma(_794, _791, _703) * _787;
    precise float _804 = _690 * _773;
    precise float _805 = _689 * _773;
    precise float _806 = _688 * _773;
    precise float _807 = _781 - _701;
    precise float _808 = _781 - _702;
    precise float _809 = _781 - _703;
    SV_Target.x = fma(_804, fma(_748, _807, _701), fma(_706, fma(_403, _769, spvNMax(_506, 0.0)), _798));
    SV_Target.y = fma(_805, fma(_748, _808, _702), fma(_707, fma(_404, _769, spvNMax(_507, 0.0)), _799));
    SV_Target.z = fma(_806, fma(_748, _809, _703), fma(_708, fma(_405, _769, spvNMax(_508, 0.0)), _800));
    SV_Target.w = 1.0;
}

