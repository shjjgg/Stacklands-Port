#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    vec4 _m12;
    vec4 _m13;
    uvec4 _m14;
    vec2 _m15;
    uvec2 _m16;
    vec2 _m17;
    uvec2 _m18;
    vec2 _m19;
    uvec2 _m20;
    vec4 _m21;
    vec4 _m22;
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

layout(location = 2, component = 0) in vec3 TEXCOORD1;
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

float dp2_f32(vec2 a, vec2 b)
{
    precise float _122 = a.x * b.x;
    return fma(a.y, b.y, _122);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _105 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _105)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _90 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _90));
}

void main()
{
    precise float _132 = TEXCOORD1.x * 1000.0;
    precise float _135 = sin(roundEven(_132)) * 43758.546875;
    precise float _137 = fract(_135) - 0.5;
    precise float _142 = _137 * cb0._m21.w;
    precise float _145 = fma(_142, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _146 = _145 * 500.0;
    precise float _147 = _145 * 10.0;
    precise float _151 = sin(roundEven(_146)) * 43758.546875;
    precise float _153 = fract(_151) - 0.5;
    precise float _154 = _153 * cb0._m21.w;
    precise float _159 = roundEven(_147) + cb1.m.x;
    precise float _160 = _159 * 250.0;
    precise float _163 = sin(roundEven(_160)) * 43758.546875;
    precise float _165 = fract(_163) - 0.5;
    precise float _166 = fma(_165, 0.004999999888241291046142578125, fma(_154, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _167 = _166 * 10.0;
    precise float _169 = roundEven(_167) + cb1.m.x;
    precise float _170 = _169 * 250.0;
    precise float _173 = sin(roundEven(_170)) * 43758.546875;
    precise float _175 = fract(_173) - 0.5;
    precise float _176 = fma(_175, 0.004999999888241291046142578125, _145);
    float _178;
    float _183;
    _178 = 0.0;
    _183 = 100000.0;
    float _179;
    precise float _182;
    float _184;
    precise float _186;
    float _181 = 0.0;
    float _185 = 0.0;
    for (;;)
    {
        if (_185 > 1.0)
        {
            break;
        }
        precise float _193 = spvNMin(_185, 1.0);
        precise float _194 = 1.0 - _193;
        precise float _195 = _194 * _194;
        float _198 = dp2_f32(vec2(_193), vec2(_194));
        precise float _204 = _198 * cb0._m19.x;
        precise float _205 = _198 * cb0._m19.y;
        precise float _212 = _193 * _193;
        precise float _217 = fma(_212, cb0._m17.x, fma(_195, cb0._m15.x, _204));
        precise float _218 = fma(_212, cb0._m17.y, fma(_195, cb0._m15.y, _205));
        _186 = _185 + 0.100000001490116119384765625;
        precise float _219 = spvNMin(_186, 1.0);
        precise float _220 = 1.0 - _219;
        precise float _221 = _220 * _220;
        float _224 = dp2_f32(vec2(_219), vec2(_220));
        precise float _225 = _224 * cb0._m19.x;
        precise float _226 = _224 * cb0._m19.y;
        precise float _229 = _219 * _219;
        precise float _232 = fma(_229, cb0._m17.x, fma(_221, cb0._m15.x, _225)) - _217;
        precise float _233 = fma(_229, cb0._m17.y, fma(_221, cb0._m15.y, _226)) - _218;
        precise float _234 = _166 - _217;
        precise float _235 = _176 - _218;
        vec2 _236 = vec2(_234, _235);
        vec2 _237 = vec2(_232, _233);
        float _239 = dp2_f32(_237, _237);
        precise float _240 = dp2_f32(_236, _237) / _239;
        precise float _241 = spvNClamp(_240, 0.0, 1.0);
        precise float _247 = -_241;
        vec2 _250 = vec2(fma(_247, _232, _234), fma(_247, _233, _235));
        precise float _253 = sqrt(dp2_f32(_250, _250)) * ((dp2_f32(vec2(_233, -_232), _236) > 0.0) ? 1.0 : (-1.0));
        precise float _254 = sqrt(_239);
        bool _257 = abs(_253) < abs(_183);
        _179 = _257 ? fma(_241, _254, _181) : _178;
        _184 = _257 ? _253 : _183;
        _182 = _181 + _254;
        _178 = _179;
        _181 = _182;
        _183 = _184;
        _185 = _186;
        continue;
    }
    precise float _259 = _178 * 40.0;
    precise float _260 = sin(_259);
    precise float _272 = _166 - cb0._m17.x;
    precise float _273 = _176 - cb0._m17.y;
    vec2 _274 = vec2(_272, _273);
    precise float _277 = sqrt(dp2_f32(_274, _274)) - 0.02999999932944774627685546875;
    precise float _278 = abs(fma(_260, 0.0199999995529651641845703125, _183));
    float _280 = (cb0._m22.x > 0.5) ? spvNMin(_277, _278) : _278;
    precise float _285 = abs(dFdy(_280)) + abs(dFdx(_280));
    bool _288 = cb0._m22.y < 0.5;
    precise float _293 = cb0._m21.y + cb0._m21.x;
    precise float _294 = -_285;
    precise float _295 = fma(_294, 0.5, _293);
    precise float _296 = _280 - _295;
    precise float _298 = fma(_285, 0.5, _293) - _295;
    precise float _299 = _296 / _298;
    precise float _300 = spvNClamp(_299, 0.0, 1.0);
    precise float _314 = cb0._m13.x - cb0._m12.x;
    precise float _315 = cb0._m13.y - cb0._m12.y;
    precise float _316 = cb0._m13.z - cb0._m12.z;
    precise float _317 = cb0._m13.w - cb0._m12.w;
    precise float _318 = fma(_300, _314, cb0._m12.x);
    precise float _319 = fma(_300, _315, cb0._m12.y);
    precise float _320 = fma(_300, _316, cb0._m12.z);
    precise float _321 = fma(_300, _317, cb0._m12.w);
    bool _324 = fma(-_280, 40.0, -0.5) < cos(_259);
    precise float _325 = fma(_294, 0.5, cb0._m21.x);
    precise float _326 = _280 - _325;
    precise float _328 = fma(_285, 0.5, cb0._m21.x) - _325;
    precise float _329 = _326 / _328;
    precise float _330 = spvNClamp(_329, 0.0, 1.0);
    precise float _331 = cb0._m12.x - _318;
    precise float _332 = cb0._m12.y - _319;
    precise float _333 = cb0._m12.z - _320;
    precise float _334 = cb0._m12.w - _321;
    float _339 = _324 ? fma(_330, _331, _318) : _318;
    float _340 = _324 ? fma(_330, _332, _319) : _319;
    float _341 = _324 ? fma(_330, _333, _320) : _320;
    float _342 = _324 ? fma(_330, _334, _321) : _321;
    precise float _343 = fma(cb0._m21.y, 2.0, cb0._m21.x);
    precise float _344 = fma(_294, 0.5, _343);
    precise float _346 = _280 - _344;
    precise float _347 = fma(_285, 0.5, _343) - _344;
    precise float _348 = _346 / _347;
    precise float _350 = abs(fma(-_260, 0.0199999995529651641845703125, _183));
    precise float _351 = _350 - _295;
    precise float _352 = _351 / _298;
    precise float _353 = spvNClamp(_352, 0.0, 1.0);
    precise float _354 = cb0._m13.x - _339;
    precise float _355 = cb0._m13.y - _340;
    precise float _356 = cb0._m13.z - _341;
    precise float _357 = cb0._m13.w - _342;
    precise float _358 = fma(_353, _354, _339);
    precise float _359 = fma(_353, _355, _340);
    precise float _360 = fma(_353, _356, _341);
    precise float _361 = fma(_353, _357, _342);
    precise float _362 = _350 - _344;
    precise float _363 = _362 / _347;
    precise float _365 = spvNClamp(_363, 0.0, 1.0) * spvNClamp(_348, 0.0, 1.0);
    precise float _374 = fma(_330, _314, cb0._m12.x);
    precise float _375 = fma(_330, _315, cb0._m12.y);
    precise float _376 = fma(_330, _316, cb0._m12.z);
    precise float _377 = fma(_330, _317, cb0._m12.w);
    precise float _398 = TEXCOORD1.y * cb0._m6.x;
    precise float _399 = TEXCOORD1.y * cb0._m6.y;
    precise float _400 = TEXCOORD1.y * cb0._m6.z;
    precise float _422 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _398)) + cb0._m10.x;
    precise float _423 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _399)) + cb0._m10.y;
    precise float _424 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _400)) + cb0._m10.z;
    float _500;
    float _501;
    float _502;
    float _503;
    if (cb3._m0.x == 1.0)
    {
        bool _433 = cb3._m0.y == 1.0;
        precise float _439 = TEXCOORD1.y * cb3._m3.x;
        precise float _440 = TEXCOORD1.y * cb3._m3.y;
        precise float _441 = TEXCOORD1.y * cb3._m3.z;
        precise float _463 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _439)) + cb3._m7.x;
        precise float _464 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _440)) + cb3._m7.y;
        precise float _465 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _441)) + cb3._m7.z;
        precise float _474 = (_433 ? _463 : TEXCOORD1.x) - cb3._m11.x;
        precise float _475 = (_433 ? _464 : TEXCOORD1.y) - cb3._m11.y;
        precise float _476 = (_433 ? _465 : TEXCOORD1.z) - cb3._m11.z;
        precise float _482 = _474 * cb3._m9.x;
        precise float _483 = _475 * cb3._m9.y;
        precise float _484 = _476 * cb3._m9.z;
        vec4 _495 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_482, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _483, _484));
        _500 = _495.w;
        _501 = _495.z;
        _502 = _495.y;
        _503 = _495.x;
    }
    else
    {
        _500 = 1.0;
        _501 = 1.0;
        _502 = 1.0;
        _503 = 1.0;
    }
    vec3 _510 = vec3(_422, _423, _424);
    precise float _519 = spvNClamp(dp4_f32(vec4(_503, _502, _501, _500), cb2._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(dp3_f32(_510, _510))).x;
    precise float _520 = (_288 ? fma(_365, -_358, _358) : fma(_300, -_374, _374)) * _519;
    precise float _521 = (_288 ? fma(_365, -_359, _359) : fma(_300, -_375, _375)) * _519;
    precise float _522 = (_288 ? fma(_365, -_360, _360) : fma(_300, -_376, _376)) * _519;
    precise float _529 = _520 * cb0._m2.x;
    precise float _530 = _521 * cb0._m2.y;
    precise float _531 = _522 * cb0._m2.z;
    precise float _532 = (_288 ? fma(_365, -_361, _361) : fma(_300, -_377, _377)) * cb0._m2.w;
    SV_Target.x = _529;
    SV_Target.y = _530;
    SV_Target.z = _531;
    SV_Target.w = _532;
}

