#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_demote_to_helper_invocation : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec3 _m2;
    uint _m3;
    uvec4 _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    vec4 _m13;
    vec3 _m14;
    uint _m15;
    vec3 _m16;
    uint _m17;
    vec3 _m18;
    uint _m19;
    uvec4 _m20;
    vec3 _m21;
    uint _m22;
    vec2 _m23;
    uvec2 _m24;
    uvec4 _m25;
    vec2 _m26;
    vec2 _m27;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
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
} cb3;

layout(set = 0, binding = 4) uniform sampler s0;
layout(set = 0, binding = 5) uniform sampler s1;
layout(set = 0, binding = 6) uniform sampler s2;
layout(set = 0, binding = 7) uniform sampler s3;
layout(set = 0, binding = 8) uniform sampler s4;
layout(set = 0, binding = 9) uniform sampler s5;
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform texture2D t1;
layout(set = 0, binding = 12) uniform texture2D t2;
layout(set = 0, binding = 13) uniform texture2D t3;
layout(set = 0, binding = 14) uniform texture2D t4;
layout(set = 0, binding = 15) uniform texture3D t5;

layout(location = 1, component = 0) in vec2 TEXCOORD;
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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _150 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _150));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _139 = a.x * b.x;
    return fma(a.y, b.y, _139);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _121 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _121)));
}

void main()
{
    precise float _174 = cb2._m0.x - TEXCOORD2.x;
    precise float _175 = cb2._m0.y - TEXCOORD2.y;
    precise float _176 = cb2._m0.z - TEXCOORD2.z;
    vec3 _177 = vec3(_174, _175, _176);
    precise float _179 = inversesqrt(dp3_f32(_177, _177));
    precise float _180 = _179 * _174;
    precise float _181 = _179 * _175;
    precise float _182 = _179 * _176;
    precise float _189 = cb1._m4.x - TEXCOORD2.x;
    precise float _190 = cb1._m4.y - TEXCOORD2.y;
    precise float _191 = cb1._m4.z - TEXCOORD2.z;
    vec3 _192 = vec3(_189, _190, _191);
    precise float _194 = inversesqrt(dp3_f32(_192, _192));
    precise float _195 = _194 * _189;
    precise float _196 = _194 * _190;
    precise float _197 = _194 * _191;
    precise float _200 = TEXCOORD.y * 150.0;
    precise float _203 = sin(roundEven(_200)) * 43758.546875;
    precise float _207 = fma(fract(_203), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _208 = _207 * 150.0;
    precise float _209 = _207 * 10.0;
    precise float _212 = sin(roundEven(_208)) * 43758.546875;
    precise float _214 = fma(fract(_212), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _223 = abs(dFdy(_207)) + abs(dFdx(_207));
    precise float _224 = abs(dFdy(_214)) + abs(dFdx(_214));
    precise float _225 = 1.0 - TEXCOORD.x;
    precise float _226 = 1.0 - TEXCOORD.y;
    bool _233 = cb0._m27.x > 0.5;
    bool _235 = cb0._m27.y > 0.5;
    float _238 = _235 ? (_233 ? 0.550000011920928955078125 : 0.5) : (_233 ? 0.5 : 0.449999988079071044921875);
    float _240 = (_233 || _235) ? 2.0 : 1.75;
    precise float _241 = _225 - 0.5;
    precise float _242 = _226 - _238;
    precise float _243 = _240 * _241;
    precise float _244 = fma(_241, _240, 0.5);
    precise float _245 = fma(_242, _240, _238);
    precise float _254 = float(_244 >= 0.0) * float(_244 <= 1.0);
    precise float _255 = float(_245 >= 0.0) * _254;
    vec2 _258 = vec2(_244, _245);
    vec4 _261 = texture(sampler2D(t0, s2), _258);
    float _262 = _261.x;
    float _263 = _261.w;
    vec4 _267 = texture(sampler2D(t1, s4), _258);
    float _268 = _267.x;
    float _269 = _267.w;
    precise float _271 = fma(-_255, float(_245 <= 1.0), 1.0);
    precise float _275 = fma(_271, -_263, _263);
    precise float _279 = fma(_271, -_269, _269);
    precise float _280 = TEXCOORD2.x - cb1._m4.x;
    precise float _281 = TEXCOORD2.y - cb1._m4.y;
    precise float _282 = TEXCOORD2.z - cb1._m4.z;
    vec3 _283 = vec3(_280, _281, _282);
    precise float _285 = inversesqrt(dp3_f32(_283, _283));
    precise float _286 = _285 * _280;
    precise float _287 = _285 * _282;
    precise float _288 = TEXCOORD.y + TEXCOORD.x;
    precise float _289 = TEXCOORD.y + TEXCOORD.y;
    precise float _293 = fma(-_287, 5.0, _289);
    precise float _294 = _293 * 10.0;
    precise float _296 = fma(sin(_294), 0.0199999995529651641845703125, fma(-_286, 5.0, _288));
    precise float _297 = _296 * 30.0;
    vec4 _304 = texture(sampler2D(t2, s3), vec2(_296, fma(cos(_297), 0.0199999995529651641845703125, _293)));
    precise float _312 = fma(cb1._m0.z, 2.0, _288) * 0.0199999995529651641845703125;
    float _315 = float(fract(_312) >= 0.9900000095367431640625);
    bool _320 = cb0._m23.x > 0.5;
    bool _321 = cb0._m23.y > 0.5;
    float _332 = _320 ? fma(_315, cb0._m26.y, cb0._m14.x) : cb0._m14.x;
    float _333 = _320 ? fma(_315, cb0._m26.y, cb0._m14.y) : cb0._m14.y;
    float _334 = _320 ? fma(_315, cb0._m26.y, cb0._m14.z) : cb0._m14.z;
    precise float _335 = _243 + 0.0;
    precise float _336 = _245 - 0.5;
    vec2 _337 = vec2(_335, _336);
    precise float _344 = (_233 ? spvNMax(abs(_336), abs(_335)) : sqrt(dp2_f32(_337, _337))) - 0.400390625;
    precise float _345 = _344 / _223;
    precise float _347 = 1.0 - spvNClamp(_345, 0.0, 1.0);
    precise float _353 = cb0._m16.x - _332;
    precise float _354 = cb0._m16.y - _333;
    precise float _355 = cb0._m16.z - _334;
    precise float _356 = fma(_347, _353, _332);
    precise float _357 = fma(_347, _354, _333);
    precise float _358 = fma(_347, _355, _334);
    float _360 = (_214 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _361 = cb0._m16.x - _356;
    precise float _362 = cb0._m16.y - _357;
    precise float _363 = cb0._m16.z - _358;
    precise float _364 = fma(_360, _361, _356);
    precise float _365 = fma(_360, _362, _357);
    precise float _366 = fma(_360, _363, _358);
    precise float _367 = 1.0 - fma(_271, -_262, _262);
    precise float _373 = cb0._m21.x - cb0._m14.x;
    precise float _374 = cb0._m21.y - cb0._m14.y;
    precise float _375 = cb0._m21.z - cb0._m14.z;
    precise float _379 = fma(_367, _373, cb0._m14.x) - _364;
    precise float _380 = fma(_367, _374, cb0._m14.y) - _365;
    precise float _381 = fma(_367, _375, cb0._m14.z) - _366;
    precise float _382 = fma(_275, _379, _364);
    precise float _383 = fma(_275, _380, _365);
    precise float _384 = fma(_275, _381, _366);
    bool _387 = (cb0._m27.y == 0.0) && (cb0._m27.x == 0.0);
    precise float _388 = 1.0 - fma(_271, -_268, _268);
    precise float _392 = fma(_388, _373, cb0._m14.x) - _382;
    precise float _393 = fma(_388, _374, cb0._m14.y) - _383;
    precise float _394 = fma(_388, _375, cb0._m14.z) - _384;
    float _398 = _387 ? _382 : fma(_279, _392, _382);
    float _399 = _387 ? _383 : fma(_279, _393, _383);
    float _400 = _387 ? _384 : fma(_279, _394, _384);
    precise float _401 = -_224;
    precise float _402 = fma(_401, 0.5, 0.189999997615814208984375);
    precise float _403 = fma(_401, 0.5, 0.2100000083446502685546875);
    precise float _406 = _214 - _402;
    precise float _407 = _214 - _403;
    precise float _410 = fma(_224, 0.5, -_402) + 0.189999997615814208984375;
    precise float _411 = fma(_224, 0.5, -_403) + 0.2100000083446502685546875;
    precise float _412 = _406 / _410;
    precise float _413 = _407 / _411;
    precise float _416 = 1.0 - spvNClamp(_413, 0.0, 1.0);
    precise float _419 = _207 - 0.1167768537998199462890625;
    precise float _420 = _214 - 0.02999999932944774627685546875;
    precise float _421 = _419 / _223;
    precise float _422 = _420 / _224;
    precise float _425 = 0.88322317600250244140625 - _207;
    precise float _426 = 0.9700000286102294921875 - _214;
    precise float _427 = _425 / _223;
    precise float _428 = _426 / _224;
    precise float _431 = spvNClamp(_421, 0.0, 1.0) * spvNClamp(_427, 0.0, 1.0);
    precise float _432 = spvNClamp(_422, 0.0, 1.0) * _431;
    precise float _433 = spvNClamp(_428, 0.0, 1.0) * _432;
    precise float _434 = fma(-spvNClamp(_412, 0.0, 1.0), _416, 1.0) * _433;
    precise float _435 = _214 * 10.0;
    precise float _439 = abs(fma(fract(_435), 2.0, -1.0)) - 0.5;
    precise float _441 = sin(_435) * _439;
    precise float _445 = abs(fma(fract(_209), 2.0, -1.0)) - 0.5;
    precise float _447 = sin(_209) * _445;
    precise float _448 = fma(_441, 0.0199999995529651641845703125, _207);
    precise float _449 = fma(_447, 0.0199999995529651641845703125, _214);
    precise float _450 = _448 - 0.089776851236820220947265625;
    precise float _451 = _449 - 0.0030000000260770320892333984375;
    precise float _452 = _450 / _223;
    precise float _453 = _451 / _224;
    precise float _456 = 0.91022312641143798828125 - _448;
    precise float _457 = 0.9969999790191650390625 - _449;
    precise float _458 = _456 / _223;
    precise float _459 = _457 / _224;
    precise float _462 = spvNClamp(_452, 0.0, 1.0) * spvNClamp(_458, 0.0, 1.0);
    precise float _463 = spvNClamp(_453, 0.0, 1.0) * _462;
    if ((fma(_463, spvNClamp(_459, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _321)
    {
        demote;
    }
    precise float _482 = (_320 ? fma(_304.x, cb0._m26.x, _398) : _398) - cb0._m18.x;
    precise float _483 = (_320 ? fma(_304.y, cb0._m26.x, _399) : _399) - cb0._m18.y;
    precise float _484 = (_320 ? fma(_304.z, cb0._m26.x, _400) : _400) - cb0._m18.z;
    precise float _485 = fma(_434, _482, cb0._m18.x);
    precise float _486 = fma(_434, _483, cb0._m18.y);
    precise float _487 = fma(_434, _484, cb0._m18.z);
    float _509;
    float _510;
    float _511;
    if (cb0._m23.y != 0.0)
    {
        float _502 = float(texture(sampler2D(t3, s5), vec2(_321 ? _448 : _207, _321 ? _449 : _214)).w >= 0.5);
        precise float _503 = _485 * (-0.39999997615814208984375);
        precise float _504 = _486 * (-0.39999997615814208984375);
        precise float _505 = _487 * (-0.39999997615814208984375);
        _509 = fma(_502, _503, _485);
        _510 = fma(_502, _504, _486);
        _511 = fma(_502, _505, _487);
    }
    else
    {
        _509 = _485;
        _510 = _486;
        _511 = _487;
    }
    precise float _517 = TEXCOORD2.y * cb0._m7.x;
    precise float _518 = TEXCOORD2.y * cb0._m7.y;
    precise float _519 = TEXCOORD2.y * cb0._m7.z;
    precise float _541 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _517)) + cb0._m11.x;
    precise float _542 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _518)) + cb0._m11.y;
    precise float _543 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _519)) + cb0._m11.z;
    float _619;
    float _620;
    float _621;
    float _622;
    if (cb3._m0.x == 1.0)
    {
        bool _552 = cb3._m0.y == 1.0;
        precise float _558 = TEXCOORD2.y * cb3._m3.x;
        precise float _559 = TEXCOORD2.y * cb3._m3.y;
        precise float _560 = TEXCOORD2.y * cb3._m3.z;
        precise float _582 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _558)) + cb3._m7.x;
        precise float _583 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _559)) + cb3._m7.y;
        precise float _584 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _560)) + cb3._m7.z;
        precise float _593 = (_552 ? _582 : TEXCOORD2.x) - cb3._m11.x;
        precise float _594 = (_552 ? _583 : TEXCOORD2.y) - cb3._m11.y;
        precise float _595 = (_552 ? _584 : TEXCOORD2.z) - cb3._m11.z;
        precise float _601 = _593 * cb3._m9.x;
        precise float _602 = _594 * cb3._m9.y;
        precise float _603 = _595 * cb3._m9.z;
        vec4 _614 = texture(sampler3D(t5, s0), vec3(spvNMax(fma(_601, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _602, _603));
        _619 = _614.w;
        _620 = _614.z;
        _621 = _614.y;
        _622 = _614.x;
    }
    else
    {
        _619 = 1.0;
        _620 = 1.0;
        _621 = 1.0;
        _622 = 1.0;
    }
    vec3 _629 = vec3(_541, _542, _543);
    precise float _637 = spvNClamp(dp4_f32(vec4(_622, _621, _620, _619), cb2._m47), 0.0, 1.0) * texture(sampler2D(t4, s1), vec2(dp3_f32(_629, _629))).x;
    precise float _643 = _637 * cb0._m2.x;
    precise float _644 = _637 * cb0._m2.y;
    precise float _645 = _637 * cb0._m2.z;
    vec3 _652 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _654 = inversesqrt(dp3_f32(_652, _652));
    precise float _655 = _654 * TEXCOORD1.x;
    precise float _656 = _654 * TEXCOORD1.y;
    precise float _657 = _654 * TEXCOORD1.z;
    precise float _658 = _509 - 0.039999999105930328369140625;
    precise float _659 = _510 - 0.039999999105930328369140625;
    precise float _660 = _511 - 0.039999999105930328369140625;
    precise float _663 = fma(cb0._m13.y, _658, 0.039999999105930328369140625);
    precise float _664 = fma(cb0._m13.y, _659, 0.039999999105930328369140625);
    precise float _665 = fma(cb0._m13.y, _660, 0.039999999105930328369140625);
    precise float _667 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _668 = _667 * _509;
    precise float _669 = _667 * _510;
    precise float _670 = _667 * _511;
    precise float _673 = 1.0 - cb0._m13.x;
    precise float _674 = fma(_174, _179, _195);
    precise float _675 = fma(_175, _179, _196);
    precise float _676 = fma(_176, _179, _197);
    vec3 _677 = vec3(_674, _675, _676);
    precise float _680 = inversesqrt(spvNMax(dp3_f32(_677, _677), 0.001000000047497451305389404296875));
    precise float _681 = _680 * _674;
    precise float _682 = _680 * _675;
    precise float _683 = _680 * _676;
    vec3 _684 = vec3(_655, _656, _657);
    vec3 _687 = vec3(_180, _181, _182);
    precise float _689 = spvNClamp(dp3_f32(_684, _687), 0.0, 1.0);
    vec3 _690 = vec3(_681, _682, _683);
    precise float _692 = spvNClamp(dp3_f32(_684, _690), 0.0, 1.0);
    precise float _694 = spvNClamp(dp3_f32(_687, _690), 0.0, 1.0);
    precise float _695 = _694 + _694;
    precise float _696 = _694 * _695;
    precise float _697 = fma(_696, _673, -0.5);
    precise float _698 = 1.0 - _689;
    precise float _699 = _698 * _698;
    precise float _700 = _699 * _699;
    precise float _701 = _698 * _700;
    precise float _703 = abs(dp3_f32(_684, vec3(_195, _196, _197)));
    precise float _704 = 1.0 - _703;
    precise float _705 = _704 * _704;
    precise float _706 = _705 * _705;
    precise float _707 = _704 * _706;
    precise float _709 = fma(_697, _707, 1.0) * fma(_697, _701, 1.0);
    precise float _710 = _673 * _673;
    precise float _711 = spvNMax(_710, 0.00200000009499490261077880859375);
    precise float _712 = 1.0 - _711;
    precise float _715 = _703 * fma(_689, _712, _711);
    precise float _717 = fma(_689, fma(_703, _712, _711), _715) + 9.9999997473787516355514526367188e-06;
    precise float _718 = 0.5 / _717;
    precise float _719 = _711 * _711;
    precise float _722 = fma(fma(_692, _719, -_692), _692, 1.0);
    precise float _723 = _719 * 0.3183098733425140380859375;
    precise float _725 = _723 / fma(_722, _722, 1.0000000116860974230803549289703e-07);
    precise float _726 = _725 * _718;
    precise float _727 = _726 * 3.1415927410125732421875;
    precise float _728 = _689 * _709;
    precise float _729 = _689 * _727;
    vec3 _731 = vec3(_663, _664, _665);
    precise float _735 = ((dp3_f32(_731, _731) == 0.0) ? 0.0 : 1.0) * spvNMax(_729, 0.0);
    precise float _736 = _728 * _643;
    precise float _737 = _728 * _644;
    precise float _738 = _728 * _645;
    precise float _739 = _643 * _735;
    precise float _740 = _644 * _735;
    precise float _741 = _645 * _735;
    precise float _742 = 1.0 - _694;
    precise float _743 = _742 * _742;
    precise float _744 = _743 * _743;
    precise float _745 = _742 * _744;
    precise float _746 = 1.0 - _663;
    precise float _747 = 1.0 - _664;
    precise float _748 = 1.0 - _665;
    precise float _752 = _739 * fma(_746, _745, _663);
    precise float _753 = _740 * fma(_747, _745, _664);
    precise float _754 = _741 * fma(_748, _745, _665);
    SV_Target.x = fma(_668, _736, _752);
    SV_Target.y = fma(_669, _737, _753);
    SV_Target.z = fma(_670, _738, _754);
    SV_Target.w = 1.0;
}

