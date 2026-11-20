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
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
    vec3 _m14;
    uint _m15;
    uvec4 _m16;
    vec3 _m17;
    uint _m18;
    vec2 _m19;
    uvec2 _m20;
    uvec4 _m21;
    vec2 _m22;
    vec2 _m23;
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
layout(set = 0, binding = 10) uniform sampler s6;
layout(set = 0, binding = 11) uniform texture2D t0;
layout(set = 0, binding = 12) uniform texture2D t1;
layout(set = 0, binding = 13) uniform texture2D t2;
layout(set = 0, binding = 14) uniform texture2D t3;
layout(set = 0, binding = 15) uniform texture2D t4;
layout(set = 0, binding = 16) uniform texture2D t5;
layout(set = 0, binding = 17) uniform texture3D t6;

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
    precise float _153 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _153));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _142 = a.x * b.x;
    return fma(a.y, b.y, _142);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _124 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _124)));
}

void main()
{
    precise float _177 = cb2._m0.x - TEXCOORD2.x;
    precise float _178 = cb2._m0.y - TEXCOORD2.y;
    precise float _179 = cb2._m0.z - TEXCOORD2.z;
    vec3 _180 = vec3(_177, _178, _179);
    precise float _182 = inversesqrt(dp3_f32(_180, _180));
    precise float _183 = _182 * _177;
    precise float _184 = _182 * _178;
    precise float _185 = _182 * _179;
    precise float _192 = cb1._m4.x - TEXCOORD2.x;
    precise float _193 = cb1._m4.y - TEXCOORD2.y;
    precise float _194 = cb1._m4.z - TEXCOORD2.z;
    vec3 _195 = vec3(_192, _193, _194);
    precise float _197 = inversesqrt(dp3_f32(_195, _195));
    precise float _198 = _197 * _192;
    precise float _199 = _197 * _193;
    precise float _200 = _197 * _194;
    precise float _203 = TEXCOORD.y * 150.0;
    precise float _206 = sin(roundEven(_203)) * 43758.546875;
    precise float _210 = fma(fract(_206), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _211 = _210 * 150.0;
    precise float _212 = _210 * 10.0;
    precise float _215 = sin(roundEven(_211)) * 43758.546875;
    precise float _217 = fma(fract(_215), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _226 = abs(dFdy(_210)) + abs(dFdx(_210));
    precise float _227 = abs(dFdy(_217)) + abs(dFdx(_217));
    precise float _228 = 1.0 - TEXCOORD.x;
    precise float _229 = 1.0 - TEXCOORD.y;
    bool _236 = cb0._m23.x > 0.5;
    bool _238 = cb0._m23.y > 0.5;
    float _241 = _238 ? (_236 ? 0.550000011920928955078125 : 0.5) : (_236 ? 0.5 : 0.449999988079071044921875);
    float _243 = (_236 || _238) ? 2.0 : 1.75;
    precise float _244 = _228 - 0.5;
    precise float _245 = _229 - _241;
    precise float _246 = _243 * _244;
    precise float _247 = fma(_244, _243, 0.5);
    precise float _248 = fma(_245, _243, _241);
    precise float _257 = float(_247 >= 0.0) * float(_247 <= 1.0);
    precise float _258 = float(_248 >= 0.0) * _257;
    vec2 _261 = vec2(_247, _248);
    vec4 _264 = texture(sampler2D(t0, s3), _261);
    float _265 = _264.x;
    float _266 = _264.w;
    vec4 _270 = texture(sampler2D(t1, s5), _261);
    float _271 = _270.x;
    float _272 = _270.w;
    precise float _274 = fma(-_258, float(_248 <= 1.0), 1.0);
    precise float _278 = fma(_274, -_266, _266);
    precise float _282 = fma(_274, -_272, _272);
    precise float _283 = TEXCOORD2.x - cb1._m4.x;
    precise float _284 = TEXCOORD2.y - cb1._m4.y;
    precise float _285 = TEXCOORD2.z - cb1._m4.z;
    vec3 _286 = vec3(_283, _284, _285);
    precise float _288 = inversesqrt(dp3_f32(_286, _286));
    precise float _289 = _288 * _283;
    precise float _290 = _288 * _285;
    precise float _291 = TEXCOORD.y + TEXCOORD.x;
    precise float _292 = TEXCOORD.y + TEXCOORD.y;
    precise float _296 = fma(-_290, 5.0, _292);
    precise float _297 = _296 * 10.0;
    precise float _299 = fma(sin(_297), 0.0199999995529651641845703125, fma(-_289, 5.0, _291));
    precise float _300 = _299 * 30.0;
    vec4 _307 = texture(sampler2D(t2, s4), vec2(_299, fma(cos(_300), 0.0199999995529651641845703125, _296)));
    precise float _315 = fma(cb1._m0.z, 2.0, _291) * 0.0199999995529651641845703125;
    float _318 = float(fract(_315) >= 0.9900000095367431640625);
    bool _323 = cb0._m19.x > 0.5;
    bool _324 = cb0._m19.y > 0.5;
    float _335 = _323 ? fma(_318, cb0._m22.y, cb0._m10.x) : cb0._m10.x;
    float _336 = _323 ? fma(_318, cb0._m22.y, cb0._m10.y) : cb0._m10.y;
    float _337 = _323 ? fma(_318, cb0._m22.y, cb0._m10.z) : cb0._m10.z;
    precise float _338 = _246 + 0.0;
    precise float _339 = _248 - 0.5;
    vec2 _340 = vec2(_338, _339);
    precise float _347 = (_236 ? spvNMax(abs(_339), abs(_338)) : sqrt(dp2_f32(_340, _340))) - 0.400390625;
    precise float _348 = _347 / _226;
    precise float _350 = 1.0 - spvNClamp(_348, 0.0, 1.0);
    precise float _356 = cb0._m12.x - _335;
    precise float _357 = cb0._m12.y - _336;
    precise float _358 = cb0._m12.z - _337;
    precise float _359 = fma(_350, _356, _335);
    precise float _360 = fma(_350, _357, _336);
    precise float _361 = fma(_350, _358, _337);
    float _363 = (_217 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _364 = cb0._m12.x - _359;
    precise float _365 = cb0._m12.y - _360;
    precise float _366 = cb0._m12.z - _361;
    precise float _367 = fma(_363, _364, _359);
    precise float _368 = fma(_363, _365, _360);
    precise float _369 = fma(_363, _366, _361);
    precise float _370 = 1.0 - fma(_274, -_265, _265);
    precise float _376 = cb0._m17.x - cb0._m10.x;
    precise float _377 = cb0._m17.y - cb0._m10.y;
    precise float _378 = cb0._m17.z - cb0._m10.z;
    precise float _382 = fma(_370, _376, cb0._m10.x) - _367;
    precise float _383 = fma(_370, _377, cb0._m10.y) - _368;
    precise float _384 = fma(_370, _378, cb0._m10.z) - _369;
    precise float _385 = fma(_278, _382, _367);
    precise float _386 = fma(_278, _383, _368);
    precise float _387 = fma(_278, _384, _369);
    bool _390 = (cb0._m23.y == 0.0) && (cb0._m23.x == 0.0);
    precise float _391 = 1.0 - fma(_274, -_271, _271);
    precise float _395 = fma(_391, _376, cb0._m10.x) - _385;
    precise float _396 = fma(_391, _377, cb0._m10.y) - _386;
    precise float _397 = fma(_391, _378, cb0._m10.z) - _387;
    float _401 = _390 ? _385 : fma(_282, _395, _385);
    float _402 = _390 ? _386 : fma(_282, _396, _386);
    float _403 = _390 ? _387 : fma(_282, _397, _387);
    precise float _404 = -_227;
    precise float _405 = fma(_404, 0.5, 0.189999997615814208984375);
    precise float _406 = fma(_404, 0.5, 0.2100000083446502685546875);
    precise float _409 = _217 - _405;
    precise float _410 = _217 - _406;
    precise float _413 = fma(_227, 0.5, -_405) + 0.189999997615814208984375;
    precise float _414 = fma(_227, 0.5, -_406) + 0.2100000083446502685546875;
    precise float _415 = _409 / _413;
    precise float _416 = _410 / _414;
    precise float _419 = 1.0 - spvNClamp(_416, 0.0, 1.0);
    precise float _422 = _210 - 0.1167768537998199462890625;
    precise float _423 = _217 - 0.02999999932944774627685546875;
    precise float _424 = _422 / _226;
    precise float _425 = _423 / _227;
    precise float _428 = 0.88322317600250244140625 - _210;
    precise float _429 = 0.9700000286102294921875 - _217;
    precise float _430 = _428 / _226;
    precise float _431 = _429 / _227;
    precise float _434 = spvNClamp(_424, 0.0, 1.0) * spvNClamp(_430, 0.0, 1.0);
    precise float _435 = spvNClamp(_425, 0.0, 1.0) * _434;
    precise float _436 = spvNClamp(_431, 0.0, 1.0) * _435;
    precise float _437 = fma(-spvNClamp(_415, 0.0, 1.0), _419, 1.0) * _436;
    precise float _438 = _217 * 10.0;
    precise float _442 = abs(fma(fract(_438), 2.0, -1.0)) - 0.5;
    precise float _444 = sin(_438) * _442;
    precise float _448 = abs(fma(fract(_212), 2.0, -1.0)) - 0.5;
    precise float _450 = sin(_212) * _448;
    precise float _451 = fma(_444, 0.0199999995529651641845703125, _210);
    precise float _452 = fma(_450, 0.0199999995529651641845703125, _217);
    precise float _453 = _451 - 0.089776851236820220947265625;
    precise float _454 = _452 - 0.0030000000260770320892333984375;
    precise float _455 = _453 / _226;
    precise float _456 = _454 / _227;
    precise float _459 = 0.91022312641143798828125 - _451;
    precise float _460 = 0.9969999790191650390625 - _452;
    precise float _461 = _459 / _226;
    precise float _462 = _460 / _227;
    precise float _465 = spvNClamp(_455, 0.0, 1.0) * spvNClamp(_461, 0.0, 1.0);
    precise float _466 = spvNClamp(_456, 0.0, 1.0) * _465;
    if ((fma(_466, spvNClamp(_462, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _324)
    {
        demote;
    }
    precise float _485 = (_323 ? fma(_307.x, cb0._m22.x, _401) : _401) - cb0._m14.x;
    precise float _486 = (_323 ? fma(_307.y, cb0._m22.x, _402) : _402) - cb0._m14.y;
    precise float _487 = (_323 ? fma(_307.z, cb0._m22.x, _403) : _403) - cb0._m14.z;
    precise float _488 = fma(_437, _485, cb0._m14.x);
    precise float _489 = fma(_437, _486, cb0._m14.y);
    precise float _490 = fma(_437, _487, cb0._m14.z);
    float _512;
    float _513;
    float _514;
    if (cb0._m19.y != 0.0)
    {
        float _505 = float(texture(sampler2D(t3, s6), vec2(_324 ? _451 : _210, _324 ? _452 : _217)).w >= 0.5);
        precise float _506 = _488 * (-0.39999997615814208984375);
        precise float _507 = _489 * (-0.39999997615814208984375);
        precise float _508 = _490 * (-0.39999997615814208984375);
        _512 = fma(_505, _506, _488);
        _513 = fma(_505, _507, _489);
        _514 = fma(_505, _508, _490);
    }
    else
    {
        _512 = _488;
        _513 = _489;
        _514 = _490;
    }
    precise float _522 = TEXCOORD2.y * cb0._m6.x;
    precise float _523 = TEXCOORD2.y * cb0._m6.y;
    precise float _524 = TEXCOORD2.y * cb0._m6.z;
    precise float _525 = TEXCOORD2.y * cb0._m6.w;
    precise float _552 = fma(cb0._m7.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _522)) + cb0._m8.x;
    precise float _553 = fma(cb0._m7.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _523)) + cb0._m8.y;
    precise float _554 = fma(cb0._m7.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _524)) + cb0._m8.z;
    precise float _555 = fma(cb0._m7.w, TEXCOORD2.z, fma(cb0._m5.w, TEXCOORD2.x, _525)) + cb0._m8.w;
    float _631;
    float _632;
    float _633;
    float _634;
    if (cb3._m0.x == 1.0)
    {
        bool _564 = cb3._m0.y == 1.0;
        precise float _570 = TEXCOORD2.y * cb3._m3.x;
        precise float _571 = TEXCOORD2.y * cb3._m3.y;
        precise float _572 = TEXCOORD2.y * cb3._m3.z;
        precise float _594 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _570)) + cb3._m7.x;
        precise float _595 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _571)) + cb3._m7.y;
        precise float _596 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _572)) + cb3._m7.z;
        precise float _605 = (_564 ? _594 : TEXCOORD2.x) - cb3._m11.x;
        precise float _606 = (_564 ? _595 : TEXCOORD2.y) - cb3._m11.y;
        precise float _607 = (_564 ? _596 : TEXCOORD2.z) - cb3._m11.z;
        precise float _613 = _605 * cb3._m9.x;
        precise float _614 = _606 * cb3._m9.y;
        precise float _615 = _607 * cb3._m9.z;
        vec4 _626 = texture(sampler3D(t6, s0), vec3(spvNMax(fma(_613, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _614, _615));
        _631 = _626.w;
        _632 = _626.z;
        _633 = _626.y;
        _634 = _626.x;
    }
    else
    {
        _631 = 1.0;
        _632 = 1.0;
        _633 = 1.0;
        _634 = 1.0;
    }
    precise float _642 = _552 / _555;
    precise float _643 = _553 / _555;
    precise float _644 = _642 + 0.5;
    precise float _645 = _643 + 0.5;
    precise float _652 = float(_554 > 0.0) * texture(sampler2D(t4, s1), vec2(_644, _645)).w;
    vec3 _653 = vec3(_552, _553, _554);
    precise float _661 = _652 * texture(sampler2D(t5, s2), vec2(dp3_f32(_653, _653))).x;
    precise float _662 = spvNClamp(dp4_f32(vec4(_634, _633, _632, _631), cb2._m47), 0.0, 1.0) * _661;
    precise float _668 = _662 * cb0._m2.x;
    precise float _669 = _662 * cb0._m2.y;
    precise float _670 = _662 * cb0._m2.z;
    vec3 _677 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _679 = inversesqrt(dp3_f32(_677, _677));
    precise float _680 = _679 * TEXCOORD1.x;
    precise float _681 = _679 * TEXCOORD1.y;
    precise float _682 = _679 * TEXCOORD1.z;
    precise float _683 = _512 - 0.039999999105930328369140625;
    precise float _684 = _513 - 0.039999999105930328369140625;
    precise float _685 = _514 - 0.039999999105930328369140625;
    precise float _688 = fma(cb0._m9.y, _683, 0.039999999105930328369140625);
    precise float _689 = fma(cb0._m9.y, _684, 0.039999999105930328369140625);
    precise float _690 = fma(cb0._m9.y, _685, 0.039999999105930328369140625);
    precise float _692 = fma(-cb0._m9.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _693 = _692 * _512;
    precise float _694 = _692 * _513;
    precise float _695 = _692 * _514;
    precise float _698 = 1.0 - cb0._m9.x;
    precise float _699 = fma(_177, _182, _198);
    precise float _700 = fma(_178, _182, _199);
    precise float _701 = fma(_179, _182, _200);
    vec3 _702 = vec3(_699, _700, _701);
    precise float _705 = inversesqrt(spvNMax(dp3_f32(_702, _702), 0.001000000047497451305389404296875));
    precise float _706 = _705 * _699;
    precise float _707 = _705 * _700;
    precise float _708 = _705 * _701;
    vec3 _709 = vec3(_680, _681, _682);
    vec3 _712 = vec3(_183, _184, _185);
    precise float _714 = spvNClamp(dp3_f32(_709, _712), 0.0, 1.0);
    vec3 _715 = vec3(_706, _707, _708);
    precise float _717 = spvNClamp(dp3_f32(_709, _715), 0.0, 1.0);
    precise float _719 = spvNClamp(dp3_f32(_712, _715), 0.0, 1.0);
    precise float _720 = _719 + _719;
    precise float _721 = _719 * _720;
    precise float _722 = fma(_721, _698, -0.5);
    precise float _723 = 1.0 - _714;
    precise float _724 = _723 * _723;
    precise float _725 = _724 * _724;
    precise float _726 = _723 * _725;
    precise float _728 = abs(dp3_f32(_709, vec3(_198, _199, _200)));
    precise float _729 = 1.0 - _728;
    precise float _730 = _729 * _729;
    precise float _731 = _730 * _730;
    precise float _732 = _729 * _731;
    precise float _734 = fma(_722, _732, 1.0) * fma(_722, _726, 1.0);
    precise float _735 = _698 * _698;
    precise float _736 = spvNMax(_735, 0.00200000009499490261077880859375);
    precise float _737 = 1.0 - _736;
    precise float _740 = _728 * fma(_714, _737, _736);
    precise float _742 = fma(_714, fma(_728, _737, _736), _740) + 9.9999997473787516355514526367188e-06;
    precise float _743 = 0.5 / _742;
    precise float _744 = _736 * _736;
    precise float _747 = fma(fma(_717, _744, -_717), _717, 1.0);
    precise float _748 = _744 * 0.3183098733425140380859375;
    precise float _750 = _748 / fma(_747, _747, 1.0000000116860974230803549289703e-07);
    precise float _751 = _750 * _743;
    precise float _752 = _751 * 3.1415927410125732421875;
    precise float _753 = _714 * _734;
    precise float _754 = _714 * _752;
    vec3 _756 = vec3(_688, _689, _690);
    precise float _760 = ((dp3_f32(_756, _756) == 0.0) ? 0.0 : 1.0) * spvNMax(_754, 0.0);
    precise float _761 = _753 * _668;
    precise float _762 = _753 * _669;
    precise float _763 = _753 * _670;
    precise float _764 = _668 * _760;
    precise float _765 = _669 * _760;
    precise float _766 = _670 * _760;
    precise float _767 = 1.0 - _719;
    precise float _768 = _767 * _767;
    precise float _769 = _768 * _768;
    precise float _770 = _767 * _769;
    precise float _771 = 1.0 - _688;
    precise float _772 = 1.0 - _689;
    precise float _773 = 1.0 - _690;
    precise float _777 = _764 * fma(_771, _770, _688);
    precise float _778 = _765 * fma(_772, _770, _689);
    precise float _779 = _766 * fma(_773, _770, _690);
    SV_Target.x = fma(_693, _761, _777);
    SV_Target.y = fma(_694, _762, _778);
    SV_Target.z = fma(_695, _763, _779);
    SV_Target.w = 1.0;
}

