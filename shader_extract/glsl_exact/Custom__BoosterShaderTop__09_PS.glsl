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
layout(set = 0, binding = 7) uniform sampler s2;
layout(set = 0, binding = 8) uniform sampler s3;
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform textureCube t2;
layout(set = 0, binding = 12) uniform textureCube t3;
layout(set = 0, binding = 13) uniform texture3D t4;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
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
    precise float _148 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _148));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _137 = a.x * b.x;
    return fma(a.y, b.y, _137);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _119 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _119)));
}

void main()
{
    precise float _172 = cb1._m4.x - TEXCOORD2.x;
    precise float _173 = cb1._m4.y - TEXCOORD2.y;
    precise float _174 = cb1._m4.z - TEXCOORD2.z;
    vec3 _175 = vec3(_172, _173, _174);
    precise float _177 = inversesqrt(dp3_f32(_175, _175));
    precise float _178 = _177 * _172;
    precise float _179 = _177 * _173;
    precise float _180 = _177 * _174;
    precise float _185 = TEXCOORD.y * 150.0;
    precise float _186 = TEXCOORD.x * 20.0;
    precise float _187 = TEXCOORD.y * 1.0;
    precise float _190 = sin(roundEven(_185)) * 43758.546875;
    precise float _192 = fma(fract(_190), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _193 = _192 * 150.0;
    precise float _196 = sin(roundEven(_193)) * 43758.546875;
    precise float _198 = fma(fract(_196), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _207 = abs(dFdx(_192)) + abs(dFdy(_192));
    precise float _208 = abs(dFdx(_198)) + abs(dFdy(_198));
    precise float _209 = 0.5 - TEXCOORD.x;
    precise float _210 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _216 = texture(sampler2D(t0, s2), vec2(_186, _187));
    float _217 = _216.x;
    float _218 = _216.y;
    float _219 = _216.z;
    precise float _226 = _217 * cb0._m6.x;
    precise float _227 = _218 * cb0._m6.y;
    precise float _228 = _219 * cb0._m6.z;
    precise float _229 = TEXCOORD2.x - cb1._m4.x;
    precise float _230 = TEXCOORD2.y - cb1._m4.y;
    precise float _231 = TEXCOORD2.z - cb1._m4.z;
    vec3 _232 = vec3(_229, _230, _231);
    precise float _234 = inversesqrt(dp3_f32(_232, _232));
    precise float _235 = _234 * _229;
    precise float _236 = _234 * _231;
    precise float _237 = TEXCOORD.y + TEXCOORD.x;
    precise float _238 = TEXCOORD.y + TEXCOORD.y;
    precise float _242 = fma(-_236, 5.0, _238);
    precise float _243 = _242 * 10.0;
    precise float _245 = fma(sin(_243), 0.0199999995529651641845703125, fma(-_235, 5.0, _237));
    precise float _246 = _245 * 30.0;
    vec4 _253 = texture(sampler2D(t1, s3), vec2(_245, fma(cos(_246), 0.0199999995529651641845703125, _242)));
    vec2 _259 = vec2(fma(_209, 1.75, 0.0), fma(_210, 1.75, -0.050000011920928955078125));
    precise float _262 = sqrt(dp2_f32(_259, _259)) - 0.400390625;
    precise float _263 = _262 / _207;
    precise float _265 = 1.0 - spvNClamp(_263, 0.0, 1.0);
    precise float _280 = _192 - 0.1167768537998199462890625;
    precise float _281 = _280 / _207;
    precise float _283 = 0.88322317600250244140625 - _192;
    precise float _284 = _283 / _207;
    precise float _286 = spvNClamp(_284, 0.0, 1.0) * spvNClamp(_281, 0.0, 1.0);
    precise float _287 = _198 - 0.02999999932944774627685546875;
    precise float _288 = _287 / _208;
    precise float _290 = _286 * spvNClamp(_288, 0.0, 1.0);
    precise float _291 = 0.9700000286102294921875 - _198;
    precise float _292 = _291 / _208;
    precise float _294 = _290 * spvNClamp(_292, 0.0, 1.0);
    precise float _295 = fma(_253.x, 0.5, fma(_265, fma(-cb0._m6.x, _217, cb0._m8.x), _226));
    precise float _296 = fma(_253.y, 0.5, fma(_265, fma(-cb0._m6.y, _218, cb0._m8.y), _227));
    precise float _297 = fma(_253.z, 0.5, fma(_265, fma(-cb0._m6.z, _219, cb0._m8.z), _228));
    precise float _298 = _294 * _295;
    precise float _299 = _294 * _296;
    precise float _300 = _294 * _297;
    bool _305 = cb4._m0.x == 1.0;
    float _378;
    float _379;
    float _380;
    float _381;
    if (_305)
    {
        bool _313 = cb4._m0.y == 1.0;
        precise float _319 = TEXCOORD2.y * cb4._m3.x;
        precise float _320 = TEXCOORD2.y * cb4._m3.y;
        precise float _321 = TEXCOORD2.y * cb4._m3.z;
        precise float _343 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _319)) + cb4._m7.x;
        precise float _344 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _320)) + cb4._m7.y;
        precise float _345 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _321)) + cb4._m7.z;
        precise float _354 = (_313 ? _343 : TEXCOORD2.x) - cb4._m11.x;
        precise float _355 = (_313 ? _344 : TEXCOORD2.y) - cb4._m11.y;
        precise float _356 = (_313 ? _345 : TEXCOORD2.z) - cb4._m11.z;
        precise float _362 = _354 * cb4._m9.x;
        precise float _363 = _355 * cb4._m9.y;
        precise float _364 = _356 * cb4._m9.z;
        vec4 _373 = texture(sampler3D(t4, s1), vec3(spvNMax(fma(_362, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _363, _364));
        _378 = _373.w;
        _379 = _373.z;
        _380 = _373.y;
        _381 = _373.x;
    }
    else
    {
        _378 = 1.0;
        _379 = 1.0;
        _380 = 1.0;
        _381 = 1.0;
    }
    precise float _388 = spvNClamp(dp4_f32(vec4(_381, _380, _379, _378), cb2._m47), 0.0, 1.0);
    precise float _391 = 1.0 - cb0._m5.x;
    precise float _392 = -_178;
    precise float _393 = -_179;
    precise float _394 = -_180;
    vec3 _402 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _403 = dp3_f32(vec3(_392, _393, _394), _402);
    precise float _404 = _403 + _403;
    precise float _405 = -_404;
    precise float _406 = fma(TEXCOORD1.x, _405, _392);
    precise float _407 = fma(TEXCOORD1.y, _405, _393);
    precise float _408 = fma(TEXCOORD1.z, _405, _394);
    precise float _414 = _388 * cb0._m2.x;
    precise float _415 = _388 * cb0._m2.y;
    precise float _416 = _388 * cb0._m2.z;
    vec4 _417 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _508;
    float _509;
    float _510;
    if (_305)
    {
        bool _423 = cb4._m0.y == 1.0;
        precise float _429 = TEXCOORD2.y * cb4._m3.x;
        precise float _430 = TEXCOORD2.y * cb4._m3.y;
        precise float _431 = TEXCOORD2.y * cb4._m3.z;
        precise float _453 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _429)) + cb4._m7.x;
        precise float _454 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _430)) + cb4._m7.y;
        precise float _455 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _431)) + cb4._m7.z;
        precise float _464 = (_423 ? _453 : TEXCOORD2.x) - cb4._m11.x;
        precise float _465 = (_423 ? _454 : TEXCOORD2.y) - cb4._m11.y;
        precise float _466 = (_423 ? _455 : TEXCOORD2.z) - cb4._m11.z;
        precise float _472 = _464 * cb4._m9.x;
        precise float _473 = _465 * cb4._m9.y;
        precise float _474 = _466 * cb4._m9.z;
        precise float _475 = _472 * 0.25;
        precise float _478 = cb4._m0.z * 0.5;
        precise float _482 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_475, _478));
        precise float _486 = _482 + 0.25;
        precise float _487 = _473 + 0.0;
        precise float _488 = _474 + 0.0;
        precise float _492 = _482 + 0.5;
        _508 = dp4_f32(texture(sampler3D(t4, s1), vec3(_492, _487, _488)), _417);
        _509 = dp4_f32(texture(sampler3D(t4, s1), vec3(_486, _487, _488)), _417);
        _510 = dp4_f32(texture(sampler3D(t4, s1), vec3(_482, _473, _474)), _417);
    }
    else
    {
        _508 = dp4_f32(cb2._m42, _417);
        _509 = dp4_f32(cb2._m41, _417);
        _510 = dp4_f32(cb2._m40, _417);
    }
    precise float _517 = _510 + TEXCOORD3.x;
    precise float _518 = _509 + TEXCOORD3.y;
    precise float _519 = _508 + TEXCOORD3.z;
    vec3 _527 = vec3(_406, _407, _408);
    float _576;
    float _577;
    float _578;
    if (cb3._m5 > 0.0)
    {
        precise float _531 = inversesqrt(dp3_f32(_527, _527));
        precise float _532 = _531 * _406;
        precise float _533 = _531 * _407;
        precise float _534 = _531 * _408;
        precise float _540 = cb3._m0.x - TEXCOORD2.x;
        precise float _541 = cb3._m0.y - TEXCOORD2.y;
        precise float _542 = cb3._m0.z - TEXCOORD2.z;
        precise float _543 = _540 / _532;
        precise float _544 = _541 / _533;
        precise float _545 = _542 / _534;
        precise float _551 = cb3._m2.x - TEXCOORD2.x;
        precise float _552 = cb3._m2.y - TEXCOORD2.y;
        precise float _553 = cb3._m2.z - TEXCOORD2.z;
        precise float _554 = _551 / _532;
        precise float _555 = _552 / _533;
        precise float _556 = _553 / _534;
        precise float _564 = spvNMin((_534 > 0.0) ? _545 : _556, spvNMin((_533 > 0.0) ? _544 : _555, (_532 > 0.0) ? _543 : _554));
        precise float _570 = TEXCOORD2.x - cb3._m4.x;
        precise float _571 = TEXCOORD2.y - cb3._m4.y;
        precise float _572 = TEXCOORD2.z - cb3._m4.z;
        _576 = fma(_534, _564, _572);
        _577 = fma(_533, _564, _571);
        _578 = fma(_532, _564, _570);
    }
    else
    {
        _576 = _408;
        _577 = _407;
        _578 = _406;
    }
    precise float _581 = fma(-_391, 0.699999988079071044921875, 1.7000000476837158203125) * _391;
    precise float _582 = _581 * 6.0;
    vec4 _588 = textureLod(samplerCube(t2, s0), vec3(_578, _577, _576), _582);
    float _589 = _588.x;
    float _590 = _588.y;
    float _591 = _588.z;
    precise float _593 = _588.w - 1.0;
    precise float _600 = log2(fma(cb3._m6.w, _593, 1.0)) * cb3._m6.y;
    precise float _604 = exp2(_600) * cb3._m6.x;
    precise float _605 = _589 * _604;
    precise float _606 = _590 * _604;
    precise float _607 = _591 * _604;
    float _699;
    float _700;
    float _701;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _664;
        float _665;
        float _666;
        if (cb3._m12 > 0.0)
        {
            precise float _619 = inversesqrt(dp3_f32(_527, _527));
            precise float _620 = _406 * _619;
            precise float _621 = _407 * _619;
            precise float _622 = _408 * _619;
            precise float _628 = cb3._m7.x - TEXCOORD2.x;
            precise float _629 = cb3._m7.y - TEXCOORD2.y;
            precise float _630 = cb3._m7.z - TEXCOORD2.z;
            precise float _631 = _628 / _620;
            precise float _632 = _629 / _621;
            precise float _633 = _630 / _622;
            precise float _639 = cb3._m9.x - TEXCOORD2.x;
            precise float _640 = cb3._m9.y - TEXCOORD2.y;
            precise float _641 = cb3._m9.z - TEXCOORD2.z;
            precise float _642 = _639 / _620;
            precise float _643 = _640 / _621;
            precise float _644 = _641 / _622;
            precise float _652 = spvNMin((_622 > 0.0) ? _633 : _644, spvNMin((_621 > 0.0) ? _632 : _643, (_620 > 0.0) ? _631 : _642));
            precise float _658 = TEXCOORD2.x - cb3._m11.x;
            precise float _659 = TEXCOORD2.y - cb3._m11.y;
            precise float _660 = TEXCOORD2.z - cb3._m11.z;
            _664 = fma(_622, _652, _660);
            _665 = fma(_621, _652, _659);
            _666 = fma(_620, _652, _658);
        }
        else
        {
            _664 = _408;
            _665 = _407;
            _666 = _406;
        }
        vec4 _670 = textureLod(samplerCube(t3, s0), vec3(_666, _665, _664), _582);
        precise float _675 = _670.w - 1.0;
        precise float _682 = log2(fma(cb3._m13.w, _675, 1.0)) * cb3._m13.y;
        precise float _686 = exp2(_682) * cb3._m13.x;
        precise float _687 = _670.x * _686;
        precise float _688 = _670.y * _686;
        precise float _689 = _670.z * _686;
        _699 = fma(cb3._m3, fma(_604, _591, -_689), _689);
        _700 = fma(cb3._m3, fma(_604, _590, -_688), _688);
        _701 = fma(cb3._m3, fma(_604, _589, -_687), _687);
    }
    else
    {
        _699 = _607;
        _700 = _606;
        _701 = _605;
    }
    precise float _703 = inversesqrt(dp3_f32(_402, _402));
    precise float _704 = _703 * TEXCOORD1.x;
    precise float _705 = _703 * TEXCOORD1.y;
    precise float _706 = _703 * TEXCOORD1.z;
    precise float _712 = fma(cb0._m5.y, fma(_294, _295, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _713 = fma(cb0._m5.y, fma(_294, _296, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _714 = fma(cb0._m5.y, fma(_294, _297, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _716 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _717 = _716 * _298;
    precise float _718 = _716 * _299;
    precise float _719 = _716 * _300;
    precise float _725 = fma(_172, _177, cb2._m0.x);
    precise float _726 = fma(_173, _177, cb2._m0.y);
    precise float _727 = fma(_174, _177, cb2._m0.z);
    vec3 _728 = vec3(_725, _726, _727);
    precise float _731 = inversesqrt(spvNMax(dp3_f32(_728, _728), 0.001000000047497451305389404296875));
    precise float _732 = _731 * _725;
    precise float _733 = _731 * _726;
    precise float _734 = _731 * _727;
    vec3 _735 = vec3(_704, _705, _706);
    precise float _739 = spvNClamp(dp3_f32(_735, cb2._m0), 0.0, 1.0);
    vec3 _740 = vec3(_732, _733, _734);
    precise float _742 = spvNClamp(dp3_f32(_735, _740), 0.0, 1.0);
    precise float _744 = spvNClamp(dp3_f32(cb2._m0, _740), 0.0, 1.0);
    precise float _745 = _744 * _744;
    precise float _749 = dp2_f32(vec2(_745), vec2(_391)) - 0.5;
    precise float _750 = 1.0 - _739;
    precise float _751 = _750 * _750;
    precise float _752 = _751 * _751;
    precise float _753 = _750 * _752;
    precise float _755 = abs(dp3_f32(_735, vec3(_178, _179, _180)));
    precise float _756 = 1.0 - _755;
    precise float _757 = _756 * _756;
    precise float _758 = _757 * _757;
    precise float _759 = _756 * _758;
    precise float _761 = fma(_749, _759, 1.0) * fma(_749, _753, 1.0);
    precise float _762 = _391 * _391;
    precise float _763 = spvNMax(_762, 0.00200000009499490261077880859375);
    precise float _764 = 1.0 - _763;
    precise float _767 = _755 * fma(_739, _764, _763);
    precise float _769 = fma(_739, fma(_755, _764, _763), _767) + 9.9999997473787516355514526367188e-06;
    precise float _770 = 0.5 / _769;
    precise float _771 = _763 * _763;
    precise float _774 = fma(fma(_742, _771, -_742), _742, 1.0);
    precise float _775 = _771 * 0.3183098733425140380859375;
    precise float _777 = _775 / fma(_774, _774, 1.0000000116860974230803549289703e-07);
    precise float _778 = _770 * _777;
    precise float _779 = _778 * 3.1415927410125732421875;
    precise float _780 = _739 * _761;
    precise float _781 = _739 * _779;
    precise float _784 = 1.0 / fma(_763, _763, 1.0);
    vec3 _785 = vec3(_712, _713, _714);
    precise float _789 = spvNMax(_781, 0.0) * ((dp3_f32(_785, _785) == 0.0) ? 0.0 : 1.0);
    precise float _790 = cb0._m5.x - _716;
    precise float _791 = _790 + 1.0;
    precise float _792 = spvNClamp(_791, 0.0, 1.0);
    precise float _796 = _414 * _789;
    precise float _797 = _415 * _789;
    precise float _798 = _416 * _789;
    precise float _799 = 1.0 - _744;
    precise float _800 = _799 * _799;
    precise float _801 = _800 * _800;
    precise float _802 = _799 * _801;
    precise float _803 = 1.0 - _712;
    precise float _804 = 1.0 - _713;
    precise float _805 = 1.0 - _714;
    precise float _809 = fma(_803, _802, _712) * _796;
    precise float _810 = fma(_804, _802, _713) * _797;
    precise float _811 = fma(_805, _802, _714) * _798;
    precise float _815 = _701 * _784;
    precise float _816 = _700 * _784;
    precise float _817 = _699 * _784;
    precise float _818 = _792 - _712;
    precise float _819 = _792 - _713;
    precise float _820 = _792 - _714;
    SV_Target.x = fma(_815, fma(_759, _818, _712), fma(_717, fma(_414, _780, spvNMax(_517, 0.0)), _809));
    SV_Target.y = fma(_816, fma(_759, _819, _713), fma(_718, fma(_415, _780, spvNMax(_518, 0.0)), _810));
    SV_Target.z = fma(_817, fma(_759, _820, _714), fma(_719, fma(_416, _780, spvNMax(_519, 0.0)), _811));
    SV_Target.w = 1.0;
}

