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
    vec2 _m5;
    uvec2 _m6;
    vec2 _m7;
    uvec2 _m8;
    vec2 _m9;
    uvec2 _m10;
    vec2 _m11;
    uvec2 _m12;
    uvec4 _m13;
    uvec4 _m14;
    vec3 _m15;
    uint _m16;
    vec3 _m17;
    uint _m18;
    vec3 _m19;
    uint _m20;
    uvec4 _m21;
    vec4 _m22;
    vec4 _m23;
    uvec4 _m24;
    vec4 _m25;
    uvec4 _m26;
    uvec4 _m27;
    vec3 _m28;
    uint _m29;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 m;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
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
    vec4 _m46;
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
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
layout(set = 0, binding = 8) uniform texture2D t0;
layout(set = 0, binding = 9) uniform texture2D t1;
layout(set = 0, binding = 10) uniform texture3D t2;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
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
    precise float _115 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _115));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _97 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _97)));
}

void main()
{
    precise float _131 = cb0._m22.y + cb0._m23.x;
    precise float _134 = fma(cb0._m22.y, 0.579999983310699462890625, cb0._m23.z);
    precise float _145 = TEXCOORD1.x - cb3._m3.x;
    precise float _146 = TEXCOORD1.z - cb3._m3.z;
    precise float _147 = _145 * 600.0;
    precise float _150 = sin(roundEven(_147)) * 43758.546875;
    precise float _152 = fract(_150) - 0.5;
    precise float _153 = fma(_152, 0.004999999888241291046142578125, _146);
    precise float _154 = _153 * 300.0;
    precise float _157 = sin(roundEven(_154)) * 43758.546875;
    precise float _159 = fract(_157) - 0.5;
    precise float _160 = fma(_159, 0.004999999888241291046142578125, _145);
    precise float _165 = abs(_160);
    precise float _166 = abs(TEXCOORD1.y);
    precise float _167 = abs(_153);
    precise float _168 = _165 - _131;
    precise float _169 = _166 - cb0._m23.y;
    precise float _170 = _167 - _134;
    vec3 _174 = vec3(spvNMax(_168, 0.0), spvNMax(_169, 0.0), spvNMax(_170, 0.0));
    precise float _179 = sqrt(dp3_f32(_174, _174)) - cb0._m23.w;
    precise float _180 = _131 + 0.02999999932944774627685546875;
    precise float _181 = cb0._m23.y + 0.02999999932944774627685546875;
    precise float _182 = _134 + 0.02999999932944774627685546875;
    precise float _183 = cb0._m23.w + 0.02999999932944774627685546875;
    precise float _184 = _165 - _180;
    precise float _185 = _166 - _181;
    precise float _186 = _167 - _182;
    vec3 _190 = vec3(spvNMax(_184, 0.0), spvNMax(_185, 0.0), spvNMax(_186, 0.0));
    precise float _193 = sqrt(dp3_f32(_190, _190)) - _183;
    precise float _194 = 1.0 - _179;
    precise float _195 = 1.0 - _193;
    precise float _196 = _160 * 600.0;
    precise float _197 = _160 * 0.100000001490116119384765625;
    precise float _198 = _153 * 0.100000001490116119384765625;
    precise float _201 = sin(roundEven(_196)) * 43758.546875;
    precise float _203 = fract(_201) - 0.5;
    precise float _205 = fma(_203, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _206 = fma(_159, 0.00200000009499490261077880859375, TEXCOORD1.x);
    vec4 _217 = texture(sampler2D(t0, s2), vec2(fma(cb1.m.x, 0.20000000298023223876953125, _197), fma(cb1.m.x, 0.20000000298023223876953125, _198)));
    precise float _224 = _131 + 1.0;
    precise float _225 = cb0._m23.y + 0.0;
    precise float _226 = _134 + 1.0;
    precise float _227 = abs(fma(fma(_217.y, 2.0, -1.0), 0.100000001490116119384765625, _160));
    precise float _228 = abs(fma(fma(_217.x, 2.0, -1.0), 0.100000001490116119384765625, _153));
    precise float _229 = _227 - _224;
    precise float _230 = _166 - _225;
    precise float _231 = _228 - _226;
    precise float _233 = spvNMax(_230, 0.0);
    vec3 _235 = vec3(spvNMax(_229, 0.0), _233, spvNMax(_231, 0.0));
    precise float _238 = sqrt(dp3_f32(_235, _235)) - 0.5;
    float _241 = float(_238 <= 0.300000011920928955078125);
    precise float _248 = cb0._m28.x - 1.0;
    precise float _249 = fma(_241, _248, 1.0);
    precise float _250 = fma(_241, cb0._m28.y, 0.0);
    precise float _251 = fma(_241, cb0._m28.z, 0.0);
    precise float _252 = _131 + 0.699999988079071044921875;
    precise float _253 = _134 + 0.699999988079071044921875;
    precise float _254 = _227 - _252;
    precise float _255 = _228 - _253;
    vec3 _258 = vec3(spvNMax(_254, 0.0), _233, spvNMax(_255, 0.0));
    float _262 = float(sqrt(dp3_f32(_258, _258)) <= 0.5);
    precise float _263 = 1.0 - _249;
    precise float _264 = 1.0 - _250;
    precise float _265 = 1.0 - _251;
    precise float _266 = fma(_262, _263, _249);
    precise float _267 = fma(_262, _264, _250);
    precise float _268 = fma(_262, _265, _251);
    precise float _269 = _131 + 0.60000002384185791015625;
    precise float _270 = _134 + 0.60000002384185791015625;
    precise float _271 = _227 - _269;
    precise float _272 = _228 - _270;
    vec3 _275 = vec3(spvNMax(_271, 0.0), _233, spvNMax(_272, 0.0));
    float _279 = float(sqrt(dp3_f32(_275, _275)) <= 0.5);
    precise float _285 = cb0._m15.x - _266;
    precise float _286 = cb0._m15.y - _267;
    precise float _287 = cb0._m15.z - _268;
    precise float _288 = fma(_279, _285, _266);
    precise float _289 = fma(_279, _286, _267);
    precise float _290 = fma(_279, _287, _268);
    precise float _291 = 1.0 - _195;
    float _293 = float(_291 <= 0.5);
    precise float _294 = 1.0 - _288;
    precise float _295 = 1.0 - _289;
    precise float _296 = 1.0 - _290;
    precise float _297 = fma(_293, _294, _288);
    precise float _298 = fma(_293, _295, _289);
    precise float _299 = fma(_293, _296, _290);
    precise float _304 = abs(dFdy(_194)) + abs(dFdx(_194));
    precise float _305 = -_304;
    precise float _306 = fma(_305, 0.5, 0.5);
    precise float _308 = _194 - _306;
    precise float _310 = fma(_304, 0.5, -_306) + 0.5;
    precise float _311 = _308 / _310;
    precise float _312 = spvNClamp(_311, 0.0, 1.0);
    precise float _313 = cb0._m15.x - _297;
    precise float _314 = cb0._m15.y - _298;
    precise float _315 = cb0._m15.z - _299;
    precise float _316 = fma(_312, _313, _297);
    precise float _317 = fma(_312, _314, _298);
    precise float _318 = fma(_312, _315, _299);
    precise float _319 = _134 - 0.89999997615814208984375;
    precise float _320 = _134 - 0.90999996662139892578125;
    precise float _321 = _134 - 0.88999998569488525390625;
    float _325 = float(_194 >= 0.5);
    precise float _326 = _325 * float(fma(_203, 0.004999999888241291046142578125, TEXCOORD1.z) >= _319);
    precise float _332 = cb0._m19.x - _316;
    precise float _333 = cb0._m19.y - _317;
    precise float _334 = cb0._m19.z - _318;
    precise float _335 = fma(_326, _332, _316);
    precise float _336 = fma(_326, _333, _317);
    precise float _337 = fma(_326, _334, _318);
    precise float _342 = abs(dFdy(_206)) + abs(dFdx(_206));
    precise float _343 = _205 - _320;
    precise float _344 = _205 - _321;
    precise float _345 = _343 / _342;
    precise float _346 = _344 / _342;
    precise float _349 = 1.0 - spvNClamp(_346, 0.0, 1.0);
    precise float _350 = _349 * spvNClamp(_345, 0.0, 1.0);
    precise float _351 = _325 * _350;
    precise float _355 = fma(_351, -_335, _335);
    precise float _356 = fma(_351, -_336, _336);
    precise float _357 = fma(_351, -_337, _337);
    precise float _360 = 0.5 - cb0._m25.x;
    precise float _361 = fma(_305, 0.5, _360);
    precise float _362 = _194 - _361;
    precise float _364 = fma(_304, 0.5, _360) - _361;
    precise float _365 = _362 / _364;
    precise float _367 = 1.0 - _194;
    precise float _368 = _367 - _361;
    precise float _369 = _368 / _364;
    precise float _371 = spvNClamp(_369, 0.0, 1.0) * spvNClamp(_365, 0.0, 1.0);
    precise float _377 = cb0._m17.x - _355;
    precise float _378 = cb0._m17.y - _356;
    precise float _379 = cb0._m17.z - _357;
    precise float _380 = fma(_371, _377, _355);
    precise float _381 = fma(_371, _378, _356);
    precise float _382 = fma(_371, _379, _357);
    if ((_382 == 0.0) && ((_381 == 0.0) && (_380 == 1.0)))
    {
        demote;
    }
    precise float _395 = TEXCOORD1.y * cb0._m7.x;
    precise float _396 = TEXCOORD1.y * cb0._m7.y;
    precise float _413 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _395)) + cb0._m11.x;
    precise float _414 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _396)) + cb0._m11.y;
    float _490;
    float _491;
    float _492;
    float _493;
    if (cb4._m0.x == 1.0)
    {
        bool _423 = cb4._m0.y == 1.0;
        precise float _429 = TEXCOORD1.y * cb4._m3.x;
        precise float _430 = TEXCOORD1.y * cb4._m3.y;
        precise float _431 = TEXCOORD1.y * cb4._m3.z;
        precise float _453 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _429)) + cb4._m7.x;
        precise float _454 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _430)) + cb4._m7.y;
        precise float _455 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _431)) + cb4._m7.z;
        precise float _464 = (_423 ? _453 : TEXCOORD1.x) - cb4._m11.x;
        precise float _465 = (_423 ? _454 : TEXCOORD1.y) - cb4._m11.y;
        precise float _466 = (_423 ? _455 : TEXCOORD1.z) - cb4._m11.z;
        precise float _472 = _464 * cb4._m9.x;
        precise float _473 = _465 * cb4._m9.y;
        precise float _474 = _466 * cb4._m9.z;
        vec4 _485 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_472, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _473, _474));
        _490 = _485.w;
        _491 = _485.z;
        _492 = _485.y;
        _493 = _485.x;
    }
    else
    {
        _490 = 1.0;
        _491 = 1.0;
        _492 = 1.0;
        _493 = 1.0;
    }
    precise float _507 = spvNClamp(dp4_f32(vec4(_493, _492, _491, _490), cb2._m46), 0.0, 1.0) * texture(sampler2D(t1, s1), vec2(_413, _414)).w;
    precise float _508 = _507 * _380;
    precise float _509 = _507 * _381;
    precise float _510 = _507 * _382;
    precise float _516 = _508 * cb0._m2.x;
    precise float _517 = _509 * cb0._m2.y;
    precise float _518 = _510 * cb0._m2.z;
    SV_Target.x = _516;
    SV_Target.y = _517;
    SV_Target.z = _518;
    SV_Target.w = 1.0;
}

