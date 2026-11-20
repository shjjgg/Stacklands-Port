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
    vec4 _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    uvec4 _m12;
    vec3 _m13;
    uint _m14;
    vec2 _m15;
    uvec2 _m16;
    uvec4 _m17;
    vec2 _m18;
    vec2 _m19;
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
layout(set = 0, binding = 9) uniform sampler s4;
layout(set = 0, binding = 10) uniform sampler s5;
layout(set = 0, binding = 11) uniform texture2D t0;
layout(set = 0, binding = 12) uniform texture2D t1;
layout(set = 0, binding = 13) uniform texture2D t2;
layout(set = 0, binding = 14) uniform texture2D t3;
layout(set = 0, binding = 15) uniform textureCube t4;
layout(set = 0, binding = 16) uniform textureCube t5;
layout(set = 0, binding = 17) uniform texture3D t6;

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
    precise float _166 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _166));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _155 = a.x * b.x;
    return fma(a.y, b.y, _155);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _137 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _137)));
}

void main()
{
    precise float _190 = cb1._m4.x - TEXCOORD2.x;
    precise float _191 = cb1._m4.y - TEXCOORD2.y;
    precise float _192 = cb1._m4.z - TEXCOORD2.z;
    vec3 _193 = vec3(_190, _191, _192);
    precise float _195 = inversesqrt(dp3_f32(_193, _193));
    precise float _196 = _195 * _190;
    precise float _197 = _195 * _191;
    precise float _198 = _195 * _192;
    precise float _201 = TEXCOORD.y * 150.0;
    precise float _204 = sin(roundEven(_201)) * 43758.546875;
    precise float _208 = fma(fract(_204), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _209 = _208 * 150.0;
    precise float _210 = _208 * 10.0;
    precise float _213 = sin(roundEven(_209)) * 43758.546875;
    precise float _215 = fma(fract(_213), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _224 = abs(dFdy(_208)) + abs(dFdx(_208));
    precise float _225 = abs(dFdy(_215)) + abs(dFdx(_215));
    precise float _226 = 1.0 - TEXCOORD.x;
    precise float _227 = 1.0 - TEXCOORD.y;
    bool _234 = cb0._m19.x > 0.5;
    bool _236 = cb0._m19.y > 0.5;
    float _239 = _236 ? (_234 ? 0.550000011920928955078125 : 0.5) : (_234 ? 0.5 : 0.449999988079071044921875);
    float _241 = (_234 || _236) ? 2.0 : 1.75;
    precise float _242 = _226 - 0.5;
    precise float _243 = _227 - _239;
    precise float _244 = _241 * _242;
    precise float _245 = fma(_242, _241, 0.5);
    precise float _246 = fma(_243, _241, _239);
    precise float _255 = float(_245 >= 0.0) * float(_245 <= 1.0);
    precise float _256 = float(_246 >= 0.0) * _255;
    vec2 _259 = vec2(_245, _246);
    vec4 _262 = texture(sampler2D(t0, s2), _259);
    float _263 = _262.x;
    float _264 = _262.w;
    vec4 _268 = texture(sampler2D(t1, s4), _259);
    float _269 = _268.x;
    float _270 = _268.w;
    precise float _272 = fma(-_256, float(_246 <= 1.0), 1.0);
    precise float _276 = fma(_272, -_264, _264);
    precise float _280 = fma(_272, -_270, _270);
    precise float _281 = TEXCOORD2.x - cb1._m4.x;
    precise float _282 = TEXCOORD2.y - cb1._m4.y;
    precise float _283 = TEXCOORD2.z - cb1._m4.z;
    vec3 _284 = vec3(_281, _282, _283);
    precise float _286 = inversesqrt(dp3_f32(_284, _284));
    precise float _287 = _286 * _281;
    precise float _288 = _286 * _283;
    precise float _289 = TEXCOORD.y + TEXCOORD.x;
    precise float _290 = TEXCOORD.y + TEXCOORD.y;
    precise float _294 = fma(-_288, 5.0, _290);
    precise float _295 = _294 * 10.0;
    precise float _297 = fma(sin(_295), 0.0199999995529651641845703125, fma(-_287, 5.0, _289));
    precise float _298 = _297 * 30.0;
    vec4 _305 = texture(sampler2D(t2, s3), vec2(_297, fma(cos(_298), 0.0199999995529651641845703125, _294)));
    precise float _313 = fma(cb1._m0.z, 2.0, _289) * 0.0199999995529651641845703125;
    float _316 = float(fract(_313) >= 0.9900000095367431640625);
    bool _321 = cb0._m15.x > 0.5;
    bool _322 = cb0._m15.y > 0.5;
    float _333 = _321 ? fma(_316, cb0._m18.y, cb0._m6.x) : cb0._m6.x;
    float _334 = _321 ? fma(_316, cb0._m18.y, cb0._m6.y) : cb0._m6.y;
    float _335 = _321 ? fma(_316, cb0._m18.y, cb0._m6.z) : cb0._m6.z;
    precise float _336 = _244 + 0.0;
    precise float _337 = _246 - 0.5;
    vec2 _338 = vec2(_336, _337);
    precise float _345 = (_234 ? spvNMax(abs(_337), abs(_336)) : sqrt(dp2_f32(_338, _338))) - 0.400390625;
    precise float _346 = _345 / _224;
    precise float _348 = 1.0 - spvNClamp(_346, 0.0, 1.0);
    precise float _354 = cb0._m8.x - _333;
    precise float _355 = cb0._m8.y - _334;
    precise float _356 = cb0._m8.z - _335;
    precise float _357 = fma(_348, _354, _333);
    precise float _358 = fma(_348, _355, _334);
    precise float _359 = fma(_348, _356, _335);
    float _361 = (_215 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _362 = cb0._m8.x - _357;
    precise float _363 = cb0._m8.y - _358;
    precise float _364 = cb0._m8.z - _359;
    precise float _365 = fma(_361, _362, _357);
    precise float _366 = fma(_361, _363, _358);
    precise float _367 = fma(_361, _364, _359);
    precise float _368 = 1.0 - fma(_272, -_263, _263);
    precise float _374 = cb0._m13.x - cb0._m6.x;
    precise float _375 = cb0._m13.y - cb0._m6.y;
    precise float _376 = cb0._m13.z - cb0._m6.z;
    precise float _380 = fma(_368, _374, cb0._m6.x) - _365;
    precise float _381 = fma(_368, _375, cb0._m6.y) - _366;
    precise float _382 = fma(_368, _376, cb0._m6.z) - _367;
    precise float _383 = fma(_276, _380, _365);
    precise float _384 = fma(_276, _381, _366);
    precise float _385 = fma(_276, _382, _367);
    bool _388 = (cb0._m19.y == 0.0) && (cb0._m19.x == 0.0);
    precise float _389 = 1.0 - fma(_272, -_269, _269);
    precise float _393 = fma(_389, _374, cb0._m6.x) - _383;
    precise float _394 = fma(_389, _375, cb0._m6.y) - _384;
    precise float _395 = fma(_389, _376, cb0._m6.z) - _385;
    float _399 = _388 ? _383 : fma(_280, _393, _383);
    float _400 = _388 ? _384 : fma(_280, _394, _384);
    float _401 = _388 ? _385 : fma(_280, _395, _385);
    precise float _402 = -_225;
    precise float _403 = fma(_402, 0.5, 0.189999997615814208984375);
    precise float _404 = fma(_402, 0.5, 0.2100000083446502685546875);
    precise float _407 = _215 - _403;
    precise float _408 = _215 - _404;
    precise float _411 = fma(_225, 0.5, -_403) + 0.189999997615814208984375;
    precise float _412 = fma(_225, 0.5, -_404) + 0.2100000083446502685546875;
    precise float _413 = _407 / _411;
    precise float _414 = _408 / _412;
    precise float _417 = 1.0 - spvNClamp(_414, 0.0, 1.0);
    precise float _420 = _208 - 0.1167768537998199462890625;
    precise float _421 = _215 - 0.02999999932944774627685546875;
    precise float _422 = _420 / _224;
    precise float _423 = _421 / _225;
    precise float _426 = 0.88322317600250244140625 - _208;
    precise float _427 = 0.9700000286102294921875 - _215;
    precise float _428 = _426 / _224;
    precise float _429 = _427 / _225;
    precise float _432 = spvNClamp(_422, 0.0, 1.0) * spvNClamp(_428, 0.0, 1.0);
    precise float _433 = spvNClamp(_423, 0.0, 1.0) * _432;
    precise float _434 = spvNClamp(_429, 0.0, 1.0) * _433;
    precise float _435 = fma(-spvNClamp(_413, 0.0, 1.0), _417, 1.0) * _434;
    precise float _436 = _215 * 10.0;
    precise float _440 = abs(fma(fract(_436), 2.0, -1.0)) - 0.5;
    precise float _442 = sin(_436) * _440;
    precise float _446 = abs(fma(fract(_210), 2.0, -1.0)) - 0.5;
    precise float _448 = sin(_210) * _446;
    precise float _449 = fma(_442, 0.0199999995529651641845703125, _208);
    precise float _450 = fma(_448, 0.0199999995529651641845703125, _215);
    precise float _451 = _449 - 0.089776851236820220947265625;
    precise float _452 = _450 - 0.0030000000260770320892333984375;
    precise float _453 = _451 / _224;
    precise float _454 = _452 / _225;
    precise float _457 = 0.91022312641143798828125 - _449;
    precise float _458 = 0.9969999790191650390625 - _450;
    precise float _459 = _457 / _224;
    precise float _460 = _458 / _225;
    precise float _463 = spvNClamp(_453, 0.0, 1.0) * spvNClamp(_459, 0.0, 1.0);
    precise float _464 = spvNClamp(_454, 0.0, 1.0) * _463;
    if ((fma(_464, spvNClamp(_460, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _322)
    {
        demote;
    }
    precise float _483 = (_321 ? fma(_305.x, cb0._m18.x, _399) : _399) - cb0._m10.x;
    precise float _484 = (_321 ? fma(_305.y, cb0._m18.x, _400) : _400) - cb0._m10.y;
    precise float _485 = (_321 ? fma(_305.z, cb0._m18.x, _401) : _401) - cb0._m10.z;
    precise float _486 = fma(_435, _483, cb0._m10.x);
    precise float _487 = fma(_435, _484, cb0._m10.y);
    precise float _488 = fma(_435, _485, cb0._m10.z);
    float _510;
    float _511;
    float _512;
    if (cb0._m15.y != 0.0)
    {
        float _503 = float(texture(sampler2D(t3, s5), vec2(_322 ? _449 : _208, _322 ? _450 : _215)).w >= 0.5);
        precise float _504 = _486 * (-0.39999997615814208984375);
        precise float _505 = _487 * (-0.39999997615814208984375);
        precise float _506 = _488 * (-0.39999997615814208984375);
        _510 = fma(_503, _504, _486);
        _511 = fma(_503, _505, _487);
        _512 = fma(_503, _506, _488);
    }
    else
    {
        _510 = _486;
        _511 = _487;
        _512 = _488;
    }
    float _588;
    float _589;
    float _590;
    float _591;
    if (cb4._m0.x == 1.0)
    {
        bool _521 = cb4._m0.y == 1.0;
        precise float _527 = TEXCOORD2.y * cb4._m3.x;
        precise float _528 = TEXCOORD2.y * cb4._m3.y;
        precise float _529 = TEXCOORD2.y * cb4._m3.z;
        precise float _551 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _527)) + cb4._m7.x;
        precise float _552 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _528)) + cb4._m7.y;
        precise float _553 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _529)) + cb4._m7.z;
        precise float _562 = (_521 ? _551 : TEXCOORD2.x) - cb4._m11.x;
        precise float _563 = (_521 ? _552 : TEXCOORD2.y) - cb4._m11.y;
        precise float _564 = (_521 ? _553 : TEXCOORD2.z) - cb4._m11.z;
        precise float _570 = _562 * cb4._m9.x;
        precise float _571 = _563 * cb4._m9.y;
        precise float _572 = _564 * cb4._m9.z;
        vec4 _583 = texture(sampler3D(t6, s1), vec3(spvNMax(fma(_570, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _571, _572));
        _588 = _583.w;
        _589 = _583.z;
        _590 = _583.y;
        _591 = _583.x;
    }
    else
    {
        _588 = 1.0;
        _589 = 1.0;
        _590 = 1.0;
        _591 = 1.0;
    }
    precise float _598 = spvNClamp(dp4_f32(vec4(_591, _590, _589, _588), cb2._m47), 0.0, 1.0);
    precise float _601 = 1.0 - cb0._m5.x;
    precise float _602 = -_196;
    precise float _603 = -_197;
    precise float _604 = -_198;
    vec3 _612 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _613 = dp3_f32(vec3(_602, _603, _604), _612);
    precise float _614 = _613 + _613;
    precise float _615 = -_614;
    precise float _616 = fma(TEXCOORD1.x, _615, _602);
    precise float _617 = fma(TEXCOORD1.y, _615, _603);
    precise float _618 = fma(TEXCOORD1.z, _615, _604);
    precise float _624 = _598 * cb0._m2.x;
    precise float _625 = _598 * cb0._m2.y;
    precise float _626 = _598 * cb0._m2.z;
    vec3 _631 = vec3(_616, _617, _618);
    float _680;
    float _681;
    float _682;
    if (cb3._m5 > 0.0)
    {
        precise float _635 = inversesqrt(dp3_f32(_631, _631));
        precise float _636 = _635 * _616;
        precise float _637 = _635 * _617;
        precise float _638 = _635 * _618;
        precise float _644 = cb3._m0.x - TEXCOORD2.x;
        precise float _645 = cb3._m0.y - TEXCOORD2.y;
        precise float _646 = cb3._m0.z - TEXCOORD2.z;
        precise float _647 = _644 / _636;
        precise float _648 = _645 / _637;
        precise float _649 = _646 / _638;
        precise float _655 = cb3._m2.x - TEXCOORD2.x;
        precise float _656 = cb3._m2.y - TEXCOORD2.y;
        precise float _657 = cb3._m2.z - TEXCOORD2.z;
        precise float _658 = _655 / _636;
        precise float _659 = _656 / _637;
        precise float _660 = _657 / _638;
        precise float _668 = spvNMin((_638 > 0.0) ? _649 : _660, spvNMin((_637 > 0.0) ? _648 : _659, (_636 > 0.0) ? _647 : _658));
        precise float _674 = TEXCOORD2.x - cb3._m4.x;
        precise float _675 = TEXCOORD2.y - cb3._m4.y;
        precise float _676 = TEXCOORD2.z - cb3._m4.z;
        _680 = fma(_638, _668, _676);
        _681 = fma(_637, _668, _675);
        _682 = fma(_636, _668, _674);
    }
    else
    {
        _680 = _618;
        _681 = _617;
        _682 = _616;
    }
    precise float _685 = fma(-_601, 0.699999988079071044921875, 1.7000000476837158203125) * _601;
    precise float _686 = _685 * 6.0;
    vec4 _692 = textureLod(samplerCube(t4, s0), vec3(_682, _681, _680), _686);
    float _693 = _692.x;
    float _694 = _692.y;
    float _695 = _692.z;
    precise float _697 = _692.w - 1.0;
    precise float _704 = log2(fma(cb3._m6.w, _697, 1.0)) * cb3._m6.y;
    precise float _708 = exp2(_704) * cb3._m6.x;
    precise float _709 = _693 * _708;
    precise float _710 = _694 * _708;
    precise float _711 = _695 * _708;
    float _803;
    float _804;
    float _805;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _768;
        float _769;
        float _770;
        if (cb3._m12 > 0.0)
        {
            precise float _723 = inversesqrt(dp3_f32(_631, _631));
            precise float _724 = _616 * _723;
            precise float _725 = _617 * _723;
            precise float _726 = _618 * _723;
            precise float _732 = cb3._m7.x - TEXCOORD2.x;
            precise float _733 = cb3._m7.y - TEXCOORD2.y;
            precise float _734 = cb3._m7.z - TEXCOORD2.z;
            precise float _735 = _732 / _724;
            precise float _736 = _733 / _725;
            precise float _737 = _734 / _726;
            precise float _743 = cb3._m9.x - TEXCOORD2.x;
            precise float _744 = cb3._m9.y - TEXCOORD2.y;
            precise float _745 = cb3._m9.z - TEXCOORD2.z;
            precise float _746 = _743 / _724;
            precise float _747 = _744 / _725;
            precise float _748 = _745 / _726;
            precise float _756 = spvNMin((_726 > 0.0) ? _737 : _748, spvNMin((_725 > 0.0) ? _736 : _747, (_724 > 0.0) ? _735 : _746));
            precise float _762 = TEXCOORD2.x - cb3._m11.x;
            precise float _763 = TEXCOORD2.y - cb3._m11.y;
            precise float _764 = TEXCOORD2.z - cb3._m11.z;
            _768 = fma(_726, _756, _764);
            _769 = fma(_725, _756, _763);
            _770 = fma(_724, _756, _762);
        }
        else
        {
            _768 = _618;
            _769 = _617;
            _770 = _616;
        }
        vec4 _774 = textureLod(samplerCube(t5, s0), vec3(_770, _769, _768), _686);
        precise float _779 = _774.w - 1.0;
        precise float _786 = log2(fma(cb3._m13.w, _779, 1.0)) * cb3._m13.y;
        precise float _790 = exp2(_786) * cb3._m13.x;
        precise float _791 = _774.x * _790;
        precise float _792 = _774.y * _790;
        precise float _793 = _774.z * _790;
        _803 = fma(cb3._m3, fma(_708, _695, -_793), _793);
        _804 = fma(cb3._m3, fma(_708, _694, -_792), _792);
        _805 = fma(cb3._m3, fma(_708, _693, -_791), _791);
    }
    else
    {
        _803 = _711;
        _804 = _710;
        _805 = _709;
    }
    precise float _807 = inversesqrt(dp3_f32(_612, _612));
    precise float _808 = _807 * TEXCOORD1.x;
    precise float _809 = _807 * TEXCOORD1.y;
    precise float _810 = _807 * TEXCOORD1.z;
    precise float _811 = _510 - 0.039999999105930328369140625;
    precise float _812 = _511 - 0.039999999105930328369140625;
    precise float _813 = _512 - 0.039999999105930328369140625;
    precise float _816 = fma(cb0._m5.y, _811, 0.039999999105930328369140625);
    precise float _817 = fma(cb0._m5.y, _812, 0.039999999105930328369140625);
    precise float _818 = fma(cb0._m5.y, _813, 0.039999999105930328369140625);
    precise float _820 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _821 = _820 * _510;
    precise float _822 = _820 * _511;
    precise float _823 = _820 * _512;
    precise float _829 = fma(_190, _195, cb2._m0.x);
    precise float _830 = fma(_191, _195, cb2._m0.y);
    precise float _831 = fma(_192, _195, cb2._m0.z);
    vec3 _832 = vec3(_829, _830, _831);
    precise float _835 = inversesqrt(spvNMax(dp3_f32(_832, _832), 0.001000000047497451305389404296875));
    precise float _836 = _835 * _829;
    precise float _837 = _835 * _830;
    precise float _838 = _835 * _831;
    vec3 _839 = vec3(_808, _809, _810);
    precise float _843 = spvNClamp(dp3_f32(_839, cb2._m0), 0.0, 1.0);
    vec3 _844 = vec3(_836, _837, _838);
    precise float _846 = spvNClamp(dp3_f32(_839, _844), 0.0, 1.0);
    precise float _848 = spvNClamp(dp3_f32(cb2._m0, _844), 0.0, 1.0);
    precise float _849 = _848 + _848;
    precise float _850 = _848 * _849;
    precise float _851 = fma(_850, _601, -0.5);
    precise float _852 = 1.0 - _843;
    precise float _853 = _852 * _852;
    precise float _854 = _853 * _853;
    precise float _855 = _852 * _854;
    precise float _857 = abs(dp3_f32(_839, vec3(_196, _197, _198)));
    precise float _858 = 1.0 - _857;
    precise float _859 = _858 * _858;
    precise float _860 = _859 * _859;
    precise float _861 = _858 * _860;
    precise float _863 = fma(_851, _861, 1.0) * fma(_851, _855, 1.0);
    precise float _864 = _601 * _601;
    precise float _865 = spvNMax(_864, 0.00200000009499490261077880859375);
    precise float _866 = 1.0 - _865;
    precise float _869 = _857 * fma(_843, _866, _865);
    precise float _871 = fma(_843, fma(_857, _866, _865), _869) + 9.9999997473787516355514526367188e-06;
    precise float _872 = 0.5 / _871;
    precise float _873 = _865 * _865;
    precise float _876 = fma(fma(_846, _873, -_846), _846, 1.0);
    precise float _877 = _873 * 0.3183098733425140380859375;
    precise float _879 = _877 / fma(_876, _876, 1.0000000116860974230803549289703e-07);
    precise float _880 = _872 * _879;
    precise float _881 = _880 * 3.1415927410125732421875;
    precise float _882 = _843 * _863;
    precise float _883 = _843 * _881;
    precise float _886 = 1.0 / fma(_865, _865, 1.0);
    vec3 _887 = vec3(_816, _817, _818);
    precise float _891 = spvNMax(_883, 0.0) * ((dp3_f32(_887, _887) == 0.0) ? 0.0 : 1.0);
    precise float _892 = cb0._m5.x - _820;
    precise float _893 = _892 + 1.0;
    precise float _894 = spvNClamp(_893, 0.0, 1.0);
    precise float _895 = _882 * _624;
    precise float _896 = _882 * _625;
    precise float _897 = _882 * _626;
    precise float _898 = _624 * _891;
    precise float _899 = _625 * _891;
    precise float _900 = _626 * _891;
    precise float _901 = 1.0 - _848;
    precise float _902 = _901 * _901;
    precise float _903 = _902 * _902;
    precise float _904 = _901 * _903;
    precise float _905 = 1.0 - _816;
    precise float _906 = 1.0 - _817;
    precise float _907 = 1.0 - _818;
    precise float _911 = fma(_905, _904, _816) * _898;
    precise float _912 = fma(_906, _904, _817) * _899;
    precise float _913 = fma(_907, _904, _818) * _900;
    precise float _917 = _805 * _886;
    precise float _918 = _804 * _886;
    precise float _919 = _803 * _886;
    precise float _920 = _894 - _816;
    precise float _921 = _894 - _817;
    precise float _922 = _894 - _818;
    SV_Target.x = fma(_917, fma(_861, _920, _816), fma(_821, _895, _911));
    SV_Target.y = fma(_918, fma(_861, _921, _817), fma(_822, _896, _912));
    SV_Target.z = fma(_919, fma(_861, _922, _818), fma(_823, _897, _913));
    SV_Target.w = 1.0;
}

