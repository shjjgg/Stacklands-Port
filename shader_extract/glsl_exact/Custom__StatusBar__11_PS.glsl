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
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
    vec4 _m14;
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
layout(set = 0, binding = 10) uniform texture2D t0;
layout(set = 0, binding = 11) uniform textureCube t1;
layout(set = 0, binding = 12) uniform textureCube t2;
layout(set = 0, binding = 13) uniform texture3D t3;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec3 TEXCOORD3;
layout(location = 5, component = 0) in vec4 TEXCOORD5;
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
    precise float _159 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _159));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _142 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _142)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _130 = a.x * b.x;
    return fma(a.y, b.y, _130);
}

void main()
{
    precise float _183 = cb1._m4.x - TEXCOORD2.x;
    precise float _184 = cb1._m4.y - TEXCOORD2.y;
    precise float _185 = cb1._m4.z - TEXCOORD2.z;
    vec3 _186 = vec3(_183, _184, _185);
    precise float _188 = inversesqrt(dp3_f32(_186, _186));
    precise float _189 = _188 * _183;
    precise float _190 = _188 * _184;
    precise float _191 = _188 * _185;
    precise float _194 = TEXCOORD.y * 150.0;
    precise float _197 = sin(roundEven(_194)) * 43758.546875;
    precise float _199 = fract(_197) - 0.5;
    precise float _202 = fma(_199, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _203 = _202 * 150.0;
    precise float _206 = sin(roundEven(_203)) * 43758.546875;
    precise float _208 = fract(_206) - 0.5;
    precise float _209 = fma(_208, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _218 = abs(dFdx(_202)) + abs(dFdy(_202));
    precise float _219 = abs(dFdx(_209)) + abs(dFdy(_209));
    precise float _220 = _219 * 0.2666666805744171142578125;
    precise float _221 = _209 - 0.5;
    precise float _222 = _202 - 0.02999999932944774627685546875;
    precise float _224 = fma(-_222, 1.06382977962493896484375, 1.0);
    precise float _225 = _222 / _218;
    precise float _227 = 0.9700000286102294921875 - _202;
    precise float _228 = _227 / _218;
    precise float _230 = spvNClamp(_228, 0.0, 1.0) * spvNClamp(_225, 0.0, 1.0);
    precise float _233 = fma(_221, 0.2666666805744171142578125, 0.069999992847442626953125) / _220;
    precise float _235 = _230 * spvNClamp(_233, 0.0, 1.0);
    precise float _236 = 0.569999992847442626953125 - fma(_221, 0.2666666805744171142578125, 0.5);
    precise float _237 = _236 / _220;
    precise float _239 = _235 * spvNClamp(_237, 0.0, 1.0);
    precise float _251 = cb0._m8.x - cb0._m6.x;
    precise float _252 = cb0._m8.y - cb0._m6.y;
    precise float _253 = cb0._m8.z - cb0._m6.z;
    precise float _254 = fma(_239, _251, cb0._m6.x);
    precise float _255 = fma(_239, _252, cb0._m6.y);
    precise float _256 = fma(_239, _253, cb0._m6.z);
    float _262 = float(cb0._m14.x >= 0.5);
    precise float _273 = cb0._m12.x - cb0._m10.x;
    precise float _274 = cb0._m12.y - cb0._m10.y;
    precise float _275 = cb0._m12.z - cb0._m10.z;
    precise float _281 = _224 - cb0._m14.y;
    precise float _286 = abs(dFdy(_224)) + abs(dFdx(_224));
    precise float _287 = _281 / _286;
    float _290 = (_239 <= 0.0) ? 0.0 : spvNClamp(_287, 0.0, 1.0);
    precise float _291 = fma(_262, _273, cb0._m10.x) - _254;
    precise float _292 = fma(_262, _274, cb0._m10.y) - _255;
    precise float _293 = fma(_262, _275, cb0._m10.z) - _256;
    precise float _294 = fma(_290, _291, _254);
    precise float _295 = fma(_290, _292, _255);
    precise float _296 = fma(_290, _293, _256);
    float _305 = dp3_f32(_186, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _312 = TEXCOORD2.x - cb3._m25.x;
    precise float _313 = TEXCOORD2.y - cb3._m25.y;
    precise float _314 = TEXCOORD2.z - cb3._m25.z;
    vec3 _315 = vec3(_312, _313, _314);
    precise float _318 = sqrt(dp3_f32(_315, _315)) - _305;
    bool _331 = cb6._m0.x == 1.0;
    float _403;
    float _404;
    float _405;
    float _406;
    if (_331)
    {
        bool _338 = cb6._m0.y == 1.0;
        precise float _344 = TEXCOORD2.y * cb6._m3.x;
        precise float _345 = TEXCOORD2.y * cb6._m3.y;
        precise float _346 = TEXCOORD2.y * cb6._m3.z;
        precise float _368 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _344)) + cb6._m7.x;
        precise float _369 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _345)) + cb6._m7.y;
        precise float _370 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _346)) + cb6._m7.z;
        precise float _379 = (_338 ? _368 : TEXCOORD2.x) - cb6._m11.x;
        precise float _380 = (_338 ? _369 : TEXCOORD2.y) - cb6._m11.y;
        precise float _381 = (_338 ? _370 : TEXCOORD2.z) - cb6._m11.z;
        precise float _387 = _379 * cb6._m9.x;
        precise float _388 = _380 * cb6._m9.y;
        precise float _389 = _381 * cb6._m9.z;
        vec4 _398 = texture(sampler3D(t3, s1), vec3(spvNMax(fma(_387, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _388, _389));
        _403 = _398.w;
        _404 = _398.z;
        _405 = _398.y;
        _406 = _398.x;
    }
    else
    {
        _403 = 1.0;
        _404 = 1.0;
        _405 = 1.0;
        _406 = 1.0;
    }
    precise float _420 = TEXCOORD5.x / TEXCOORD5.w;
    precise float _421 = TEXCOORD5.y / TEXCOORD5.w;
    vec4 _427 = texture(sampler2D(t0, s2), vec2(_420, _421));
    float _428 = _427.x;
    precise float _429 = spvNClamp(dp4_f32(vec4(_406, _405, _404, _403), cb2._m47), 0.0, 1.0) - _428;
    precise float _430 = fma(spvNClamp(fma(fma(cb3._m26, _318, _305), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _429, _428);
    precise float _433 = 1.0 - cb0._m5.x;
    precise float _434 = -_189;
    precise float _435 = -_190;
    precise float _436 = -_191;
    vec3 _444 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    float _445 = dp3_f32(vec3(_434, _435, _436), _444);
    precise float _446 = _445 + _445;
    precise float _447 = -_446;
    precise float _448 = fma(TEXCOORD1.x, _447, _434);
    precise float _449 = fma(TEXCOORD1.y, _447, _435);
    precise float _450 = fma(TEXCOORD1.z, _447, _436);
    precise float _456 = _430 * cb0._m2.x;
    precise float _457 = _430 * cb0._m2.y;
    precise float _458 = _430 * cb0._m2.z;
    vec4 _459 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _550;
    float _551;
    float _552;
    if (_331)
    {
        bool _465 = cb6._m0.y == 1.0;
        precise float _471 = TEXCOORD2.y * cb6._m3.x;
        precise float _472 = TEXCOORD2.y * cb6._m3.y;
        precise float _473 = TEXCOORD2.y * cb6._m3.z;
        precise float _495 = fma(cb6._m5.x, TEXCOORD2.z, fma(cb6._m1.x, TEXCOORD2.x, _471)) + cb6._m7.x;
        precise float _496 = fma(cb6._m5.y, TEXCOORD2.z, fma(cb6._m1.y, TEXCOORD2.x, _472)) + cb6._m7.y;
        precise float _497 = fma(cb6._m5.z, TEXCOORD2.z, fma(cb6._m1.z, TEXCOORD2.x, _473)) + cb6._m7.z;
        precise float _506 = (_465 ? _495 : TEXCOORD2.x) - cb6._m11.x;
        precise float _507 = (_465 ? _496 : TEXCOORD2.y) - cb6._m11.y;
        precise float _508 = (_465 ? _497 : TEXCOORD2.z) - cb6._m11.z;
        precise float _514 = _506 * cb6._m9.x;
        precise float _515 = _507 * cb6._m9.y;
        precise float _516 = _508 * cb6._m9.z;
        precise float _517 = _514 * 0.25;
        precise float _520 = cb6._m0.z * 0.5;
        precise float _524 = spvNMin(fma(-cb6._m0.z, 0.5, 0.25), spvNMax(_517, _520));
        precise float _528 = _524 + 0.25;
        precise float _529 = _515 + 0.0;
        precise float _530 = _516 + 0.0;
        precise float _534 = _524 + 0.5;
        _550 = dp4_f32(texture(sampler3D(t3, s1), vec3(_534, _529, _530)), _459);
        _551 = dp4_f32(texture(sampler3D(t3, s1), vec3(_528, _529, _530)), _459);
        _552 = dp4_f32(texture(sampler3D(t3, s1), vec3(_524, _515, _516)), _459);
    }
    else
    {
        _550 = dp4_f32(cb2._m42, _459);
        _551 = dp4_f32(cb2._m41, _459);
        _552 = dp4_f32(cb2._m40, _459);
    }
    precise float _559 = _552 + TEXCOORD3.x;
    precise float _560 = _551 + TEXCOORD3.y;
    precise float _561 = _550 + TEXCOORD3.z;
    vec3 _569 = vec3(_448, _449, _450);
    float _618;
    float _619;
    float _620;
    if (cb5._m5 > 0.0)
    {
        precise float _573 = inversesqrt(dp3_f32(_569, _569));
        precise float _574 = _573 * _448;
        precise float _575 = _573 * _449;
        precise float _576 = _573 * _450;
        precise float _582 = cb5._m0.x - TEXCOORD2.x;
        precise float _583 = cb5._m0.y - TEXCOORD2.y;
        precise float _584 = cb5._m0.z - TEXCOORD2.z;
        precise float _585 = _582 / _574;
        precise float _586 = _583 / _575;
        precise float _587 = _584 / _576;
        precise float _593 = cb5._m2.x - TEXCOORD2.x;
        precise float _594 = cb5._m2.y - TEXCOORD2.y;
        precise float _595 = cb5._m2.z - TEXCOORD2.z;
        precise float _596 = _593 / _574;
        precise float _597 = _594 / _575;
        precise float _598 = _595 / _576;
        precise float _606 = spvNMin((_576 > 0.0) ? _587 : _598, spvNMin((_575 > 0.0) ? _586 : _597, (_574 > 0.0) ? _585 : _596));
        precise float _612 = TEXCOORD2.x - cb5._m4.x;
        precise float _613 = TEXCOORD2.y - cb5._m4.y;
        precise float _614 = TEXCOORD2.z - cb5._m4.z;
        _618 = fma(_576, _606, _614);
        _619 = fma(_575, _606, _613);
        _620 = fma(_574, _606, _612);
    }
    else
    {
        _618 = _450;
        _619 = _449;
        _620 = _448;
    }
    precise float _623 = fma(-_433, 0.699999988079071044921875, 1.7000000476837158203125) * _433;
    precise float _624 = _623 * 6.0;
    vec4 _630 = textureLod(samplerCube(t1, s0), vec3(_620, _619, _618), _624);
    float _631 = _630.x;
    float _632 = _630.y;
    float _633 = _630.z;
    precise float _635 = _630.w - 1.0;
    precise float _642 = log2(fma(cb5._m6.w, _635, 1.0)) * cb5._m6.y;
    precise float _646 = exp2(_642) * cb5._m6.x;
    precise float _647 = _631 * _646;
    precise float _648 = _632 * _646;
    precise float _649 = _633 * _646;
    float _741;
    float _742;
    float _743;
    if (cb5._m3 < 0.999989986419677734375)
    {
        float _706;
        float _707;
        float _708;
        if (cb5._m12 > 0.0)
        {
            precise float _661 = inversesqrt(dp3_f32(_569, _569));
            precise float _662 = _448 * _661;
            precise float _663 = _449 * _661;
            precise float _664 = _450 * _661;
            precise float _670 = cb5._m7.x - TEXCOORD2.x;
            precise float _671 = cb5._m7.y - TEXCOORD2.y;
            precise float _672 = cb5._m7.z - TEXCOORD2.z;
            precise float _673 = _670 / _662;
            precise float _674 = _671 / _663;
            precise float _675 = _672 / _664;
            precise float _681 = cb5._m9.x - TEXCOORD2.x;
            precise float _682 = cb5._m9.y - TEXCOORD2.y;
            precise float _683 = cb5._m9.z - TEXCOORD2.z;
            precise float _684 = _681 / _662;
            precise float _685 = _682 / _663;
            precise float _686 = _683 / _664;
            precise float _694 = spvNMin((_664 > 0.0) ? _675 : _686, spvNMin((_663 > 0.0) ? _674 : _685, (_662 > 0.0) ? _673 : _684));
            precise float _700 = TEXCOORD2.x - cb5._m11.x;
            precise float _701 = TEXCOORD2.y - cb5._m11.y;
            precise float _702 = TEXCOORD2.z - cb5._m11.z;
            _706 = fma(_664, _694, _702);
            _707 = fma(_663, _694, _701);
            _708 = fma(_662, _694, _700);
        }
        else
        {
            _706 = _450;
            _707 = _449;
            _708 = _448;
        }
        vec4 _712 = textureLod(samplerCube(t2, s0), vec3(_708, _707, _706), _624);
        precise float _717 = _712.w - 1.0;
        precise float _724 = log2(fma(cb5._m13.w, _717, 1.0)) * cb5._m13.y;
        precise float _728 = exp2(_724) * cb5._m13.x;
        precise float _729 = _712.x * _728;
        precise float _730 = _712.y * _728;
        precise float _731 = _712.z * _728;
        _741 = fma(cb5._m3, fma(_646, _633, -_731), _731);
        _742 = fma(cb5._m3, fma(_646, _632, -_730), _730);
        _743 = fma(cb5._m3, fma(_646, _631, -_729), _729);
    }
    else
    {
        _741 = _649;
        _742 = _648;
        _743 = _647;
    }
    precise float _745 = inversesqrt(dp3_f32(_444, _444));
    precise float _746 = _745 * TEXCOORD1.x;
    precise float _747 = _745 * TEXCOORD1.y;
    precise float _748 = _745 * TEXCOORD1.z;
    precise float _749 = _294 - 0.039999999105930328369140625;
    precise float _750 = _295 - 0.039999999105930328369140625;
    precise float _751 = _296 - 0.039999999105930328369140625;
    precise float _754 = fma(cb0._m5.y, _749, 0.039999999105930328369140625);
    precise float _755 = fma(cb0._m5.y, _750, 0.039999999105930328369140625);
    precise float _756 = fma(cb0._m5.y, _751, 0.039999999105930328369140625);
    precise float _758 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _759 = _758 * _294;
    precise float _760 = _758 * _295;
    precise float _761 = _758 * _296;
    precise float _767 = fma(_183, _188, cb2._m0.x);
    precise float _768 = fma(_184, _188, cb2._m0.y);
    precise float _769 = fma(_185, _188, cb2._m0.z);
    vec3 _770 = vec3(_767, _768, _769);
    precise float _773 = inversesqrt(spvNMax(dp3_f32(_770, _770), 0.001000000047497451305389404296875));
    precise float _774 = _773 * _767;
    precise float _775 = _773 * _768;
    precise float _776 = _773 * _769;
    vec3 _777 = vec3(_746, _747, _748);
    precise float _781 = spvNClamp(dp3_f32(_777, cb2._m0), 0.0, 1.0);
    vec3 _782 = vec3(_774, _775, _776);
    precise float _784 = spvNClamp(dp3_f32(_777, _782), 0.0, 1.0);
    precise float _786 = spvNClamp(dp3_f32(cb2._m0, _782), 0.0, 1.0);
    precise float _787 = _786 * _786;
    precise float _791 = dp2_f32(vec2(_787), vec2(_433)) - 0.5;
    precise float _792 = 1.0 - _781;
    precise float _793 = _792 * _792;
    precise float _794 = _793 * _793;
    precise float _795 = _792 * _794;
    precise float _797 = abs(dp3_f32(_777, vec3(_189, _190, _191)));
    precise float _798 = 1.0 - _797;
    precise float _799 = _798 * _798;
    precise float _800 = _799 * _799;
    precise float _801 = _798 * _800;
    precise float _803 = fma(_791, _801, 1.0) * fma(_791, _795, 1.0);
    precise float _804 = _433 * _433;
    precise float _805 = spvNMax(_804, 0.00200000009499490261077880859375);
    precise float _806 = 1.0 - _805;
    precise float _809 = _797 * fma(_781, _806, _805);
    precise float _811 = fma(_781, fma(_797, _806, _805), _809) + 9.9999997473787516355514526367188e-06;
    precise float _812 = 0.5 / _811;
    precise float _813 = _805 * _805;
    precise float _816 = fma(fma(_784, _813, -_784), _784, 1.0);
    precise float _817 = _813 * 0.3183098733425140380859375;
    precise float _819 = _817 / fma(_816, _816, 1.0000000116860974230803549289703e-07);
    precise float _820 = _812 * _819;
    precise float _821 = _820 * 3.1415927410125732421875;
    precise float _822 = _781 * _803;
    precise float _823 = _781 * _821;
    precise float _826 = 1.0 / fma(_805, _805, 1.0);
    vec3 _827 = vec3(_754, _755, _756);
    precise float _831 = spvNMax(_823, 0.0) * ((dp3_f32(_827, _827) == 0.0) ? 0.0 : 1.0);
    precise float _832 = cb0._m5.x - _758;
    precise float _833 = _832 + 1.0;
    precise float _834 = spvNClamp(_833, 0.0, 1.0);
    precise float _838 = _456 * _831;
    precise float _839 = _457 * _831;
    precise float _840 = _458 * _831;
    precise float _841 = 1.0 - _786;
    precise float _842 = _841 * _841;
    precise float _843 = _842 * _842;
    precise float _844 = _841 * _843;
    precise float _845 = 1.0 - _754;
    precise float _846 = 1.0 - _755;
    precise float _847 = 1.0 - _756;
    precise float _851 = fma(_845, _844, _754) * _838;
    precise float _852 = fma(_846, _844, _755) * _839;
    precise float _853 = fma(_847, _844, _756) * _840;
    precise float _857 = _743 * _826;
    precise float _858 = _742 * _826;
    precise float _859 = _741 * _826;
    precise float _860 = _834 - _754;
    precise float _861 = _834 - _755;
    precise float _862 = _834 - _756;
    SV_Target.x = fma(_857, fma(_801, _860, _754), fma(_759, fma(_456, _822, spvNMax(_559, 0.0)), _851));
    SV_Target.y = fma(_858, fma(_801, _861, _755), fma(_760, fma(_457, _822, spvNMax(_560, 0.0)), _852));
    SV_Target.z = fma(_859, fma(_801, _862, _756), fma(_761, fma(_458, _822, spvNMax(_561, 0.0)), _853));
    SV_Target.w = 1.0;
}

