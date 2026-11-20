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
    uvec4 _m18;
    vec3 _m19;
    uint _m20;
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
layout(set = 0, binding = 12) uniform textureCube t3;
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
    precise float _131 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _131));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _120 = a.x * b.x;
    return fma(a.y, b.y, _120);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _102 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _102)));
}

void main()
{
    precise float _155 = cb2._m0.x - TEXCOORD2.x;
    precise float _156 = cb2._m0.y - TEXCOORD2.y;
    precise float _157 = cb2._m0.z - TEXCOORD2.z;
    vec3 _158 = vec3(_155, _156, _157);
    precise float _160 = inversesqrt(dp3_f32(_158, _158));
    precise float _161 = _160 * _155;
    precise float _162 = _160 * _156;
    precise float _163 = _160 * _157;
    precise float _170 = cb1._m4.x - TEXCOORD2.x;
    precise float _171 = cb1._m4.y - TEXCOORD2.y;
    precise float _172 = cb1._m4.z - TEXCOORD2.z;
    vec3 _173 = vec3(_170, _171, _172);
    precise float _175 = inversesqrt(dp3_f32(_173, _173));
    precise float _176 = _175 * _170;
    precise float _177 = _175 * _171;
    precise float _178 = _175 * _172;
    precise float _181 = TEXCOORD.y * 150.0;
    precise float _184 = sin(roundEven(_181)) * 43758.546875;
    precise float _188 = fma(fract(_184), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _189 = _188 * 150.0;
    precise float _192 = sin(roundEven(_189)) * 43758.546875;
    precise float _194 = fma(fract(_192), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _203 = abs(dFdx(_188)) + abs(dFdy(_188));
    precise float _204 = abs(dFdx(_194)) + abs(dFdy(_194));
    precise float _205 = TEXCOORD.x - 0.5;
    precise float _206 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _207 = fma(_205, 1.75, 0.5);
    precise float _208 = fma(_206, 1.75, 0.4000000059604644775390625);
    precise float _220 = float(_207 >= 0.0) * float(_207 <= 1.0);
    precise float _221 = float(_208 >= 0.0) * _220;
    vec4 _227 = texture(sampler2D(t0, s3), vec2(_207, _208));
    float _228 = _227.x;
    float _229 = _227.w;
    precise float _231 = fma(-_221, float(_208 <= 1.0), 1.0);
    precise float _235 = fma(_231, -_229, _229);
    precise float _236 = TEXCOORD2.x - cb1._m4.x;
    precise float _237 = TEXCOORD2.y - cb1._m4.y;
    precise float _238 = TEXCOORD2.z - cb1._m4.z;
    vec3 _239 = vec3(_236, _237, _238);
    precise float _241 = inversesqrt(dp3_f32(_239, _239));
    precise float _242 = _241 * _236;
    precise float _243 = _241 * _238;
    precise float _244 = TEXCOORD.y + TEXCOORD.x;
    precise float _245 = TEXCOORD.y + TEXCOORD.y;
    precise float _249 = fma(-_243, 5.0, _245);
    precise float _250 = _249 * 10.0;
    precise float _252 = fma(sin(_250), 0.0199999995529651641845703125, fma(-_242, 5.0, _244));
    precise float _253 = _252 * 30.0;
    vec4 _260 = texture(sampler2D(t1, s4), vec2(_252, fma(cos(_253), 0.0199999995529651641845703125, _249)));
    vec2 _264 = vec2(fma(_205, 1.75, 0.0), fma(_206, 1.75, -0.0999999940395355224609375));
    precise float _267 = sqrt(dp2_f32(_264, _264)) - 0.400390625;
    precise float _268 = _267 / _203;
    precise float _270 = 1.0 - spvNClamp(_268, 0.0, 1.0);
    precise float _282 = cb0._m16.x - cb0._m14.x;
    precise float _283 = cb0._m16.y - cb0._m14.y;
    precise float _284 = cb0._m16.z - cb0._m14.z;
    precise float _285 = fma(_270, _282, cb0._m14.x);
    precise float _286 = fma(_270, _283, cb0._m14.y);
    precise float _287 = fma(_270, _284, cb0._m14.z);
    precise float _288 = 1.0 - fma(_231, -_228, _228);
    precise float _294 = cb0._m19.x - cb0._m14.x;
    precise float _295 = cb0._m19.y - cb0._m14.y;
    precise float _296 = cb0._m19.z - cb0._m14.z;
    precise float _300 = fma(_288, _294, cb0._m14.x) - _285;
    precise float _301 = fma(_288, _295, cb0._m14.y) - _286;
    precise float _302 = fma(_288, _296, cb0._m14.z) - _287;
    precise float _306 = _188 - 0.1167768537998199462890625;
    precise float _307 = _306 / _203;
    precise float _309 = 0.88322317600250244140625 - _188;
    precise float _310 = _309 / _203;
    precise float _312 = spvNClamp(_310, 0.0, 1.0) * spvNClamp(_307, 0.0, 1.0);
    precise float _313 = _194 - 0.02999999932944774627685546875;
    precise float _314 = _313 / _204;
    precise float _316 = _312 * spvNClamp(_314, 0.0, 1.0);
    precise float _317 = 0.9700000286102294921875 - _194;
    precise float _318 = _317 / _204;
    precise float _320 = _316 * spvNClamp(_318, 0.0, 1.0);
    precise float _321 = fma(_260.x, 0.5, fma(_235, _300, _285));
    precise float _322 = fma(_260.y, 0.5, fma(_235, _301, _286));
    precise float _323 = fma(_260.z, 0.5, fma(_235, _302, _287));
    precise float _324 = _320 * _321;
    precise float _325 = _320 * _322;
    precise float _326 = _320 * _323;
    precise float _332 = TEXCOORD2.y * cb0._m7.x;
    precise float _333 = TEXCOORD2.y * cb0._m7.y;
    precise float _334 = TEXCOORD2.y * cb0._m7.z;
    precise float _356 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _332)) + cb0._m11.x;
    precise float _357 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _333)) + cb0._m11.y;
    precise float _358 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _334)) + cb0._m11.z;
    float _435;
    float _436;
    float _437;
    float _438;
    if (cb3._m0.x == 1.0)
    {
        bool _368 = cb3._m0.y == 1.0;
        precise float _374 = TEXCOORD2.y * cb3._m3.x;
        precise float _375 = TEXCOORD2.y * cb3._m3.y;
        precise float _376 = TEXCOORD2.y * cb3._m3.z;
        precise float _398 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _374)) + cb3._m7.x;
        precise float _399 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _375)) + cb3._m7.y;
        precise float _400 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _376)) + cb3._m7.z;
        precise float _409 = (_368 ? _398 : TEXCOORD2.x) - cb3._m11.x;
        precise float _410 = (_368 ? _399 : TEXCOORD2.y) - cb3._m11.y;
        precise float _411 = (_368 ? _400 : TEXCOORD2.z) - cb3._m11.z;
        precise float _417 = _409 * cb3._m9.x;
        precise float _418 = _410 * cb3._m9.y;
        precise float _419 = _411 * cb3._m9.z;
        vec4 _430 = texture(sampler3D(t4, s0), vec3(spvNMax(fma(_417, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _418, _419));
        _435 = _430.w;
        _436 = _430.z;
        _437 = _430.y;
        _438 = _430.x;
    }
    else
    {
        _435 = 1.0;
        _436 = 1.0;
        _437 = 1.0;
        _438 = 1.0;
    }
    vec3 _445 = vec3(_356, _357, _358);
    precise float _459 = texture(samplerCube(t3, s1), _445).w * texture(sampler2D(t2, s2), vec2(dp3_f32(_445, _445))).x;
    precise float _460 = spvNClamp(dp4_f32(vec4(_438, _437, _436, _435), cb2._m47), 0.0, 1.0) * _459;
    precise float _466 = _460 * cb0._m2.x;
    precise float _467 = _460 * cb0._m2.y;
    precise float _468 = _460 * cb0._m2.z;
    vec3 _475 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _477 = inversesqrt(dp3_f32(_475, _475));
    precise float _478 = _477 * TEXCOORD1.x;
    precise float _479 = _477 * TEXCOORD1.y;
    precise float _480 = _477 * TEXCOORD1.z;
    precise float _486 = fma(cb0._m13.y, fma(_320, _321, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _487 = fma(cb0._m13.y, fma(_320, _322, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _488 = fma(cb0._m13.y, fma(_320, _323, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _490 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _491 = _490 * _324;
    precise float _492 = _490 * _325;
    precise float _493 = _490 * _326;
    precise float _496 = 1.0 - cb0._m13.x;
    precise float _497 = fma(_155, _160, _176);
    precise float _498 = fma(_156, _160, _177);
    precise float _499 = fma(_157, _160, _178);
    vec3 _500 = vec3(_497, _498, _499);
    precise float _503 = inversesqrt(spvNMax(dp3_f32(_500, _500), 0.001000000047497451305389404296875));
    precise float _504 = _503 * _497;
    precise float _505 = _503 * _498;
    precise float _506 = _503 * _499;
    vec3 _507 = vec3(_478, _479, _480);
    vec3 _510 = vec3(_161, _162, _163);
    precise float _512 = spvNClamp(dp3_f32(_507, _510), 0.0, 1.0);
    vec3 _513 = vec3(_504, _505, _506);
    precise float _515 = spvNClamp(dp3_f32(_507, _513), 0.0, 1.0);
    precise float _517 = spvNClamp(dp3_f32(_510, _513), 0.0, 1.0);
    precise float _518 = _517 * _517;
    precise float _522 = dp2_f32(vec2(_518), vec2(_496)) - 0.5;
    precise float _523 = 1.0 - _512;
    precise float _524 = _523 * _523;
    precise float _525 = _524 * _524;
    precise float _526 = _523 * _525;
    precise float _528 = abs(dp3_f32(_507, vec3(_176, _177, _178)));
    precise float _529 = 1.0 - _528;
    precise float _530 = _529 * _529;
    precise float _531 = _530 * _530;
    precise float _532 = _529 * _531;
    precise float _534 = fma(_522, _532, 1.0) * fma(_522, _526, 1.0);
    precise float _535 = _496 * _496;
    precise float _536 = spvNMax(_535, 0.00200000009499490261077880859375);
    precise float _537 = 1.0 - _536;
    precise float _540 = _528 * fma(_512, _537, _536);
    precise float _542 = fma(_512, fma(_528, _537, _536), _540) + 9.9999997473787516355514526367188e-06;
    precise float _543 = 0.5 / _542;
    precise float _544 = _536 * _536;
    precise float _547 = fma(fma(_515, _544, -_515), _515, 1.0);
    precise float _548 = _544 * 0.3183098733425140380859375;
    precise float _550 = _548 / fma(_547, _547, 1.0000000116860974230803549289703e-07);
    precise float _551 = _550 * _543;
    precise float _552 = _551 * 3.1415927410125732421875;
    precise float _553 = _512 * _534;
    precise float _554 = _512 * _552;
    vec3 _556 = vec3(_486, _487, _488);
    precise float _560 = ((dp3_f32(_556, _556) == 0.0) ? 0.0 : 1.0) * spvNMax(_554, 0.0);
    precise float _561 = _553 * _466;
    precise float _562 = _553 * _467;
    precise float _563 = _553 * _468;
    precise float _564 = _466 * _560;
    precise float _565 = _467 * _560;
    precise float _566 = _468 * _560;
    precise float _567 = 1.0 - _517;
    precise float _568 = _567 * _567;
    precise float _569 = _568 * _568;
    precise float _570 = _567 * _569;
    precise float _571 = 1.0 - _486;
    precise float _572 = 1.0 - _487;
    precise float _573 = 1.0 - _488;
    precise float _577 = _564 * fma(_571, _570, _486);
    precise float _578 = _565 * fma(_572, _570, _487);
    precise float _579 = _566 * fma(_573, _570, _488);
    SV_Target.x = fma(_491, _561, _577);
    SV_Target.y = fma(_492, _562, _578);
    SV_Target.z = fma(_493, _563, _579);
    SV_Target.w = 1.0;
}

