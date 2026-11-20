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
    precise float _170 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _170));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _159 = a.x * b.x;
    return fma(a.y, b.y, _159);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _141 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _141)));
}

void main()
{
    precise float _194 = cb1._m4.x - TEXCOORD2.x;
    precise float _195 = cb1._m4.y - TEXCOORD2.y;
    precise float _196 = cb1._m4.z - TEXCOORD2.z;
    vec3 _197 = vec3(_194, _195, _196);
    precise float _199 = inversesqrt(dp3_f32(_197, _197));
    precise float _200 = _199 * _194;
    precise float _201 = _199 * _195;
    precise float _202 = _199 * _196;
    precise float _205 = TEXCOORD.y * 150.0;
    precise float _208 = sin(roundEven(_205)) * 43758.546875;
    precise float _212 = fma(fract(_208), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _213 = _212 * 150.0;
    precise float _214 = _212 * 10.0;
    precise float _217 = sin(roundEven(_213)) * 43758.546875;
    precise float _219 = fma(fract(_217), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _228 = abs(dFdy(_212)) + abs(dFdx(_212));
    precise float _229 = abs(dFdy(_219)) + abs(dFdx(_219));
    precise float _230 = 1.0 - TEXCOORD.x;
    precise float _231 = 1.0 - TEXCOORD.y;
    bool _238 = cb0._m19.x > 0.5;
    bool _240 = cb0._m19.y > 0.5;
    float _243 = _240 ? (_238 ? 0.550000011920928955078125 : 0.5) : (_238 ? 0.5 : 0.449999988079071044921875);
    float _245 = (_238 || _240) ? 2.0 : 1.75;
    precise float _246 = _230 - 0.5;
    precise float _247 = _231 - _243;
    precise float _248 = _245 * _246;
    precise float _249 = fma(_246, _245, 0.5);
    precise float _250 = fma(_247, _245, _243);
    precise float _259 = float(_249 >= 0.0) * float(_249 <= 1.0);
    precise float _260 = float(_250 >= 0.0) * _259;
    vec2 _263 = vec2(_249, _250);
    vec4 _266 = texture(sampler2D(t0, s2), _263);
    float _267 = _266.x;
    float _268 = _266.w;
    vec4 _272 = texture(sampler2D(t1, s4), _263);
    float _273 = _272.x;
    float _274 = _272.w;
    precise float _276 = fma(-_260, float(_250 <= 1.0), 1.0);
    precise float _280 = fma(_276, -_268, _268);
    precise float _284 = fma(_276, -_274, _274);
    precise float _285 = TEXCOORD2.x - cb1._m4.x;
    precise float _286 = TEXCOORD2.y - cb1._m4.y;
    precise float _287 = TEXCOORD2.z - cb1._m4.z;
    vec3 _288 = vec3(_285, _286, _287);
    precise float _290 = inversesqrt(dp3_f32(_288, _288));
    precise float _291 = _290 * _285;
    precise float _292 = _290 * _287;
    precise float _293 = TEXCOORD.y + TEXCOORD.x;
    precise float _294 = TEXCOORD.y + TEXCOORD.y;
    precise float _298 = fma(-_292, 5.0, _294);
    precise float _299 = _298 * 10.0;
    precise float _301 = fma(sin(_299), 0.0199999995529651641845703125, fma(-_291, 5.0, _293));
    precise float _302 = _301 * 30.0;
    vec4 _309 = texture(sampler2D(t2, s3), vec2(_301, fma(cos(_302), 0.0199999995529651641845703125, _298)));
    precise float _317 = fma(cb1._m0.z, 2.0, _293) * 0.0199999995529651641845703125;
    float _320 = float(fract(_317) >= 0.9900000095367431640625);
    bool _325 = cb0._m15.x > 0.5;
    bool _326 = cb0._m15.y > 0.5;
    float _337 = _325 ? fma(_320, cb0._m18.y, cb0._m6.x) : cb0._m6.x;
    float _338 = _325 ? fma(_320, cb0._m18.y, cb0._m6.y) : cb0._m6.y;
    float _339 = _325 ? fma(_320, cb0._m18.y, cb0._m6.z) : cb0._m6.z;
    precise float _340 = _248 + 0.0;
    precise float _341 = _250 - 0.5;
    vec2 _342 = vec2(_340, _341);
    precise float _349 = (_238 ? spvNMax(abs(_341), abs(_340)) : sqrt(dp2_f32(_342, _342))) - 0.400390625;
    precise float _350 = _349 / _228;
    precise float _352 = 1.0 - spvNClamp(_350, 0.0, 1.0);
    precise float _358 = cb0._m8.x - _337;
    precise float _359 = cb0._m8.y - _338;
    precise float _360 = cb0._m8.z - _339;
    precise float _361 = fma(_352, _358, _337);
    precise float _362 = fma(_352, _359, _338);
    precise float _363 = fma(_352, _360, _339);
    float _365 = (_219 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _366 = cb0._m8.x - _361;
    precise float _367 = cb0._m8.y - _362;
    precise float _368 = cb0._m8.z - _363;
    precise float _369 = fma(_365, _366, _361);
    precise float _370 = fma(_365, _367, _362);
    precise float _371 = fma(_365, _368, _363);
    precise float _372 = 1.0 - fma(_276, -_267, _267);
    precise float _378 = cb0._m13.x - cb0._m6.x;
    precise float _379 = cb0._m13.y - cb0._m6.y;
    precise float _380 = cb0._m13.z - cb0._m6.z;
    precise float _384 = fma(_372, _378, cb0._m6.x) - _369;
    precise float _385 = fma(_372, _379, cb0._m6.y) - _370;
    precise float _386 = fma(_372, _380, cb0._m6.z) - _371;
    precise float _387 = fma(_280, _384, _369);
    precise float _388 = fma(_280, _385, _370);
    precise float _389 = fma(_280, _386, _371);
    bool _392 = (cb0._m19.y == 0.0) && (cb0._m19.x == 0.0);
    precise float _393 = 1.0 - fma(_276, -_273, _273);
    precise float _397 = fma(_393, _378, cb0._m6.x) - _387;
    precise float _398 = fma(_393, _379, cb0._m6.y) - _388;
    precise float _399 = fma(_393, _380, cb0._m6.z) - _389;
    float _403 = _392 ? _387 : fma(_284, _397, _387);
    float _404 = _392 ? _388 : fma(_284, _398, _388);
    float _405 = _392 ? _389 : fma(_284, _399, _389);
    precise float _406 = -_229;
    precise float _407 = fma(_406, 0.5, 0.189999997615814208984375);
    precise float _408 = fma(_406, 0.5, 0.2100000083446502685546875);
    precise float _411 = _219 - _407;
    precise float _412 = _219 - _408;
    precise float _415 = fma(_229, 0.5, -_407) + 0.189999997615814208984375;
    precise float _416 = fma(_229, 0.5, -_408) + 0.2100000083446502685546875;
    precise float _417 = _411 / _415;
    precise float _418 = _412 / _416;
    precise float _421 = 1.0 - spvNClamp(_418, 0.0, 1.0);
    precise float _424 = _212 - 0.1167768537998199462890625;
    precise float _425 = _219 - 0.02999999932944774627685546875;
    precise float _426 = _424 / _228;
    precise float _427 = _425 / _229;
    precise float _430 = 0.88322317600250244140625 - _212;
    precise float _431 = 0.9700000286102294921875 - _219;
    precise float _432 = _430 / _228;
    precise float _433 = _431 / _229;
    precise float _436 = spvNClamp(_426, 0.0, 1.0) * spvNClamp(_432, 0.0, 1.0);
    precise float _437 = spvNClamp(_427, 0.0, 1.0) * _436;
    precise float _438 = spvNClamp(_433, 0.0, 1.0) * _437;
    precise float _439 = fma(-spvNClamp(_417, 0.0, 1.0), _421, 1.0) * _438;
    precise float _440 = _219 * 10.0;
    precise float _444 = abs(fma(fract(_440), 2.0, -1.0)) - 0.5;
    precise float _446 = sin(_440) * _444;
    precise float _450 = abs(fma(fract(_214), 2.0, -1.0)) - 0.5;
    precise float _452 = sin(_214) * _450;
    precise float _453 = fma(_446, 0.0199999995529651641845703125, _212);
    precise float _454 = fma(_452, 0.0199999995529651641845703125, _219);
    precise float _455 = _453 - 0.089776851236820220947265625;
    precise float _456 = _454 - 0.0030000000260770320892333984375;
    precise float _457 = _455 / _228;
    precise float _458 = _456 / _229;
    precise float _461 = 0.91022312641143798828125 - _453;
    precise float _462 = 0.9969999790191650390625 - _454;
    precise float _463 = _461 / _228;
    precise float _464 = _462 / _229;
    precise float _467 = spvNClamp(_457, 0.0, 1.0) * spvNClamp(_463, 0.0, 1.0);
    precise float _468 = spvNClamp(_458, 0.0, 1.0) * _467;
    if ((fma(_468, spvNClamp(_464, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _326)
    {
        demote;
    }
    precise float _487 = (_325 ? fma(_309.x, cb0._m18.x, _403) : _403) - cb0._m10.x;
    precise float _488 = (_325 ? fma(_309.y, cb0._m18.x, _404) : _404) - cb0._m10.y;
    precise float _489 = (_325 ? fma(_309.z, cb0._m18.x, _405) : _405) - cb0._m10.z;
    precise float _490 = fma(_439, _487, cb0._m10.x);
    precise float _491 = fma(_439, _488, cb0._m10.y);
    precise float _492 = fma(_439, _489, cb0._m10.z);
    float _514;
    float _515;
    float _516;
    if (cb0._m15.y != 0.0)
    {
        float _507 = float(texture(sampler2D(t3, s5), vec2(_326 ? _453 : _212, _326 ? _454 : _219)).w >= 0.5);
        precise float _508 = _490 * (-0.39999997615814208984375);
        precise float _509 = _491 * (-0.39999997615814208984375);
        precise float _510 = _492 * (-0.39999997615814208984375);
        _514 = fma(_507, _508, _490);
        _515 = fma(_507, _509, _491);
        _516 = fma(_507, _510, _492);
    }
    else
    {
        _514 = _490;
        _515 = _491;
        _516 = _492;
    }
    bool _520 = cb4._m0.x == 1.0;
    float _592;
    float _593;
    float _594;
    float _595;
    if (_520)
    {
        bool _527 = cb4._m0.y == 1.0;
        precise float _533 = TEXCOORD2.y * cb4._m3.x;
        precise float _534 = TEXCOORD2.y * cb4._m3.y;
        precise float _535 = TEXCOORD2.y * cb4._m3.z;
        precise float _557 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _533)) + cb4._m7.x;
        precise float _558 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _534)) + cb4._m7.y;
        precise float _559 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _535)) + cb4._m7.z;
        precise float _568 = (_527 ? _557 : TEXCOORD2.x) - cb4._m11.x;
        precise float _569 = (_527 ? _558 : TEXCOORD2.y) - cb4._m11.y;
        precise float _570 = (_527 ? _559 : TEXCOORD2.z) - cb4._m11.z;
        precise float _576 = _568 * cb4._m9.x;
        precise float _577 = _569 * cb4._m9.y;
        precise float _578 = _570 * cb4._m9.z;
        vec4 _587 = texture(sampler3D(t6, s1), vec3(spvNMax(fma(_576, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _577, _578));
        _592 = _587.w;
        _593 = _587.z;
        _594 = _587.y;
        _595 = _587.x;
    }
    else
    {
        _592 = 1.0;
        _593 = 1.0;
        _594 = 1.0;
        _595 = 1.0;
    }
    precise float _602 = spvNClamp(dp4_f32(vec4(_595, _594, _593, _592), cb2._m47), 0.0, 1.0);
    precise float _605 = 1.0 - cb0._m5.x;
    precise float _606 = -_200;
    precise float _607 = -_201;
    precise float _608 = -_202;
    vec3 _616 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _617 = dp3_f32(vec3(_606, _607, _608), _616);
    precise float _618 = _617 + _617;
    precise float _619 = -_618;
    precise float _620 = fma(TEXCOORD1.x, _619, _606);
    precise float _621 = fma(TEXCOORD1.y, _619, _607);
    precise float _622 = fma(TEXCOORD1.z, _619, _608);
    precise float _628 = _602 * cb0._m2.x;
    precise float _629 = _602 * cb0._m2.y;
    precise float _630 = _602 * cb0._m2.z;
    vec4 _631 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _722;
    float _723;
    float _724;
    if (_520)
    {
        bool _637 = cb4._m0.y == 1.0;
        precise float _643 = TEXCOORD2.y * cb4._m3.x;
        precise float _644 = TEXCOORD2.y * cb4._m3.y;
        precise float _645 = TEXCOORD2.y * cb4._m3.z;
        precise float _667 = fma(cb4._m5.x, TEXCOORD2.z, fma(cb4._m1.x, TEXCOORD2.x, _643)) + cb4._m7.x;
        precise float _668 = fma(cb4._m5.y, TEXCOORD2.z, fma(cb4._m1.y, TEXCOORD2.x, _644)) + cb4._m7.y;
        precise float _669 = fma(cb4._m5.z, TEXCOORD2.z, fma(cb4._m1.z, TEXCOORD2.x, _645)) + cb4._m7.z;
        precise float _678 = (_637 ? _667 : TEXCOORD2.x) - cb4._m11.x;
        precise float _679 = (_637 ? _668 : TEXCOORD2.y) - cb4._m11.y;
        precise float _680 = (_637 ? _669 : TEXCOORD2.z) - cb4._m11.z;
        precise float _686 = _678 * cb4._m9.x;
        precise float _687 = _679 * cb4._m9.y;
        precise float _688 = _680 * cb4._m9.z;
        precise float _689 = _686 * 0.25;
        precise float _692 = cb4._m0.z * 0.5;
        precise float _696 = spvNMin(fma(-cb4._m0.z, 0.5, 0.25), spvNMax(_689, _692));
        precise float _700 = _696 + 0.25;
        precise float _701 = _687 + 0.0;
        precise float _702 = _688 + 0.0;
        precise float _706 = _696 + 0.5;
        _722 = dp4_f32(texture(sampler3D(t6, s1), vec3(_706, _701, _702)), _631);
        _723 = dp4_f32(texture(sampler3D(t6, s1), vec3(_700, _701, _702)), _631);
        _724 = dp4_f32(texture(sampler3D(t6, s1), vec3(_696, _687, _688)), _631);
    }
    else
    {
        _722 = dp4_f32(cb2._m42, _631);
        _723 = dp4_f32(cb2._m41, _631);
        _724 = dp4_f32(cb2._m40, _631);
    }
    precise float _731 = _724 + TEXCOORD3.x;
    precise float _732 = _723 + TEXCOORD3.y;
    precise float _733 = _722 + TEXCOORD3.z;
    vec3 _741 = vec3(_620, _621, _622);
    float _790;
    float _791;
    float _792;
    if (cb3._m5 > 0.0)
    {
        precise float _745 = inversesqrt(dp3_f32(_741, _741));
        precise float _746 = _745 * _620;
        precise float _747 = _745 * _621;
        precise float _748 = _745 * _622;
        precise float _754 = cb3._m0.x - TEXCOORD2.x;
        precise float _755 = cb3._m0.y - TEXCOORD2.y;
        precise float _756 = cb3._m0.z - TEXCOORD2.z;
        precise float _757 = _754 / _746;
        precise float _758 = _755 / _747;
        precise float _759 = _756 / _748;
        precise float _765 = cb3._m2.x - TEXCOORD2.x;
        precise float _766 = cb3._m2.y - TEXCOORD2.y;
        precise float _767 = cb3._m2.z - TEXCOORD2.z;
        precise float _768 = _765 / _746;
        precise float _769 = _766 / _747;
        precise float _770 = _767 / _748;
        precise float _778 = spvNMin((_748 > 0.0) ? _759 : _770, spvNMin((_747 > 0.0) ? _758 : _769, (_746 > 0.0) ? _757 : _768));
        precise float _784 = TEXCOORD2.x - cb3._m4.x;
        precise float _785 = TEXCOORD2.y - cb3._m4.y;
        precise float _786 = TEXCOORD2.z - cb3._m4.z;
        _790 = fma(_748, _778, _786);
        _791 = fma(_747, _778, _785);
        _792 = fma(_746, _778, _784);
    }
    else
    {
        _790 = _622;
        _791 = _621;
        _792 = _620;
    }
    precise float _795 = fma(-_605, 0.699999988079071044921875, 1.7000000476837158203125) * _605;
    precise float _796 = _795 * 6.0;
    vec4 _802 = textureLod(samplerCube(t4, s0), vec3(_792, _791, _790), _796);
    float _803 = _802.x;
    float _804 = _802.y;
    float _805 = _802.z;
    precise float _807 = _802.w - 1.0;
    precise float _814 = log2(fma(cb3._m6.w, _807, 1.0)) * cb3._m6.y;
    precise float _818 = exp2(_814) * cb3._m6.x;
    precise float _819 = _803 * _818;
    precise float _820 = _804 * _818;
    precise float _821 = _805 * _818;
    float _913;
    float _914;
    float _915;
    if (cb3._m3 < 0.999989986419677734375)
    {
        float _878;
        float _879;
        float _880;
        if (cb3._m12 > 0.0)
        {
            precise float _833 = inversesqrt(dp3_f32(_741, _741));
            precise float _834 = _833 * _620;
            precise float _835 = _833 * _621;
            precise float _836 = _833 * _622;
            precise float _842 = cb3._m7.x - TEXCOORD2.x;
            precise float _843 = cb3._m7.y - TEXCOORD2.y;
            precise float _844 = cb3._m7.z - TEXCOORD2.z;
            precise float _845 = _842 / _834;
            precise float _846 = _843 / _835;
            precise float _847 = _844 / _836;
            precise float _853 = cb3._m9.x - TEXCOORD2.x;
            precise float _854 = cb3._m9.y - TEXCOORD2.y;
            precise float _855 = cb3._m9.z - TEXCOORD2.z;
            precise float _856 = _853 / _834;
            precise float _857 = _854 / _835;
            precise float _858 = _855 / _836;
            precise float _866 = spvNMin((_836 > 0.0) ? _847 : _858, spvNMin((_835 > 0.0) ? _846 : _857, (_834 > 0.0) ? _845 : _856));
            precise float _872 = TEXCOORD2.x - cb3._m11.x;
            precise float _873 = TEXCOORD2.y - cb3._m11.y;
            precise float _874 = TEXCOORD2.z - cb3._m11.z;
            _878 = fma(_836, _866, _874);
            _879 = fma(_835, _866, _873);
            _880 = fma(_834, _866, _872);
        }
        else
        {
            _878 = _622;
            _879 = _621;
            _880 = _620;
        }
        vec4 _884 = textureLod(samplerCube(t5, s0), vec3(_880, _879, _878), _796);
        precise float _889 = _884.w - 1.0;
        precise float _896 = log2(fma(cb3._m13.w, _889, 1.0)) * cb3._m13.y;
        precise float _900 = exp2(_896) * cb3._m13.x;
        precise float _901 = _884.x * _900;
        precise float _902 = _884.y * _900;
        precise float _903 = _884.z * _900;
        _913 = fma(cb3._m3, fma(_818, _805, -_903), _903);
        _914 = fma(cb3._m3, fma(_818, _804, -_902), _902);
        _915 = fma(cb3._m3, fma(_818, _803, -_901), _901);
    }
    else
    {
        _913 = _821;
        _914 = _820;
        _915 = _819;
    }
    precise float _917 = inversesqrt(dp3_f32(_616, _616));
    precise float _918 = _917 * TEXCOORD1.x;
    precise float _919 = _917 * TEXCOORD1.y;
    precise float _920 = _917 * TEXCOORD1.z;
    precise float _921 = _514 - 0.039999999105930328369140625;
    precise float _922 = _515 - 0.039999999105930328369140625;
    precise float _923 = _516 - 0.039999999105930328369140625;
    precise float _926 = fma(cb0._m5.y, _921, 0.039999999105930328369140625);
    precise float _927 = fma(cb0._m5.y, _922, 0.039999999105930328369140625);
    precise float _928 = fma(cb0._m5.y, _923, 0.039999999105930328369140625);
    precise float _930 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _931 = _930 * _514;
    precise float _932 = _930 * _515;
    precise float _933 = _930 * _516;
    precise float _939 = fma(_194, _199, cb2._m0.x);
    precise float _940 = fma(_195, _199, cb2._m0.y);
    precise float _941 = fma(_196, _199, cb2._m0.z);
    vec3 _942 = vec3(_939, _940, _941);
    precise float _945 = inversesqrt(spvNMax(dp3_f32(_942, _942), 0.001000000047497451305389404296875));
    precise float _946 = _945 * _939;
    precise float _947 = _945 * _940;
    precise float _948 = _945 * _941;
    vec3 _949 = vec3(_918, _919, _920);
    precise float _953 = spvNClamp(dp3_f32(_949, cb2._m0), 0.0, 1.0);
    vec3 _954 = vec3(_946, _947, _948);
    precise float _956 = spvNClamp(dp3_f32(_949, _954), 0.0, 1.0);
    precise float _958 = spvNClamp(dp3_f32(cb2._m0, _954), 0.0, 1.0);
    precise float _959 = _958 + _958;
    precise float _960 = _958 * _959;
    precise float _961 = fma(_960, _605, -0.5);
    precise float _962 = 1.0 - _953;
    precise float _963 = _962 * _962;
    precise float _964 = _963 * _963;
    precise float _965 = _962 * _964;
    precise float _967 = abs(dp3_f32(_949, vec3(_200, _201, _202)));
    precise float _968 = 1.0 - _967;
    precise float _969 = _968 * _968;
    precise float _970 = _969 * _969;
    precise float _971 = _968 * _970;
    precise float _973 = fma(_961, _971, 1.0) * fma(_961, _965, 1.0);
    precise float _974 = _605 * _605;
    precise float _975 = spvNMax(_974, 0.00200000009499490261077880859375);
    precise float _976 = 1.0 - _975;
    precise float _979 = _967 * fma(_953, _976, _975);
    precise float _981 = fma(_953, fma(_967, _976, _975), _979) + 9.9999997473787516355514526367188e-06;
    precise float _982 = 0.5 / _981;
    precise float _983 = _975 * _975;
    precise float _986 = fma(fma(_956, _983, -_956), _956, 1.0);
    precise float _987 = _983 * 0.3183098733425140380859375;
    precise float _989 = _987 / fma(_986, _986, 1.0000000116860974230803549289703e-07);
    precise float _990 = _982 * _989;
    precise float _991 = _990 * 3.1415927410125732421875;
    precise float _992 = _953 * _973;
    precise float _993 = _953 * _991;
    precise float _996 = 1.0 / fma(_975, _975, 1.0);
    vec3 _997 = vec3(_926, _927, _928);
    precise float _1001 = spvNMax(_993, 0.0) * ((dp3_f32(_997, _997) == 0.0) ? 0.0 : 1.0);
    precise float _1002 = 1.0 - _930;
    precise float _1003 = _1002 + cb0._m5.x;
    precise float _1004 = spvNClamp(_1003, 0.0, 1.0);
    precise float _1008 = _628 * _1001;
    precise float _1009 = _629 * _1001;
    precise float _1010 = _630 * _1001;
    precise float _1011 = 1.0 - _958;
    precise float _1012 = _1011 * _1011;
    precise float _1013 = _1012 * _1012;
    precise float _1014 = _1011 * _1013;
    precise float _1015 = 1.0 - _926;
    precise float _1016 = 1.0 - _927;
    precise float _1017 = 1.0 - _928;
    precise float _1021 = fma(_1015, _1014, _926) * _1008;
    precise float _1022 = fma(_1016, _1014, _927) * _1009;
    precise float _1023 = fma(_1017, _1014, _928) * _1010;
    precise float _1027 = _915 * _996;
    precise float _1028 = _914 * _996;
    precise float _1029 = _913 * _996;
    precise float _1030 = _1004 - _926;
    precise float _1031 = _1004 - _927;
    precise float _1032 = _1004 - _928;
    SV_Target.x = fma(_1027, fma(_971, _1030, _926), fma(_931, fma(_628, _992, spvNMax(_731, 0.0)), _1021));
    SV_Target.y = fma(_1028, fma(_971, _1031, _927), fma(_932, fma(_629, _992, spvNMax(_732, 0.0)), _1022));
    SV_Target.z = fma(_1029, fma(_971, _1032, _928), fma(_933, fma(_630, _992, spvNMax(_733, 0.0)), _1023));
    SV_Target.w = 1.0;
}

