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
    uvec4 _m5;
    uvec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    uvec4 _m13;
    vec4 _m14;
    vec4 _m15;
    uvec4 _m16;
    vec4 _m17;
    uvec4 _m18;
    uvec4 _m19;
    vec3 _m20;
    uint _m21;
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
    vec4 _m3;
} cb4;

layout(set = 0, binding = 5, std140) uniform cb5_buf
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
layout(set = 0, binding = 11) uniform texture2D t1;
layout(set = 0, binding = 12) uniform texture3D t2;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 4, component = 0) in vec4 TEXCOORD4;
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

float dp4_f32(vec4 a, vec4 b)
{
    precise float _112 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _112)));
}

void main()
{
    precise float _146 = cb0._m14.y + cb0._m15.x;
    precise float _149 = fma(cb0._m14.y, 0.579999983310699462890625, cb0._m15.z);
    precise float _160 = TEXCOORD1.x - cb4._m3.x;
    precise float _161 = TEXCOORD1.z - cb4._m3.z;
    precise float _162 = _160 * 600.0;
    precise float _165 = sin(roundEven(_162)) * 43758.546875;
    precise float _167 = fract(_165) - 0.5;
    precise float _168 = fma(_167, 0.004999999888241291046142578125, _161);
    precise float _169 = _168 * 300.0;
    precise float _172 = sin(roundEven(_169)) * 43758.546875;
    precise float _174 = fract(_172) - 0.5;
    precise float _175 = fma(_174, 0.004999999888241291046142578125, _160);
    precise float _180 = abs(_175);
    precise float _181 = abs(TEXCOORD1.y);
    precise float _182 = abs(_168);
    precise float _183 = _180 - _146;
    precise float _184 = _181 - cb0._m15.y;
    precise float _185 = _182 - _149;
    vec3 _189 = vec3(spvNMax(_183, 0.0), spvNMax(_184, 0.0), spvNMax(_185, 0.0));
    precise float _194 = sqrt(dp3_f32(_189, _189)) - cb0._m15.w;
    precise float _195 = _146 + 0.02999999932944774627685546875;
    precise float _196 = cb0._m15.y + 0.02999999932944774627685546875;
    precise float _197 = _149 + 0.02999999932944774627685546875;
    precise float _198 = cb0._m15.w + 0.02999999932944774627685546875;
    precise float _199 = _180 - _195;
    precise float _200 = _181 - _196;
    precise float _201 = _182 - _197;
    vec3 _205 = vec3(spvNMax(_199, 0.0), spvNMax(_200, 0.0), spvNMax(_201, 0.0));
    precise float _208 = sqrt(dp3_f32(_205, _205)) - _198;
    precise float _209 = 1.0 - _194;
    precise float _210 = 1.0 - _208;
    precise float _211 = _175 * 600.0;
    precise float _212 = _175 * 0.100000001490116119384765625;
    precise float _213 = _168 * 0.100000001490116119384765625;
    precise float _216 = sin(roundEven(_211)) * 43758.546875;
    precise float _218 = fract(_216) - 0.5;
    precise float _220 = fma(_218, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _221 = fma(_174, 0.00200000009499490261077880859375, TEXCOORD1.x);
    vec4 _233 = texture(sampler2D(t0, s2), vec2(fma(cb1._m0.x, 0.20000000298023223876953125, _212), fma(cb1._m0.x, 0.20000000298023223876953125, _213)));
    precise float _240 = _146 + 1.0;
    precise float _241 = cb0._m15.y + 0.0;
    precise float _242 = _149 + 1.0;
    precise float _243 = abs(fma(fma(_233.y, 2.0, -1.0), 0.100000001490116119384765625, _175));
    precise float _244 = abs(fma(fma(_233.x, 2.0, -1.0), 0.100000001490116119384765625, _168));
    precise float _245 = _243 - _240;
    precise float _246 = _181 - _241;
    precise float _247 = _244 - _242;
    precise float _249 = spvNMax(_246, 0.0);
    vec3 _251 = vec3(spvNMax(_245, 0.0), _249, spvNMax(_247, 0.0));
    precise float _254 = sqrt(dp3_f32(_251, _251)) - 0.5;
    float _257 = float(_254 <= 0.300000011920928955078125);
    precise float _264 = cb0._m20.x - 1.0;
    precise float _265 = fma(_257, _264, 1.0);
    precise float _266 = fma(_257, cb0._m20.y, 0.0);
    precise float _267 = fma(_257, cb0._m20.z, 0.0);
    precise float _268 = _146 + 0.699999988079071044921875;
    precise float _269 = _149 + 0.699999988079071044921875;
    precise float _270 = _243 - _268;
    precise float _271 = _244 - _269;
    vec3 _274 = vec3(spvNMax(_270, 0.0), _249, spvNMax(_271, 0.0));
    float _278 = float(sqrt(dp3_f32(_274, _274)) <= 0.5);
    precise float _279 = 1.0 - _265;
    precise float _280 = 1.0 - _266;
    precise float _281 = 1.0 - _267;
    precise float _282 = fma(_278, _279, _265);
    precise float _283 = fma(_278, _280, _266);
    precise float _284 = fma(_278, _281, _267);
    precise float _285 = _146 + 0.60000002384185791015625;
    precise float _286 = _149 + 0.60000002384185791015625;
    precise float _287 = _243 - _285;
    precise float _288 = _244 - _286;
    vec3 _291 = vec3(spvNMax(_287, 0.0), _249, spvNMax(_288, 0.0));
    float _295 = float(sqrt(dp3_f32(_291, _291)) <= 0.5);
    precise float _301 = cb0._m7.x - _282;
    precise float _302 = cb0._m7.y - _283;
    precise float _303 = cb0._m7.z - _284;
    precise float _304 = fma(_295, _301, _282);
    precise float _305 = fma(_295, _302, _283);
    precise float _306 = fma(_295, _303, _284);
    precise float _307 = 1.0 - _210;
    float _309 = float(_307 <= 0.5);
    precise float _310 = 1.0 - _304;
    precise float _311 = 1.0 - _305;
    precise float _312 = 1.0 - _306;
    precise float _313 = fma(_309, _310, _304);
    precise float _314 = fma(_309, _311, _305);
    precise float _315 = fma(_309, _312, _306);
    precise float _320 = abs(dFdy(_209)) + abs(dFdx(_209));
    precise float _321 = -_320;
    precise float _322 = fma(_321, 0.5, 0.5);
    precise float _324 = _209 - _322;
    precise float _326 = fma(_320, 0.5, -_322) + 0.5;
    precise float _327 = _324 / _326;
    precise float _328 = spvNClamp(_327, 0.0, 1.0);
    precise float _329 = cb0._m7.x - _313;
    precise float _330 = cb0._m7.y - _314;
    precise float _331 = cb0._m7.z - _315;
    precise float _332 = fma(_328, _329, _313);
    precise float _333 = fma(_328, _330, _314);
    precise float _334 = fma(_328, _331, _315);
    precise float _335 = _149 - 0.89999997615814208984375;
    precise float _336 = _149 - 0.90999996662139892578125;
    precise float _337 = _149 - 0.88999998569488525390625;
    float _341 = float(_209 >= 0.5);
    precise float _342 = _341 * float(fma(_218, 0.004999999888241291046142578125, TEXCOORD1.z) >= _335);
    precise float _348 = cb0._m11.x - _332;
    precise float _349 = cb0._m11.y - _333;
    precise float _350 = cb0._m11.z - _334;
    precise float _351 = fma(_342, _348, _332);
    precise float _352 = fma(_342, _349, _333);
    precise float _353 = fma(_342, _350, _334);
    precise float _358 = abs(dFdy(_221)) + abs(dFdx(_221));
    precise float _359 = _220 - _336;
    precise float _360 = _220 - _337;
    precise float _361 = _359 / _358;
    precise float _362 = _360 / _358;
    precise float _365 = 1.0 - spvNClamp(_362, 0.0, 1.0);
    precise float _366 = _365 * spvNClamp(_361, 0.0, 1.0);
    precise float _367 = _341 * _366;
    precise float _371 = fma(_367, -_351, _351);
    precise float _372 = fma(_367, -_352, _352);
    precise float _373 = fma(_367, -_353, _353);
    precise float _376 = 0.5 - cb0._m17.x;
    precise float _377 = fma(_321, 0.5, _376);
    precise float _378 = _209 - _377;
    precise float _380 = fma(_320, 0.5, _376) - _377;
    precise float _381 = _378 / _380;
    precise float _383 = 1.0 - _209;
    precise float _384 = _383 - _377;
    precise float _385 = _384 / _380;
    precise float _387 = spvNClamp(_385, 0.0, 1.0) * spvNClamp(_381, 0.0, 1.0);
    precise float _393 = cb0._m9.x - _371;
    precise float _394 = cb0._m9.y - _372;
    precise float _395 = cb0._m9.z - _373;
    precise float _396 = fma(_387, _393, _371);
    precise float _397 = fma(_387, _394, _372);
    precise float _398 = fma(_387, _395, _373);
    if (((_397 == 0.0) && (_396 == 1.0)) && (_398 == 0.0))
    {
        demote;
    }
    precise float _411 = cb1._m4.x - TEXCOORD1.x;
    precise float _412 = cb1._m4.y - TEXCOORD1.y;
    precise float _413 = cb1._m4.z - TEXCOORD1.z;
    float _423 = dp3_f32(vec3(_411, _412, _413), vec3(cb5._m9.z, cb5._m10.z, cb5._m11.z));
    precise float _430 = TEXCOORD1.x - cb3._m25.x;
    precise float _431 = TEXCOORD1.y - cb3._m25.y;
    precise float _432 = TEXCOORD1.z - cb3._m25.z;
    vec3 _433 = vec3(_430, _431, _432);
    precise float _436 = sqrt(dp3_f32(_433, _433)) - _423;
    float _521;
    float _522;
    float _523;
    float _524;
    if (cb6._m0.x == 1.0)
    {
        bool _454 = cb6._m0.y == 1.0;
        precise float _460 = TEXCOORD1.y * cb6._m3.x;
        precise float _461 = TEXCOORD1.y * cb6._m3.y;
        precise float _462 = TEXCOORD1.y * cb6._m3.z;
        precise float _484 = fma(cb6._m5.x, TEXCOORD1.z, fma(cb6._m1.x, TEXCOORD1.x, _460)) + cb6._m7.x;
        precise float _485 = fma(cb6._m5.y, TEXCOORD1.z, fma(cb6._m1.y, TEXCOORD1.x, _461)) + cb6._m7.y;
        precise float _486 = fma(cb6._m5.z, TEXCOORD1.z, fma(cb6._m1.z, TEXCOORD1.x, _462)) + cb6._m7.z;
        precise float _495 = (_454 ? _484 : TEXCOORD1.x) - cb6._m11.x;
        precise float _496 = (_454 ? _485 : TEXCOORD1.y) - cb6._m11.y;
        precise float _497 = (_454 ? _486 : TEXCOORD1.z) - cb6._m11.z;
        precise float _503 = _495 * cb6._m9.x;
        precise float _504 = _496 * cb6._m9.y;
        precise float _505 = _497 * cb6._m9.z;
        vec4 _516 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_503, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _504, _505));
        _521 = _516.w;
        _522 = _516.z;
        _523 = _516.y;
        _524 = _516.x;
    }
    else
    {
        _521 = 1.0;
        _522 = 1.0;
        _523 = 1.0;
        _524 = 1.0;
    }
    precise float _538 = TEXCOORD4.x / TEXCOORD4.w;
    precise float _539 = TEXCOORD4.y / TEXCOORD4.w;
    vec4 _544 = texture(sampler2D(t1, s1), vec2(_538, _539));
    float _545 = _544.x;
    precise float _546 = spvNClamp(dp4_f32(vec4(_524, _523, _522, _521), cb2._m46), 0.0, 1.0) - _545;
    precise float _547 = fma(spvNClamp(fma(fma(cb3._m26, _436, _423), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _546, _545);
    precise float _548 = _547 * _396;
    precise float _549 = _547 * _397;
    precise float _550 = _547 * _398;
    precise float _556 = _548 * cb0._m2.x;
    precise float _557 = _549 * cb0._m2.y;
    precise float _558 = _550 * cb0._m2.z;
    SV_Target.x = fma(_396, TEXCOORD2.x, _556);
    SV_Target.y = fma(_397, TEXCOORD2.y, _557);
    SV_Target.z = fma(_398, TEXCOORD2.z, _558);
    SV_Target.w = 1.0;
}

