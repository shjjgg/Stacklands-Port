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

layout(set = 0, binding = 5, std140) uniform cb5_buf
{
    uvec4 m;
} cb5;

layout(set = 0, binding = 6, std140) uniform cb6_buf
{
    vec4 m[4096];
} cb6;

layout(set = 0, binding = 7) uniform sampler s0;
layout(set = 0, binding = 8) uniform sampler s1;
layout(set = 0, binding = 9) uniform sampler s2;
layout(set = 0, binding = 10) uniform sampler s3;
layout(set = 0, binding = 11) uniform sampler s4;
layout(set = 0, binding = 12) uniform sampler s5;
layout(set = 0, binding = 13) uniform texture2D t0;
layout(set = 0, binding = 14) uniform texture2D t1;
layout(set = 0, binding = 15) uniform texture2D t2;
layout(set = 0, binding = 16) uniform texture2D t3;
layout(set = 0, binding = 17) uniform textureCube t4;
layout(set = 0, binding = 18) uniform textureCube t5;
layout(set = 0, binding = 19) uniform texture3D t6;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
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
    precise float _177 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _177));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _166 = a.x * b.x;
    return fma(a.y, b.y, _166);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _148 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _148)));
}

void main()
{
    precise float _207 = cb1._m4.x - TEXCOORD2.x;
    precise float _208 = cb1._m4.y - TEXCOORD2.y;
    precise float _209 = cb1._m4.z - TEXCOORD2.z;
    vec3 _210 = vec3(_207, _208, _209);
    precise float _212 = inversesqrt(dp3_f32(_210, _210));
    precise float _213 = _207 * _212;
    precise float _214 = _208 * _212;
    precise float _215 = _209 * _212;
    precise float _218 = TEXCOORD.y * 150.0;
    precise float _221 = sin(roundEven(_218)) * 43758.546875;
    precise float _225 = fma(fract(_221), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _226 = _225 * 150.0;
    precise float _227 = _225 * 10.0;
    precise float _230 = sin(roundEven(_226)) * 43758.546875;
    precise float _232 = fma(fract(_230), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _241 = abs(dFdy(_225)) + abs(dFdx(_225));
    precise float _242 = abs(dFdy(_232)) + abs(dFdx(_232));
    precise float _243 = 1.0 - TEXCOORD.x;
    precise float _244 = 1.0 - TEXCOORD.y;
    bool _251 = cb0._m19.x > 0.5;
    bool _253 = cb0._m19.y > 0.5;
    float _256 = _253 ? (_251 ? 0.550000011920928955078125 : 0.5) : (_251 ? 0.5 : 0.449999988079071044921875);
    float _258 = (_251 || _253) ? 2.0 : 1.75;
    precise float _259 = _243 - 0.5;
    precise float _260 = _244 - _256;
    precise float _261 = _258 * _259;
    precise float _262 = fma(_259, _258, 0.5);
    precise float _263 = fma(_260, _258, _256);
    precise float _272 = float(_262 >= 0.0) * float(_262 <= 1.0);
    precise float _273 = float(_263 >= 0.0) * _272;
    vec2 _276 = vec2(_262, _263);
    vec4 _279 = texture(sampler2D(t0, s2), _276);
    float _280 = _279.x;
    float _281 = _279.w;
    vec4 _285 = texture(sampler2D(t1, s4), _276);
    float _286 = _285.x;
    float _287 = _285.w;
    precise float _289 = fma(-_273, float(_263 <= 1.0), 1.0);
    precise float _293 = fma(_289, -_281, _281);
    precise float _297 = fma(_289, -_287, _287);
    precise float _298 = TEXCOORD2.x - cb1._m4.x;
    precise float _299 = TEXCOORD2.y - cb1._m4.y;
    precise float _300 = TEXCOORD2.z - cb1._m4.z;
    vec3 _301 = vec3(_298, _299, _300);
    precise float _303 = inversesqrt(dp3_f32(_301, _301));
    precise float _304 = _303 * _298;
    precise float _305 = _303 * _300;
    precise float _306 = TEXCOORD.y + TEXCOORD.x;
    precise float _307 = TEXCOORD.y + TEXCOORD.y;
    precise float _311 = fma(-_305, 5.0, _307);
    precise float _312 = _311 * 10.0;
    precise float _314 = fma(sin(_312), 0.0199999995529651641845703125, fma(-_304, 5.0, _306));
    precise float _315 = _314 * 30.0;
    vec4 _322 = texture(sampler2D(t2, s3), vec2(_314, fma(cos(_315), 0.0199999995529651641845703125, _311)));
    precise float _330 = fma(cb1._m0.z, 2.0, _306) * 0.0199999995529651641845703125;
    float _333 = float(fract(_330) >= 0.9900000095367431640625);
    bool _338 = cb0._m15.x > 0.5;
    bool _339 = cb0._m15.y > 0.5;
    float _350 = _338 ? fma(_333, cb0._m18.y, cb0._m6.x) : cb0._m6.x;
    float _351 = _338 ? fma(_333, cb0._m18.y, cb0._m6.y) : cb0._m6.y;
    float _352 = _338 ? fma(_333, cb0._m18.y, cb0._m6.z) : cb0._m6.z;
    precise float _353 = _261 + 0.0;
    precise float _354 = _263 - 0.5;
    vec2 _355 = vec2(_353, _354);
    precise float _362 = (_251 ? spvNMax(abs(_354), abs(_353)) : sqrt(dp2_f32(_355, _355))) - 0.400390625;
    precise float _363 = _362 / _241;
    precise float _365 = 1.0 - spvNClamp(_363, 0.0, 1.0);
    precise float _371 = cb0._m8.x - _350;
    precise float _372 = cb0._m8.y - _351;
    precise float _373 = cb0._m8.z - _352;
    precise float _374 = fma(_365, _371, _350);
    precise float _375 = fma(_365, _372, _351);
    precise float _376 = fma(_365, _373, _352);
    float _378 = (_232 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _379 = cb0._m8.x - _374;
    precise float _380 = cb0._m8.y - _375;
    precise float _381 = cb0._m8.z - _376;
    precise float _382 = fma(_378, _379, _374);
    precise float _383 = fma(_378, _380, _375);
    precise float _384 = fma(_378, _381, _376);
    precise float _385 = 1.0 - fma(_289, -_280, _280);
    precise float _391 = cb0._m13.x - cb0._m6.x;
    precise float _392 = cb0._m13.y - cb0._m6.y;
    precise float _393 = cb0._m13.z - cb0._m6.z;
    precise float _397 = fma(_385, _391, cb0._m6.x) - _382;
    precise float _398 = fma(_385, _392, cb0._m6.y) - _383;
    precise float _399 = fma(_385, _393, cb0._m6.z) - _384;
    precise float _400 = fma(_293, _397, _382);
    precise float _401 = fma(_293, _398, _383);
    precise float _402 = fma(_293, _399, _384);
    bool _405 = (cb0._m19.y == 0.0) && (cb0._m19.x == 0.0);
    precise float _406 = 1.0 - fma(_289, -_286, _286);
    precise float _410 = fma(_406, _391, cb0._m6.x) - _400;
    precise float _411 = fma(_406, _392, cb0._m6.y) - _401;
    precise float _412 = fma(_406, _393, cb0._m6.z) - _402;
    float _416 = _405 ? _400 : fma(_297, _410, _400);
    float _417 = _405 ? _401 : fma(_297, _411, _401);
    float _418 = _405 ? _402 : fma(_297, _412, _402);
    precise float _419 = -_242;
    precise float _420 = fma(_419, 0.5, 0.189999997615814208984375);
    precise float _421 = fma(_419, 0.5, 0.2100000083446502685546875);
    precise float _424 = _232 - _420;
    precise float _425 = _232 - _421;
    precise float _428 = fma(_242, 0.5, -_420) + 0.189999997615814208984375;
    precise float _429 = fma(_242, 0.5, -_421) + 0.2100000083446502685546875;
    precise float _430 = _424 / _428;
    precise float _431 = _425 / _429;
    precise float _434 = 1.0 - spvNClamp(_431, 0.0, 1.0);
    precise float _437 = _225 - 0.1167768537998199462890625;
    precise float _438 = _232 - 0.02999999932944774627685546875;
    precise float _439 = _437 / _241;
    precise float _440 = _438 / _242;
    precise float _443 = 0.88322317600250244140625 - _225;
    precise float _444 = 0.9700000286102294921875 - _232;
    precise float _445 = _443 / _241;
    precise float _446 = _444 / _242;
    precise float _449 = spvNClamp(_439, 0.0, 1.0) * spvNClamp(_445, 0.0, 1.0);
    precise float _450 = spvNClamp(_440, 0.0, 1.0) * _449;
    precise float _451 = spvNClamp(_446, 0.0, 1.0) * _450;
    precise float _452 = fma(-spvNClamp(_430, 0.0, 1.0), _434, 1.0) * _451;
    precise float _453 = _232 * 10.0;
    precise float _457 = abs(fma(fract(_453), 2.0, -1.0)) - 0.5;
    precise float _459 = sin(_453) * _457;
    precise float _463 = abs(fma(fract(_227), 2.0, -1.0)) - 0.5;
    precise float _465 = sin(_227) * _463;
    precise float _466 = fma(_459, 0.0199999995529651641845703125, _225);
    precise float _467 = fma(_465, 0.0199999995529651641845703125, _232);
    precise float _468 = _466 - 0.089776851236820220947265625;
    precise float _469 = _467 - 0.0030000000260770320892333984375;
    precise float _470 = _468 / _241;
    precise float _471 = _469 / _242;
    precise float _474 = 0.91022312641143798828125 - _466;
    precise float _475 = 0.9969999790191650390625 - _467;
    precise float _476 = _474 / _241;
    precise float _477 = _475 / _242;
    precise float _480 = spvNClamp(_476, 0.0, 1.0) * spvNClamp(_470, 0.0, 1.0);
    precise float _481 = spvNClamp(_471, 0.0, 1.0) * _480;
    if ((fma(_481, spvNClamp(_477, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _339)
    {
        demote;
    }
    precise float _500 = (_338 ? fma(_322.x, cb0._m18.x, _416) : _416) - cb0._m10.x;
    precise float _501 = (_338 ? fma(_322.y, cb0._m18.x, _417) : _417) - cb0._m10.y;
    precise float _502 = (_338 ? fma(_322.z, cb0._m18.x, _418) : _418) - cb0._m10.z;
    precise float _503 = fma(_452, _500, cb0._m10.x);
    precise float _504 = fma(_452, _501, cb0._m10.y);
    precise float _505 = fma(_452, _502, cb0._m10.z);
    float _527;
    float _528;
    float _529;
    if (cb0._m15.y != 0.0)
    {
        float _520 = float(texture(sampler2D(t3, s5), vec2(_339 ? _466 : _225, _339 ? _467 : _232)).w >= 0.5);
        precise float _521 = _503 * (-0.39999997615814208984375);
        precise float _522 = _504 * (-0.39999997615814208984375);
        precise float _523 = _505 * (-0.39999997615814208984375);
        _527 = fma(_520, _521, _503);
        _528 = fma(_520, _522, _504);
        _529 = fma(_520, _523, _505);
    }
    else
    {
        _527 = _503;
        _528 = _504;
        _529 = _505;
    }
    uint _530 = (SV_InstanceID + cb5.m.x) * 7u;
    bool _534 = cb4._m0.x == 1.0;
    float _612;
    float _613;
    float _614;
    float _615;
    if (_534)
    {
        bool _543 = cb4._m0.y == 1.0;
        precise float _549 = TEXCOORD2.y * cb4._m3.x;
        precise float _550 = TEXCOORD2.y * cb4._m3.y;
        precise float _551 = TEXCOORD2.y * cb4._m3.z;
        precise float _573 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _549)) + cb4._m7.x;
        precise float _574 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _550)) + cb4._m7.y;
        precise float _575 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _551)) + cb4._m7.z;
        precise float _584 = (_543 ? _573 : TEXCOORD2.x) - cb4._m11.x;
        precise float _585 = (_543 ? _574 : TEXCOORD2.y) - cb4._m11.y;
        precise float _586 = (_543 ? _575 : TEXCOORD2.z) - cb4._m11.z;
        precise float _592 = _584 * cb4._m9.x;
        precise float _593 = _585 * cb4._m9.y;
        precise float _594 = _586 * cb4._m9.z;
        vec4 _603 = texture(sampler3D(t6, s1), vec3(spvNMax(fma(cb4._m0.z, 0.5, 0.75), fma(_592, 0.25, 0.75)), _593, _594));
        _612 = _603.w;
        _613 = _603.z;
        _614 = _603.y;
        _615 = _603.x;
    }
    else
    {
        uint _608 = _530 + 6u;
        _612 = cb6.m[_608].w;
        _613 = cb6.m[_608].w;
        _614 = cb6.m[_608].w;
        _615 = cb6.m[_608].w;
    }
    precise float _622 = spvNClamp(dp4_f32(vec4(_615, _614, _613, _612), cb2._m47), 0.0, 1.0);
    precise float _625 = 1.0 - cb0._m5.x;
    precise float _626 = -_213;
    precise float _627 = -_214;
    precise float _628 = -_215;
    vec3 _636 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _637 = dp3_f32(vec3(_626, _627, _628), _636);
    precise float _638 = _637 + _637;
    precise float _639 = -_638;
    precise float _640 = fma(TEXCOORD1.x, _639, _626);
    precise float _641 = fma(TEXCOORD1.y, _639, _627);
    precise float _642 = fma(TEXCOORD1.z, _639, _628);
    precise float _648 = _622 * cb0._m2.x;
    precise float _649 = _622 * cb0._m2.y;
    precise float _650 = _622 * cb0._m2.z;
    vec4 _651 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _744;
    float _745;
    float _746;
    if (_534)
    {
        bool _657 = cb4._m0.y == 1.0;
        precise float _663 = TEXCOORD2.y * cb4._m3.x;
        precise float _664 = TEXCOORD2.y * cb4._m3.y;
        precise float _665 = TEXCOORD2.y * cb4._m3.z;
        precise float _687 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _663)) + cb4._m7.x;
        precise float _688 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _664)) + cb4._m7.y;
        precise float _689 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _665)) + cb4._m7.z;
        precise float _698 = (_657 ? _687 : TEXCOORD2.x) - cb4._m11.x;
        precise float _699 = (_657 ? _688 : TEXCOORD2.y) - cb4._m11.y;
        precise float _700 = (_657 ? _689 : TEXCOORD2.z) - cb4._m11.z;
        precise float _706 = _698 * cb4._m9.x;
        precise float _707 = _699 * cb4._m9.y;
        precise float _708 = _700 * cb4._m9.z;
        precise float _709 = _706 * 0.25;
        precise float _712 = cb4._m0.z * 0.5;
        precise float _716 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_712, _709));
        precise float _720 = _716 + 0.25;
        precise float _721 = _707 + 0.0;
        precise float _722 = _708 + 0.0;
        precise float _726 = _716 + 0.5;
        _744 = dp4_f32(texture(sampler3D(t6, s1), vec3(_726, _721, _722)), _651);
        _745 = dp4_f32(texture(sampler3D(t6, s1), vec3(_720, _721, _722)), _651);
        _746 = dp4_f32(texture(sampler3D(t6, s1), vec3(_716, _707, _708)), _651);
    }
    else
    {
        _744 = dp4_f32(cb6.m[_530 + 2u], _651);
        _745 = dp4_f32(cb6.m[_530 + 1u], _651);
        _746 = dp4_f32(cb6.m[_530], _651);
    }
    precise float _753 = _746 + TEXCOORD3.x;
    precise float _754 = _745 + TEXCOORD3.y;
    precise float _755 = _744 + TEXCOORD3.z;
    vec3 _763 = vec3(_640, _641, _642);
    float _812;
    float _813;
    float _814;
    if (cb3._m5 > 0.0)
    {
        precise float _767 = inversesqrt(dp3_f32(_763, _763));
        precise float _768 = _767 * _640;
        precise float _769 = _767 * _641;
        precise float _770 = _767 * _642;
        precise float _776 = cb3._m0.x - TEXCOORD2.x;
        precise float _777 = cb3._m0.y - TEXCOORD2.y;
        precise float _778 = cb3._m0.z - TEXCOORD2.z;
        precise float _779 = _776 / _768;
        precise float _780 = _777 / _769;
        precise float _781 = _778 / _770;
        precise float _787 = cb3._m2.x - TEXCOORD2.x;
        precise float _788 = cb3._m2.y - TEXCOORD2.y;
        precise float _789 = cb3._m2.z - TEXCOORD2.z;
        precise float _790 = _787 / _768;
        precise float _791 = _788 / _769;
        precise float _792 = _789 / _770;
        precise float _800 = spvNMin((_770 > 0.0) ? _781 : _792, spvNMin((_769 > 0.0) ? _780 : _791, (_768 > 0.0) ? _779 : _790));
        precise float _806 = TEXCOORD2.x - cb3._m4.x;
        precise float _807 = TEXCOORD2.y - cb3._m4.y;
        precise float _808 = TEXCOORD2.z - cb3._m4.z;
        _812 = fma(_770, _800, _808);
        _813 = fma(_769, _800, _807);
        _814 = fma(_768, _800, _806);
    }
    else
    {
        _812 = _642;
        _813 = _641;
        _814 = _640;
    }
    precise float _817 = fma(-_625, 0.699999988079071044921875, 1.7000000476837158203125) * _625;
    precise float _818 = _817 * 6.0;
    vec4 _824 = textureLod(samplerCube(t4, s0), vec3(_814, _813, _812), _818);
    float _825 = _824.x;
    float _826 = _824.y;
    float _827 = _824.z;
    precise float _829 = _824.w - 1.0;
    precise float _836 = log2(fma(cb3._m6.w, _829, 1.0)) * cb3._m6.y;
    precise float _840 = exp2(_836) * cb3._m6.x;
    precise float _841 = _825 * _840;
    precise float _842 = _826 * _840;
    precise float _843 = _827 * _840;
    float _935;
    float _936;
    float _937;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _900;
        float _901;
        float _902;
        if (cb3._m12 > 0.0)
        {
            precise float _855 = inversesqrt(dp3_f32(_763, _763));
            precise float _856 = _855 * _640;
            precise float _857 = _855 * _641;
            precise float _858 = _855 * _642;
            precise float _864 = cb3._m7.x - TEXCOORD2.x;
            precise float _865 = cb3._m7.y - TEXCOORD2.y;
            precise float _866 = cb3._m7.z - TEXCOORD2.z;
            precise float _867 = _864 / _856;
            precise float _868 = _865 / _857;
            precise float _869 = _866 / _858;
            precise float _875 = cb3._m9.x - TEXCOORD2.x;
            precise float _876 = cb3._m9.y - TEXCOORD2.y;
            precise float _877 = cb3._m9.z - TEXCOORD2.z;
            precise float _878 = _875 / _856;
            precise float _879 = _876 / _857;
            precise float _880 = _877 / _858;
            precise float _888 = spvNMin((_858 > 0.0) ? _869 : _880, spvNMin((_857 > 0.0) ? _868 : _879, (_856 > 0.0) ? _867 : _878));
            precise float _894 = TEXCOORD2.x - cb3._m11.x;
            precise float _895 = TEXCOORD2.y - cb3._m11.y;
            precise float _896 = TEXCOORD2.z - cb3._m11.z;
            _900 = fma(_858, _888, _896);
            _901 = fma(_857, _888, _895);
            _902 = fma(_856, _888, _894);
        }
        else
        {
            _900 = _642;
            _901 = _641;
            _902 = _640;
        }
        vec4 _906 = textureLod(samplerCube(t5, s0), vec3(_902, _901, _900), _818);
        precise float _911 = _906.w - 1.0;
        precise float _918 = log2(fma(cb3._m13.w, _911, 1.0)) * cb3._m13.y;
        precise float _922 = exp2(_918) * cb3._m13.x;
        precise float _923 = _906.x * _922;
        precise float _924 = _906.y * _922;
        precise float _925 = _906.z * _922;
        _935 = fma(cb3._m3, fma(_840, _827, -_925), _925);
        _936 = fma(cb3._m3, fma(_840, _826, -_924), _924);
        _937 = fma(cb3._m3, fma(_840, _825, -_923), _923);
    }
    else
    {
        _935 = _843;
        _936 = _842;
        _937 = _841;
    }
    precise float _939 = inversesqrt(dp3_f32(_636, _636));
    precise float _940 = _939 * TEXCOORD1.x;
    precise float _941 = _939 * TEXCOORD1.y;
    precise float _942 = _939 * TEXCOORD1.z;
    precise float _943 = _527 - 0.039999999105930328369140625;
    precise float _944 = _528 - 0.039999999105930328369140625;
    precise float _945 = _529 - 0.039999999105930328369140625;
    precise float _948 = fma(cb0._m5.y, _943, 0.039999999105930328369140625);
    precise float _949 = fma(cb0._m5.y, _944, 0.039999999105930328369140625);
    precise float _950 = fma(cb0._m5.y, _945, 0.039999999105930328369140625);
    precise float _952 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _953 = _952 * _527;
    precise float _954 = _952 * _528;
    precise float _955 = _952 * _529;
    precise float _961 = fma(_207, _212, cb2._m0.x);
    precise float _962 = fma(_208, _212, cb2._m0.y);
    precise float _963 = fma(_209, _212, cb2._m0.z);
    vec3 _964 = vec3(_961, _962, _963);
    precise float _967 = inversesqrt(spvNMax(dp3_f32(_964, _964), 0.001000000047497451305389404296875));
    precise float _968 = _961 * _967;
    precise float _969 = _962 * _967;
    precise float _970 = _963 * _967;
    vec3 _971 = vec3(_940, _941, _942);
    precise float _975 = spvNClamp(dp3_f32(_971, cb2._m0), 0.0, 1.0);
    vec3 _976 = vec3(_968, _969, _970);
    precise float _978 = spvNClamp(dp3_f32(_971, _976), 0.0, 1.0);
    precise float _980 = spvNClamp(dp3_f32(cb2._m0, _976), 0.0, 1.0);
    precise float _981 = _980 + _980;
    precise float _982 = _980 * _981;
    precise float _983 = fma(_982, _625, -0.5);
    precise float _984 = 1.0 - _975;
    precise float _985 = _984 * _984;
    precise float _986 = _985 * _985;
    precise float _987 = _984 * _986;
    precise float _989 = abs(dp3_f32(_971, vec3(_213, _214, _215)));
    precise float _990 = 1.0 - _989;
    precise float _991 = _990 * _990;
    precise float _992 = _991 * _991;
    precise float _993 = _990 * _992;
    precise float _995 = fma(_983, _993, 1.0) * fma(_983, _987, 1.0);
    precise float _996 = _975 * _995;
    precise float _997 = _625 * _625;
    precise float _998 = spvNMax(_997, 0.00200000009499490261077880859375);
    precise float _999 = 1.0 - _998;
    precise float _1002 = _989 * fma(_975, _999, _998);
    precise float _1004 = fma(_975, fma(_989, _999, _998), _1002) + 9.9999997473787516355514526367188e-06;
    precise float _1005 = 0.5 / _1004;
    precise float _1006 = _998 * _998;
    precise float _1009 = fma(fma(_978, _1006, -_978), _978, 1.0);
    precise float _1010 = _1006 * 0.3183098733425140380859375;
    precise float _1012 = _1010 / fma(_1009, _1009, 1.0000000116860974230803549289703e-07);
    precise float _1013 = _1012 * _1005;
    precise float _1014 = _1013 * 3.1415927410125732421875;
    precise float _1015 = _975 * _1014;
    precise float _1018 = 1.0 / fma(_998, _998, 1.0);
    vec3 _1019 = vec3(_948, _949, _950);
    precise float _1023 = ((dp3_f32(_1019, _1019) == 0.0) ? 0.0 : 1.0) * spvNMax(_1015, 0.0);
    precise float _1024 = cb0._m5.x - _952;
    precise float _1025 = _1024 + 1.0;
    precise float _1026 = spvNClamp(_1025, 0.0, 1.0);
    precise float _1030 = _648 * _1023;
    precise float _1031 = _649 * _1023;
    precise float _1032 = _650 * _1023;
    precise float _1033 = 1.0 - _980;
    precise float _1034 = _1033 * _1033;
    precise float _1035 = _1034 * _1034;
    precise float _1036 = _1033 * _1035;
    precise float _1037 = 1.0 - _948;
    precise float _1038 = 1.0 - _949;
    precise float _1039 = 1.0 - _950;
    precise float _1043 = _1030 * fma(_1037, _1036, _948);
    precise float _1044 = _1031 * fma(_1038, _1036, _949);
    precise float _1045 = _1032 * fma(_1039, _1036, _950);
    precise float _1049 = _937 * _1018;
    precise float _1050 = _936 * _1018;
    precise float _1051 = _935 * _1018;
    precise float _1052 = _1026 - _948;
    precise float _1053 = _1026 - _949;
    precise float _1054 = _1026 - _950;
    SV_Target.x = fma(_1049, fma(_993, _1052, _948), fma(_953, fma(_648, _996, spvNMax(_753, 0.0)), _1043));
    SV_Target.y = fma(_1050, fma(_993, _1053, _949), fma(_954, fma(_649, _996, spvNMax(_754, 0.0)), _1044));
    SV_Target.z = fma(_1051, fma(_993, _1054, _950), fma(_955, fma(_650, _996, spvNMax(_755, 0.0)), _1045));
    SV_Target.w = 1.0;
}

