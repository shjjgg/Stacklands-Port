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
    uvec4 _m14;
    vec3 _m15;
    uint _m16;
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
    precise float _180 = TEXCOORD.y * 150.0;
    precise float _183 = sin(roundEven(_180)) * 43758.546875;
    precise float _187 = fma(fract(_183), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _188 = _187 * 150.0;
    precise float _191 = sin(roundEven(_188)) * 43758.546875;
    precise float _193 = fma(fract(_191), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _202 = abs(dFdx(_187)) + abs(dFdy(_187));
    precise float _203 = abs(dFdx(_193)) + abs(dFdy(_193));
    precise float _204 = TEXCOORD.x - 0.5;
    precise float _205 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _206 = fma(_204, 1.75, 0.5);
    precise float _207 = fma(_205, 1.75, 0.4000000059604644775390625);
    precise float _219 = float(_206 >= 0.0) * float(_206 <= 1.0);
    precise float _220 = float(_207 >= 0.0) * _219;
    vec4 _226 = texture(sampler2D(t0, s3), vec2(_206, _207));
    float _227 = _226.x;
    float _228 = _226.w;
    precise float _230 = fma(-_220, float(_207 <= 1.0), 1.0);
    precise float _234 = fma(_230, -_228, _228);
    precise float _235 = TEXCOORD2.x - cb1._m4.x;
    precise float _236 = TEXCOORD2.y - cb1._m4.y;
    precise float _237 = TEXCOORD2.z - cb1._m4.z;
    vec3 _238 = vec3(_235, _236, _237);
    precise float _240 = inversesqrt(dp3_f32(_238, _238));
    precise float _241 = _240 * _235;
    precise float _242 = _240 * _237;
    precise float _243 = TEXCOORD.y + TEXCOORD.x;
    precise float _244 = TEXCOORD.y + TEXCOORD.y;
    precise float _248 = fma(-_242, 5.0, _244);
    precise float _249 = _248 * 10.0;
    precise float _251 = fma(sin(_249), 0.0199999995529651641845703125, fma(-_241, 5.0, _243));
    precise float _252 = _251 * 30.0;
    vec4 _259 = texture(sampler2D(t1, s4), vec2(_251, fma(cos(_252), 0.0199999995529651641845703125, _248)));
    vec2 _263 = vec2(fma(_204, 1.75, 0.0), fma(_205, 1.75, -0.0999999940395355224609375));
    precise float _266 = sqrt(dp2_f32(_263, _263)) - 0.400390625;
    precise float _267 = _266 / _202;
    precise float _269 = 1.0 - spvNClamp(_267, 0.0, 1.0);
    precise float _281 = cb0._m12.x - cb0._m10.x;
    precise float _282 = cb0._m12.y - cb0._m10.y;
    precise float _283 = cb0._m12.z - cb0._m10.z;
    precise float _284 = fma(_269, _281, cb0._m10.x);
    precise float _285 = fma(_269, _282, cb0._m10.y);
    precise float _286 = fma(_269, _283, cb0._m10.z);
    precise float _287 = 1.0 - fma(_230, -_227, _227);
    precise float _293 = cb0._m15.x - cb0._m10.x;
    precise float _294 = cb0._m15.y - cb0._m10.y;
    precise float _295 = cb0._m15.z - cb0._m10.z;
    precise float _299 = fma(_287, _293, cb0._m10.x) - _284;
    precise float _300 = fma(_287, _294, cb0._m10.y) - _285;
    precise float _301 = fma(_287, _295, cb0._m10.z) - _286;
    precise float _305 = _187 - 0.1167768537998199462890625;
    precise float _306 = _305 / _202;
    precise float _308 = 0.88322317600250244140625 - _187;
    precise float _309 = _308 / _202;
    precise float _311 = spvNClamp(_309, 0.0, 1.0) * spvNClamp(_306, 0.0, 1.0);
    precise float _312 = _193 - 0.02999999932944774627685546875;
    precise float _313 = _312 / _203;
    precise float _315 = _311 * spvNClamp(_313, 0.0, 1.0);
    precise float _316 = 0.9700000286102294921875 - _193;
    precise float _317 = _316 / _203;
    precise float _319 = _315 * spvNClamp(_317, 0.0, 1.0);
    precise float _320 = fma(_259.x, 0.5, fma(_234, _299, _284));
    precise float _321 = fma(_259.y, 0.5, fma(_234, _300, _285));
    precise float _322 = fma(_259.z, 0.5, fma(_234, _301, _286));
    precise float _323 = _319 * _320;
    precise float _324 = _319 * _321;
    precise float _325 = _319 * _322;
    precise float _333 = TEXCOORD2.y * cb0._m6.x;
    precise float _334 = TEXCOORD2.y * cb0._m6.y;
    precise float _335 = TEXCOORD2.y * cb0._m6.z;
    precise float _336 = TEXCOORD2.y * cb0._m6.w;
    precise float _363 = fma(cb0._m7.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _333)) + cb0._m8.x;
    precise float _364 = fma(cb0._m7.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _334)) + cb0._m8.y;
    precise float _365 = fma(cb0._m7.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _335)) + cb0._m8.z;
    precise float _366 = fma(cb0._m7.w, TEXCOORD2.z, fma(cb0._m5.w, TEXCOORD2.x, _336)) + cb0._m8.w;
    float _443;
    float _444;
    float _445;
    float _446;
    if (cb3._m0.x == 1.0)
    {
        bool _376 = cb3._m0.y == 1.0;
        precise float _382 = TEXCOORD2.y * cb3._m3.x;
        precise float _383 = TEXCOORD2.y * cb3._m3.y;
        precise float _384 = TEXCOORD2.y * cb3._m3.z;
        precise float _406 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _382)) + cb3._m7.x;
        precise float _407 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _383)) + cb3._m7.y;
        precise float _408 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _384)) + cb3._m7.z;
        precise float _417 = (_376 ? _406 : TEXCOORD2.x) - cb3._m11.x;
        precise float _418 = (_376 ? _407 : TEXCOORD2.y) - cb3._m11.y;
        precise float _419 = (_376 ? _408 : TEXCOORD2.z) - cb3._m11.z;
        precise float _425 = _417 * cb3._m9.x;
        precise float _426 = _418 * cb3._m9.y;
        precise float _427 = _419 * cb3._m9.z;
        vec4 _438 = texture(sampler3D(t4, s0), vec3(spvNMax(fma(_425, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _426, _427));
        _443 = _438.w;
        _444 = _438.z;
        _445 = _438.y;
        _446 = _438.x;
    }
    else
    {
        _443 = 1.0;
        _444 = 1.0;
        _445 = 1.0;
        _446 = 1.0;
    }
    precise float _454 = _363 / _366;
    precise float _455 = _364 / _366;
    precise float _456 = _454 + 0.5;
    precise float _457 = _455 + 0.5;
    precise float _464 = float(_365 > 0.0) * texture(sampler2D(t2, s1), vec2(_456, _457)).w;
    vec3 _465 = vec3(_363, _364, _365);
    precise float _473 = _464 * texture(sampler2D(t3, s2), vec2(dp3_f32(_465, _465))).x;
    precise float _474 = spvNClamp(dp4_f32(vec4(_446, _445, _444, _443), cb2._m47), 0.0, 1.0) * _473;
    precise float _480 = _474 * cb0._m2.x;
    precise float _481 = _474 * cb0._m2.y;
    precise float _482 = _474 * cb0._m2.z;
    vec3 _489 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _491 = inversesqrt(dp3_f32(_489, _489));
    precise float _492 = _491 * TEXCOORD1.x;
    precise float _493 = _491 * TEXCOORD1.y;
    precise float _494 = _491 * TEXCOORD1.z;
    precise float _500 = fma(cb0._m9.y, fma(_319, _320, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _501 = fma(cb0._m9.y, fma(_319, _321, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _502 = fma(cb0._m9.y, fma(_319, _322, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _504 = fma(-cb0._m9.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _505 = _504 * _323;
    precise float _506 = _504 * _324;
    precise float _507 = _504 * _325;
    precise float _510 = 1.0 - cb0._m9.x;
    precise float _511 = fma(_154, _159, _175);
    precise float _512 = fma(_155, _159, _176);
    precise float _513 = fma(_156, _159, _177);
    vec3 _514 = vec3(_511, _512, _513);
    precise float _517 = inversesqrt(spvNMax(dp3_f32(_514, _514), 0.001000000047497451305389404296875));
    precise float _518 = _517 * _511;
    precise float _519 = _517 * _512;
    precise float _520 = _517 * _513;
    vec3 _521 = vec3(_492, _493, _494);
    vec3 _524 = vec3(_160, _161, _162);
    precise float _526 = spvNClamp(dp3_f32(_521, _524), 0.0, 1.0);
    vec3 _527 = vec3(_518, _519, _520);
    precise float _529 = spvNClamp(dp3_f32(_521, _527), 0.0, 1.0);
    precise float _531 = spvNClamp(dp3_f32(_524, _527), 0.0, 1.0);
    precise float _532 = _531 * _531;
    precise float _536 = dp2_f32(vec2(_532), vec2(_510)) - 0.5;
    precise float _537 = 1.0 - _526;
    precise float _538 = _537 * _537;
    precise float _539 = _538 * _538;
    precise float _540 = _537 * _539;
    precise float _542 = abs(dp3_f32(_521, vec3(_175, _176, _177)));
    precise float _543 = 1.0 - _542;
    precise float _544 = _543 * _543;
    precise float _545 = _544 * _544;
    precise float _546 = _543 * _545;
    precise float _548 = fma(_536, _546, 1.0) * fma(_536, _540, 1.0);
    precise float _549 = _510 * _510;
    precise float _550 = spvNMax(_549, 0.00200000009499490261077880859375);
    precise float _551 = 1.0 - _550;
    precise float _554 = _542 * fma(_526, _551, _550);
    precise float _556 = fma(_526, fma(_542, _551, _550), _554) + 9.9999997473787516355514526367188e-06;
    precise float _557 = 0.5 / _556;
    precise float _558 = _550 * _550;
    precise float _561 = fma(fma(_529, _558, -_529), _529, 1.0);
    precise float _562 = _558 * 0.3183098733425140380859375;
    precise float _564 = _562 / fma(_561, _561, 1.0000000116860974230803549289703e-07);
    precise float _565 = _564 * _557;
    precise float _566 = _565 * 3.1415927410125732421875;
    precise float _567 = _526 * _548;
    precise float _568 = _526 * _566;
    vec3 _570 = vec3(_500, _501, _502);
    precise float _574 = ((dp3_f32(_570, _570) == 0.0) ? 0.0 : 1.0) * spvNMax(_568, 0.0);
    precise float _575 = _567 * _480;
    precise float _576 = _567 * _481;
    precise float _577 = _567 * _482;
    precise float _578 = _480 * _574;
    precise float _579 = _481 * _574;
    precise float _580 = _482 * _574;
    precise float _581 = 1.0 - _531;
    precise float _582 = _581 * _581;
    precise float _583 = _582 * _582;
    precise float _584 = _581 * _583;
    precise float _585 = 1.0 - _500;
    precise float _586 = 1.0 - _501;
    precise float _587 = 1.0 - _502;
    precise float _591 = _578 * fma(_585, _584, _500);
    precise float _592 = _579 * fma(_586, _584, _501);
    precise float _593 = _580 * fma(_587, _584, _502);
    SV_Target.x = fma(_505, _575, _591);
    SV_Target.y = fma(_506, _576, _592);
    SV_Target.z = fma(_507, _577, _593);
    SV_Target.w = 1.0;
}

