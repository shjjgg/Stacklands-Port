#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec2 _m4;
    uvec2 _m5;
    vec2 _m6;
    uvec2 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec2 _m10;
    uvec2 _m11;
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
    precise float _108 = a.x * b.x;
    return fma(a.y, b.y, _108);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _90 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _90)));
}

void main()
{
    precise float _118 = TEXCOORD1.x * 1000.0;
    precise float _121 = sin(roundEven(_118)) * 43758.546875;
    precise float _123 = fract(_121) - 0.5;
    precise float _128 = _123 * cb0._m21.w;
    precise float _131 = fma(_128, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _132 = _131 * 500.0;
    precise float _133 = _131 * 10.0;
    precise float _137 = sin(roundEven(_132)) * 43758.546875;
    precise float _139 = fract(_137) - 0.5;
    precise float _140 = _139 * cb0._m21.w;
    precise float _145 = roundEven(_133) + cb1.m.x;
    precise float _146 = _145 * 250.0;
    precise float _149 = sin(roundEven(_146)) * 43758.546875;
    precise float _151 = fract(_149) - 0.5;
    precise float _152 = fma(_151, 0.004999999888241291046142578125, fma(_140, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _153 = _152 * 10.0;
    precise float _155 = roundEven(_153) + cb1.m.x;
    precise float _156 = _155 * 250.0;
    precise float _159 = sin(roundEven(_156)) * 43758.546875;
    precise float _161 = fract(_159) - 0.5;
    precise float _162 = fma(_161, 0.004999999888241291046142578125, _131);
    float _164;
    float _169;
    _164 = 0.0;
    _169 = 100000.0;
    float _165;
    precise float _168;
    float _170;
    precise float _172;
    float _167 = 0.0;
    float _171 = 0.0;
    for (;;)
    {
        if (_171 > 1.0)
        {
            break;
        }
        precise float _179 = spvNMin(_171, 1.0);
        precise float _180 = 1.0 - _179;
        precise float _181 = _180 * _180;
        float _184 = dp2_f32(vec2(_179), vec2(_180));
        precise float _190 = _184 * cb0._m19.x;
        precise float _191 = _184 * cb0._m19.y;
        precise float _198 = _179 * _179;
        precise float _203 = fma(_198, cb0._m17.x, fma(_181, cb0._m15.x, _190));
        precise float _204 = fma(_198, cb0._m17.y, fma(_181, cb0._m15.y, _191));
        _172 = _171 + 0.100000001490116119384765625;
        precise float _205 = spvNMin(_172, 1.0);
        precise float _206 = 1.0 - _205;
        precise float _207 = _206 * _206;
        float _210 = dp2_f32(vec2(_205), vec2(_206));
        precise float _211 = _210 * cb0._m19.x;
        precise float _212 = _210 * cb0._m19.y;
        precise float _215 = _205 * _205;
        precise float _218 = fma(_215, cb0._m17.x, fma(_207, cb0._m15.x, _211)) - _203;
        precise float _219 = fma(_215, cb0._m17.y, fma(_207, cb0._m15.y, _212)) - _204;
        precise float _220 = _152 - _203;
        precise float _221 = _162 - _204;
        vec2 _222 = vec2(_220, _221);
        vec2 _223 = vec2(_218, _219);
        float _225 = dp2_f32(_223, _223);
        precise float _226 = dp2_f32(_222, _223) / _225;
        precise float _227 = spvNClamp(_226, 0.0, 1.0);
        precise float _233 = -_227;
        vec2 _236 = vec2(fma(_233, _218, _220), fma(_233, _219, _221));
        precise float _239 = sqrt(dp2_f32(_236, _236)) * ((dp2_f32(vec2(_219, -_218), _222) > 0.0) ? 1.0 : (-1.0));
        precise float _240 = sqrt(_225);
        bool _243 = abs(_239) < abs(_169);
        _165 = _243 ? fma(_227, _240, _167) : _164;
        _170 = _243 ? _239 : _169;
        _168 = _167 + _240;
        _164 = _165;
        _167 = _168;
        _169 = _170;
        _171 = _172;
        continue;
    }
    precise float _245 = _164 * 40.0;
    precise float _246 = sin(_245);
    precise float _258 = _152 - cb0._m17.x;
    precise float _259 = _162 - cb0._m17.y;
    vec2 _260 = vec2(_258, _259);
    precise float _263 = sqrt(dp2_f32(_260, _260)) - 0.02999999932944774627685546875;
    precise float _264 = abs(fma(_246, 0.0199999995529651641845703125, _169));
    float _266 = (cb0._m22.x > 0.5) ? spvNMin(_263, _264) : _264;
    precise float _271 = abs(dFdy(_266)) + abs(dFdx(_266));
    bool _274 = cb0._m22.y < 0.5;
    precise float _279 = cb0._m21.y + cb0._m21.x;
    precise float _280 = -_271;
    precise float _281 = fma(_280, 0.5, _279);
    precise float _282 = _266 - _281;
    precise float _284 = fma(_271, 0.5, _279) - _281;
    precise float _285 = _282 / _284;
    precise float _286 = spvNClamp(_285, 0.0, 1.0);
    precise float _300 = cb0._m13.x - cb0._m12.x;
    precise float _301 = cb0._m13.y - cb0._m12.y;
    precise float _302 = cb0._m13.z - cb0._m12.z;
    precise float _303 = cb0._m13.w - cb0._m12.w;
    precise float _304 = fma(_286, _300, cb0._m12.x);
    precise float _305 = fma(_286, _301, cb0._m12.y);
    precise float _306 = fma(_286, _302, cb0._m12.z);
    precise float _307 = fma(_286, _303, cb0._m12.w);
    bool _310 = fma(-_266, 40.0, -0.5) < cos(_245);
    precise float _311 = fma(_280, 0.5, cb0._m21.x);
    precise float _312 = _266 - _311;
    precise float _314 = fma(_271, 0.5, cb0._m21.x) - _311;
    precise float _315 = _312 / _314;
    precise float _316 = spvNClamp(_315, 0.0, 1.0);
    precise float _317 = cb0._m12.x - _304;
    precise float _318 = cb0._m12.y - _305;
    precise float _319 = cb0._m12.z - _306;
    precise float _320 = cb0._m12.w - _307;
    float _325 = _310 ? fma(_316, _317, _304) : _304;
    float _326 = _310 ? fma(_316, _318, _305) : _305;
    float _327 = _310 ? fma(_316, _319, _306) : _306;
    float _328 = _310 ? fma(_316, _320, _307) : _307;
    precise float _329 = fma(cb0._m21.y, 2.0, cb0._m21.x);
    precise float _330 = fma(_280, 0.5, _329);
    precise float _332 = _266 - _330;
    precise float _333 = fma(_271, 0.5, _329) - _330;
    precise float _334 = _332 / _333;
    precise float _336 = abs(fma(-_246, 0.0199999995529651641845703125, _169));
    precise float _337 = _336 - _281;
    precise float _338 = _337 / _284;
    precise float _339 = spvNClamp(_338, 0.0, 1.0);
    precise float _340 = cb0._m13.x - _325;
    precise float _341 = cb0._m13.y - _326;
    precise float _342 = cb0._m13.z - _327;
    precise float _343 = cb0._m13.w - _328;
    precise float _344 = fma(_339, _340, _325);
    precise float _345 = fma(_339, _341, _326);
    precise float _346 = fma(_339, _342, _327);
    precise float _347 = fma(_339, _343, _328);
    precise float _348 = _336 - _330;
    precise float _349 = _348 / _333;
    precise float _351 = spvNClamp(_349, 0.0, 1.0) * spvNClamp(_334, 0.0, 1.0);
    precise float _360 = fma(_316, _300, cb0._m12.x);
    precise float _361 = fma(_316, _301, cb0._m12.y);
    precise float _362 = fma(_316, _302, cb0._m12.z);
    precise float _363 = fma(_316, _303, cb0._m12.w);
    precise float _382 = TEXCOORD1.y * cb0._m6.x;
    precise float _383 = TEXCOORD1.y * cb0._m6.y;
    precise float _400 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _382)) + cb0._m10.x;
    precise float _401 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _383)) + cb0._m10.y;
    float _478;
    float _479;
    float _480;
    float _481;
    if (cb3._m0.x == 1.0)
    {
        bool _410 = cb3._m0.y == 1.0;
        precise float _417 = TEXCOORD1.y * cb3._m3.x;
        precise float _418 = TEXCOORD1.y * cb3._m3.y;
        precise float _419 = TEXCOORD1.y * cb3._m3.z;
        precise float _441 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _417)) + cb3._m7.x;
        precise float _442 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _418)) + cb3._m7.y;
        precise float _443 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _419)) + cb3._m7.z;
        precise float _452 = (_410 ? _441 : TEXCOORD1.x) - cb3._m11.x;
        precise float _453 = (_410 ? _442 : TEXCOORD1.y) - cb3._m11.y;
        precise float _454 = (_410 ? _443 : TEXCOORD1.z) - cb3._m11.z;
        precise float _460 = _452 * cb3._m9.x;
        precise float _461 = _453 * cb3._m9.y;
        precise float _462 = _454 * cb3._m9.z;
        vec4 _473 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(cb3._m0.z, 0.5, 0.75), fma(_460, 0.25, 0.75)), _461, _462));
        _478 = _473.w;
        _479 = _473.z;
        _480 = _473.y;
        _481 = _473.x;
    }
    else
    {
        _478 = 1.0;
        _479 = 1.0;
        _480 = 1.0;
        _481 = 1.0;
    }
    precise float _495 = spvNClamp(dp4_f32(vec4(_481, _480, _479, _478), cb2._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_400, _401)).w;
    precise float _496 = (_274 ? fma(_351, -_344, _344) : fma(_286, -_360, _360)) * _495;
    precise float _497 = (_274 ? fma(_351, -_345, _345) : fma(_286, -_361, _361)) * _495;
    precise float _498 = (_274 ? fma(_351, -_346, _346) : fma(_286, -_362, _362)) * _495;
    precise float _505 = _496 * cb0._m2.x;
    precise float _506 = _497 * cb0._m2.y;
    precise float _507 = _498 * cb0._m2.z;
    precise float _508 = (_274 ? fma(_351, -_347, _347) : fma(_286, -_363, _363)) * cb0._m2.w;
    SV_Target.x = _505;
    SV_Target.y = _506;
    SV_Target.z = _507;
    SV_Target.w = _508;
}

