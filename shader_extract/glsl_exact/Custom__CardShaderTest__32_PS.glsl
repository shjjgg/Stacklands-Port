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
layout(set = 0, binding = 10) uniform sampler s6;
layout(set = 0, binding = 11) uniform texture2D t0;
layout(set = 0, binding = 12) uniform texture2D t1;
layout(set = 0, binding = 13) uniform texture2D t2;
layout(set = 0, binding = 14) uniform texture2D t3;
layout(set = 0, binding = 15) uniform texture2D t4;
layout(set = 0, binding = 16) uniform textureCube t5;
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
    precise float _154 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _154));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _143 = a.x * b.x;
    return fma(a.y, b.y, _143);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _125 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _125)));
}

void main()
{
    precise float _178 = cb2._m0.x - TEXCOORD2.x;
    precise float _179 = cb2._m0.y - TEXCOORD2.y;
    precise float _180 = cb2._m0.z - TEXCOORD2.z;
    vec3 _181 = vec3(_178, _179, _180);
    precise float _183 = inversesqrt(dp3_f32(_181, _181));
    precise float _184 = _183 * _178;
    precise float _185 = _183 * _179;
    precise float _186 = _183 * _180;
    precise float _193 = cb1._m4.x - TEXCOORD2.x;
    precise float _194 = cb1._m4.y - TEXCOORD2.y;
    precise float _195 = cb1._m4.z - TEXCOORD2.z;
    vec3 _196 = vec3(_193, _194, _195);
    precise float _198 = inversesqrt(dp3_f32(_196, _196));
    precise float _199 = _198 * _193;
    precise float _200 = _198 * _194;
    precise float _201 = _198 * _195;
    precise float _204 = TEXCOORD.y * 150.0;
    precise float _207 = sin(roundEven(_204)) * 43758.546875;
    precise float _211 = fma(fract(_207), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _212 = _211 * 150.0;
    precise float _213 = _211 * 10.0;
    precise float _216 = sin(roundEven(_212)) * 43758.546875;
    precise float _218 = fma(fract(_216), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _227 = abs(dFdy(_211)) + abs(dFdx(_211));
    precise float _228 = abs(dFdy(_218)) + abs(dFdx(_218));
    precise float _229 = 1.0 - TEXCOORD.x;
    precise float _230 = 1.0 - TEXCOORD.y;
    bool _237 = cb0._m27.x > 0.5;
    bool _239 = cb0._m27.y > 0.5;
    float _242 = _239 ? (_237 ? 0.550000011920928955078125 : 0.5) : (_237 ? 0.5 : 0.449999988079071044921875);
    float _244 = (_237 || _239) ? 2.0 : 1.75;
    precise float _245 = _229 - 0.5;
    precise float _246 = _230 - _242;
    precise float _247 = _244 * _245;
    precise float _248 = fma(_245, _244, 0.5);
    precise float _249 = fma(_246, _244, _242);
    precise float _258 = float(_248 >= 0.0) * float(_248 <= 1.0);
    precise float _259 = float(_249 >= 0.0) * _258;
    vec2 _262 = vec2(_248, _249);
    vec4 _265 = texture(sampler2D(t0, s3), _262);
    float _266 = _265.x;
    float _267 = _265.w;
    vec4 _271 = texture(sampler2D(t1, s5), _262);
    float _272 = _271.x;
    float _273 = _271.w;
    precise float _275 = fma(-_259, float(_249 <= 1.0), 1.0);
    precise float _279 = fma(_275, -_267, _267);
    precise float _283 = fma(_275, -_273, _273);
    precise float _284 = TEXCOORD2.x - cb1._m4.x;
    precise float _285 = TEXCOORD2.y - cb1._m4.y;
    precise float _286 = TEXCOORD2.z - cb1._m4.z;
    vec3 _287 = vec3(_284, _285, _286);
    precise float _289 = inversesqrt(dp3_f32(_287, _287));
    precise float _290 = _289 * _284;
    precise float _291 = _289 * _286;
    precise float _292 = TEXCOORD.y + TEXCOORD.x;
    precise float _293 = TEXCOORD.y + TEXCOORD.y;
    precise float _297 = fma(-_291, 5.0, _293);
    precise float _298 = _297 * 10.0;
    precise float _300 = fma(sin(_298), 0.0199999995529651641845703125, fma(-_290, 5.0, _292));
    precise float _301 = _300 * 30.0;
    vec4 _308 = texture(sampler2D(t2, s4), vec2(_300, fma(cos(_301), 0.0199999995529651641845703125, _297)));
    precise float _316 = fma(cb1._m0.z, 2.0, _292) * 0.0199999995529651641845703125;
    float _319 = float(fract(_316) >= 0.9900000095367431640625);
    bool _324 = cb0._m23.x > 0.5;
    bool _325 = cb0._m23.y > 0.5;
    float _336 = _324 ? fma(_319, cb0._m26.y, cb0._m14.x) : cb0._m14.x;
    float _337 = _324 ? fma(_319, cb0._m26.y, cb0._m14.y) : cb0._m14.y;
    float _338 = _324 ? fma(_319, cb0._m26.y, cb0._m14.z) : cb0._m14.z;
    precise float _339 = _247 + 0.0;
    precise float _340 = _249 - 0.5;
    vec2 _341 = vec2(_339, _340);
    precise float _348 = (_237 ? spvNMax(abs(_340), abs(_339)) : sqrt(dp2_f32(_341, _341))) - 0.400390625;
    precise float _349 = _348 / _227;
    precise float _351 = 1.0 - spvNClamp(_349, 0.0, 1.0);
    precise float _357 = cb0._m16.x - _336;
    precise float _358 = cb0._m16.y - _337;
    precise float _359 = cb0._m16.z - _338;
    precise float _360 = fma(_351, _357, _336);
    precise float _361 = fma(_351, _358, _337);
    precise float _362 = fma(_351, _359, _338);
    float _364 = (_218 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _365 = cb0._m16.x - _360;
    precise float _366 = cb0._m16.y - _361;
    precise float _367 = cb0._m16.z - _362;
    precise float _368 = fma(_364, _365, _360);
    precise float _369 = fma(_364, _366, _361);
    precise float _370 = fma(_364, _367, _362);
    precise float _371 = 1.0 - fma(_275, -_266, _266);
    precise float _377 = cb0._m21.x - cb0._m14.x;
    precise float _378 = cb0._m21.y - cb0._m14.y;
    precise float _379 = cb0._m21.z - cb0._m14.z;
    precise float _383 = fma(_371, _377, cb0._m14.x) - _368;
    precise float _384 = fma(_371, _378, cb0._m14.y) - _369;
    precise float _385 = fma(_371, _379, cb0._m14.z) - _370;
    precise float _386 = fma(_279, _383, _368);
    precise float _387 = fma(_279, _384, _369);
    precise float _388 = fma(_279, _385, _370);
    bool _391 = (cb0._m27.y == 0.0) && (cb0._m27.x == 0.0);
    precise float _392 = 1.0 - fma(_275, -_272, _272);
    precise float _396 = fma(_392, _377, cb0._m14.x) - _386;
    precise float _397 = fma(_392, _378, cb0._m14.y) - _387;
    precise float _398 = fma(_392, _379, cb0._m14.z) - _388;
    float _402 = _391 ? _386 : fma(_283, _396, _386);
    float _403 = _391 ? _387 : fma(_283, _397, _387);
    float _404 = _391 ? _388 : fma(_283, _398, _388);
    precise float _405 = -_228;
    precise float _406 = fma(_405, 0.5, 0.189999997615814208984375);
    precise float _407 = fma(_405, 0.5, 0.2100000083446502685546875);
    precise float _410 = _218 - _406;
    precise float _411 = _218 - _407;
    precise float _414 = fma(_228, 0.5, -_406) + 0.189999997615814208984375;
    precise float _415 = fma(_228, 0.5, -_407) + 0.2100000083446502685546875;
    precise float _416 = _410 / _414;
    precise float _417 = _411 / _415;
    precise float _420 = 1.0 - spvNClamp(_417, 0.0, 1.0);
    precise float _423 = _211 - 0.1167768537998199462890625;
    precise float _424 = _218 - 0.02999999932944774627685546875;
    precise float _425 = _423 / _227;
    precise float _426 = _424 / _228;
    precise float _429 = 0.88322317600250244140625 - _211;
    precise float _430 = 0.9700000286102294921875 - _218;
    precise float _431 = _429 / _227;
    precise float _432 = _430 / _228;
    precise float _435 = spvNClamp(_425, 0.0, 1.0) * spvNClamp(_431, 0.0, 1.0);
    precise float _436 = spvNClamp(_426, 0.0, 1.0) * _435;
    precise float _437 = spvNClamp(_432, 0.0, 1.0) * _436;
    precise float _438 = fma(-spvNClamp(_416, 0.0, 1.0), _420, 1.0) * _437;
    precise float _439 = _218 * 10.0;
    precise float _443 = abs(fma(fract(_439), 2.0, -1.0)) - 0.5;
    precise float _445 = sin(_439) * _443;
    precise float _449 = abs(fma(fract(_213), 2.0, -1.0)) - 0.5;
    precise float _451 = sin(_213) * _449;
    precise float _452 = fma(_445, 0.0199999995529651641845703125, _211);
    precise float _453 = fma(_451, 0.0199999995529651641845703125, _218);
    precise float _454 = _452 - 0.089776851236820220947265625;
    precise float _455 = _453 - 0.0030000000260770320892333984375;
    precise float _456 = _454 / _227;
    precise float _457 = _455 / _228;
    precise float _460 = 0.91022312641143798828125 - _452;
    precise float _461 = 0.9969999790191650390625 - _453;
    precise float _462 = _460 / _227;
    precise float _463 = _461 / _228;
    precise float _466 = spvNClamp(_456, 0.0, 1.0) * spvNClamp(_462, 0.0, 1.0);
    precise float _467 = spvNClamp(_457, 0.0, 1.0) * _466;
    if ((fma(_467, spvNClamp(_463, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _325)
    {
        demote;
    }
    precise float _486 = (_324 ? fma(_308.x, cb0._m26.x, _402) : _402) - cb0._m18.x;
    precise float _487 = (_324 ? fma(_308.y, cb0._m26.x, _403) : _403) - cb0._m18.y;
    precise float _488 = (_324 ? fma(_308.z, cb0._m26.x, _404) : _404) - cb0._m18.z;
    precise float _489 = fma(_438, _486, cb0._m18.x);
    precise float _490 = fma(_438, _487, cb0._m18.y);
    precise float _491 = fma(_438, _488, cb0._m18.z);
    float _513;
    float _514;
    float _515;
    if (cb0._m23.y != 0.0)
    {
        float _506 = float(texture(sampler2D(t3, s6), vec2(_325 ? _452 : _211, _325 ? _453 : _218)).w >= 0.5);
        precise float _507 = _489 * (-0.39999997615814208984375);
        precise float _508 = _490 * (-0.39999997615814208984375);
        precise float _509 = _491 * (-0.39999997615814208984375);
        _513 = fma(_506, _507, _489);
        _514 = fma(_506, _508, _490);
        _515 = fma(_506, _509, _491);
    }
    else
    {
        _513 = _489;
        _514 = _490;
        _515 = _491;
    }
    precise float _521 = TEXCOORD2.y * cb0._m7.x;
    precise float _522 = TEXCOORD2.y * cb0._m7.y;
    precise float _523 = TEXCOORD2.y * cb0._m7.z;
    precise float _545 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _521)) + cb0._m11.x;
    precise float _546 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _522)) + cb0._m11.y;
    precise float _547 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _523)) + cb0._m11.z;
    float _623;
    float _624;
    float _625;
    float _626;
    if (cb3._m0.x == 1.0)
    {
        bool _556 = cb3._m0.y == 1.0;
        precise float _562 = TEXCOORD2.y * cb3._m3.x;
        precise float _563 = TEXCOORD2.y * cb3._m3.y;
        precise float _564 = TEXCOORD2.y * cb3._m3.z;
        precise float _586 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _562)) + cb3._m7.x;
        precise float _587 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _563)) + cb3._m7.y;
        precise float _588 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _564)) + cb3._m7.z;
        precise float _597 = (_556 ? _586 : TEXCOORD2.x) - cb3._m11.x;
        precise float _598 = (_556 ? _587 : TEXCOORD2.y) - cb3._m11.y;
        precise float _599 = (_556 ? _588 : TEXCOORD2.z) - cb3._m11.z;
        precise float _605 = _597 * cb3._m9.x;
        precise float _606 = _598 * cb3._m9.y;
        precise float _607 = _599 * cb3._m9.z;
        vec4 _618 = texture(sampler3D(t6, s0), vec3(spvNMax(fma(_605, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _606, _607));
        _623 = _618.w;
        _624 = _618.z;
        _625 = _618.y;
        _626 = _618.x;
    }
    else
    {
        _623 = 1.0;
        _624 = 1.0;
        _625 = 1.0;
        _626 = 1.0;
    }
    vec3 _633 = vec3(_545, _546, _547);
    precise float _647 = texture(samplerCube(t5, s1), _633).w * texture(sampler2D(t4, s2), vec2(dp3_f32(_633, _633))).x;
    precise float _648 = spvNClamp(dp4_f32(vec4(_626, _625, _624, _623), cb2._m47), 0.0, 1.0) * _647;
    precise float _654 = _648 * cb0._m2.x;
    precise float _655 = _648 * cb0._m2.y;
    precise float _656 = _648 * cb0._m2.z;
    vec3 _663 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _665 = inversesqrt(dp3_f32(_663, _663));
    precise float _666 = _665 * TEXCOORD1.x;
    precise float _667 = _665 * TEXCOORD1.y;
    precise float _668 = _665 * TEXCOORD1.z;
    precise float _669 = _513 - 0.039999999105930328369140625;
    precise float _670 = _514 - 0.039999999105930328369140625;
    precise float _671 = _515 - 0.039999999105930328369140625;
    precise float _674 = fma(cb0._m13.y, _669, 0.039999999105930328369140625);
    precise float _675 = fma(cb0._m13.y, _670, 0.039999999105930328369140625);
    precise float _676 = fma(cb0._m13.y, _671, 0.039999999105930328369140625);
    precise float _678 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _679 = _678 * _513;
    precise float _680 = _678 * _514;
    precise float _681 = _678 * _515;
    precise float _684 = 1.0 - cb0._m13.x;
    precise float _685 = fma(_178, _183, _199);
    precise float _686 = fma(_179, _183, _200);
    precise float _687 = fma(_180, _183, _201);
    vec3 _688 = vec3(_685, _686, _687);
    precise float _691 = inversesqrt(spvNMax(dp3_f32(_688, _688), 0.001000000047497451305389404296875));
    precise float _692 = _691 * _685;
    precise float _693 = _691 * _686;
    precise float _694 = _691 * _687;
    vec3 _695 = vec3(_666, _667, _668);
    vec3 _698 = vec3(_184, _185, _186);
    precise float _700 = spvNClamp(dp3_f32(_695, _698), 0.0, 1.0);
    vec3 _701 = vec3(_692, _693, _694);
    precise float _703 = spvNClamp(dp3_f32(_695, _701), 0.0, 1.0);
    precise float _705 = spvNClamp(dp3_f32(_698, _701), 0.0, 1.0);
    precise float _706 = _705 + _705;
    precise float _707 = _705 * _706;
    precise float _708 = fma(_707, _684, -0.5);
    precise float _709 = 1.0 - _700;
    precise float _710 = _709 * _709;
    precise float _711 = _710 * _710;
    precise float _712 = _709 * _711;
    precise float _714 = abs(dp3_f32(_695, vec3(_199, _200, _201)));
    precise float _715 = 1.0 - _714;
    precise float _716 = _715 * _715;
    precise float _717 = _716 * _716;
    precise float _718 = _715 * _717;
    precise float _720 = fma(_708, _718, 1.0) * fma(_708, _712, 1.0);
    precise float _721 = _684 * _684;
    precise float _722 = spvNMax(_721, 0.00200000009499490261077880859375);
    precise float _723 = 1.0 - _722;
    precise float _726 = _714 * fma(_700, _723, _722);
    precise float _728 = fma(_700, fma(_714, _723, _722), _726) + 9.9999997473787516355514526367188e-06;
    precise float _729 = 0.5 / _728;
    precise float _730 = _722 * _722;
    precise float _733 = fma(fma(_703, _730, -_703), _703, 1.0);
    precise float _734 = _730 * 0.3183098733425140380859375;
    precise float _736 = _734 / fma(_733, _733, 1.0000000116860974230803549289703e-07);
    precise float _737 = _736 * _729;
    precise float _738 = _737 * 3.1415927410125732421875;
    precise float _739 = _700 * _720;
    precise float _740 = _700 * _738;
    vec3 _742 = vec3(_674, _675, _676);
    precise float _746 = ((dp3_f32(_742, _742) == 0.0) ? 0.0 : 1.0) * spvNMax(_740, 0.0);
    precise float _747 = _739 * _654;
    precise float _748 = _739 * _655;
    precise float _749 = _739 * _656;
    precise float _750 = _654 * _746;
    precise float _751 = _655 * _746;
    precise float _752 = _656 * _746;
    precise float _753 = 1.0 - _705;
    precise float _754 = _753 * _753;
    precise float _755 = _754 * _754;
    precise float _756 = _753 * _755;
    precise float _757 = 1.0 - _674;
    precise float _758 = 1.0 - _675;
    precise float _759 = 1.0 - _676;
    precise float _763 = _750 * fma(_757, _756, _674);
    precise float _764 = _751 * fma(_758, _756, _675);
    precise float _765 = _752 * fma(_759, _756, _676);
    SV_Target.x = fma(_679, _747, _763);
    SV_Target.y = fma(_680, _748, _764);
    SV_Target.z = fma(_681, _749, _765);
    SV_Target.w = 1.0;
}

