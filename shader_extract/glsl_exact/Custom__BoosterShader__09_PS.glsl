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
    uvec4 _m10;
    vec3 _m11;
    uint _m12;
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
    precise float _147 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _147));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _136 = a.x * b.x;
    return fma(a.y, b.y, _136);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _118 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _118)));
}

void main()
{
    precise float _171 = cb1._m4.x - TEXCOORD2.x;
    precise float _172 = cb1._m4.y - TEXCOORD2.y;
    precise float _173 = cb1._m4.z - TEXCOORD2.z;
    vec3 _174 = vec3(_171, _172, _173);
    precise float _176 = inversesqrt(dp3_f32(_174, _174));
    precise float _177 = _176 * _171;
    precise float _178 = _176 * _172;
    precise float _179 = _176 * _173;
    precise float _182 = TEXCOORD.y * 150.0;
    precise float _185 = sin(roundEven(_182)) * 43758.546875;
    precise float _189 = fma(fract(_185), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _190 = _189 * 150.0;
    precise float _193 = sin(roundEven(_190)) * 43758.546875;
    precise float _195 = fma(fract(_193), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _204 = abs(dFdx(_189)) + abs(dFdy(_189));
    precise float _205 = abs(dFdx(_195)) + abs(dFdy(_195));
    precise float _206 = TEXCOORD.x - 0.5;
    precise float _207 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _208 = fma(_206, 1.75, 0.5);
    precise float _209 = fma(_207, 1.75, 0.4000000059604644775390625);
    precise float _221 = float(_208 <= 1.0) * float(_208 >= 0.0);
    precise float _222 = float(_209 >= 0.0) * _221;
    vec4 _228 = texture(sampler2D(t0, s2), vec2(_208, _209));
    float _229 = _228.x;
    float _230 = _228.w;
    precise float _232 = fma(-_222, float(_209 <= 1.0), 1.0);
    precise float _236 = fma(_232, -_230, _230);
    precise float _237 = TEXCOORD2.x - cb1._m4.x;
    precise float _238 = TEXCOORD2.y - cb1._m4.y;
    precise float _239 = TEXCOORD2.z - cb1._m4.z;
    vec3 _240 = vec3(_237, _238, _239);
    precise float _242 = inversesqrt(dp3_f32(_240, _240));
    precise float _243 = _242 * _237;
    precise float _244 = _242 * _239;
    precise float _245 = TEXCOORD.y + TEXCOORD.x;
    precise float _246 = TEXCOORD.y + TEXCOORD.y;
    precise float _250 = fma(-_244, 5.0, _246);
    precise float _251 = _250 * 10.0;
    precise float _253 = fma(sin(_251), 0.0199999995529651641845703125, fma(-_243, 5.0, _245));
    precise float _254 = _253 * 30.0;
    vec4 _261 = texture(sampler2D(t1, s3), vec2(_253, fma(cos(_254), 0.0199999995529651641845703125, _250)));
    vec2 _265 = vec2(fma(_206, 1.75, 0.0), fma(_207, 1.75, -0.0999999940395355224609375));
    precise float _268 = sqrt(dp2_f32(_265, _265)) - 0.400390625;
    precise float _269 = _268 / _204;
    precise float _271 = 1.0 - spvNClamp(_269, 0.0, 1.0);
    precise float _283 = cb0._m8.x - cb0._m6.x;
    precise float _284 = cb0._m8.y - cb0._m6.y;
    precise float _285 = cb0._m8.z - cb0._m6.z;
    precise float _286 = fma(_271, _283, cb0._m6.x);
    precise float _287 = fma(_271, _284, cb0._m6.y);
    precise float _288 = fma(_271, _285, cb0._m6.z);
    precise float _289 = 1.0 - fma(_232, -_229, _229);
    precise float _295 = cb0._m11.x - cb0._m6.x;
    precise float _296 = cb0._m11.y - cb0._m6.y;
    precise float _297 = cb0._m11.z - cb0._m6.z;
    precise float _301 = fma(_289, _295, cb0._m6.x) - _286;
    precise float _302 = fma(_289, _296, cb0._m6.y) - _287;
    precise float _303 = fma(_289, _297, cb0._m6.z) - _288;
    precise float _307 = _189 - 0.1167768537998199462890625;
    precise float _308 = _307 / _204;
    precise float _310 = 0.88322317600250244140625 - _189;
    precise float _311 = _310 / _204;
    precise float _313 = spvNClamp(_311, 0.0, 1.0) * spvNClamp(_308, 0.0, 1.0);
    precise float _314 = _195 - 0.02999999932944774627685546875;
    precise float _315 = _314 / _205;
    precise float _317 = _313 * spvNClamp(_315, 0.0, 1.0);
    precise float _318 = 0.9700000286102294921875 - _195;
    precise float _319 = _318 / _205;
    precise float _321 = _317 * spvNClamp(_319, 0.0, 1.0);
    precise float _322 = fma(_261.x, 0.5, fma(_236, _301, _286));
    precise float _323 = fma(_261.y, 0.5, fma(_236, _302, _287));
    precise float _324 = fma(_261.z, 0.5, fma(_236, _303, _288));
    precise float _325 = _321 * _322;
    precise float _326 = _321 * _323;
    precise float _327 = _321 * _324;
    bool _332 = cb4._m0.x == 1.0;
    float _404;
    float _405;
    float _406;
    float _407;
    if (_332)
    {
        bool _339 = cb4._m0.y == 1.0;
        precise float _345 = TEXCOORD2.y * cb4._m3.x;
        precise float _346 = TEXCOORD2.y * cb4._m3.y;
        precise float _347 = TEXCOORD2.y * cb4._m3.z;
        precise float _369 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _345)) + cb4._m7.x;
        precise float _370 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _346)) + cb4._m7.y;
        precise float _371 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _347)) + cb4._m7.z;
        precise float _380 = (_339 ? _369 : TEXCOORD2.x) - cb4._m11.x;
        precise float _381 = (_339 ? _370 : TEXCOORD2.y) - cb4._m11.y;
        precise float _382 = (_339 ? _371 : TEXCOORD2.z) - cb4._m11.z;
        precise float _388 = _380 * cb4._m9.x;
        precise float _389 = _381 * cb4._m9.y;
        precise float _390 = _382 * cb4._m9.z;
        vec4 _399 = texture(sampler3D(t4, s1), vec3(spvNMax(fma(_388, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _389, _390));
        _404 = _399.w;
        _405 = _399.z;
        _406 = _399.y;
        _407 = _399.x;
    }
    else
    {
        _404 = 1.0;
        _405 = 1.0;
        _406 = 1.0;
        _407 = 1.0;
    }
    precise float _414 = spvNClamp(dp4_f32(vec4(_407, _406, _405, _404), cb2._m47), 0.0, 1.0);
    precise float _417 = 1.0 - cb0._m5.x;
    precise float _418 = -_177;
    precise float _419 = -_178;
    precise float _420 = -_179;
    vec3 _428 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _429 = dp3_f32(vec3(_418, _419, _420), _428);
    precise float _430 = _429 + _429;
    precise float _431 = -_430;
    precise float _432 = fma(TEXCOORD1.x, _431, _418);
    precise float _433 = fma(TEXCOORD1.y, _431, _419);
    precise float _434 = fma(TEXCOORD1.z, _431, _420);
    precise float _440 = _414 * cb0._m2.x;
    precise float _441 = _414 * cb0._m2.y;
    precise float _442 = _414 * cb0._m2.z;
    vec4 _443 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _534;
    float _535;
    float _536;
    if (_332)
    {
        bool _449 = cb4._m0.y == 1.0;
        precise float _455 = TEXCOORD2.y * cb4._m3.x;
        precise float _456 = TEXCOORD2.y * cb4._m3.y;
        precise float _457 = TEXCOORD2.y * cb4._m3.z;
        precise float _479 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _455)) + cb4._m7.x;
        precise float _480 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _456)) + cb4._m7.y;
        precise float _481 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _457)) + cb4._m7.z;
        precise float _490 = (_449 ? _479 : TEXCOORD2.x) - cb4._m11.x;
        precise float _491 = (_449 ? _480 : TEXCOORD2.y) - cb4._m11.y;
        precise float _492 = (_449 ? _481 : TEXCOORD2.z) - cb4._m11.z;
        precise float _498 = _490 * cb4._m9.x;
        precise float _499 = _491 * cb4._m9.y;
        precise float _500 = _492 * cb4._m9.z;
        precise float _501 = _498 * 0.25;
        precise float _504 = cb4._m0.z * 0.5;
        precise float _508 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_501, _504));
        precise float _512 = _508 + 0.25;
        precise float _513 = _499 + 0.0;
        precise float _514 = _500 + 0.0;
        precise float _518 = _508 + 0.5;
        _534 = dp4_f32(texture(sampler3D(t4, s1), vec3(_518, _513, _514)), _443);
        _535 = dp4_f32(texture(sampler3D(t4, s1), vec3(_512, _513, _514)), _443);
        _536 = dp4_f32(texture(sampler3D(t4, s1), vec3(_508, _499, _500)), _443);
    }
    else
    {
        _534 = dp4_f32(cb2._m42, _443);
        _535 = dp4_f32(cb2._m41, _443);
        _536 = dp4_f32(cb2._m40, _443);
    }
    precise float _543 = _536 + TEXCOORD3.x;
    precise float _544 = _535 + TEXCOORD3.y;
    precise float _545 = _534 + TEXCOORD3.z;
    vec3 _553 = vec3(_432, _433, _434);
    float _602;
    float _603;
    float _604;
    if (cb3._m5 > 0.0)
    {
        precise float _557 = inversesqrt(dp3_f32(_553, _553));
        precise float _558 = _557 * _432;
        precise float _559 = _557 * _433;
        precise float _560 = _557 * _434;
        precise float _566 = cb3._m0.x - TEXCOORD2.x;
        precise float _567 = cb3._m0.y - TEXCOORD2.y;
        precise float _568 = cb3._m0.z - TEXCOORD2.z;
        precise float _569 = _566 / _558;
        precise float _570 = _567 / _559;
        precise float _571 = _568 / _560;
        precise float _577 = cb3._m2.x - TEXCOORD2.x;
        precise float _578 = cb3._m2.y - TEXCOORD2.y;
        precise float _579 = cb3._m2.z - TEXCOORD2.z;
        precise float _580 = _577 / _558;
        precise float _581 = _578 / _559;
        precise float _582 = _579 / _560;
        precise float _590 = spvNMin((_560 > 0.0) ? _571 : _582, spvNMin((_559 > 0.0) ? _570 : _581, (_558 > 0.0) ? _569 : _580));
        precise float _596 = TEXCOORD2.x - cb3._m4.x;
        precise float _597 = TEXCOORD2.y - cb3._m4.y;
        precise float _598 = TEXCOORD2.z - cb3._m4.z;
        _602 = fma(_560, _590, _598);
        _603 = fma(_559, _590, _597);
        _604 = fma(_558, _590, _596);
    }
    else
    {
        _602 = _434;
        _603 = _433;
        _604 = _432;
    }
    precise float _607 = fma(-_417, 0.699999988079071044921875, 1.7000000476837158203125) * _417;
    precise float _608 = _607 * 6.0;
    vec4 _614 = textureLod(samplerCube(t2, s0), vec3(_604, _603, _602), _608);
    float _615 = _614.x;
    float _616 = _614.y;
    float _617 = _614.z;
    precise float _619 = _614.w - 1.0;
    precise float _626 = log2(fma(cb3._m6.w, _619, 1.0)) * cb3._m6.y;
    precise float _630 = exp2(_626) * cb3._m6.x;
    precise float _631 = _615 * _630;
    precise float _632 = _616 * _630;
    precise float _633 = _617 * _630;
    float _725;
    float _726;
    float _727;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _690;
        float _691;
        float _692;
        if (cb3._m12 > 0.0)
        {
            precise float _645 = inversesqrt(dp3_f32(_553, _553));
            precise float _646 = _432 * _645;
            precise float _647 = _433 * _645;
            precise float _648 = _434 * _645;
            precise float _654 = cb3._m7.x - TEXCOORD2.x;
            precise float _655 = cb3._m7.y - TEXCOORD2.y;
            precise float _656 = cb3._m7.z - TEXCOORD2.z;
            precise float _657 = _654 / _646;
            precise float _658 = _655 / _647;
            precise float _659 = _656 / _648;
            precise float _665 = cb3._m9.x - TEXCOORD2.x;
            precise float _666 = cb3._m9.y - TEXCOORD2.y;
            precise float _667 = cb3._m9.z - TEXCOORD2.z;
            precise float _668 = _665 / _646;
            precise float _669 = _666 / _647;
            precise float _670 = _667 / _648;
            precise float _678 = spvNMin((_648 > 0.0) ? _659 : _670, spvNMin((_647 > 0.0) ? _658 : _669, (_646 > 0.0) ? _657 : _668));
            precise float _684 = TEXCOORD2.x - cb3._m11.x;
            precise float _685 = TEXCOORD2.y - cb3._m11.y;
            precise float _686 = TEXCOORD2.z - cb3._m11.z;
            _690 = fma(_648, _678, _686);
            _691 = fma(_647, _678, _685);
            _692 = fma(_646, _678, _684);
        }
        else
        {
            _690 = _434;
            _691 = _433;
            _692 = _432;
        }
        vec4 _696 = textureLod(samplerCube(t3, s0), vec3(_692, _691, _690), _608);
        precise float _701 = _696.w - 1.0;
        precise float _708 = log2(fma(cb3._m13.w, _701, 1.0)) * cb3._m13.y;
        precise float _712 = exp2(_708) * cb3._m13.x;
        precise float _713 = _696.x * _712;
        precise float _714 = _696.y * _712;
        precise float _715 = _696.z * _712;
        _725 = fma(cb3._m3, fma(_630, _617, -_715), _715);
        _726 = fma(cb3._m3, fma(_630, _616, -_714), _714);
        _727 = fma(cb3._m3, fma(_630, _615, -_713), _713);
    }
    else
    {
        _725 = _633;
        _726 = _632;
        _727 = _631;
    }
    precise float _729 = inversesqrt(dp3_f32(_428, _428));
    precise float _730 = _729 * TEXCOORD1.x;
    precise float _731 = _729 * TEXCOORD1.y;
    precise float _732 = _729 * TEXCOORD1.z;
    precise float _738 = fma(cb0._m5.y, fma(_321, _322, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _739 = fma(cb0._m5.y, fma(_321, _323, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _740 = fma(cb0._m5.y, fma(_321, _324, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _742 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _743 = _742 * _325;
    precise float _744 = _742 * _326;
    precise float _745 = _742 * _327;
    precise float _751 = fma(_171, _176, cb2._m0.x);
    precise float _752 = fma(_172, _176, cb2._m0.y);
    precise float _753 = fma(_173, _176, cb2._m0.z);
    vec3 _754 = vec3(_751, _752, _753);
    precise float _757 = inversesqrt(spvNMax(dp3_f32(_754, _754), 0.001000000047497451305389404296875));
    precise float _758 = _757 * _751;
    precise float _759 = _757 * _752;
    precise float _760 = _757 * _753;
    vec3 _761 = vec3(_730, _731, _732);
    precise float _765 = spvNClamp(dp3_f32(_761, cb2._m0), 0.0, 1.0);
    vec3 _766 = vec3(_758, _759, _760);
    precise float _768 = spvNClamp(dp3_f32(_761, _766), 0.0, 1.0);
    precise float _770 = spvNClamp(dp3_f32(cb2._m0, _766), 0.0, 1.0);
    precise float _771 = _770 * _770;
    precise float _775 = dp2_f32(vec2(_771), vec2(_417)) - 0.5;
    precise float _776 = 1.0 - _765;
    precise float _777 = _776 * _776;
    precise float _778 = _777 * _777;
    precise float _779 = _776 * _778;
    precise float _781 = abs(dp3_f32(_761, vec3(_177, _178, _179)));
    precise float _782 = 1.0 - _781;
    precise float _783 = _782 * _782;
    precise float _784 = _783 * _783;
    precise float _785 = _782 * _784;
    precise float _787 = fma(_775, _785, 1.0) * fma(_775, _779, 1.0);
    precise float _788 = _417 * _417;
    precise float _789 = spvNMax(_788, 0.00200000009499490261077880859375);
    precise float _790 = 1.0 - _789;
    precise float _793 = _781 * fma(_765, _790, _789);
    precise float _795 = fma(_765, fma(_781, _790, _789), _793) + 9.9999997473787516355514526367188e-06;
    precise float _796 = 0.5 / _795;
    precise float _797 = _789 * _789;
    precise float _800 = fma(fma(_768, _797, -_768), _768, 1.0);
    precise float _801 = _797 * 0.3183098733425140380859375;
    precise float _803 = _801 / fma(_800, _800, 1.0000000116860974230803549289703e-07);
    precise float _804 = _796 * _803;
    precise float _805 = _804 * 3.1415927410125732421875;
    precise float _806 = _765 * _787;
    precise float _807 = _765 * _805;
    precise float _810 = 1.0 / fma(_789, _789, 1.0);
    vec3 _811 = vec3(_738, _739, _740);
    precise float _815 = spvNMax(_807, 0.0) * ((dp3_f32(_811, _811) == 0.0) ? 0.0 : 1.0);
    precise float _816 = cb0._m5.x - _742;
    precise float _817 = _816 + 1.0;
    precise float _818 = spvNClamp(_817, 0.0, 1.0);
    precise float _822 = _440 * _815;
    precise float _823 = _441 * _815;
    precise float _824 = _442 * _815;
    precise float _825 = 1.0 - _770;
    precise float _826 = _825 * _825;
    precise float _827 = _826 * _826;
    precise float _828 = _825 * _827;
    precise float _829 = 1.0 - _738;
    precise float _830 = 1.0 - _739;
    precise float _831 = 1.0 - _740;
    precise float _835 = fma(_829, _828, _738) * _822;
    precise float _836 = fma(_830, _828, _739) * _823;
    precise float _837 = fma(_831, _828, _740) * _824;
    precise float _841 = _727 * _810;
    precise float _842 = _726 * _810;
    precise float _843 = _725 * _810;
    precise float _844 = _818 - _738;
    precise float _845 = _818 - _739;
    precise float _846 = _818 - _740;
    SV_Target.x = fma(_841, fma(_785, _844, _738), fma(_743, fma(_440, _806, spvNMax(_543, 0.0)), _835));
    SV_Target.y = fma(_842, fma(_785, _845, _739), fma(_744, fma(_441, _806, spvNMax(_544, 0.0)), _836));
    SV_Target.z = fma(_843, fma(_785, _846, _740), fma(_745, fma(_442, _806, spvNMax(_545, 0.0)), _837));
    SV_Target.w = 1.0;
}

