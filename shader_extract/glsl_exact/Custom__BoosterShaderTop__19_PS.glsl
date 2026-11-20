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
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
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
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform texture2D t2;
layout(set = 0, binding = 12) uniform texture2D t3;
layout(set = 0, binding = 13) uniform texture3D t4;

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
    precise float _130 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _130));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _119 = a.x * b.x;
    return fma(a.y, b.y, _119);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _101 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _101)));
}

void main()
{
    precise float _154 = cb2._m0.x - TEXCOORD2.x;
    precise float _155 = cb2._m0.y - TEXCOORD2.y;
    precise float _156 = cb2._m0.z - TEXCOORD2.z;
    vec3 _157 = vec3(_154, _155, _156);
    precise float _159 = inversesqrt(dp3_f32(_157, _157));
    precise float _160 = _159 * _154;
    precise float _161 = _159 * _155;
    precise float _162 = _159 * _156;
    precise float _169 = cb1._m4.x - TEXCOORD2.x;
    precise float _170 = cb1._m4.y - TEXCOORD2.y;
    precise float _171 = cb1._m4.z - TEXCOORD2.z;
    vec3 _172 = vec3(_169, _170, _171);
    precise float _174 = inversesqrt(dp3_f32(_172, _172));
    precise float _175 = _174 * _169;
    precise float _176 = _174 * _170;
    precise float _177 = _174 * _171;
    precise float _182 = TEXCOORD.y * 150.0;
    precise float _183 = TEXCOORD.x * 20.0;
    precise float _184 = TEXCOORD.y * 1.0;
    precise float _187 = sin(roundEven(_182)) * 43758.546875;
    precise float _189 = fma(fract(_187), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _190 = _189 * 150.0;
    precise float _193 = sin(roundEven(_190)) * 43758.546875;
    precise float _195 = fma(fract(_193), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _204 = abs(dFdx(_189)) + abs(dFdy(_189));
    precise float _205 = abs(dFdx(_195)) + abs(dFdy(_195));
    precise float _206 = 0.5 - TEXCOORD.x;
    precise float _207 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _213 = texture(sampler2D(t0, s3), vec2(_183, _184));
    float _214 = _213.x;
    float _215 = _213.y;
    float _216 = _213.z;
    precise float _223 = _214 * cb0._m10.x;
    precise float _224 = _215 * cb0._m10.y;
    precise float _225 = _216 * cb0._m10.z;
    precise float _226 = TEXCOORD2.x - cb1._m4.x;
    precise float _227 = TEXCOORD2.y - cb1._m4.y;
    precise float _228 = TEXCOORD2.z - cb1._m4.z;
    vec3 _229 = vec3(_226, _227, _228);
    precise float _231 = inversesqrt(dp3_f32(_229, _229));
    precise float _232 = _231 * _226;
    precise float _233 = _231 * _228;
    precise float _234 = TEXCOORD.y + TEXCOORD.x;
    precise float _235 = TEXCOORD.y + TEXCOORD.y;
    precise float _239 = fma(-_233, 5.0, _235);
    precise float _240 = _239 * 10.0;
    precise float _242 = fma(sin(_240), 0.0199999995529651641845703125, fma(-_232, 5.0, _234));
    precise float _243 = _242 * 30.0;
    vec4 _250 = texture(sampler2D(t1, s4), vec2(_242, fma(cos(_243), 0.0199999995529651641845703125, _239)));
    vec2 _256 = vec2(fma(_206, 1.75, 0.0), fma(_207, 1.75, -0.050000011920928955078125));
    precise float _259 = sqrt(dp2_f32(_256, _256)) - 0.400390625;
    precise float _260 = _259 / _204;
    precise float _262 = 1.0 - spvNClamp(_260, 0.0, 1.0);
    precise float _277 = _189 - 0.1167768537998199462890625;
    precise float _278 = _277 / _204;
    precise float _280 = 0.88322317600250244140625 - _189;
    precise float _281 = _280 / _204;
    precise float _283 = spvNClamp(_281, 0.0, 1.0) * spvNClamp(_278, 0.0, 1.0);
    precise float _284 = _195 - 0.02999999932944774627685546875;
    precise float _285 = _284 / _205;
    precise float _287 = _283 * spvNClamp(_285, 0.0, 1.0);
    precise float _288 = 0.9700000286102294921875 - _195;
    precise float _289 = _288 / _205;
    precise float _291 = _287 * spvNClamp(_289, 0.0, 1.0);
    precise float _292 = fma(_250.x, 0.5, fma(_262, fma(-cb0._m10.x, _214, cb0._m12.x), _223));
    precise float _293 = fma(_250.y, 0.5, fma(_262, fma(-cb0._m10.y, _215, cb0._m12.y), _224));
    precise float _294 = fma(_250.z, 0.5, fma(_262, fma(-cb0._m10.z, _216, cb0._m12.z), _225));
    precise float _295 = _291 * _292;
    precise float _296 = _291 * _293;
    precise float _297 = _291 * _294;
    precise float _305 = TEXCOORD2.y * cb0._m6.x;
    precise float _306 = TEXCOORD2.y * cb0._m6.y;
    precise float _307 = TEXCOORD2.y * cb0._m6.z;
    precise float _308 = TEXCOORD2.y * cb0._m6.w;
    precise float _335 = fma(cb0._m7.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _305)) + cb0._m8.x;
    precise float _336 = fma(cb0._m7.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _306)) + cb0._m8.y;
    precise float _337 = fma(cb0._m7.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _307)) + cb0._m8.z;
    precise float _338 = fma(cb0._m7.w, TEXCOORD2.z, fma(cb0._m5.w, TEXCOORD2.x, _308)) + cb0._m8.w;
    float _416;
    float _417;
    float _418;
    float _419;
    if (cb3._m0.x == 1.0)
    {
        bool _349 = cb3._m0.y == 1.0;
        precise float _355 = TEXCOORD2.y * cb3._m3.x;
        precise float _356 = TEXCOORD2.y * cb3._m3.y;
        precise float _357 = TEXCOORD2.y * cb3._m3.z;
        precise float _379 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _355)) + cb3._m7.x;
        precise float _380 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _356)) + cb3._m7.y;
        precise float _381 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _357)) + cb3._m7.z;
        precise float _390 = (_349 ? _379 : TEXCOORD2.x) - cb3._m11.x;
        precise float _391 = (_349 ? _380 : TEXCOORD2.y) - cb3._m11.y;
        precise float _392 = (_349 ? _381 : TEXCOORD2.z) - cb3._m11.z;
        precise float _398 = _390 * cb3._m9.x;
        precise float _399 = _391 * cb3._m9.y;
        precise float _400 = _392 * cb3._m9.z;
        vec4 _411 = texture(sampler3D(t4, s0), vec3(spvNMax(fma(_398, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _399, _400));
        _416 = _411.w;
        _417 = _411.z;
        _418 = _411.y;
        _419 = _411.x;
    }
    else
    {
        _416 = 1.0;
        _417 = 1.0;
        _418 = 1.0;
        _419 = 1.0;
    }
    precise float _427 = _335 / _338;
    precise float _428 = _336 / _338;
    precise float _429 = _427 + 0.5;
    precise float _430 = _428 + 0.5;
    precise float _437 = float(_337 > 0.0) * texture(sampler2D(t2, s1), vec2(_429, _430)).w;
    vec3 _438 = vec3(_335, _336, _337);
    precise float _446 = _437 * texture(sampler2D(t3, s2), vec2(dp3_f32(_438, _438))).x;
    precise float _447 = spvNClamp(dp4_f32(vec4(_419, _418, _417, _416), cb2._m47), 0.0, 1.0) * _446;
    precise float _453 = _447 * cb0._m2.x;
    precise float _454 = _447 * cb0._m2.y;
    precise float _455 = _447 * cb0._m2.z;
    vec3 _462 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _464 = inversesqrt(dp3_f32(_462, _462));
    precise float _465 = _464 * TEXCOORD1.x;
    precise float _466 = _464 * TEXCOORD1.y;
    precise float _467 = _464 * TEXCOORD1.z;
    precise float _473 = fma(cb0._m9.y, fma(_291, _292, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _474 = fma(cb0._m9.y, fma(_291, _293, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _475 = fma(cb0._m9.y, fma(_291, _294, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _477 = fma(-cb0._m9.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _478 = _477 * _295;
    precise float _479 = _477 * _296;
    precise float _480 = _477 * _297;
    precise float _483 = 1.0 - cb0._m9.x;
    precise float _484 = fma(_154, _159, _175);
    precise float _485 = fma(_155, _159, _176);
    precise float _486 = fma(_156, _159, _177);
    vec3 _487 = vec3(_484, _485, _486);
    precise float _490 = inversesqrt(spvNMax(dp3_f32(_487, _487), 0.001000000047497451305389404296875));
    precise float _491 = _490 * _484;
    precise float _492 = _490 * _485;
    precise float _493 = _490 * _486;
    vec3 _494 = vec3(_465, _466, _467);
    vec3 _497 = vec3(_160, _161, _162);
    precise float _499 = spvNClamp(dp3_f32(_494, _497), 0.0, 1.0);
    vec3 _500 = vec3(_491, _492, _493);
    precise float _502 = spvNClamp(dp3_f32(_494, _500), 0.0, 1.0);
    precise float _504 = spvNClamp(dp3_f32(_497, _500), 0.0, 1.0);
    precise float _505 = _504 * _504;
    precise float _509 = dp2_f32(vec2(_505), vec2(_483)) - 0.5;
    precise float _510 = 1.0 - _499;
    precise float _511 = _510 * _510;
    precise float _512 = _511 * _511;
    precise float _513 = _510 * _512;
    precise float _515 = abs(dp3_f32(_494, vec3(_175, _176, _177)));
    precise float _516 = 1.0 - _515;
    precise float _517 = _516 * _516;
    precise float _518 = _517 * _517;
    precise float _519 = _516 * _518;
    precise float _521 = fma(_509, _519, 1.0) * fma(_509, _513, 1.0);
    precise float _522 = _483 * _483;
    precise float _523 = spvNMax(_522, 0.00200000009499490261077880859375);
    precise float _524 = 1.0 - _523;
    precise float _527 = _515 * fma(_499, _524, _523);
    precise float _529 = fma(_499, fma(_515, _524, _523), _527) + 9.9999997473787516355514526367188e-06;
    precise float _530 = 0.5 / _529;
    precise float _531 = _523 * _523;
    precise float _534 = fma(fma(_502, _531, -_502), _502, 1.0);
    precise float _535 = _531 * 0.3183098733425140380859375;
    precise float _537 = _535 / fma(_534, _534, 1.0000000116860974230803549289703e-07);
    precise float _538 = _537 * _530;
    precise float _539 = _538 * 3.1415927410125732421875;
    precise float _540 = _499 * _521;
    precise float _541 = _499 * _539;
    vec3 _543 = vec3(_473, _474, _475);
    precise float _547 = ((dp3_f32(_543, _543) == 0.0) ? 0.0 : 1.0) * spvNMax(_541, 0.0);
    precise float _548 = _540 * _453;
    precise float _549 = _540 * _454;
    precise float _550 = _540 * _455;
    precise float _551 = _453 * _547;
    precise float _552 = _454 * _547;
    precise float _553 = _455 * _547;
    precise float _554 = 1.0 - _504;
    precise float _555 = _554 * _554;
    precise float _556 = _555 * _555;
    precise float _557 = _554 * _556;
    precise float _558 = 1.0 - _473;
    precise float _559 = 1.0 - _474;
    precise float _560 = 1.0 - _475;
    precise float _564 = _551 * fma(_558, _557, _473);
    precise float _565 = _552 * fma(_559, _557, _474);
    precise float _566 = _553 * fma(_560, _557, _475);
    SV_Target.x = fma(_478, _548, _564);
    SV_Target.y = fma(_479, _549, _565);
    SV_Target.z = fma(_480, _550, _566);
    SV_Target.w = 1.0;
}

