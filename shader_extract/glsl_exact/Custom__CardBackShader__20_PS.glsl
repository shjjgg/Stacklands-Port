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
layout(set = 0, binding = 7) uniform sampler s2;
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform textureCube t1;
layout(set = 0, binding = 10) uniform textureCube t2;
layout(set = 0, binding = 11) uniform texture3D t3;

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
    precise float _130 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _130));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _113 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _113)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _101 = a.x * b.x;
    return fma(a.y, b.y, _101);
}

void main()
{
    precise float _154 = cb1._m4.x - TEXCOORD2.x;
    precise float _155 = cb1._m4.y - TEXCOORD2.y;
    precise float _156 = cb1._m4.z - TEXCOORD2.z;
    vec3 _157 = vec3(_154, _155, _156);
    precise float _159 = inversesqrt(dp3_f32(_157, _157));
    precise float _160 = _159 * _154;
    precise float _161 = _159 * _155;
    precise float _162 = _159 * _156;
    vec4 _172 = texture(sampler2D(t0, s2), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _182 = _172.x * cb0._m6.x;
    precise float _183 = _172.y * cb0._m6.y;
    precise float _184 = _172.z * cb0._m6.z;
    precise float _185 = TEXCOORD.y + TEXCOORD.x;
    precise float _186 = _185 * 10.0;
    precise float _189 = roundEven(fract(_186)) + 0.800000011920928955078125;
    precise float _190 = spvNMin(_189, 1.0);
    precise float _191 = _190 * _182;
    precise float _192 = _190 * _183;
    precise float _193 = _190 * _184;
    bool _201 = (((TEXCOORD.x < 0.13677684962749481201171875) || (TEXCOORD.x > 0.863223135471343994140625)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _202 = _201 ? 0.0 : _191;
    float _203 = _201 ? 0.0 : _192;
    float _204 = _201 ? 0.0 : _193;
    float _281;
    float _282;
    float _283;
    float _284;
    if (cb4._m0.x == 1.0)
    {
        bool _214 = cb4._m0.y == 1.0;
        precise float _220 = TEXCOORD2.y * cb4._m3.x;
        precise float _221 = TEXCOORD2.y * cb4._m3.y;
        precise float _222 = TEXCOORD2.y * cb4._m3.z;
        precise float _244 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _220)) + cb4._m7.x;
        precise float _245 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _221)) + cb4._m7.y;
        precise float _246 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _222)) + cb4._m7.z;
        precise float _255 = (_214 ? _244 : TEXCOORD2.x) - cb4._m11.x;
        precise float _256 = (_214 ? _245 : TEXCOORD2.y) - cb4._m11.y;
        precise float _257 = (_214 ? _246 : TEXCOORD2.z) - cb4._m11.z;
        precise float _263 = _255 * cb4._m9.x;
        precise float _264 = _256 * cb4._m9.y;
        precise float _265 = _257 * cb4._m9.z;
        vec4 _276 = texture(sampler3D(t3, s1), vec3(spvNMax(fma(_263, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _264, _265));
        _281 = _276.w;
        _282 = _276.z;
        _283 = _276.y;
        _284 = _276.x;
    }
    else
    {
        _281 = 1.0;
        _282 = 1.0;
        _283 = 1.0;
        _284 = 1.0;
    }
    precise float _291 = spvNClamp(dp4_f32(vec4(_284, _283, _282, _281), cb2._m47), 0.0, 1.0);
    precise float _294 = 1.0 - cb0._m5.x;
    precise float _295 = -_160;
    precise float _296 = -_161;
    precise float _297 = -_162;
    vec3 _305 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _306 = dp3_f32(vec3(_295, _296, _297), _305);
    precise float _307 = _306 + _306;
    precise float _308 = -_307;
    precise float _309 = fma(TEXCOORD1.x, _308, _295);
    precise float _310 = fma(TEXCOORD1.y, _308, _296);
    precise float _311 = fma(TEXCOORD1.z, _308, _297);
    precise float _317 = _291 * cb0._m2.x;
    precise float _318 = _291 * cb0._m2.y;
    precise float _319 = _291 * cb0._m2.z;
    vec3 _324 = vec3(_309, _310, _311);
    float _373;
    float _374;
    float _375;
    if (cb3._m5 > 0.0)
    {
        precise float _328 = inversesqrt(dp3_f32(_324, _324));
        precise float _329 = _328 * _309;
        precise float _330 = _328 * _310;
        precise float _331 = _328 * _311;
        precise float _337 = cb3._m0.x - TEXCOORD2.x;
        precise float _338 = cb3._m0.y - TEXCOORD2.y;
        precise float _339 = cb3._m0.z - TEXCOORD2.z;
        precise float _340 = _337 / _329;
        precise float _341 = _338 / _330;
        precise float _342 = _339 / _331;
        precise float _348 = cb3._m2.x - TEXCOORD2.x;
        precise float _349 = cb3._m2.y - TEXCOORD2.y;
        precise float _350 = cb3._m2.z - TEXCOORD2.z;
        precise float _351 = _348 / _329;
        precise float _352 = _349 / _330;
        precise float _353 = _350 / _331;
        precise float _361 = spvNMin((_331 > 0.0) ? _342 : _353, spvNMin((_330 > 0.0) ? _341 : _352, (_329 > 0.0) ? _340 : _351));
        precise float _367 = TEXCOORD2.x - cb3._m4.x;
        precise float _368 = TEXCOORD2.y - cb3._m4.y;
        precise float _369 = TEXCOORD2.z - cb3._m4.z;
        _373 = fma(_331, _361, _369);
        _374 = fma(_330, _361, _368);
        _375 = fma(_329, _361, _367);
    }
    else
    {
        _373 = _311;
        _374 = _310;
        _375 = _309;
    }
    precise float _378 = fma(-_294, 0.699999988079071044921875, 1.7000000476837158203125) * _294;
    precise float _379 = _378 * 6.0;
    vec4 _385 = textureLod(samplerCube(t1, s0), vec3(_375, _374, _373), _379);
    float _386 = _385.x;
    float _387 = _385.y;
    float _388 = _385.z;
    precise float _390 = _385.w - 1.0;
    precise float _397 = log2(fma(cb3._m6.w, _390, 1.0)) * cb3._m6.y;
    precise float _401 = exp2(_397) * cb3._m6.x;
    precise float _402 = _386 * _401;
    precise float _403 = _387 * _401;
    precise float _404 = _388 * _401;
    float _496;
    float _497;
    float _498;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _461;
        float _462;
        float _463;
        if (cb3._m12 > 0.0)
        {
            precise float _416 = inversesqrt(dp3_f32(_324, _324));
            precise float _417 = _309 * _416;
            precise float _418 = _310 * _416;
            precise float _419 = _311 * _416;
            precise float _425 = cb3._m7.x - TEXCOORD2.x;
            precise float _426 = cb3._m7.y - TEXCOORD2.y;
            precise float _427 = cb3._m7.z - TEXCOORD2.z;
            precise float _428 = _425 / _417;
            precise float _429 = _426 / _418;
            precise float _430 = _427 / _419;
            precise float _436 = cb3._m9.x - TEXCOORD2.x;
            precise float _437 = cb3._m9.y - TEXCOORD2.y;
            precise float _438 = cb3._m9.z - TEXCOORD2.z;
            precise float _439 = _436 / _417;
            precise float _440 = _437 / _418;
            precise float _441 = _438 / _419;
            precise float _449 = spvNMin((_419 > 0.0) ? _430 : _441, spvNMin((_418 > 0.0) ? _429 : _440, (_417 > 0.0) ? _428 : _439));
            precise float _455 = TEXCOORD2.x - cb3._m11.x;
            precise float _456 = TEXCOORD2.y - cb3._m11.y;
            precise float _457 = TEXCOORD2.z - cb3._m11.z;
            _461 = fma(_419, _449, _457);
            _462 = fma(_418, _449, _456);
            _463 = fma(_417, _449, _455);
        }
        else
        {
            _461 = _311;
            _462 = _310;
            _463 = _309;
        }
        vec4 _467 = textureLod(samplerCube(t2, s0), vec3(_463, _462, _461), _379);
        precise float _472 = _467.w - 1.0;
        precise float _479 = log2(fma(cb3._m13.w, _472, 1.0)) * cb3._m13.y;
        precise float _483 = exp2(_479) * cb3._m13.x;
        precise float _484 = _467.x * _483;
        precise float _485 = _467.y * _483;
        precise float _486 = _467.z * _483;
        _496 = fma(cb3._m3, fma(_401, _388, -_486), _486);
        _497 = fma(cb3._m3, fma(_401, _387, -_485), _485);
        _498 = fma(cb3._m3, fma(_401, _386, -_484), _484);
    }
    else
    {
        _496 = _404;
        _497 = _403;
        _498 = _402;
    }
    precise float _500 = inversesqrt(dp3_f32(_305, _305));
    precise float _501 = _500 * TEXCOORD1.x;
    precise float _502 = _500 * TEXCOORD1.y;
    precise float _503 = _500 * TEXCOORD1.z;
    precise float _504 = _202 - 0.039999999105930328369140625;
    precise float _505 = _203 - 0.039999999105930328369140625;
    precise float _506 = _204 - 0.039999999105930328369140625;
    precise float _509 = fma(cb0._m5.y, _504, 0.039999999105930328369140625);
    precise float _510 = fma(cb0._m5.y, _505, 0.039999999105930328369140625);
    precise float _511 = fma(cb0._m5.y, _506, 0.039999999105930328369140625);
    precise float _513 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _514 = _513 * _202;
    precise float _515 = _513 * _203;
    precise float _516 = _513 * _204;
    precise float _522 = fma(_154, _159, cb2._m0.x);
    precise float _523 = fma(_155, _159, cb2._m0.y);
    precise float _524 = fma(_156, _159, cb2._m0.z);
    vec3 _525 = vec3(_522, _523, _524);
    precise float _528 = inversesqrt(spvNMax(dp3_f32(_525, _525), 0.001000000047497451305389404296875));
    precise float _529 = _528 * _522;
    precise float _530 = _528 * _523;
    precise float _531 = _528 * _524;
    vec3 _532 = vec3(_501, _502, _503);
    precise float _536 = spvNClamp(dp3_f32(_532, cb2._m0), 0.0, 1.0);
    vec3 _537 = vec3(_529, _530, _531);
    precise float _539 = spvNClamp(dp3_f32(_532, _537), 0.0, 1.0);
    precise float _541 = spvNClamp(dp3_f32(cb2._m0, _537), 0.0, 1.0);
    precise float _542 = _541 * _541;
    precise float _546 = dp2_f32(vec2(_542), vec2(_294)) - 0.5;
    precise float _547 = 1.0 - _536;
    precise float _548 = _547 * _547;
    precise float _549 = _548 * _548;
    precise float _550 = _547 * _549;
    precise float _552 = abs(dp3_f32(_532, vec3(_160, _161, _162)));
    precise float _553 = 1.0 - _552;
    precise float _554 = _553 * _553;
    precise float _555 = _554 * _554;
    precise float _556 = _553 * _555;
    precise float _558 = fma(_546, _556, 1.0) * fma(_546, _550, 1.0);
    precise float _559 = _294 * _294;
    precise float _560 = spvNMax(_559, 0.00200000009499490261077880859375);
    precise float _561 = 1.0 - _560;
    precise float _564 = _552 * fma(_536, _561, _560);
    precise float _566 = fma(_536, fma(_552, _561, _560), _564) + 9.9999997473787516355514526367188e-06;
    precise float _567 = 0.5 / _566;
    precise float _568 = _560 * _560;
    precise float _571 = fma(fma(_539, _568, -_539), _539, 1.0);
    precise float _572 = _568 * 0.3183098733425140380859375;
    precise float _574 = _572 / fma(_571, _571, 1.0000000116860974230803549289703e-07);
    precise float _575 = _567 * _574;
    precise float _576 = _575 * 3.1415927410125732421875;
    precise float _577 = _536 * _558;
    precise float _578 = _536 * _576;
    precise float _581 = 1.0 / fma(_560, _560, 1.0);
    vec3 _582 = vec3(_509, _510, _511);
    precise float _586 = spvNMax(_578, 0.0) * ((dp3_f32(_582, _582) == 0.0) ? 0.0 : 1.0);
    precise float _587 = cb0._m5.x - _513;
    precise float _588 = _587 + 1.0;
    precise float _589 = spvNClamp(_588, 0.0, 1.0);
    precise float _590 = _577 * _317;
    precise float _591 = _577 * _318;
    precise float _592 = _577 * _319;
    precise float _593 = _317 * _586;
    precise float _594 = _318 * _586;
    precise float _595 = _319 * _586;
    precise float _596 = 1.0 - _541;
    precise float _597 = _596 * _596;
    precise float _598 = _597 * _597;
    precise float _599 = _596 * _598;
    precise float _600 = 1.0 - _509;
    precise float _601 = 1.0 - _510;
    precise float _602 = 1.0 - _511;
    precise float _606 = fma(_600, _599, _509) * _593;
    precise float _607 = fma(_601, _599, _510) * _594;
    precise float _608 = fma(_602, _599, _511) * _595;
    precise float _612 = _498 * _581;
    precise float _613 = _497 * _581;
    precise float _614 = _496 * _581;
    precise float _615 = _589 - _509;
    precise float _616 = _589 - _510;
    precise float _617 = _589 - _511;
    SV_Target.x = fma(_612, fma(_556, _615, _509), fma(_514, _590, _606));
    SV_Target.y = fma(_613, fma(_556, _616, _510), fma(_515, _591, _607));
    SV_Target.z = fma(_614, fma(_556, _617, _511), fma(_516, _592, _608));
    SV_Target.w = 1.0;
}

