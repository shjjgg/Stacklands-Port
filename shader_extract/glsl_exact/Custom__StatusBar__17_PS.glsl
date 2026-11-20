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
    vec3 _m18;
    uint _m19;
    vec3 _m20;
    uint _m21;
    vec4 _m22;
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
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

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
    precise float _121 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _121));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _104 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _104)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _92 = a.x * b.x;
    return fma(a.y, b.y, _92);
}

void main()
{
    precise float _145 = cb2._m0.x - TEXCOORD2.x;
    precise float _146 = cb2._m0.y - TEXCOORD2.y;
    precise float _147 = cb2._m0.z - TEXCOORD2.z;
    vec3 _148 = vec3(_145, _146, _147);
    precise float _150 = inversesqrt(dp3_f32(_148, _148));
    precise float _151 = _150 * _145;
    precise float _152 = _150 * _146;
    precise float _153 = _150 * _147;
    precise float _160 = cb1._m4.x - TEXCOORD2.x;
    precise float _161 = cb1._m4.y - TEXCOORD2.y;
    precise float _162 = cb1._m4.z - TEXCOORD2.z;
    vec3 _163 = vec3(_160, _161, _162);
    precise float _165 = inversesqrt(dp3_f32(_163, _163));
    precise float _166 = _165 * _160;
    precise float _167 = _165 * _161;
    precise float _168 = _165 * _162;
    precise float _171 = TEXCOORD.y * 150.0;
    precise float _174 = sin(roundEven(_171)) * 43758.546875;
    precise float _176 = fract(_174) - 0.5;
    precise float _179 = fma(_176, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _180 = _179 * 150.0;
    precise float _183 = sin(roundEven(_180)) * 43758.546875;
    precise float _185 = fract(_183) - 0.5;
    precise float _186 = fma(_185, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _195 = abs(dFdx(_179)) + abs(dFdy(_179));
    precise float _196 = abs(dFdx(_186)) + abs(dFdy(_186));
    precise float _197 = _196 * 0.2666666805744171142578125;
    precise float _198 = _186 - 0.5;
    precise float _199 = _179 - 0.02999999932944774627685546875;
    precise float _201 = fma(-_199, 1.06382977962493896484375, 1.0);
    precise float _202 = _199 / _195;
    precise float _204 = 0.9700000286102294921875 - _179;
    precise float _205 = _204 / _195;
    precise float _207 = spvNClamp(_205, 0.0, 1.0) * spvNClamp(_202, 0.0, 1.0);
    precise float _210 = fma(_198, 0.2666666805744171142578125, 0.069999992847442626953125) / _197;
    precise float _212 = _207 * spvNClamp(_210, 0.0, 1.0);
    precise float _213 = 0.569999992847442626953125 - fma(_198, 0.2666666805744171142578125, 0.5);
    precise float _214 = _213 / _197;
    precise float _216 = _212 * spvNClamp(_214, 0.0, 1.0);
    precise float _228 = cb0._m16.x - cb0._m14.x;
    precise float _229 = cb0._m16.y - cb0._m14.y;
    precise float _230 = cb0._m16.z - cb0._m14.z;
    precise float _231 = fma(_216, _228, cb0._m14.x);
    precise float _232 = fma(_216, _229, cb0._m14.y);
    precise float _233 = fma(_216, _230, cb0._m14.z);
    float _239 = float(cb0._m22.x >= 0.5);
    precise float _250 = cb0._m20.x - cb0._m18.x;
    precise float _251 = cb0._m20.y - cb0._m18.y;
    precise float _252 = cb0._m20.z - cb0._m18.z;
    precise float _258 = _201 - cb0._m22.y;
    precise float _263 = abs(dFdy(_201)) + abs(dFdx(_201));
    precise float _264 = _258 / _263;
    float _267 = (_216 <= 0.0) ? 0.0 : spvNClamp(_264, 0.0, 1.0);
    precise float _268 = fma(_239, _250, cb0._m18.x) - _231;
    precise float _269 = fma(_239, _251, cb0._m18.y) - _232;
    precise float _270 = fma(_239, _252, cb0._m18.z) - _233;
    precise float _271 = fma(_267, _268, _231);
    precise float _272 = fma(_267, _269, _232);
    precise float _273 = fma(_267, _270, _233);
    precise float _279 = TEXCOORD2.y * cb0._m7.x;
    precise float _280 = TEXCOORD2.y * cb0._m7.y;
    precise float _281 = TEXCOORD2.y * cb0._m7.z;
    precise float _303 = fma(cb0._m9.x, TEXCOORD2.z, fma(cb0._m5.x, TEXCOORD2.x, _279)) + cb0._m11.x;
    precise float _304 = fma(cb0._m9.y, TEXCOORD2.z, fma(cb0._m5.y, TEXCOORD2.x, _280)) + cb0._m11.y;
    precise float _305 = fma(cb0._m9.z, TEXCOORD2.z, fma(cb0._m5.z, TEXCOORD2.x, _281)) + cb0._m11.z;
    float _381;
    float _382;
    float _383;
    float _384;
    if (cb3._m0.x == 1.0)
    {
        bool _314 = cb3._m0.y == 1.0;
        precise float _320 = TEXCOORD2.y * cb3._m3.x;
        precise float _321 = TEXCOORD2.y * cb3._m3.y;
        precise float _322 = TEXCOORD2.y * cb3._m3.z;
        precise float _344 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _320)) + cb3._m7.x;
        precise float _345 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _321)) + cb3._m7.y;
        precise float _346 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _322)) + cb3._m7.z;
        precise float _355 = (_314 ? _344 : TEXCOORD2.x) - cb3._m11.x;
        precise float _356 = (_314 ? _345 : TEXCOORD2.y) - cb3._m11.y;
        precise float _357 = (_314 ? _346 : TEXCOORD2.z) - cb3._m11.z;
        precise float _363 = _355 * cb3._m9.x;
        precise float _364 = _356 * cb3._m9.y;
        precise float _365 = _357 * cb3._m9.z;
        vec4 _376 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_363, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _364, _365));
        _381 = _376.w;
        _382 = _376.z;
        _383 = _376.y;
        _384 = _376.x;
    }
    else
    {
        _381 = 1.0;
        _382 = 1.0;
        _383 = 1.0;
        _384 = 1.0;
    }
    vec3 _391 = vec3(_303, _304, _305);
    precise float _400 = spvNClamp(dp4_f32(vec4(_384, _383, _382, _381), cb2._m47), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_391, _391))).x;
    precise float _406 = _400 * cb0._m2.x;
    precise float _407 = _400 * cb0._m2.y;
    precise float _408 = _400 * cb0._m2.z;
    vec3 _415 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _417 = inversesqrt(dp3_f32(_415, _415));
    precise float _418 = _417 * TEXCOORD1.x;
    precise float _419 = _417 * TEXCOORD1.y;
    precise float _420 = _417 * TEXCOORD1.z;
    precise float _421 = _271 - 0.039999999105930328369140625;
    precise float _422 = _272 - 0.039999999105930328369140625;
    precise float _423 = _273 - 0.039999999105930328369140625;
    precise float _426 = fma(cb0._m13.y, _421, 0.039999999105930328369140625);
    precise float _427 = fma(cb0._m13.y, _422, 0.039999999105930328369140625);
    precise float _428 = fma(cb0._m13.y, _423, 0.039999999105930328369140625);
    precise float _430 = fma(-cb0._m13.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _431 = _430 * _271;
    precise float _432 = _430 * _272;
    precise float _433 = _430 * _273;
    precise float _436 = 1.0 - cb0._m13.x;
    precise float _437 = fma(_145, _150, _166);
    precise float _438 = fma(_146, _150, _167);
    precise float _439 = fma(_147, _150, _168);
    vec3 _440 = vec3(_437, _438, _439);
    precise float _443 = inversesqrt(spvNMax(dp3_f32(_440, _440), 0.001000000047497451305389404296875));
    precise float _444 = _443 * _437;
    precise float _445 = _443 * _438;
    precise float _446 = _443 * _439;
    vec3 _447 = vec3(_418, _419, _420);
    vec3 _450 = vec3(_151, _152, _153);
    precise float _452 = spvNClamp(dp3_f32(_447, _450), 0.0, 1.0);
    vec3 _453 = vec3(_444, _445, _446);
    precise float _455 = spvNClamp(dp3_f32(_447, _453), 0.0, 1.0);
    precise float _457 = spvNClamp(dp3_f32(_450, _453), 0.0, 1.0);
    precise float _458 = _457 * _457;
    precise float _462 = dp2_f32(vec2(_458), vec2(_436)) - 0.5;
    precise float _463 = 1.0 - _452;
    precise float _464 = _463 * _463;
    precise float _465 = _464 * _464;
    precise float _466 = _463 * _465;
    precise float _468 = abs(dp3_f32(_447, vec3(_166, _167, _168)));
    precise float _469 = 1.0 - _468;
    precise float _470 = _469 * _469;
    precise float _471 = _470 * _470;
    precise float _472 = _469 * _471;
    precise float _474 = fma(_462, _472, 1.0) * fma(_462, _466, 1.0);
    precise float _475 = _436 * _436;
    precise float _476 = spvNMax(_475, 0.00200000009499490261077880859375);
    precise float _477 = 1.0 - _476;
    precise float _480 = _468 * fma(_452, _477, _476);
    precise float _482 = fma(_452, fma(_468, _477, _476), _480) + 9.9999997473787516355514526367188e-06;
    precise float _483 = 0.5 / _482;
    precise float _484 = _476 * _476;
    precise float _487 = fma(fma(_455, _484, -_455), _455, 1.0);
    precise float _488 = _484 * 0.3183098733425140380859375;
    precise float _490 = _488 / fma(_487, _487, 1.0000000116860974230803549289703e-07);
    precise float _491 = _490 * _483;
    precise float _492 = _491 * 3.1415927410125732421875;
    precise float _493 = _452 * _474;
    precise float _494 = _452 * _492;
    vec3 _496 = vec3(_426, _427, _428);
    precise float _500 = ((dp3_f32(_496, _496) == 0.0) ? 0.0 : 1.0) * spvNMax(_494, 0.0);
    precise float _501 = _493 * _406;
    precise float _502 = _493 * _407;
    precise float _503 = _493 * _408;
    precise float _504 = _406 * _500;
    precise float _505 = _407 * _500;
    precise float _506 = _408 * _500;
    precise float _507 = 1.0 - _457;
    precise float _508 = _507 * _507;
    precise float _509 = _508 * _508;
    precise float _510 = _507 * _509;
    precise float _511 = 1.0 - _426;
    precise float _512 = 1.0 - _427;
    precise float _513 = 1.0 - _428;
    precise float _517 = _504 * fma(_511, _510, _426);
    precise float _518 = _505 * fma(_512, _510, _427);
    precise float _519 = _506 * fma(_513, _510, _428);
    SV_Target.x = fma(_431, _501, _517);
    SV_Target.y = fma(_432, _502, _518);
    SV_Target.z = fma(_433, _503, _519);
    SV_Target.w = 1.0;
}

