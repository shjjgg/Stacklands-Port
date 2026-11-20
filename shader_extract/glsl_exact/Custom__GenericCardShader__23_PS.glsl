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

layout(set = 0, binding = 7, std140) uniform cb7_buf
{
    uvec4 m;
} cb7;

layout(set = 0, binding = 8, std140) uniform cb8_buf
{
    vec4 m[4096];
} cb8;

layout(set = 0, binding = 9) uniform sampler s0;
layout(set = 0, binding = 10) uniform sampler s1;
layout(set = 0, binding = 11) uniform sampler s2;
layout(set = 0, binding = 12) uniform texture2D t0;
layout(set = 0, binding = 13) uniform textureCube t1;
layout(set = 0, binding = 14) uniform textureCube t2;
layout(set = 0, binding = 15) uniform texture3D t3;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
layout(location = 5, component = 0) in vec4 TEXCOORD5;
layout(location = 7, component = 0) flat in uint SV_InstanceID;
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
    precise float _159 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _159));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _148 = a.x * b.x;
    return fma(a.y, b.y, _148);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _130 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _130)));
}

void main()
{
    precise float _189 = cb1._m4.x - TEXCOORD2.x;
    precise float _190 = cb1._m4.y - TEXCOORD2.y;
    precise float _191 = cb1._m4.z - TEXCOORD2.z;
    vec3 _192 = vec3(_189, _190, _191);
    precise float _194 = inversesqrt(dp3_f32(_192, _192));
    precise float _195 = _189 * _194;
    precise float _196 = _190 * _194;
    precise float _197 = _191 * _194;
    precise float _200 = TEXCOORD.y - 0.5;
    precise float _201 = _200 * 0.3333333432674407958984375;
    precise float _202 = _200 * 150.0;
    precise float _207 = abs(dFdy(_201)) + abs(dFdx(_201));
    precise float _210 = sin(roundEven(_202)) * 43758.546875;
    precise float _212 = fract(_210) - 0.5;
    precise float _215 = fma(_212, 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _216 = _215 * 150.0;
    precise float _219 = sin(roundEven(_216)) * 43758.546875;
    precise float _221 = fract(_219) - 0.5;
    precise float _232 = cb0._m8.x - cb0._m10.x;
    precise float _233 = cb0._m8.y - cb0._m10.x;
    precise float _236 = abs(_215) - _232;
    precise float _237 = abs(fma(_221, 0.00166666670702397823333740234375, _201)) - _233;
    vec2 _240 = vec2(spvNMax(_236, 0.0), spvNMax(_237, 0.0));
    precise float _243 = sqrt(dp2_f32(_240, _240)) / _207;
    precise float _244 = spvNMin(_243, 1.0);
    precise float _253 = fma(_244, -cb0._m6.x, cb0._m6.x);
    precise float _254 = fma(_244, -cb0._m6.y, cb0._m6.y);
    precise float _255 = fma(_244, -cb0._m6.z, cb0._m6.z);
    float _264 = dp3_f32(_192, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _271 = TEXCOORD2.x - cb3._m25.x;
    precise float _272 = TEXCOORD2.y - cb3._m25.y;
    precise float _273 = TEXCOORD2.z - cb3._m25.z;
    vec3 _274 = vec3(_271, _272, _273);
    precise float _277 = sqrt(dp3_f32(_274, _274)) - _264;
    uint _287 = (SV_InstanceID + cb7.m.x) * 7u;
    bool _291 = cb6._m0.x == 1.0;
    float _370;
    float _371;
    float _372;
    float _373;
    if (_291)
    {
        bool _301 = cb6._m0.y == 1.0;
        precise float _307 = TEXCOORD2.y * cb6._m3.x;
        precise float _308 = TEXCOORD2.y * cb6._m3.y;
        precise float _309 = TEXCOORD2.y * cb6._m3.z;
        precise float _331 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _307)) + cb6._m7.x;
        precise float _332 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _308)) + cb6._m7.y;
        precise float _333 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _309)) + cb6._m7.z;
        precise float _342 = (_301 ? _331 : TEXCOORD2.x) - cb6._m11.x;
        precise float _343 = (_301 ? _332 : TEXCOORD2.y) - cb6._m11.y;
        precise float _344 = (_301 ? _333 : TEXCOORD2.z) - cb6._m11.z;
        precise float _350 = _342 * cb6._m9.x;
        precise float _351 = _343 * cb6._m9.y;
        precise float _352 = _344 * cb6._m9.z;
        vec4 _361 = texture(sampler3D(t3, s1), vec3(spvNMax(fma(cb6._m0.z, 0.5, 0.75), fma(_350, 0.25, 0.75)), _351, _352));
        _370 = _361.w;
        _371 = _361.z;
        _372 = _361.y;
        _373 = _361.x;
    }
    else
    {
        uint _366 = _287 + 6u;
        _370 = cb8.m[_366].w;
        _371 = cb8.m[_366].w;
        _372 = cb8.m[_366].w;
        _373 = cb8.m[_366].w;
    }
    precise float _387 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _388 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _394 = texture(sampler2D(t0, s2), vec2(_387, _388));
    float _395 = _394.x;
    precise float _396 = spvNClamp(dp4_f32(vec4(_373, _372, _371, _370), cb2._m47), 0.0, 1.0) - _395;
    precise float _397 = fma(spvNClamp(fma(fma(cb3._m26, _277, _264), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _396, _395);
    precise float _400 = 1.0 - cb0._m5.x;
    precise float _401 = -_195;
    precise float _402 = -_196;
    precise float _403 = -_197;
    vec3 _411 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _412 = dp3_f32(vec3(_401, _402, _403), _411);
    precise float _413 = _412 + _412;
    precise float _414 = -_413;
    precise float _415 = fma(TEXCOORD1.x, _414, _401);
    precise float _416 = fma(TEXCOORD1.y, _414, _402);
    precise float _417 = fma(TEXCOORD1.z, _414, _403);
    precise float _423 = _397 * cb0._m2.x;
    precise float _424 = _397 * cb0._m2.y;
    precise float _425 = _397 * cb0._m2.z;
    vec4 _426 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _519;
    float _520;
    float _521;
    if (_291)
    {
        bool _432 = cb6._m0.y == 1.0;
        precise float _438 = TEXCOORD2.y * cb6._m3.x;
        precise float _439 = TEXCOORD2.y * cb6._m3.y;
        precise float _440 = TEXCOORD2.y * cb6._m3.z;
        precise float _462 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _438)) + cb6._m7.x;
        precise float _463 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _439)) + cb6._m7.y;
        precise float _464 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _440)) + cb6._m7.z;
        precise float _473 = (_432 ? _462 : TEXCOORD2.x) - cb6._m11.x;
        precise float _474 = (_432 ? _463 : TEXCOORD2.y) - cb6._m11.y;
        precise float _475 = (_432 ? _464 : TEXCOORD2.z) - cb6._m11.z;
        precise float _481 = _473 * cb6._m9.x;
        precise float _482 = _474 * cb6._m9.y;
        precise float _483 = _475 * cb6._m9.z;
        precise float _484 = _481 * 0.25;
        precise float _487 = cb6._m0.z * 0.5;
        precise float _491 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_484, _487));
        precise float _495 = _491 + 0.25;
        precise float _496 = _482 + 0.0;
        precise float _497 = _483 + 0.0;
        precise float _501 = _491 + 0.5;
        _519 = dp4_f32(texture(sampler3D(t3, s1), vec3(_501, _496, _497)), _426);
        _520 = dp4_f32(texture(sampler3D(t3, s1), vec3(_495, _496, _497)), _426);
        _521 = dp4_f32(texture(sampler3D(t3, s1), vec3(_491, _482, _483)), _426);
    }
    else
    {
        _519 = dp4_f32(cb8.m[_287 + 2u], _426);
        _520 = dp4_f32(cb8.m[_287 + 1u], _426);
        _521 = dp4_f32(cb8.m[_287], _426);
    }
    precise float _528 = _521 + TEXCOORD3.x;
    precise float _529 = _520 + TEXCOORD3.y;
    precise float _530 = _519 + TEXCOORD3.z;
    vec3 _538 = vec3(_415, _416, _417);
    float _587;
    float _588;
    float _589;
    if (cb5._m5 > 0.0)
    {
        precise float _542 = inversesqrt(dp3_f32(_538, _538));
        precise float _543 = _542 * _415;
        precise float _544 = _542 * _416;
        precise float _545 = _542 * _417;
        precise float _551 = cb5._m0.x - TEXCOORD2.x;
        precise float _552 = cb5._m0.y - TEXCOORD2.y;
        precise float _553 = cb5._m0.z - TEXCOORD2.z;
        precise float _554 = _551 / _543;
        precise float _555 = _552 / _544;
        precise float _556 = _553 / _545;
        precise float _562 = cb5._m2.x - TEXCOORD2.x;
        precise float _563 = cb5._m2.y - TEXCOORD2.y;
        precise float _564 = cb5._m2.z - TEXCOORD2.z;
        precise float _565 = _562 / _543;
        precise float _566 = _563 / _544;
        precise float _567 = _564 / _545;
        precise float _575 = spvNMin((_545 > 0.0) ? _556 : _567, spvNMin((_544 > 0.0) ? _555 : _566, (_543 > 0.0) ? _554 : _565));
        precise float _581 = TEXCOORD2.x - cb5._m4.x;
        precise float _582 = TEXCOORD2.y - cb5._m4.y;
        precise float _583 = TEXCOORD2.z - cb5._m4.z;
        _587 = fma(_545, _575, _583);
        _588 = fma(_544, _575, _582);
        _589 = fma(_543, _575, _581);
    }
    else
    {
        _587 = _417;
        _588 = _416;
        _589 = _415;
    }
    precise float _592 = fma(-_400, 0.699999988079071044921875, 1.7000000476837158203125) * _400;
    precise float _593 = _592 * 6.0;
    vec4 _599 = textureLod(samplerCube(t1, s0), vec3(_589, _588, _587), _593);
    float _600 = _599.x;
    float _601 = _599.y;
    float _602 = _599.z;
    precise float _604 = _599.w - 1.0;
    precise float _611 = log2(fma(cb5._m6.w, _604, 1.0)) * cb5._m6.y;
    precise float _615 = exp2(_611) * cb5._m6.x;
    precise float _616 = _600 * _615;
    precise float _617 = _601 * _615;
    precise float _618 = _602 * _615;
    float _710;
    float _711;
    float _712;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _675;
        float _676;
        float _677;
        if (cb5._m12 > 0.0)
        {
            precise float _630 = inversesqrt(dp3_f32(_538, _538));
            precise float _631 = _630 * _415;
            precise float _632 = _630 * _416;
            precise float _633 = _630 * _417;
            precise float _639 = cb5._m7.x - TEXCOORD2.x;
            precise float _640 = cb5._m7.y - TEXCOORD2.y;
            precise float _641 = cb5._m7.z - TEXCOORD2.z;
            precise float _642 = _639 / _631;
            precise float _643 = _640 / _632;
            precise float _644 = _641 / _633;
            precise float _650 = cb5._m9.x - TEXCOORD2.x;
            precise float _651 = cb5._m9.y - TEXCOORD2.y;
            precise float _652 = cb5._m9.z - TEXCOORD2.z;
            precise float _653 = _650 / _631;
            precise float _654 = _651 / _632;
            precise float _655 = _652 / _633;
            precise float _663 = spvNMin((_633 > 0.0) ? _644 : _655, spvNMin((_632 > 0.0) ? _643 : _654, (_631 > 0.0) ? _642 : _653));
            precise float _669 = TEXCOORD2.x - cb5._m11.x;
            precise float _670 = TEXCOORD2.y - cb5._m11.y;
            precise float _671 = TEXCOORD2.z - cb5._m11.z;
            _675 = fma(_633, _663, _671);
            _676 = fma(_632, _663, _670);
            _677 = fma(_631, _663, _669);
        }
        else
        {
            _675 = _417;
            _676 = _416;
            _677 = _415;
        }
        vec4 _681 = textureLod(samplerCube(t2, s0), vec3(_677, _676, _675), _593);
        precise float _686 = _681.w - 1.0;
        precise float _693 = log2(fma(cb5._m13.w, _686, 1.0)) * cb5._m13.y;
        precise float _697 = exp2(_693) * cb5._m13.x;
        precise float _698 = _681.x * _697;
        precise float _699 = _681.y * _697;
        precise float _700 = _681.z * _697;
        _710 = fma(cb5._m3, fma(_615, _602, -_700), _700);
        _711 = fma(cb5._m3, fma(_615, _601, -_699), _699);
        _712 = fma(cb5._m3, fma(_615, _600, -_698), _698);
    }
    else
    {
        _710 = _618;
        _711 = _617;
        _712 = _616;
    }
    precise float _714 = inversesqrt(dp3_f32(_411, _411));
    precise float _715 = _714 * TEXCOORD1.x;
    precise float _716 = _714 * TEXCOORD1.y;
    precise float _717 = _714 * TEXCOORD1.z;
    precise float _718 = _253 - 0.039999999105930328369140625;
    precise float _719 = _254 - 0.039999999105930328369140625;
    precise float _720 = _255 - 0.039999999105930328369140625;
    precise float _723 = fma(cb0._m5.y, _718, 0.039999999105930328369140625);
    precise float _724 = fma(cb0._m5.y, _719, 0.039999999105930328369140625);
    precise float _725 = fma(cb0._m5.y, _720, 0.039999999105930328369140625);
    precise float _727 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _728 = _727 * _253;
    precise float _729 = _727 * _254;
    precise float _730 = _727 * _255;
    precise float _736 = fma(_189, _194, cb2._m0.x);
    precise float _737 = fma(_190, _194, cb2._m0.y);
    precise float _738 = fma(_191, _194, cb2._m0.z);
    vec3 _739 = vec3(_736, _737, _738);
    precise float _742 = inversesqrt(spvNMax(dp3_f32(_739, _739), 0.001000000047497451305389404296875));
    precise float _743 = _736 * _742;
    precise float _744 = _737 * _742;
    precise float _745 = _738 * _742;
    vec3 _746 = vec3(_715, _716, _717);
    precise float _750 = spvNClamp(dp3_f32(_746, cb2._m0), 0.0, 1.0);
    vec3 _751 = vec3(_743, _744, _745);
    precise float _753 = spvNClamp(dp3_f32(_746, _751), 0.0, 1.0);
    precise float _755 = spvNClamp(dp3_f32(cb2._m0, _751), 0.0, 1.0);
    precise float _756 = _755 * _755;
    precise float _760 = dp2_f32(vec2(_756), vec2(_400)) - 0.5;
    precise float _761 = 1.0 - _750;
    precise float _762 = _761 * _761;
    precise float _763 = _762 * _762;
    precise float _764 = _761 * _763;
    precise float _766 = abs(dp3_f32(_746, vec3(_195, _196, _197)));
    precise float _767 = 1.0 - _766;
    precise float _768 = _767 * _767;
    precise float _769 = _768 * _768;
    precise float _770 = _767 * _769;
    precise float _772 = fma(_760, _770, 1.0) * fma(_760, _764, 1.0);
    precise float _773 = _750 * _772;
    precise float _774 = _400 * _400;
    precise float _775 = spvNMax(_774, 0.00200000009499490261077880859375);
    precise float _776 = 1.0 - _775;
    precise float _779 = _766 * fma(_750, _776, _775);
    precise float _781 = fma(_750, fma(_766, _776, _775), _779) + 9.9999997473787516355514526367188e-06;
    precise float _782 = 0.5 / _781;
    precise float _783 = _775 * _775;
    precise float _786 = fma(fma(_753, _783, -_753), _753, 1.0);
    precise float _787 = _783 * 0.3183098733425140380859375;
    precise float _789 = _787 / fma(_786, _786, 1.0000000116860974230803549289703e-07);
    precise float _790 = _789 * _782;
    precise float _791 = _790 * 3.1415927410125732421875;
    precise float _792 = _750 * _791;
    precise float _795 = 1.0 / fma(_775, _775, 1.0);
    vec3 _796 = vec3(_723, _724, _725);
    precise float _800 = ((dp3_f32(_796, _796) == 0.0) ? 0.0 : 1.0) * spvNMax(_792, 0.0);
    precise float _801 = cb0._m5.x - _727;
    precise float _802 = _801 + 1.0;
    precise float _803 = spvNClamp(_802, 0.0, 1.0);
    precise float _807 = _423 * _800;
    precise float _808 = _424 * _800;
    precise float _809 = _425 * _800;
    precise float _810 = 1.0 - _755;
    precise float _811 = _810 * _810;
    precise float _812 = _811 * _811;
    precise float _813 = _810 * _812;
    precise float _814 = 1.0 - _723;
    precise float _815 = 1.0 - _724;
    precise float _816 = 1.0 - _725;
    precise float _820 = _807 * fma(_814, _813, _723);
    precise float _821 = _808 * fma(_815, _813, _724);
    precise float _822 = _809 * fma(_816, _813, _725);
    precise float _826 = _712 * _795;
    precise float _827 = _711 * _795;
    precise float _828 = _710 * _795;
    precise float _829 = _803 - _723;
    precise float _830 = _803 - _724;
    precise float _831 = _803 - _725;
    SV_Target.x = fma(_826, fma(_770, _829, _723), fma(_728, fma(_423, _773, spvNMax(_528, 0.0)), _820));
    SV_Target.y = fma(_827, fma(_770, _830, _724), fma(_729, fma(_424, _773, spvNMax(_529, 0.0)), _821));
    SV_Target.z = fma(_828, fma(_770, _831, _725), fma(_730, fma(_425, _773, spvNMax(_530, 0.0)), _822));
    SV_Target.w = 1.0;
}

