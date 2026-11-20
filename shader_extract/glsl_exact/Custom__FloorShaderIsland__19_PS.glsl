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
    uvec4 _m9;
    uvec4 _m10;
    vec3 _m11;
    uint _m12;
    vec3 _m13;
    uint _m14;
    vec3 _m15;
    uint _m16;
    uvec4 _m17;
    vec4 _m18;
    vec4 _m19;
    uvec4 _m20;
    vec4 _m21;
    uvec4 _m22;
    uvec4 _m23;
    vec3 _m24;
    uint _m25;
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
layout(set = 0, binding = 8) uniform sampler s3;
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform texture2D t2;
layout(set = 0, binding = 12) uniform texture3D t3;

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
    precise float _117 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _117));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _99 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _99)));
}

void main()
{
    precise float _133 = cb0._m18.y + cb0._m19.x;
    precise float _136 = fma(cb0._m18.y, 0.579999983310699462890625, cb0._m19.z);
    precise float _147 = TEXCOORD1.x - cb3._m3.x;
    precise float _148 = TEXCOORD1.z - cb3._m3.z;
    precise float _149 = _147 * 600.0;
    precise float _152 = sin(roundEven(_149)) * 43758.546875;
    precise float _154 = fract(_152) - 0.5;
    precise float _155 = fma(_154, 0.004999999888241291046142578125, _148);
    precise float _156 = _155 * 300.0;
    precise float _159 = sin(roundEven(_156)) * 43758.546875;
    precise float _161 = fract(_159) - 0.5;
    precise float _162 = fma(_161, 0.004999999888241291046142578125, _147);
    precise float _167 = abs(_162);
    precise float _168 = abs(TEXCOORD1.y);
    precise float _169 = abs(_155);
    precise float _170 = _167 - _133;
    precise float _171 = _168 - cb0._m19.y;
    precise float _172 = _169 - _136;
    vec3 _176 = vec3(spvNMax(_170, 0.0), spvNMax(_171, 0.0), spvNMax(_172, 0.0));
    precise float _181 = sqrt(dp3_f32(_176, _176)) - cb0._m19.w;
    precise float _182 = _133 + 0.02999999932944774627685546875;
    precise float _183 = cb0._m19.y + 0.02999999932944774627685546875;
    precise float _184 = _136 + 0.02999999932944774627685546875;
    precise float _185 = cb0._m19.w + 0.02999999932944774627685546875;
    precise float _186 = _167 - _182;
    precise float _187 = _168 - _183;
    precise float _188 = _169 - _184;
    vec3 _192 = vec3(spvNMax(_186, 0.0), spvNMax(_187, 0.0), spvNMax(_188, 0.0));
    precise float _195 = sqrt(dp3_f32(_192, _192)) - _185;
    precise float _196 = 1.0 - _181;
    precise float _197 = 1.0 - _195;
    precise float _198 = _162 * 600.0;
    precise float _199 = _162 * 0.100000001490116119384765625;
    precise float _200 = _155 * 0.100000001490116119384765625;
    precise float _203 = sin(roundEven(_198)) * 43758.546875;
    precise float _205 = fract(_203) - 0.5;
    precise float _207 = fma(_205, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _208 = fma(_161, 0.00200000009499490261077880859375, TEXCOORD1.x);
    vec4 _220 = texture(sampler2D(t0, s3), vec2(fma(cb1.m.x, 0.20000000298023223876953125, _199), fma(cb1.m.x, 0.20000000298023223876953125, _200)));
    precise float _227 = _133 + 1.0;
    precise float _228 = cb0._m19.y + 0.0;
    precise float _229 = _136 + 1.0;
    precise float _230 = abs(fma(fma(_220.y, 2.0, -1.0), 0.100000001490116119384765625, _162));
    precise float _231 = abs(fma(fma(_220.x, 2.0, -1.0), 0.100000001490116119384765625, _155));
    precise float _232 = _230 - _227;
    precise float _233 = _168 - _228;
    precise float _234 = _231 - _229;
    precise float _236 = spvNMax(_233, 0.0);
    vec3 _238 = vec3(spvNMax(_232, 0.0), _236, spvNMax(_234, 0.0));
    precise float _241 = sqrt(dp3_f32(_238, _238)) - 0.5;
    float _244 = float(_241 <= 0.300000011920928955078125);
    precise float _251 = cb0._m24.x - 1.0;
    precise float _252 = fma(_244, _251, 1.0);
    precise float _253 = fma(_244, cb0._m24.y, 0.0);
    precise float _254 = fma(_244, cb0._m24.z, 0.0);
    precise float _255 = _133 + 0.699999988079071044921875;
    precise float _256 = _136 + 0.699999988079071044921875;
    precise float _257 = _230 - _255;
    precise float _258 = _231 - _256;
    vec3 _261 = vec3(spvNMax(_257, 0.0), _236, spvNMax(_258, 0.0));
    float _265 = float(sqrt(dp3_f32(_261, _261)) <= 0.5);
    precise float _266 = 1.0 - _252;
    precise float _267 = 1.0 - _253;
    precise float _268 = 1.0 - _254;
    precise float _269 = fma(_265, _266, _252);
    precise float _270 = fma(_265, _267, _253);
    precise float _271 = fma(_265, _268, _254);
    precise float _272 = _133 + 0.60000002384185791015625;
    precise float _273 = _136 + 0.60000002384185791015625;
    precise float _274 = _230 - _272;
    precise float _275 = _231 - _273;
    vec3 _278 = vec3(spvNMax(_274, 0.0), _236, spvNMax(_275, 0.0));
    float _282 = float(sqrt(dp3_f32(_278, _278)) <= 0.5);
    precise float _288 = cb0._m11.x - _269;
    precise float _289 = cb0._m11.y - _270;
    precise float _290 = cb0._m11.z - _271;
    precise float _291 = fma(_282, _288, _269);
    precise float _292 = fma(_282, _289, _270);
    precise float _293 = fma(_282, _290, _271);
    precise float _294 = 1.0 - _197;
    float _296 = float(_294 <= 0.5);
    precise float _297 = 1.0 - _291;
    precise float _298 = 1.0 - _292;
    precise float _299 = 1.0 - _293;
    precise float _300 = fma(_296, _297, _291);
    precise float _301 = fma(_296, _298, _292);
    precise float _302 = fma(_296, _299, _293);
    precise float _307 = abs(dFdy(_196)) + abs(dFdx(_196));
    precise float _308 = -_307;
    precise float _309 = fma(_308, 0.5, 0.5);
    precise float _311 = _196 - _309;
    precise float _313 = fma(_307, 0.5, -_309) + 0.5;
    precise float _314 = _311 / _313;
    precise float _315 = spvNClamp(_314, 0.0, 1.0);
    precise float _316 = cb0._m11.x - _300;
    precise float _317 = cb0._m11.y - _301;
    precise float _318 = cb0._m11.z - _302;
    precise float _319 = fma(_315, _316, _300);
    precise float _320 = fma(_315, _317, _301);
    precise float _321 = fma(_315, _318, _302);
    precise float _322 = _136 - 0.89999997615814208984375;
    precise float _323 = _136 - 0.90999996662139892578125;
    precise float _324 = _136 - 0.88999998569488525390625;
    float _328 = float(_196 >= 0.5);
    precise float _329 = _328 * float(fma(_205, 0.004999999888241291046142578125, TEXCOORD1.z) >= _322);
    precise float _335 = cb0._m15.x - _319;
    precise float _336 = cb0._m15.y - _320;
    precise float _337 = cb0._m15.z - _321;
    precise float _338 = fma(_329, _335, _319);
    precise float _339 = fma(_329, _336, _320);
    precise float _340 = fma(_329, _337, _321);
    precise float _345 = abs(dFdy(_208)) + abs(dFdx(_208));
    precise float _346 = _207 - _323;
    precise float _347 = _207 - _324;
    precise float _348 = _346 / _345;
    precise float _349 = _347 / _345;
    precise float _352 = 1.0 - spvNClamp(_349, 0.0, 1.0);
    precise float _353 = _352 * spvNClamp(_348, 0.0, 1.0);
    precise float _354 = _328 * _353;
    precise float _358 = fma(_354, -_338, _338);
    precise float _359 = fma(_354, -_339, _339);
    precise float _360 = fma(_354, -_340, _340);
    precise float _363 = 0.5 - cb0._m21.x;
    precise float _364 = fma(_308, 0.5, _363);
    precise float _365 = _196 - _364;
    precise float _367 = fma(_307, 0.5, _363) - _364;
    precise float _368 = _365 / _367;
    precise float _370 = _364 + _196;
    precise float _371 = 1.0 - _370;
    precise float _372 = _371 / _367;
    precise float _374 = spvNClamp(_372, 0.0, 1.0) * spvNClamp(_368, 0.0, 1.0);
    precise float _380 = cb0._m13.x - _358;
    precise float _381 = cb0._m13.y - _359;
    precise float _382 = cb0._m13.z - _360;
    precise float _383 = fma(_374, _380, _358);
    precise float _384 = fma(_374, _381, _359);
    precise float _385 = fma(_374, _382, _360);
    if (((_384 == 0.0) && (_383 == 1.0)) && (_385 == 0.0))
    {
        demote;
    }
    precise float _400 = TEXCOORD1.y * cb0._m6.x;
    precise float _401 = TEXCOORD1.y * cb0._m6.y;
    precise float _402 = TEXCOORD1.y * cb0._m6.z;
    precise float _403 = TEXCOORD1.y * cb0._m6.w;
    precise float _430 = fma(cb0._m7.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _400)) + cb0._m8.x;
    precise float _431 = fma(cb0._m7.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _401)) + cb0._m8.y;
    precise float _432 = fma(cb0._m7.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _402)) + cb0._m8.z;
    precise float _433 = fma(cb0._m7.w, TEXCOORD1.z, fma(cb0._m5.w, TEXCOORD1.x, _403)) + cb0._m8.w;
    float _509;
    float _510;
    float _511;
    float _512;
    if (cb4._m0.x == 1.0)
    {
        bool _442 = cb4._m0.y == 1.0;
        precise float _448 = TEXCOORD1.y * cb4._m3.x;
        precise float _449 = TEXCOORD1.y * cb4._m3.y;
        precise float _450 = TEXCOORD1.y * cb4._m3.z;
        precise float _472 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _448)) + cb4._m7.x;
        precise float _473 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _449)) + cb4._m7.y;
        precise float _474 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _450)) + cb4._m7.z;
        precise float _483 = (_442 ? _472 : TEXCOORD1.x) - cb4._m11.x;
        precise float _484 = (_442 ? _473 : TEXCOORD1.y) - cb4._m11.y;
        precise float _485 = (_442 ? _474 : TEXCOORD1.z) - cb4._m11.z;
        precise float _491 = _483 * cb4._m9.x;
        precise float _492 = _484 * cb4._m9.y;
        precise float _493 = _485 * cb4._m9.z;
        vec4 _504 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_491, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _492, _493));
        _509 = _504.w;
        _510 = _504.z;
        _511 = _504.y;
        _512 = _504.x;
    }
    else
    {
        _509 = 1.0;
        _510 = 1.0;
        _511 = 1.0;
        _512 = 1.0;
    }
    precise float _521 = _430 / _433;
    precise float _522 = _431 / _433;
    precise float _523 = _521 + 0.5;
    precise float _524 = _522 + 0.5;
    precise float _531 = float(_432 > 0.0) * texture(sampler2D(t1, s1), vec2(_523, _524)).w;
    vec3 _532 = vec3(_430, _431, _432);
    precise float _540 = _531 * texture(sampler2D(t2, s2), vec2(dp3_f32(_532, _532))).x;
    precise float _541 = spvNClamp(dp4_f32(vec4(_512, _511, _510, _509), cb2._m46), 0.0, 1.0) * _540;
    precise float _542 = _541 * _383;
    precise float _543 = _541 * _384;
    precise float _544 = _541 * _385;
    precise float _550 = _542 * cb0._m2.x;
    precise float _551 = _543 * cb0._m2.y;
    precise float _552 = _544 * cb0._m2.z;
    SV_Target.x = _550;
    SV_Target.y = _551;
    SV_Target.z = _552;
    SV_Target.w = 1.0;
}

