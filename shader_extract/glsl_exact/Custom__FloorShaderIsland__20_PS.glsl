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
layout(set = 0, binding = 8) uniform sampler s3;
layout(set = 0, binding = 9) uniform texture2D t0;
layout(set = 0, binding = 10) uniform texture2D t1;
layout(set = 0, binding = 11) uniform textureCube t2;
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
    precise float _118 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _118));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _100 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _100)));
}

void main()
{
    precise float _134 = cb0._m22.y + cb0._m23.x;
    precise float _137 = fma(cb0._m22.y, 0.579999983310699462890625, cb0._m23.z);
    precise float _148 = TEXCOORD1.x - cb3._m3.x;
    precise float _149 = TEXCOORD1.z - cb3._m3.z;
    precise float _150 = _148 * 600.0;
    precise float _153 = sin(roundEven(_150)) * 43758.546875;
    precise float _155 = fract(_153) - 0.5;
    precise float _156 = fma(_155, 0.004999999888241291046142578125, _149);
    precise float _157 = _156 * 300.0;
    precise float _160 = sin(roundEven(_157)) * 43758.546875;
    precise float _162 = fract(_160) - 0.5;
    precise float _163 = fma(_162, 0.004999999888241291046142578125, _148);
    precise float _168 = abs(_163);
    precise float _169 = abs(TEXCOORD1.y);
    precise float _170 = abs(_156);
    precise float _171 = _168 - _134;
    precise float _172 = _169 - cb0._m23.y;
    precise float _173 = _170 - _137;
    vec3 _177 = vec3(spvNMax(_171, 0.0), spvNMax(_172, 0.0), spvNMax(_173, 0.0));
    precise float _182 = sqrt(dp3_f32(_177, _177)) - cb0._m23.w;
    precise float _183 = _134 + 0.02999999932944774627685546875;
    precise float _184 = cb0._m23.y + 0.02999999932944774627685546875;
    precise float _185 = _137 + 0.02999999932944774627685546875;
    precise float _186 = cb0._m23.w + 0.02999999932944774627685546875;
    precise float _187 = _168 - _183;
    precise float _188 = _169 - _184;
    precise float _189 = _170 - _185;
    vec3 _193 = vec3(spvNMax(_187, 0.0), spvNMax(_188, 0.0), spvNMax(_189, 0.0));
    precise float _196 = sqrt(dp3_f32(_193, _193)) - _186;
    precise float _197 = 1.0 - _182;
    precise float _198 = 1.0 - _196;
    precise float _199 = _163 * 600.0;
    precise float _200 = _163 * 0.100000001490116119384765625;
    precise float _201 = _156 * 0.100000001490116119384765625;
    precise float _204 = sin(roundEven(_199)) * 43758.546875;
    precise float _206 = fract(_204) - 0.5;
    precise float _208 = fma(_206, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _209 = fma(_162, 0.00200000009499490261077880859375, TEXCOORD1.x);
    vec4 _221 = texture(sampler2D(t0, s3), vec2(fma(cb1.m.x, 0.20000000298023223876953125, _200), fma(cb1.m.x, 0.20000000298023223876953125, _201)));
    precise float _228 = _134 + 1.0;
    precise float _229 = cb0._m23.y + 0.0;
    precise float _230 = _137 + 1.0;
    precise float _231 = abs(fma(fma(_221.y, 2.0, -1.0), 0.100000001490116119384765625, _163));
    precise float _232 = abs(fma(fma(_221.x, 2.0, -1.0), 0.100000001490116119384765625, _156));
    precise float _233 = _231 - _228;
    precise float _234 = _169 - _229;
    precise float _235 = _232 - _230;
    precise float _237 = spvNMax(_234, 0.0);
    vec3 _239 = vec3(spvNMax(_233, 0.0), _237, spvNMax(_235, 0.0));
    precise float _242 = sqrt(dp3_f32(_239, _239)) - 0.5;
    float _245 = float(_242 <= 0.300000011920928955078125);
    precise float _252 = cb0._m28.x - 1.0;
    precise float _253 = fma(_245, _252, 1.0);
    precise float _254 = fma(_245, cb0._m28.y, 0.0);
    precise float _255 = fma(_245, cb0._m28.z, 0.0);
    precise float _256 = _134 + 0.699999988079071044921875;
    precise float _257 = _137 + 0.699999988079071044921875;
    precise float _258 = _231 - _256;
    precise float _259 = _232 - _257;
    vec3 _262 = vec3(spvNMax(_258, 0.0), _237, spvNMax(_259, 0.0));
    float _266 = float(sqrt(dp3_f32(_262, _262)) <= 0.5);
    precise float _267 = 1.0 - _253;
    precise float _268 = 1.0 - _254;
    precise float _269 = 1.0 - _255;
    precise float _270 = fma(_266, _267, _253);
    precise float _271 = fma(_266, _268, _254);
    precise float _272 = fma(_266, _269, _255);
    precise float _273 = _134 + 0.60000002384185791015625;
    precise float _274 = _137 + 0.60000002384185791015625;
    precise float _275 = _231 - _273;
    precise float _276 = _232 - _274;
    vec3 _279 = vec3(spvNMax(_275, 0.0), _237, spvNMax(_276, 0.0));
    float _283 = float(sqrt(dp3_f32(_279, _279)) <= 0.5);
    precise float _289 = cb0._m15.x - _270;
    precise float _290 = cb0._m15.y - _271;
    precise float _291 = cb0._m15.z - _272;
    precise float _292 = fma(_283, _289, _270);
    precise float _293 = fma(_283, _290, _271);
    precise float _294 = fma(_283, _291, _272);
    precise float _295 = 1.0 - _198;
    float _297 = float(_295 <= 0.5);
    precise float _298 = 1.0 - _292;
    precise float _299 = 1.0 - _293;
    precise float _300 = 1.0 - _294;
    precise float _301 = fma(_297, _298, _292);
    precise float _302 = fma(_297, _299, _293);
    precise float _303 = fma(_297, _300, _294);
    precise float _308 = abs(dFdy(_197)) + abs(dFdx(_197));
    precise float _309 = -_308;
    precise float _310 = fma(_309, 0.5, 0.5);
    precise float _312 = _197 - _310;
    precise float _314 = fma(_308, 0.5, -_310) + 0.5;
    precise float _315 = _312 / _314;
    precise float _316 = spvNClamp(_315, 0.0, 1.0);
    precise float _317 = cb0._m15.x - _301;
    precise float _318 = cb0._m15.y - _302;
    precise float _319 = cb0._m15.z - _303;
    precise float _320 = fma(_316, _317, _301);
    precise float _321 = fma(_316, _318, _302);
    precise float _322 = fma(_316, _319, _303);
    precise float _323 = _137 - 0.89999997615814208984375;
    precise float _324 = _137 - 0.90999996662139892578125;
    precise float _325 = _137 - 0.88999998569488525390625;
    float _329 = float(_197 >= 0.5);
    precise float _330 = _329 * float(fma(_206, 0.004999999888241291046142578125, TEXCOORD1.z) >= _323);
    precise float _336 = cb0._m19.x - _320;
    precise float _337 = cb0._m19.y - _321;
    precise float _338 = cb0._m19.z - _322;
    precise float _339 = fma(_330, _336, _320);
    precise float _340 = fma(_330, _337, _321);
    precise float _341 = fma(_330, _338, _322);
    precise float _346 = abs(dFdy(_209)) + abs(dFdx(_209));
    precise float _347 = _208 - _324;
    precise float _348 = _208 - _325;
    precise float _349 = _347 / _346;
    precise float _350 = _348 / _346;
    precise float _353 = 1.0 - spvNClamp(_350, 0.0, 1.0);
    precise float _354 = _353 * spvNClamp(_349, 0.0, 1.0);
    precise float _355 = _329 * _354;
    precise float _359 = fma(_355, -_339, _339);
    precise float _360 = fma(_355, -_340, _340);
    precise float _361 = fma(_355, -_341, _341);
    precise float _364 = 0.5 - cb0._m25.x;
    precise float _365 = fma(_309, 0.5, _364);
    precise float _366 = _197 - _365;
    precise float _368 = fma(_308, 0.5, _364) - _365;
    precise float _369 = _366 / _368;
    precise float _371 = 1.0 - _197;
    precise float _372 = _371 - _365;
    precise float _373 = _372 / _368;
    precise float _375 = spvNClamp(_373, 0.0, 1.0) * spvNClamp(_369, 0.0, 1.0);
    precise float _381 = cb0._m17.x - _359;
    precise float _382 = cb0._m17.y - _360;
    precise float _383 = cb0._m17.z - _361;
    precise float _384 = fma(_375, _381, _359);
    precise float _385 = fma(_375, _382, _360);
    precise float _386 = fma(_375, _383, _361);
    if (((_385 == 0.0) && (_384 == 1.0)) && (_386 == 0.0))
    {
        demote;
    }
    precise float _399 = TEXCOORD1.y * cb0._m7.x;
    precise float _400 = TEXCOORD1.y * cb0._m7.y;
    precise float _401 = TEXCOORD1.y * cb0._m7.z;
    precise float _423 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _399)) + cb0._m11.x;
    precise float _424 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _400)) + cb0._m11.y;
    precise float _425 = fma(cb0._m9.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _401)) + cb0._m11.z;
    float _501;
    float _502;
    float _503;
    float _504;
    if (cb4._m0.x == 1.0)
    {
        bool _434 = cb4._m0.y == 1.0;
        precise float _440 = TEXCOORD1.y * cb4._m3.x;
        precise float _441 = TEXCOORD1.y * cb4._m3.y;
        precise float _442 = TEXCOORD1.y * cb4._m3.z;
        precise float _464 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _440)) + cb4._m7.x;
        precise float _465 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _441)) + cb4._m7.y;
        precise float _466 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _442)) + cb4._m7.z;
        precise float _475 = (_434 ? _464 : TEXCOORD1.x) - cb4._m11.x;
        precise float _476 = (_434 ? _465 : TEXCOORD1.y) - cb4._m11.y;
        precise float _477 = (_434 ? _466 : TEXCOORD1.z) - cb4._m11.z;
        precise float _483 = _475 * cb4._m9.x;
        precise float _484 = _476 * cb4._m9.y;
        precise float _485 = _477 * cb4._m9.z;
        vec4 _496 = texture(sampler3D(t3, s0), vec3(spvNMax(fma(_483, 0.25, 0.75), fma(cb4._m0.z, 0.5, 0.75)), _484, _485));
        _501 = _496.w;
        _502 = _496.z;
        _503 = _496.y;
        _504 = _496.x;
    }
    else
    {
        _501 = 1.0;
        _502 = 1.0;
        _503 = 1.0;
        _504 = 1.0;
    }
    vec3 _512 = vec3(_423, _424, _425);
    precise float _526 = texture(samplerCube(t2, s1), _512).w * texture(sampler2D(t1, s2), vec2(dp3_f32(_512, _512))).x;
    precise float _527 = spvNClamp(dp4_f32(vec4(_504, _503, _502, _501), cb2._m46), 0.0, 1.0) * _526;
    precise float _528 = _527 * _384;
    precise float _529 = _527 * _385;
    precise float _530 = _527 * _386;
    precise float _536 = _528 * cb0._m2.x;
    precise float _537 = _529 * cb0._m2.y;
    precise float _538 = _530 * cb0._m2.z;
    SV_Target.x = _536;
    SV_Target.y = _537;
    SV_Target.z = _538;
    SV_Target.w = 1.0;
}

