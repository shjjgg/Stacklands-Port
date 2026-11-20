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
layout(set = 0, binding = 10) uniform sampler s3;
layout(set = 0, binding = 11) uniform sampler s4;
layout(set = 0, binding = 12) uniform sampler s5;
layout(set = 0, binding = 13) uniform sampler s6;
layout(set = 0, binding = 14) uniform texture2D t0;
layout(set = 0, binding = 15) uniform texture2D t1;
layout(set = 0, binding = 16) uniform texture2D t2;
layout(set = 0, binding = 17) uniform texture2D t3;
layout(set = 0, binding = 18) uniform texture2D t4;
layout(set = 0, binding = 19) uniform textureCube t5;
layout(set = 0, binding = 20) uniform textureCube t6;
layout(set = 0, binding = 21) uniform texture3D t7;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec4 TEXCOORD5;
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
    precise float _184 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _184));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _173 = a.x * b.x;
    return fma(a.y, b.y, _173);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _155 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _155)));
}

void main()
{
    precise float _208 = cb1._m4.x - TEXCOORD2.x;
    precise float _209 = cb1._m4.y - TEXCOORD2.y;
    precise float _210 = cb1._m4.z - TEXCOORD2.z;
    vec3 _211 = vec3(_208, _209, _210);
    precise float _213 = inversesqrt(dp3_f32(_211, _211));
    precise float _214 = _213 * _208;
    precise float _215 = _213 * _209;
    precise float _216 = _213 * _210;
    precise float _219 = TEXCOORD.y * 150.0;
    precise float _222 = sin(roundEven(_219)) * 43758.546875;
    precise float _226 = fma(fract(_222), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _227 = _226 * 150.0;
    precise float _228 = _226 * 10.0;
    precise float _231 = sin(roundEven(_227)) * 43758.546875;
    precise float _233 = fma(fract(_231), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _242 = abs(dFdy(_226)) + abs(dFdx(_226));
    precise float _243 = abs(dFdy(_233)) + abs(dFdx(_233));
    precise float _244 = 1.0 - TEXCOORD.x;
    precise float _245 = 1.0 - TEXCOORD.y;
    bool _252 = cb0._m19.x > 0.5;
    bool _254 = cb0._m19.y > 0.5;
    float _257 = _254 ? (_252 ? 0.550000011920928955078125 : 0.5) : (_252 ? 0.5 : 0.449999988079071044921875);
    float _259 = (_252 || _254) ? 2.0 : 1.75;
    precise float _260 = _244 - 0.5;
    precise float _261 = _245 - _257;
    precise float _262 = _259 * _260;
    precise float _263 = fma(_260, _259, 0.5);
    precise float _264 = fma(_261, _259, _257);
    precise float _273 = float(_263 >= 0.0) * float(_263 <= 1.0);
    precise float _274 = float(_264 >= 0.0) * _273;
    vec2 _277 = vec2(_263, _264);
    vec4 _280 = texture(sampler2D(t0, s3), _277);
    float _281 = _280.x;
    float _282 = _280.w;
    vec4 _286 = texture(sampler2D(t1, s5), _277);
    float _287 = _286.x;
    float _288 = _286.w;
    precise float _290 = fma(-_274, float(_264 <= 1.0), 1.0);
    precise float _294 = fma(_290, -_282, _282);
    precise float _298 = fma(_290, -_288, _288);
    precise float _299 = TEXCOORD2.x - cb1._m4.x;
    precise float _300 = TEXCOORD2.y - cb1._m4.y;
    precise float _301 = TEXCOORD2.z - cb1._m4.z;
    vec3 _302 = vec3(_299, _300, _301);
    precise float _304 = inversesqrt(dp3_f32(_302, _302));
    precise float _305 = _304 * _299;
    precise float _306 = _304 * _301;
    precise float _307 = TEXCOORD.y + TEXCOORD.x;
    precise float _308 = TEXCOORD.y + TEXCOORD.y;
    precise float _312 = fma(-_306, 5.0, _308);
    precise float _313 = _312 * 10.0;
    precise float _315 = fma(sin(_313), 0.0199999995529651641845703125, fma(-_305, 5.0, _307));
    precise float _316 = _315 * 30.0;
    vec4 _323 = texture(sampler2D(t2, s4), vec2(_315, fma(cos(_316), 0.0199999995529651641845703125, _312)));
    precise float _331 = fma(cb1._m0.z, 2.0, _307) * 0.0199999995529651641845703125;
    float _334 = float(fract(_331) >= 0.9900000095367431640625);
    bool _339 = cb0._m15.x > 0.5;
    bool _340 = cb0._m15.y > 0.5;
    float _351 = _339 ? fma(_334, cb0._m18.y, cb0._m6.x) : cb0._m6.x;
    float _352 = _339 ? fma(_334, cb0._m18.y, cb0._m6.y) : cb0._m6.y;
    float _353 = _339 ? fma(_334, cb0._m18.y, cb0._m6.z) : cb0._m6.z;
    precise float _354 = _262 + 0.0;
    precise float _355 = _264 - 0.5;
    vec2 _356 = vec2(_354, _355);
    precise float _363 = (_252 ? spvNMax(abs(_355), abs(_354)) : sqrt(dp2_f32(_356, _356))) - 0.400390625;
    precise float _364 = _363 / _242;
    precise float _366 = 1.0 - spvNClamp(_364, 0.0, 1.0);
    precise float _372 = cb0._m8.x - _351;
    precise float _373 = cb0._m8.y - _352;
    precise float _374 = cb0._m8.z - _353;
    precise float _375 = fma(_366, _372, _351);
    precise float _376 = fma(_366, _373, _352);
    precise float _377 = fma(_366, _374, _353);
    float _379 = (_233 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _380 = cb0._m8.x - _375;
    precise float _381 = cb0._m8.y - _376;
    precise float _382 = cb0._m8.z - _377;
    precise float _383 = fma(_379, _380, _375);
    precise float _384 = fma(_379, _381, _376);
    precise float _385 = fma(_379, _382, _377);
    precise float _386 = 1.0 - fma(_290, -_281, _281);
    precise float _392 = cb0._m13.x - cb0._m6.x;
    precise float _393 = cb0._m13.y - cb0._m6.y;
    precise float _394 = cb0._m13.z - cb0._m6.z;
    precise float _398 = fma(_386, _392, cb0._m6.x) - _383;
    precise float _399 = fma(_386, _393, cb0._m6.y) - _384;
    precise float _400 = fma(_386, _394, cb0._m6.z) - _385;
    precise float _401 = fma(_294, _398, _383);
    precise float _402 = fma(_294, _399, _384);
    precise float _403 = fma(_294, _400, _385);
    bool _406 = (cb0._m19.y == 0.0) && (cb0._m19.x == 0.0);
    precise float _407 = 1.0 - fma(_290, -_287, _287);
    precise float _411 = fma(_407, _392, cb0._m6.x) - _401;
    precise float _412 = fma(_407, _393, cb0._m6.y) - _402;
    precise float _413 = fma(_407, _394, cb0._m6.z) - _403;
    float _417 = _406 ? _401 : fma(_298, _411, _401);
    float _418 = _406 ? _402 : fma(_298, _412, _402);
    float _419 = _406 ? _403 : fma(_298, _413, _403);
    precise float _420 = -_243;
    precise float _421 = fma(_420, 0.5, 0.189999997615814208984375);
    precise float _422 = fma(_420, 0.5, 0.2100000083446502685546875);
    precise float _425 = _233 - _421;
    precise float _426 = _233 - _422;
    precise float _429 = fma(_243, 0.5, -_421) + 0.189999997615814208984375;
    precise float _430 = fma(_243, 0.5, -_422) + 0.2100000083446502685546875;
    precise float _431 = _425 / _429;
    precise float _432 = _426 / _430;
    precise float _435 = 1.0 - spvNClamp(_432, 0.0, 1.0);
    precise float _438 = _226 - 0.1167768537998199462890625;
    precise float _439 = _233 - 0.02999999932944774627685546875;
    precise float _440 = _438 / _242;
    precise float _441 = _439 / _243;
    precise float _444 = 0.88322317600250244140625 - _226;
    precise float _445 = 0.9700000286102294921875 - _233;
    precise float _446 = _444 / _242;
    precise float _447 = _445 / _243;
    precise float _450 = spvNClamp(_440, 0.0, 1.0) * spvNClamp(_446, 0.0, 1.0);
    precise float _451 = spvNClamp(_441, 0.0, 1.0) * _450;
    precise float _452 = spvNClamp(_447, 0.0, 1.0) * _451;
    precise float _453 = fma(-spvNClamp(_431, 0.0, 1.0), _435, 1.0) * _452;
    precise float _454 = _233 * 10.0;
    precise float _458 = abs(fma(fract(_454), 2.0, -1.0)) - 0.5;
    precise float _460 = sin(_454) * _458;
    precise float _464 = abs(fma(fract(_228), 2.0, -1.0)) - 0.5;
    precise float _466 = sin(_228) * _464;
    precise float _467 = fma(_460, 0.0199999995529651641845703125, _226);
    precise float _468 = fma(_466, 0.0199999995529651641845703125, _233);
    precise float _469 = _467 - 0.089776851236820220947265625;
    precise float _470 = _468 - 0.0030000000260770320892333984375;
    precise float _471 = _469 / _242;
    precise float _472 = _470 / _243;
    precise float _475 = 0.91022312641143798828125 - _467;
    precise float _476 = 0.9969999790191650390625 - _468;
    precise float _477 = _475 / _242;
    precise float _478 = _476 / _243;
    precise float _481 = spvNClamp(_471, 0.0, 1.0) * spvNClamp(_477, 0.0, 1.0);
    precise float _482 = spvNClamp(_472, 0.0, 1.0) * _481;
    if ((fma(_482, spvNClamp(_478, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _340)
    {
        demote;
    }
    precise float _501 = (_339 ? fma(_323.x, cb0._m18.x, _417) : _417) - cb0._m10.x;
    precise float _502 = (_339 ? fma(_323.y, cb0._m18.x, _418) : _418) - cb0._m10.y;
    precise float _503 = (_339 ? fma(_323.z, cb0._m18.x, _419) : _419) - cb0._m10.z;
    precise float _504 = fma(_453, _501, cb0._m10.x);
    precise float _505 = fma(_453, _502, cb0._m10.y);
    precise float _506 = fma(_453, _503, cb0._m10.z);
    float _528;
    float _529;
    float _530;
    if (cb0._m15.y != 0.0)
    {
        float _521 = float(texture(sampler2D(t3, s6), vec2(_340 ? _467 : _226, _340 ? _468 : _233)).w >= 0.5);
        precise float _522 = _504 * (-0.39999997615814208984375);
        precise float _523 = _505 * (-0.39999997615814208984375);
        precise float _524 = _506 * (-0.39999997615814208984375);
        _528 = fma(_521, _522, _504);
        _529 = fma(_521, _523, _505);
        _530 = fma(_521, _524, _506);
    }
    else
    {
        _528 = _504;
        _529 = _505;
        _530 = _506;
    }
    float _539 = dp3_f32(_211, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _546 = TEXCOORD2.x - cb3._m25.x;
    precise float _547 = TEXCOORD2.y - cb3._m25.y;
    precise float _548 = TEXCOORD2.z - cb3._m25.z;
    vec3 _549 = vec3(_546, _547, _548);
    precise float _552 = sqrt(dp3_f32(_549, _549)) - _539;
    float _637;
    float _638;
    float _639;
    float _640;
    if (cb6._m0.x == 1.0)
    {
        bool _570 = cb6._m0.y == 1.0;
        precise float _576 = TEXCOORD2.y * cb6._m3.x;
        precise float _577 = TEXCOORD2.y * cb6._m3.y;
        precise float _578 = TEXCOORD2.y * cb6._m3.z;
        precise float _600 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _576)) + cb6._m7.x;
        precise float _601 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _577)) + cb6._m7.y;
        precise float _602 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _578)) + cb6._m7.z;
        precise float _611 = (_570 ? _600 : TEXCOORD2.x) - cb6._m11.x;
        precise float _612 = (_570 ? _601 : TEXCOORD2.y) - cb6._m11.y;
        precise float _613 = (_570 ? _602 : TEXCOORD2.z) - cb6._m11.z;
        precise float _619 = _611 * cb6._m9.x;
        precise float _620 = _612 * cb6._m9.y;
        precise float _621 = _613 * cb6._m9.z;
        vec4 _632 = texture(sampler3D(t7, s1), vec3(spvNMax(fma(_619, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _620, _621));
        _637 = _632.w;
        _638 = _632.z;
        _639 = _632.y;
        _640 = _632.x;
    }
    else
    {
        _637 = 1.0;
        _638 = 1.0;
        _639 = 1.0;
        _640 = 1.0;
    }
    precise float _654 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _655 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _660 = texture(sampler2D(t4, s2), vec2(_654, _655));
    float _661 = _660.x;
    precise float _662 = spvNClamp(dp4_f32(vec4(_640, _639, _638, _637), cb2._m47), 0.0, 1.0) - _661;
    precise float _663 = fma(spvNClamp(fma(fma(cb3._m26, _552, _539), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _662, _661);
    precise float _666 = 1.0 - cb0._m5.x;
    precise float _667 = -_214;
    precise float _668 = -_215;
    precise float _669 = -_216;
    vec3 _677 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _678 = dp3_f32(vec3(_667, _668, _669), _677);
    precise float _679 = _678 + _678;
    precise float _680 = -_679;
    precise float _681 = fma(TEXCOORD1.x, _680, _667);
    precise float _682 = fma(TEXCOORD1.y, _680, _668);
    precise float _683 = fma(TEXCOORD1.z, _680, _669);
    precise float _689 = _663 * cb0._m2.x;
    precise float _690 = _663 * cb0._m2.y;
    precise float _691 = _663 * cb0._m2.z;
    vec3 _696 = vec3(_681, _682, _683);
    float _745;
    float _746;
    float _747;
    if (cb5._m5 > 0.0)
    {
        precise float _700 = inversesqrt(dp3_f32(_696, _696));
        precise float _701 = _700 * _681;
        precise float _702 = _700 * _682;
        precise float _703 = _700 * _683;
        precise float _709 = cb5._m0.x - TEXCOORD2.x;
        precise float _710 = cb5._m0.y - TEXCOORD2.y;
        precise float _711 = cb5._m0.z - TEXCOORD2.z;
        precise float _712 = _709 / _701;
        precise float _713 = _710 / _702;
        precise float _714 = _711 / _703;
        precise float _720 = cb5._m2.x - TEXCOORD2.x;
        precise float _721 = cb5._m2.y - TEXCOORD2.y;
        precise float _722 = cb5._m2.z - TEXCOORD2.z;
        precise float _723 = _720 / _701;
        precise float _724 = _721 / _702;
        precise float _725 = _722 / _703;
        precise float _733 = spvNMin((_703 > 0.0) ? _714 : _725, spvNMin((_702 > 0.0) ? _713 : _724, (_701 > 0.0) ? _712 : _723));
        precise float _739 = TEXCOORD2.x - cb5._m4.x;
        precise float _740 = TEXCOORD2.y - cb5._m4.y;
        precise float _741 = TEXCOORD2.z - cb5._m4.z;
        _745 = fma(_703, _733, _741);
        _746 = fma(_702, _733, _740);
        _747 = fma(_701, _733, _739);
    }
    else
    {
        _745 = _683;
        _746 = _682;
        _747 = _681;
    }
    precise float _750 = fma(-_666, 0.699999988079071044921875, 1.7000000476837158203125) * _666;
    precise float _751 = _750 * 6.0;
    vec4 _757 = textureLod(samplerCube(t5, s0), vec3(_747, _746, _745), _751);
    float _758 = _757.x;
    float _759 = _757.y;
    float _760 = _757.z;
    precise float _762 = _757.w - 1.0;
    precise float _769 = log2(fma(cb5._m6.w, _762, 1.0)) * cb5._m6.y;
    precise float _773 = exp2(_769) * cb5._m6.x;
    precise float _774 = _758 * _773;
    precise float _775 = _759 * _773;
    precise float _776 = _760 * _773;
    float _868;
    float _869;
    float _870;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _833;
        float _834;
        float _835;
        if (cb5._m12 > 0.0)
        {
            precise float _788 = inversesqrt(dp3_f32(_696, _696));
            precise float _789 = _681 * _788;
            precise float _790 = _682 * _788;
            precise float _791 = _683 * _788;
            precise float _797 = cb5._m7.x - TEXCOORD2.x;
            precise float _798 = cb5._m7.y - TEXCOORD2.y;
            precise float _799 = cb5._m7.z - TEXCOORD2.z;
            precise float _800 = _797 / _789;
            precise float _801 = _798 / _790;
            precise float _802 = _799 / _791;
            precise float _808 = cb5._m9.x - TEXCOORD2.x;
            precise float _809 = cb5._m9.y - TEXCOORD2.y;
            precise float _810 = cb5._m9.z - TEXCOORD2.z;
            precise float _811 = _808 / _789;
            precise float _812 = _809 / _790;
            precise float _813 = _810 / _791;
            precise float _821 = spvNMin((_791 > 0.0) ? _802 : _813, spvNMin((_790 > 0.0) ? _801 : _812, (_789 > 0.0) ? _800 : _811));
            precise float _827 = TEXCOORD2.x - cb5._m11.x;
            precise float _828 = TEXCOORD2.y - cb5._m11.y;
            precise float _829 = TEXCOORD2.z - cb5._m11.z;
            _833 = fma(_791, _821, _829);
            _834 = fma(_790, _821, _828);
            _835 = fma(_789, _821, _827);
        }
        else
        {
            _833 = _683;
            _834 = _682;
            _835 = _681;
        }
        vec4 _839 = textureLod(samplerCube(t6, s0), vec3(_835, _834, _833), _751);
        precise float _844 = _839.w - 1.0;
        precise float _851 = log2(fma(cb5._m13.w, _844, 1.0)) * cb5._m13.y;
        precise float _855 = exp2(_851) * cb5._m13.x;
        precise float _856 = _839.x * _855;
        precise float _857 = _839.y * _855;
        precise float _858 = _839.z * _855;
        _868 = fma(cb5._m3, fma(_773, _760, -_858), _858);
        _869 = fma(cb5._m3, fma(_773, _759, -_857), _857);
        _870 = fma(cb5._m3, fma(_773, _758, -_856), _856);
    }
    else
    {
        _868 = _776;
        _869 = _775;
        _870 = _774;
    }
    precise float _872 = inversesqrt(dp3_f32(_677, _677));
    precise float _873 = _872 * TEXCOORD1.x;
    precise float _874 = _872 * TEXCOORD1.y;
    precise float _875 = _872 * TEXCOORD1.z;
    precise float _876 = _528 - 0.039999999105930328369140625;
    precise float _877 = _529 - 0.039999999105930328369140625;
    precise float _878 = _530 - 0.039999999105930328369140625;
    precise float _881 = fma(cb0._m5.y, _876, 0.039999999105930328369140625);
    precise float _882 = fma(cb0._m5.y, _877, 0.039999999105930328369140625);
    precise float _883 = fma(cb0._m5.y, _878, 0.039999999105930328369140625);
    precise float _885 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _886 = _885 * _528;
    precise float _887 = _885 * _529;
    precise float _888 = _885 * _530;
    precise float _894 = fma(_208, _213, cb2._m0.x);
    precise float _895 = fma(_209, _213, cb2._m0.y);
    precise float _896 = fma(_210, _213, cb2._m0.z);
    vec3 _897 = vec3(_894, _895, _896);
    precise float _900 = inversesqrt(spvNMax(dp3_f32(_897, _897), 0.001000000047497451305389404296875));
    precise float _901 = _900 * _894;
    precise float _902 = _900 * _895;
    precise float _903 = _900 * _896;
    vec3 _904 = vec3(_873, _874, _875);
    precise float _908 = spvNClamp(dp3_f32(_904, cb2._m0), 0.0, 1.0);
    vec3 _909 = vec3(_901, _902, _903);
    precise float _911 = spvNClamp(dp3_f32(_904, _909), 0.0, 1.0);
    precise float _913 = spvNClamp(dp3_f32(cb2._m0, _909), 0.0, 1.0);
    precise float _914 = _913 + _913;
    precise float _915 = _913 * _914;
    precise float _916 = fma(_915, _666, -0.5);
    precise float _917 = 1.0 - _908;
    precise float _918 = _917 * _917;
    precise float _919 = _918 * _918;
    precise float _920 = _917 * _919;
    precise float _922 = abs(dp3_f32(_904, vec3(_214, _215, _216)));
    precise float _923 = 1.0 - _922;
    precise float _924 = _923 * _923;
    precise float _925 = _924 * _924;
    precise float _926 = _923 * _925;
    precise float _928 = fma(_916, _926, 1.0) * fma(_916, _920, 1.0);
    precise float _929 = _666 * _666;
    precise float _930 = spvNMax(_929, 0.00200000009499490261077880859375);
    precise float _931 = 1.0 - _930;
    precise float _934 = _922 * fma(_908, _931, _930);
    precise float _936 = fma(_908, fma(_922, _931, _930), _934) + 9.9999997473787516355514526367188e-06;
    precise float _937 = 0.5 / _936;
    precise float _938 = _930 * _930;
    precise float _941 = fma(fma(_911, _938, -_911), _911, 1.0);
    precise float _942 = _938 * 0.3183098733425140380859375;
    precise float _944 = _942 / fma(_941, _941, 1.0000000116860974230803549289703e-07);
    precise float _945 = _937 * _944;
    precise float _946 = _945 * 3.1415927410125732421875;
    precise float _947 = _908 * _928;
    precise float _948 = _908 * _946;
    precise float _951 = 1.0 / fma(_930, _930, 1.0);
    vec3 _952 = vec3(_881, _882, _883);
    precise float _956 = spvNMax(_948, 0.0) * ((dp3_f32(_952, _952) == 0.0) ? 0.0 : 1.0);
    precise float _957 = 1.0 - _885;
    precise float _958 = _957 + cb0._m5.x;
    precise float _959 = spvNClamp(_958, 0.0, 1.0);
    precise float _960 = _947 * _689;
    precise float _961 = _947 * _690;
    precise float _962 = _947 * _691;
    precise float _963 = _689 * _956;
    precise float _964 = _690 * _956;
    precise float _965 = _691 * _956;
    precise float _966 = 1.0 - _913;
    precise float _967 = _966 * _966;
    precise float _968 = _967 * _967;
    precise float _969 = _966 * _968;
    precise float _970 = 1.0 - _881;
    precise float _971 = 1.0 - _882;
    precise float _972 = 1.0 - _883;
    precise float _976 = fma(_970, _969, _881) * _963;
    precise float _977 = fma(_971, _969, _882) * _964;
    precise float _978 = fma(_972, _969, _883) * _965;
    precise float _982 = _870 * _951;
    precise float _983 = _869 * _951;
    precise float _984 = _868 * _951;
    precise float _985 = _959 - _881;
    precise float _986 = _959 - _882;
    precise float _987 = _959 - _883;
    SV_Target.x = fma(_982, fma(_926, _985, _881), fma(_886, _960, _976));
    SV_Target.y = fma(_983, fma(_926, _986, _882), fma(_887, _961, _977));
    SV_Target.z = fma(_984, fma(_926, _987, _883), fma(_888, _962, _978));
    SV_Target.w = 1.0;
}

