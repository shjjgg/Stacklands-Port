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
layout(set = 0, binding = 12) uniform sampler s3;
layout(set = 0, binding = 13) uniform sampler s4;
layout(set = 0, binding = 14) uniform sampler s5;
layout(set = 0, binding = 15) uniform sampler s6;
layout(set = 0, binding = 16) uniform texture2D t0;
layout(set = 0, binding = 17) uniform texture2D t1;
layout(set = 0, binding = 18) uniform texture2D t2;
layout(set = 0, binding = 19) uniform texture2D t3;
layout(set = 0, binding = 20) uniform texture2D t4;
layout(set = 0, binding = 21) uniform textureCube t5;
layout(set = 0, binding = 22) uniform textureCube t6;
layout(set = 0, binding = 23) uniform texture3D t7;

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
    precise float _195 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _195));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _184 = a.x * b.x;
    return fma(a.y, b.y, _184);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _166 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _166)));
}

void main()
{
    precise float _225 = cb1._m4.x - TEXCOORD2.x;
    precise float _226 = cb1._m4.y - TEXCOORD2.y;
    precise float _227 = cb1._m4.z - TEXCOORD2.z;
    vec3 _228 = vec3(_225, _226, _227);
    precise float _230 = inversesqrt(dp3_f32(_228, _228));
    precise float _231 = _225 * _230;
    precise float _232 = _226 * _230;
    precise float _233 = _227 * _230;
    precise float _236 = TEXCOORD.y * 150.0;
    precise float _239 = sin(roundEven(_236)) * 43758.546875;
    precise float _243 = fma(fract(_239), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _244 = _243 * 150.0;
    precise float _245 = _243 * 10.0;
    precise float _248 = sin(roundEven(_244)) * 43758.546875;
    precise float _250 = fma(fract(_248), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _259 = abs(dFdy(_243)) + abs(dFdx(_243));
    precise float _260 = abs(dFdy(_250)) + abs(dFdx(_250));
    precise float _261 = 1.0 - TEXCOORD.x;
    precise float _262 = 1.0 - TEXCOORD.y;
    bool _269 = cb0._m19.x > 0.5;
    bool _271 = cb0._m19.y > 0.5;
    float _274 = _271 ? (_269 ? 0.550000011920928955078125 : 0.5) : (_269 ? 0.5 : 0.449999988079071044921875);
    float _276 = (_269 || _271) ? 2.0 : 1.75;
    precise float _277 = _261 - 0.5;
    precise float _278 = _262 - _274;
    precise float _279 = _276 * _277;
    precise float _280 = fma(_277, _276, 0.5);
    precise float _281 = fma(_278, _276, _274);
    precise float _290 = float(_280 >= 0.0) * float(_280 <= 1.0);
    precise float _291 = float(_281 >= 0.0) * _290;
    vec2 _294 = vec2(_280, _281);
    vec4 _297 = texture(sampler2D(t0, s3), _294);
    float _298 = _297.x;
    float _299 = _297.w;
    vec4 _303 = texture(sampler2D(t1, s5), _294);
    float _304 = _303.x;
    float _305 = _303.w;
    precise float _307 = fma(-_291, float(_281 <= 1.0), 1.0);
    precise float _311 = fma(_307, -_299, _299);
    precise float _315 = fma(_307, -_305, _305);
    precise float _316 = TEXCOORD2.x - cb1._m4.x;
    precise float _317 = TEXCOORD2.y - cb1._m4.y;
    precise float _318 = TEXCOORD2.z - cb1._m4.z;
    vec3 _319 = vec3(_316, _317, _318);
    precise float _321 = inversesqrt(dp3_f32(_319, _319));
    precise float _322 = _321 * _316;
    precise float _323 = _321 * _318;
    precise float _324 = TEXCOORD.y + TEXCOORD.x;
    precise float _325 = TEXCOORD.y + TEXCOORD.y;
    precise float _329 = fma(-_323, 5.0, _325);
    precise float _330 = _329 * 10.0;
    precise float _332 = fma(sin(_330), 0.0199999995529651641845703125, fma(-_322, 5.0, _324));
    precise float _333 = _332 * 30.0;
    vec4 _340 = texture(sampler2D(t2, s4), vec2(_332, fma(cos(_333), 0.0199999995529651641845703125, _329)));
    precise float _348 = fma(cb1._m0.z, 2.0, _324) * 0.0199999995529651641845703125;
    float _351 = float(fract(_348) >= 0.9900000095367431640625);
    bool _356 = cb0._m15.x > 0.5;
    bool _357 = cb0._m15.y > 0.5;
    float _368 = _356 ? fma(_351, cb0._m18.y, cb0._m6.x) : cb0._m6.x;
    float _369 = _356 ? fma(_351, cb0._m18.y, cb0._m6.y) : cb0._m6.y;
    float _370 = _356 ? fma(_351, cb0._m18.y, cb0._m6.z) : cb0._m6.z;
    precise float _371 = _279 + 0.0;
    precise float _372 = _281 - 0.5;
    vec2 _373 = vec2(_371, _372);
    precise float _380 = (_269 ? spvNMax(abs(_372), abs(_371)) : sqrt(dp2_f32(_373, _373))) - 0.400390625;
    precise float _381 = _380 / _259;
    precise float _383 = 1.0 - spvNClamp(_381, 0.0, 1.0);
    precise float _389 = cb0._m8.x - _368;
    precise float _390 = cb0._m8.y - _369;
    precise float _391 = cb0._m8.z - _370;
    precise float _392 = fma(_383, _389, _368);
    precise float _393 = fma(_383, _390, _369);
    precise float _394 = fma(_383, _391, _370);
    float _396 = (_250 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _397 = cb0._m8.x - _392;
    precise float _398 = cb0._m8.y - _393;
    precise float _399 = cb0._m8.z - _394;
    precise float _400 = fma(_396, _397, _392);
    precise float _401 = fma(_396, _398, _393);
    precise float _402 = fma(_396, _399, _394);
    precise float _403 = 1.0 - fma(_307, -_298, _298);
    precise float _409 = cb0._m13.x - cb0._m6.x;
    precise float _410 = cb0._m13.y - cb0._m6.y;
    precise float _411 = cb0._m13.z - cb0._m6.z;
    precise float _415 = fma(_403, _409, cb0._m6.x) - _400;
    precise float _416 = fma(_403, _410, cb0._m6.y) - _401;
    precise float _417 = fma(_403, _411, cb0._m6.z) - _402;
    precise float _418 = fma(_311, _415, _400);
    precise float _419 = fma(_311, _416, _401);
    precise float _420 = fma(_311, _417, _402);
    bool _423 = (cb0._m19.y == 0.0) && (cb0._m19.x == 0.0);
    precise float _424 = 1.0 - fma(_307, -_304, _304);
    precise float _428 = fma(_424, _409, cb0._m6.x) - _418;
    precise float _429 = fma(_424, _410, cb0._m6.y) - _419;
    precise float _430 = fma(_424, _411, cb0._m6.z) - _420;
    float _434 = _423 ? _418 : fma(_315, _428, _418);
    float _435 = _423 ? _419 : fma(_315, _429, _419);
    float _436 = _423 ? _420 : fma(_315, _430, _420);
    precise float _437 = -_260;
    precise float _438 = fma(_437, 0.5, 0.189999997615814208984375);
    precise float _439 = fma(_437, 0.5, 0.2100000083446502685546875);
    precise float _442 = _250 - _438;
    precise float _443 = _250 - _439;
    precise float _446 = fma(_260, 0.5, -_438) + 0.189999997615814208984375;
    precise float _447 = fma(_260, 0.5, -_439) + 0.2100000083446502685546875;
    precise float _448 = _442 / _446;
    precise float _449 = _443 / _447;
    precise float _452 = 1.0 - spvNClamp(_449, 0.0, 1.0);
    precise float _455 = _243 - 0.1167768537998199462890625;
    precise float _456 = _250 - 0.02999999932944774627685546875;
    precise float _457 = _455 / _259;
    precise float _458 = _456 / _260;
    precise float _461 = 0.88322317600250244140625 - _243;
    precise float _462 = 0.9700000286102294921875 - _250;
    precise float _463 = _461 / _259;
    precise float _464 = _462 / _260;
    precise float _467 = spvNClamp(_457, 0.0, 1.0) * spvNClamp(_463, 0.0, 1.0);
    precise float _468 = spvNClamp(_458, 0.0, 1.0) * _467;
    precise float _469 = spvNClamp(_464, 0.0, 1.0) * _468;
    precise float _470 = fma(-spvNClamp(_448, 0.0, 1.0), _452, 1.0) * _469;
    precise float _471 = _250 * 10.0;
    precise float _475 = abs(fma(fract(_471), 2.0, -1.0)) - 0.5;
    precise float _477 = sin(_471) * _475;
    precise float _481 = abs(fma(fract(_245), 2.0, -1.0)) - 0.5;
    precise float _483 = sin(_245) * _481;
    precise float _484 = fma(_477, 0.0199999995529651641845703125, _243);
    precise float _485 = fma(_483, 0.0199999995529651641845703125, _250);
    precise float _486 = _484 - 0.089776851236820220947265625;
    precise float _487 = _485 - 0.0030000000260770320892333984375;
    precise float _488 = _486 / _259;
    precise float _489 = _487 / _260;
    precise float _492 = 0.91022312641143798828125 - _484;
    precise float _493 = 0.9969999790191650390625 - _485;
    precise float _494 = _492 / _259;
    precise float _495 = _493 / _260;
    precise float _498 = spvNClamp(_494, 0.0, 1.0) * spvNClamp(_488, 0.0, 1.0);
    precise float _499 = spvNClamp(_489, 0.0, 1.0) * _498;
    if ((fma(_499, spvNClamp(_495, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _357)
    {
        demote;
    }
    precise float _518 = (_356 ? fma(_340.x, cb0._m18.x, _434) : _434) - cb0._m10.x;
    precise float _519 = (_356 ? fma(_340.y, cb0._m18.x, _435) : _435) - cb0._m10.y;
    precise float _520 = (_356 ? fma(_340.z, cb0._m18.x, _436) : _436) - cb0._m10.z;
    precise float _521 = fma(_470, _518, cb0._m10.x);
    precise float _522 = fma(_470, _519, cb0._m10.y);
    precise float _523 = fma(_470, _520, cb0._m10.z);
    float _545;
    float _546;
    float _547;
    if (cb0._m15.y != 0.0)
    {
        float _538 = float(texture(sampler2D(t3, s6), vec2(_357 ? _484 : _243, _357 ? _485 : _250)).w >= 0.5);
        precise float _539 = _521 * (-0.39999997615814208984375);
        precise float _540 = _522 * (-0.39999997615814208984375);
        precise float _541 = _523 * (-0.39999997615814208984375);
        _545 = fma(_538, _539, _521);
        _546 = fma(_538, _540, _522);
        _547 = fma(_538, _541, _523);
    }
    else
    {
        _545 = _521;
        _546 = _522;
        _547 = _523;
    }
    float _556 = dp3_f32(_228, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _563 = TEXCOORD2.x - cb3._m25.x;
    precise float _564 = TEXCOORD2.y - cb3._m25.y;
    precise float _565 = TEXCOORD2.z - cb3._m25.z;
    vec3 _566 = vec3(_563, _564, _565);
    precise float _569 = sqrt(dp3_f32(_566, _566)) - _556;
    uint _579 = (SV_InstanceID + cb7.m.x) * 7u;
    bool _583 = cb6._m0.x == 1.0;
    float _661;
    float _662;
    float _663;
    float _664;
    if (_583)
    {
        bool _592 = cb6._m0.y == 1.0;
        precise float _598 = TEXCOORD2.y * cb6._m3.x;
        precise float _599 = TEXCOORD2.y * cb6._m3.y;
        precise float _600 = TEXCOORD2.y * cb6._m3.z;
        precise float _622 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _598)) + cb6._m7.x;
        precise float _623 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _599)) + cb6._m7.y;
        precise float _624 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _600)) + cb6._m7.z;
        precise float _633 = (_592 ? _622 : TEXCOORD2.x) - cb6._m11.x;
        precise float _634 = (_592 ? _623 : TEXCOORD2.y) - cb6._m11.y;
        precise float _635 = (_592 ? _624 : TEXCOORD2.z) - cb6._m11.z;
        precise float _641 = _633 * cb6._m9.x;
        precise float _642 = _634 * cb6._m9.y;
        precise float _643 = _635 * cb6._m9.z;
        vec4 _652 = texture(sampler3D(t7, s1), vec3(spvNMax(fma(cb6._m0.z, 0.5, 0.75), fma(_641, 0.25, 0.75)), _642, _643));
        _661 = _652.w;
        _662 = _652.z;
        _663 = _652.y;
        _664 = _652.x;
    }
    else
    {
        uint _657 = _579 + 6u;
        _661 = cb8.m[_657].w;
        _662 = cb8.m[_657].w;
        _663 = cb8.m[_657].w;
        _664 = cb8.m[_657].w;
    }
    precise float _678 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _679 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _684 = texture(sampler2D(t4, s2), vec2(_678, _679));
    float _685 = _684.x;
    precise float _686 = spvNClamp(dp4_f32(vec4(_664, _663, _662, _661), cb2._m47), 0.0, 1.0) - _685;
    precise float _687 = fma(spvNClamp(fma(fma(cb3._m26, _569, _556), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _686, _685);
    precise float _690 = 1.0 - cb0._m5.x;
    precise float _691 = -_231;
    precise float _692 = -_232;
    precise float _693 = -_233;
    vec3 _701 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _702 = dp3_f32(vec3(_691, _692, _693), _701);
    precise float _703 = _702 + _702;
    precise float _704 = -_703;
    precise float _705 = fma(TEXCOORD1.x, _704, _691);
    precise float _706 = fma(TEXCOORD1.y, _704, _692);
    precise float _707 = fma(TEXCOORD1.z, _704, _693);
    precise float _713 = _687 * cb0._m2.x;
    precise float _714 = _687 * cb0._m2.y;
    precise float _715 = _687 * cb0._m2.z;
    vec4 _716 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _809;
    float _810;
    float _811;
    if (_583)
    {
        bool _722 = cb6._m0.y == 1.0;
        precise float _728 = TEXCOORD2.y * cb6._m3.x;
        precise float _729 = TEXCOORD2.y * cb6._m3.y;
        precise float _730 = TEXCOORD2.y * cb6._m3.z;
        precise float _752 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _728)) + cb6._m7.x;
        precise float _753 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _729)) + cb6._m7.y;
        precise float _754 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _730)) + cb6._m7.z;
        precise float _763 = (_722 ? _752 : TEXCOORD2.x) - cb6._m11.x;
        precise float _764 = (_722 ? _753 : TEXCOORD2.y) - cb6._m11.y;
        precise float _765 = (_722 ? _754 : TEXCOORD2.z) - cb6._m11.z;
        precise float _771 = _763 * cb6._m9.x;
        precise float _772 = _764 * cb6._m9.y;
        precise float _773 = _765 * cb6._m9.z;
        precise float _774 = _771 * 0.25;
        precise float _777 = cb6._m0.z * 0.5;
        precise float _781 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_777, _774));
        precise float _785 = _781 + 0.25;
        precise float _786 = _772 + 0.0;
        precise float _787 = _773 + 0.0;
        precise float _791 = _781 + 0.5;
        _809 = dp4_f32(texture(sampler3D(t7, s1), vec3(_791, _786, _787)), _716);
        _810 = dp4_f32(texture(sampler3D(t7, s1), vec3(_785, _786, _787)), _716);
        _811 = dp4_f32(texture(sampler3D(t7, s1), vec3(_781, _772, _773)), _716);
    }
    else
    {
        _809 = dp4_f32(cb8.m[_579 + 2u], _716);
        _810 = dp4_f32(cb8.m[_579 + 1u], _716);
        _811 = dp4_f32(cb8.m[_579], _716);
    }
    precise float _818 = _811 + TEXCOORD3.x;
    precise float _819 = _810 + TEXCOORD3.y;
    precise float _820 = _809 + TEXCOORD3.z;
    vec3 _828 = vec3(_705, _706, _707);
    float _877;
    float _878;
    float _879;
    if (cb5._m5 > 0.0)
    {
        precise float _832 = inversesqrt(dp3_f32(_828, _828));
        precise float _833 = _832 * _705;
        precise float _834 = _832 * _706;
        precise float _835 = _832 * _707;
        precise float _841 = cb5._m0.x - TEXCOORD2.x;
        precise float _842 = cb5._m0.y - TEXCOORD2.y;
        precise float _843 = cb5._m0.z - TEXCOORD2.z;
        precise float _844 = _841 / _833;
        precise float _845 = _842 / _834;
        precise float _846 = _843 / _835;
        precise float _852 = cb5._m2.x - TEXCOORD2.x;
        precise float _853 = cb5._m2.y - TEXCOORD2.y;
        precise float _854 = cb5._m2.z - TEXCOORD2.z;
        precise float _855 = _852 / _833;
        precise float _856 = _853 / _834;
        precise float _857 = _854 / _835;
        precise float _865 = spvNMin((_835 > 0.0) ? _846 : _857, spvNMin((_834 > 0.0) ? _845 : _856, (_833 > 0.0) ? _844 : _855));
        precise float _871 = TEXCOORD2.x - cb5._m4.x;
        precise float _872 = TEXCOORD2.y - cb5._m4.y;
        precise float _873 = TEXCOORD2.z - cb5._m4.z;
        _877 = fma(_835, _865, _873);
        _878 = fma(_834, _865, _872);
        _879 = fma(_833, _865, _871);
    }
    else
    {
        _877 = _707;
        _878 = _706;
        _879 = _705;
    }
    precise float _882 = fma(-_690, 0.699999988079071044921875, 1.7000000476837158203125) * _690;
    precise float _883 = _882 * 6.0;
    vec4 _889 = textureLod(samplerCube(t5, s0), vec3(_879, _878, _877), _883);
    float _890 = _889.x;
    float _891 = _889.y;
    float _892 = _889.z;
    precise float _894 = _889.w - 1.0;
    precise float _901 = log2(fma(cb5._m6.w, _894, 1.0)) * cb5._m6.y;
    precise float _905 = exp2(_901) * cb5._m6.x;
    precise float _906 = _890 * _905;
    precise float _907 = _891 * _905;
    precise float _908 = _892 * _905;
    float _1000;
    float _1001;
    float _1002;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _965;
        float _966;
        float _967;
        if (cb5._m12 > 0.0)
        {
            precise float _920 = inversesqrt(dp3_f32(_828, _828));
            precise float _921 = _920 * _705;
            precise float _922 = _920 * _706;
            precise float _923 = _920 * _707;
            precise float _929 = cb5._m7.x - TEXCOORD2.x;
            precise float _930 = cb5._m7.y - TEXCOORD2.y;
            precise float _931 = cb5._m7.z - TEXCOORD2.z;
            precise float _932 = _929 / _921;
            precise float _933 = _930 / _922;
            precise float _934 = _931 / _923;
            precise float _940 = cb5._m9.x - TEXCOORD2.x;
            precise float _941 = cb5._m9.y - TEXCOORD2.y;
            precise float _942 = cb5._m9.z - TEXCOORD2.z;
            precise float _943 = _940 / _921;
            precise float _944 = _941 / _922;
            precise float _945 = _942 / _923;
            precise float _953 = spvNMin((_923 > 0.0) ? _934 : _945, spvNMin((_922 > 0.0) ? _933 : _944, (_921 > 0.0) ? _932 : _943));
            precise float _959 = TEXCOORD2.x - cb5._m11.x;
            precise float _960 = TEXCOORD2.y - cb5._m11.y;
            precise float _961 = TEXCOORD2.z - cb5._m11.z;
            _965 = fma(_923, _953, _961);
            _966 = fma(_922, _953, _960);
            _967 = fma(_921, _953, _959);
        }
        else
        {
            _965 = _707;
            _966 = _706;
            _967 = _705;
        }
        vec4 _971 = textureLod(samplerCube(t6, s0), vec3(_967, _966, _965), _883);
        precise float _976 = _971.w - 1.0;
        precise float _983 = log2(fma(cb5._m13.w, _976, 1.0)) * cb5._m13.y;
        precise float _987 = exp2(_983) * cb5._m13.x;
        precise float _988 = _971.x * _987;
        precise float _989 = _971.y * _987;
        precise float _990 = _971.z * _987;
        _1000 = fma(cb5._m3, fma(_905, _892, -_990), _990);
        _1001 = fma(cb5._m3, fma(_905, _891, -_989), _989);
        _1002 = fma(cb5._m3, fma(_905, _890, -_988), _988);
    }
    else
    {
        _1000 = _908;
        _1001 = _907;
        _1002 = _906;
    }
    precise float _1004 = inversesqrt(dp3_f32(_701, _701));
    precise float _1005 = _1004 * TEXCOORD1.x;
    precise float _1006 = _1004 * TEXCOORD1.y;
    precise float _1007 = _1004 * TEXCOORD1.z;
    precise float _1008 = _545 - 0.039999999105930328369140625;
    precise float _1009 = _546 - 0.039999999105930328369140625;
    precise float _1010 = _547 - 0.039999999105930328369140625;
    precise float _1013 = fma(cb0._m5.y, _1008, 0.039999999105930328369140625);
    precise float _1014 = fma(cb0._m5.y, _1009, 0.039999999105930328369140625);
    precise float _1015 = fma(cb0._m5.y, _1010, 0.039999999105930328369140625);
    precise float _1017 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _1018 = _1017 * _545;
    precise float _1019 = _1017 * _546;
    precise float _1020 = _1017 * _547;
    precise float _1026 = fma(_225, _230, cb2._m0.x);
    precise float _1027 = fma(_226, _230, cb2._m0.y);
    precise float _1028 = fma(_227, _230, cb2._m0.z);
    vec3 _1029 = vec3(_1026, _1027, _1028);
    precise float _1032 = inversesqrt(spvNMax(dp3_f32(_1029, _1029), 0.001000000047497451305389404296875));
    precise float _1033 = _1026 * _1032;
    precise float _1034 = _1027 * _1032;
    precise float _1035 = _1028 * _1032;
    vec3 _1036 = vec3(_1005, _1006, _1007);
    precise float _1040 = spvNClamp(dp3_f32(_1036, cb2._m0), 0.0, 1.0);
    vec3 _1041 = vec3(_1033, _1034, _1035);
    precise float _1043 = spvNClamp(dp3_f32(_1036, _1041), 0.0, 1.0);
    precise float _1045 = spvNClamp(dp3_f32(cb2._m0, _1041), 0.0, 1.0);
    precise float _1046 = _1045 + _1045;
    precise float _1047 = _1045 * _1046;
    precise float _1048 = fma(_1047, _690, -0.5);
    precise float _1049 = 1.0 - _1040;
    precise float _1050 = _1049 * _1049;
    precise float _1051 = _1050 * _1050;
    precise float _1052 = _1049 * _1051;
    precise float _1054 = abs(dp3_f32(_1036, vec3(_231, _232, _233)));
    precise float _1055 = 1.0 - _1054;
    precise float _1056 = _1055 * _1055;
    precise float _1057 = _1056 * _1056;
    precise float _1058 = _1055 * _1057;
    precise float _1060 = fma(_1048, _1058, 1.0) * fma(_1048, _1052, 1.0);
    precise float _1061 = _1040 * _1060;
    precise float _1062 = _690 * _690;
    precise float _1063 = spvNMax(_1062, 0.00200000009499490261077880859375);
    precise float _1064 = 1.0 - _1063;
    precise float _1067 = _1054 * fma(_1040, _1064, _1063);
    precise float _1069 = fma(_1040, fma(_1054, _1064, _1063), _1067) + 9.9999997473787516355514526367188e-06;
    precise float _1070 = 0.5 / _1069;
    precise float _1071 = _1063 * _1063;
    precise float _1074 = fma(fma(_1043, _1071, -_1043), _1043, 1.0);
    precise float _1075 = _1071 * 0.3183098733425140380859375;
    precise float _1077 = _1075 / fma(_1074, _1074, 1.0000000116860974230803549289703e-07);
    precise float _1078 = _1077 * _1070;
    precise float _1079 = _1078 * 3.1415927410125732421875;
    precise float _1080 = _1040 * _1079;
    precise float _1083 = 1.0 / fma(_1063, _1063, 1.0);
    vec3 _1084 = vec3(_1013, _1014, _1015);
    precise float _1088 = ((dp3_f32(_1084, _1084) == 0.0) ? 0.0 : 1.0) * spvNMax(_1080, 0.0);
    precise float _1089 = cb0._m5.x - _1017;
    precise float _1090 = _1089 + 1.0;
    precise float _1091 = spvNClamp(_1090, 0.0, 1.0);
    precise float _1095 = _713 * _1088;
    precise float _1096 = _714 * _1088;
    precise float _1097 = _715 * _1088;
    precise float _1098 = 1.0 - _1045;
    precise float _1099 = _1098 * _1098;
    precise float _1100 = _1099 * _1099;
    precise float _1101 = _1098 * _1100;
    precise float _1102 = 1.0 - _1013;
    precise float _1103 = 1.0 - _1014;
    precise float _1104 = 1.0 - _1015;
    precise float _1108 = _1095 * fma(_1102, _1101, _1013);
    precise float _1109 = _1096 * fma(_1103, _1101, _1014);
    precise float _1110 = _1097 * fma(_1104, _1101, _1015);
    precise float _1114 = _1002 * _1083;
    precise float _1115 = _1001 * _1083;
    precise float _1116 = _1000 * _1083;
    precise float _1117 = _1091 - _1013;
    precise float _1118 = _1091 - _1014;
    precise float _1119 = _1091 - _1015;
    SV_Target.x = fma(_1114, fma(_1058, _1117, _1013), fma(_1018, fma(_713, _1061, spvNMax(_818, 0.0)), _1108));
    SV_Target.y = fma(_1115, fma(_1058, _1118, _1014), fma(_1019, fma(_714, _1061, spvNMax(_819, 0.0)), _1109));
    SV_Target.z = fma(_1116, fma(_1058, _1119, _1015), fma(_1020, fma(_715, _1061, spvNMax(_820, 0.0)), _1110));
    SV_Target.w = 1.0;
}

