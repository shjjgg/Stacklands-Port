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
} cb5;

layout(set = 0, binding = 6) uniform sampler s0;
layout(set = 0, binding = 7) uniform sampler s1;
layout(set = 0, binding = 8) uniform sampler s2;
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform texture3D t2;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec4 TEXCOORD4;
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
    precise float _129 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _129));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _112 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _112)));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _100 = a.x * b.x;
    return fma(a.y, b.y, _100);
}

void main()
{
    precise float _153 = cb1._m4.x - TEXCOORD2.x;
    precise float _154 = cb1._m4.y - TEXCOORD2.y;
    precise float _155 = cb1._m4.z - TEXCOORD2.z;
    vec3 _156 = vec3(_153, _154, _155);
    precise float _158 = inversesqrt(dp3_f32(_156, _156));
    precise float _159 = _158 * _153;
    precise float _160 = _158 * _154;
    precise float _161 = _158 * _155;
    vec4 _171 = texture(sampler2D(t0, s2), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _181 = _171.x * cb0._m6.x;
    precise float _182 = _171.y * cb0._m6.y;
    precise float _183 = _171.z * cb0._m6.z;
    precise float _184 = TEXCOORD.y + TEXCOORD.x;
    precise float _185 = _184 * 10.0;
    precise float _188 = roundEven(fract(_185)) + 0.800000011920928955078125;
    precise float _189 = spvNMin(_188, 1.0);
    precise float _190 = _189 * _181;
    precise float _191 = _189 * _182;
    precise float _192 = _189 * _183;
    bool _200 = (TEXCOORD.y > 0.949999988079071044921875) || ((TEXCOORD.y < 0.0500000007450580596923828125) || ((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)));
    float _201 = _200 ? 0.0 : _190;
    float _202 = _200 ? 0.0 : _191;
    float _203 = _200 ? 0.0 : _192;
    float _213 = dp3_f32(_156, vec3(cb4._m9.z, cb4._m10.z, cb4._m11.z));
    precise float _220 = TEXCOORD2.x - cb3._m25.x;
    precise float _221 = TEXCOORD2.y - cb3._m25.y;
    precise float _222 = TEXCOORD2.z - cb3._m25.z;
    vec3 _223 = vec3(_220, _221, _222);
    precise float _226 = sqrt(dp3_f32(_223, _223)) - _213;
    float _311;
    float _312;
    float _313;
    float _314;
    if (cb5._m0.x == 1.0)
    {
        bool _244 = cb5._m0.y == 1.0;
        precise float _250 = TEXCOORD2.y * cb5._m3.x;
        precise float _251 = TEXCOORD2.y * cb5._m3.y;
        precise float _252 = TEXCOORD2.y * cb5._m3.z;
        precise float _274 = fma(cb5._m5.x, TEXCOORD2.z, fma(cb5._m1.x, TEXCOORD2.x, _250)) + cb5._m7.x;
        precise float _275 = fma(cb5._m5.y, TEXCOORD2.z, fma(cb5._m1.y, TEXCOORD2.x, _251)) + cb5._m7.y;
        precise float _276 = fma(cb5._m5.z, TEXCOORD2.z, fma(cb5._m1.z, TEXCOORD2.x, _252)) + cb5._m7.z;
        precise float _285 = (_244 ? _274 : TEXCOORD2.x) - cb5._m11.x;
        precise float _286 = (_244 ? _275 : TEXCOORD2.y) - cb5._m11.y;
        precise float _287 = (_244 ? _276 : TEXCOORD2.z) - cb5._m11.z;
        precise float _293 = _285 * cb5._m9.x;
        precise float _294 = _286 * cb5._m9.y;
        precise float _295 = _287 * cb5._m9.z;
        vec4 _306 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_293, 0.25, 0.75), fma(cb5._m0.z, 0.5, 0.75)), _294, _295));
        _311 = _306.w;
        _312 = _306.z;
        _313 = _306.y;
        _314 = _306.x;
    }
    else
    {
        _311 = 1.0;
        _312 = 1.0;
        _313 = 1.0;
        _314 = 1.0;
    }
    precise float _328 = TEXCOORD4.x / TEXCOORD4.w;
    precise float _329 = TEXCOORD4.y / TEXCOORD4.w;
    vec4 _334 = texture(sampler2D(t1, s1), vec2(_328, _329));
    float _335 = _334.x;
    precise float _336 = spvNClamp(dp4_f32(vec4(_314, _313, _312, _311), cb2._m47), 0.0, 1.0) - _335;
    precise float _337 = fma(spvNClamp(fma(fma(cb3._m26, _226, _213), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _336, _335);
    precise float _343 = _337 * cb0._m2.x;
    precise float _344 = _337 * cb0._m2.y;
    precise float _345 = _337 * cb0._m2.z;
    vec3 _352 = vec3(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z);
    precise float _354 = inversesqrt(dp3_f32(_352, _352));
    precise float _355 = _354 * TEXCOORD1.x;
    precise float _356 = _354 * TEXCOORD1.y;
    precise float _357 = _354 * TEXCOORD1.z;
    precise float _358 = _201 - 0.039999999105930328369140625;
    precise float _359 = _202 - 0.039999999105930328369140625;
    precise float _360 = _203 - 0.039999999105930328369140625;
    precise float _363 = fma(cb0._m5.y, _358, 0.039999999105930328369140625);
    precise float _364 = fma(cb0._m5.y, _359, 0.039999999105930328369140625);
    precise float _365 = fma(cb0._m5.y, _360, 0.039999999105930328369140625);
    precise float _367 = fma(-cb0._m5.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _368 = _367 * _201;
    precise float _369 = _367 * _202;
    precise float _370 = _367 * _203;
    precise float _373 = 1.0 - cb0._m5.x;
    precise float _379 = fma(_153, _158, cb2._m0.x);
    precise float _380 = fma(_154, _158, cb2._m0.y);
    precise float _381 = fma(_155, _158, cb2._m0.z);
    vec3 _382 = vec3(_379, _380, _381);
    precise float _385 = inversesqrt(spvNMax(dp3_f32(_382, _382), 0.001000000047497451305389404296875));
    precise float _386 = _385 * _379;
    precise float _387 = _385 * _380;
    precise float _388 = _385 * _381;
    vec3 _389 = vec3(_355, _356, _357);
    precise float _393 = spvNClamp(dp3_f32(_389, cb2._m0), 0.0, 1.0);
    vec3 _394 = vec3(_386, _387, _388);
    precise float _396 = spvNClamp(dp3_f32(_389, _394), 0.0, 1.0);
    precise float _398 = spvNClamp(dp3_f32(cb2._m0, _394), 0.0, 1.0);
    precise float _399 = _398 * _398;
    precise float _403 = dp2_f32(vec2(_399), vec2(_373)) - 0.5;
    precise float _404 = 1.0 - _393;
    precise float _405 = _404 * _404;
    precise float _406 = _405 * _405;
    precise float _407 = _404 * _406;
    precise float _409 = abs(dp3_f32(_389, vec3(_159, _160, _161)));
    precise float _410 = 1.0 - _409;
    precise float _411 = _410 * _410;
    precise float _412 = _411 * _411;
    precise float _413 = _410 * _412;
    precise float _415 = fma(_403, _413, 1.0) * fma(_403, _407, 1.0);
    precise float _416 = _373 * _373;
    precise float _417 = spvNMax(_416, 0.00200000009499490261077880859375);
    precise float _418 = 1.0 - _417;
    precise float _421 = _409 * fma(_393, _418, _417);
    precise float _423 = fma(_393, fma(_409, _418, _417), _421) + 9.9999997473787516355514526367188e-06;
    precise float _424 = 0.5 / _423;
    precise float _425 = _417 * _417;
    precise float _428 = fma(fma(_396, _425, -_396), _396, 1.0);
    precise float _429 = _425 * 0.3183098733425140380859375;
    precise float _431 = _429 / fma(_428, _428, 1.0000000116860974230803549289703e-07);
    precise float _432 = _431 * _424;
    precise float _433 = _432 * 3.1415927410125732421875;
    precise float _434 = _393 * _415;
    precise float _435 = _393 * _433;
    vec3 _437 = vec3(_363, _364, _365);
    precise float _441 = ((dp3_f32(_437, _437) == 0.0) ? 0.0 : 1.0) * spvNMax(_435, 0.0);
    precise float _442 = _434 * _343;
    precise float _443 = _434 * _344;
    precise float _444 = _434 * _345;
    precise float _445 = _343 * _441;
    precise float _446 = _344 * _441;
    precise float _447 = _345 * _441;
    precise float _448 = 1.0 - _398;
    precise float _449 = _448 * _448;
    precise float _450 = _449 * _449;
    precise float _451 = _448 * _450;
    precise float _452 = 1.0 - _363;
    precise float _453 = 1.0 - _364;
    precise float _454 = 1.0 - _365;
    precise float _458 = _445 * fma(_452, _451, _363);
    precise float _459 = _446 * fma(_453, _451, _364);
    precise float _460 = _447 * fma(_454, _451, _365);
    SV_Target.x = fma(_368, _442, _458);
    SV_Target.y = fma(_369, _443, _459);
    SV_Target.z = fma(_370, _444, _460);
    SV_Target.w = 1.0;
}

