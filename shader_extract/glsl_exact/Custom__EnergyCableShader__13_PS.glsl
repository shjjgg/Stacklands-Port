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
layout(set = 0, binding = 6) uniform sampler s2;
layout(set = 0, binding = 7) uniform texture2D t0;
layout(set = 0, binding = 8) uniform textureCube t1;
layout(set = 0, binding = 9) uniform texture3D t2;

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
    precise float _126 = a.x * b.x;
    return fma(a.y, b.y, _126);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _109 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _109)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _94 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _94));
}

void main()
{
    precise float _136 = TEXCOORD1.x * 1000.0;
    precise float _139 = sin(roundEven(_136)) * 43758.546875;
    precise float _141 = fract(_139) - 0.5;
    precise float _146 = _141 * cb0._m21.w;
    precise float _149 = fma(_146, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _150 = _149 * 500.0;
    precise float _151 = _149 * 10.0;
    precise float _155 = sin(roundEven(_150)) * 43758.546875;
    precise float _157 = fract(_155) - 0.5;
    precise float _158 = _157 * cb0._m21.w;
    precise float _163 = roundEven(_151) + cb1.m.x;
    precise float _164 = _163 * 250.0;
    precise float _167 = sin(roundEven(_164)) * 43758.546875;
    precise float _169 = fract(_167) - 0.5;
    precise float _170 = fma(_169, 0.004999999888241291046142578125, fma(_158, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _171 = _170 * 10.0;
    precise float _173 = roundEven(_171) + cb1.m.x;
    precise float _174 = _173 * 250.0;
    precise float _177 = sin(roundEven(_174)) * 43758.546875;
    precise float _179 = fract(_177) - 0.5;
    precise float _180 = fma(_179, 0.004999999888241291046142578125, _149);
    float _182;
    float _187;
    _182 = 0.0;
    _187 = 100000.0;
    float _183;
    precise float _186;
    float _188;
    precise float _190;
    float _185 = 0.0;
    float _189 = 0.0;
    for (;;)
    {
        if (_189 > 1.0)
        {
            break;
        }
        precise float _197 = spvNMin(_189, 1.0);
        precise float _198 = 1.0 - _197;
        precise float _199 = _198 * _198;
        float _202 = dp2_f32(vec2(_197), vec2(_198));
        precise float _208 = _202 * cb0._m19.x;
        precise float _209 = _202 * cb0._m19.y;
        precise float _216 = _197 * _197;
        precise float _221 = fma(_216, cb0._m17.x, fma(_199, cb0._m15.x, _208));
        precise float _222 = fma(_216, cb0._m17.y, fma(_199, cb0._m15.y, _209));
        _190 = _189 + 0.100000001490116119384765625;
        precise float _223 = spvNMin(_190, 1.0);
        precise float _224 = 1.0 - _223;
        precise float _225 = _224 * _224;
        float _228 = dp2_f32(vec2(_223), vec2(_224));
        precise float _229 = _228 * cb0._m19.x;
        precise float _230 = _228 * cb0._m19.y;
        precise float _233 = _223 * _223;
        precise float _236 = fma(_233, cb0._m17.x, fma(_225, cb0._m15.x, _229)) - _221;
        precise float _237 = fma(_233, cb0._m17.y, fma(_225, cb0._m15.y, _230)) - _222;
        precise float _238 = _170 - _221;
        precise float _239 = _180 - _222;
        vec2 _240 = vec2(_238, _239);
        vec2 _241 = vec2(_236, _237);
        float _243 = dp2_f32(_241, _241);
        precise float _244 = dp2_f32(_240, _241) / _243;
        precise float _245 = spvNClamp(_244, 0.0, 1.0);
        precise float _251 = -_245;
        vec2 _254 = vec2(fma(_251, _236, _238), fma(_251, _237, _239));
        precise float _257 = sqrt(dp2_f32(_254, _254)) * ((dp2_f32(vec2(_237, -_236), _240) > 0.0) ? 1.0 : (-1.0));
        precise float _258 = sqrt(_243);
        bool _261 = abs(_257) < abs(_187);
        _183 = _261 ? fma(_245, _258, _185) : _182;
        _188 = _261 ? _257 : _187;
        _186 = _185 + _258;
        _182 = _183;
        _185 = _186;
        _187 = _188;
        _189 = _190;
        continue;
    }
    precise float _263 = _182 * 40.0;
    precise float _264 = sin(_263);
    precise float _276 = _170 - cb0._m17.x;
    precise float _277 = _180 - cb0._m17.y;
    vec2 _278 = vec2(_276, _277);
    precise float _281 = sqrt(dp2_f32(_278, _278)) - 0.02999999932944774627685546875;
    precise float _282 = abs(fma(_264, 0.0199999995529651641845703125, _187));
    float _284 = (cb0._m22.x > 0.5) ? spvNMin(_281, _282) : _282;
    precise float _289 = abs(dFdy(_284)) + abs(dFdx(_284));
    bool _292 = cb0._m22.y < 0.5;
    precise float _297 = cb0._m21.y + cb0._m21.x;
    precise float _298 = -_289;
    precise float _299 = fma(_298, 0.5, _297);
    precise float _300 = _284 - _299;
    precise float _302 = fma(_289, 0.5, _297) - _299;
    precise float _303 = _300 / _302;
    precise float _304 = spvNClamp(_303, 0.0, 1.0);
    precise float _318 = cb0._m13.x - cb0._m12.x;
    precise float _319 = cb0._m13.y - cb0._m12.y;
    precise float _320 = cb0._m13.z - cb0._m12.z;
    precise float _321 = cb0._m13.w - cb0._m12.w;
    precise float _322 = fma(_304, _318, cb0._m12.x);
    precise float _323 = fma(_304, _319, cb0._m12.y);
    precise float _324 = fma(_304, _320, cb0._m12.z);
    precise float _325 = fma(_304, _321, cb0._m12.w);
    bool _328 = fma(-_284, 40.0, -0.5) < cos(_263);
    precise float _329 = fma(_298, 0.5, cb0._m21.x);
    precise float _330 = _284 - _329;
    precise float _332 = fma(_289, 0.5, cb0._m21.x) - _329;
    precise float _333 = _330 / _332;
    precise float _334 = spvNClamp(_333, 0.0, 1.0);
    precise float _335 = cb0._m12.x - _322;
    precise float _336 = cb0._m12.y - _323;
    precise float _337 = cb0._m12.z - _324;
    precise float _338 = cb0._m12.w - _325;
    float _343 = _328 ? fma(_334, _335, _322) : _322;
    float _344 = _328 ? fma(_334, _336, _323) : _323;
    float _345 = _328 ? fma(_334, _337, _324) : _324;
    float _346 = _328 ? fma(_334, _338, _325) : _325;
    precise float _347 = fma(cb0._m21.y, 2.0, cb0._m21.x);
    precise float _348 = fma(_298, 0.5, _347);
    precise float _350 = _284 - _348;
    precise float _351 = fma(_289, 0.5, _347) - _348;
    precise float _352 = _350 / _351;
    precise float _354 = abs(fma(-_264, 0.0199999995529651641845703125, _187));
    precise float _355 = _354 - _299;
    precise float _356 = _355 / _302;
    precise float _357 = spvNClamp(_356, 0.0, 1.0);
    precise float _358 = cb0._m13.x - _343;
    precise float _359 = cb0._m13.y - _344;
    precise float _360 = cb0._m13.z - _345;
    precise float _361 = cb0._m13.w - _346;
    precise float _362 = fma(_357, _358, _343);
    precise float _363 = fma(_357, _359, _344);
    precise float _364 = fma(_357, _360, _345);
    precise float _365 = fma(_357, _361, _346);
    precise float _366 = _354 - _348;
    precise float _367 = _366 / _351;
    precise float _369 = spvNClamp(_367, 0.0, 1.0) * spvNClamp(_352, 0.0, 1.0);
    precise float _378 = fma(_334, _318, cb0._m12.x);
    precise float _379 = fma(_334, _319, cb0._m12.y);
    precise float _380 = fma(_334, _320, cb0._m12.z);
    precise float _381 = fma(_334, _321, cb0._m12.w);
    precise float _402 = TEXCOORD1.y * cb0._m6.x;
    precise float _403 = TEXCOORD1.y * cb0._m6.y;
    precise float _404 = TEXCOORD1.y * cb0._m6.z;
    precise float _426 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _402)) + cb0._m10.x;
    precise float _427 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _403)) + cb0._m10.y;
    precise float _428 = fma(cb0._m8.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _404)) + cb0._m10.z;
    float _504;
    float _505;
    float _506;
    float _507;
    if (cb3._m0.x == 1.0)
    {
        bool _437 = cb3._m0.y == 1.0;
        precise float _443 = TEXCOORD1.y * cb3._m3.x;
        precise float _444 = TEXCOORD1.y * cb3._m3.y;
        precise float _445 = TEXCOORD1.y * cb3._m3.z;
        precise float _467 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _443)) + cb3._m7.x;
        precise float _468 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _444)) + cb3._m7.y;
        precise float _469 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _445)) + cb3._m7.z;
        precise float _478 = (_437 ? _467 : TEXCOORD1.x) - cb3._m11.x;
        precise float _479 = (_437 ? _468 : TEXCOORD1.y) - cb3._m11.y;
        precise float _480 = (_437 ? _469 : TEXCOORD1.z) - cb3._m11.z;
        precise float _486 = _478 * cb3._m9.x;
        precise float _487 = _479 * cb3._m9.y;
        precise float _488 = _480 * cb3._m9.z;
        vec4 _499 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_486, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _487, _488));
        _504 = _499.w;
        _505 = _499.z;
        _506 = _499.y;
        _507 = _499.x;
    }
    else
    {
        _504 = 1.0;
        _505 = 1.0;
        _506 = 1.0;
        _507 = 1.0;
    }
    vec3 _514 = vec3(_426, _427, _428);
    precise float _529 = texture(sampler2D(t0, s2), vec2(dp3_f32(_514, _514))).x * texture(samplerCube(t1, s1), _514).w;
    precise float _530 = spvNClamp(dp4_f32(vec4(_507, _506, _505, _504), cb2._m46), 0.0, 1.0) * _529;
    precise float _531 = (_292 ? fma(_369, -_362, _362) : fma(_304, -_378, _378)) * _530;
    precise float _532 = (_292 ? fma(_369, -_363, _363) : fma(_304, -_379, _379)) * _530;
    precise float _533 = (_292 ? fma(_369, -_364, _364) : fma(_304, -_380, _380)) * _530;
    precise float _540 = _531 * cb0._m2.x;
    precise float _541 = _532 * cb0._m2.y;
    precise float _542 = _533 * cb0._m2.z;
    precise float _543 = (_292 ? fma(_369, -_365, _365) : fma(_304, -_381, _381)) * cb0._m2.w;
    SV_Target.x = _540;
    SV_Target.y = _541;
    SV_Target.z = _542;
    SV_Target.w = _543;
}

