#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec4 _m7;
    vec4 _m8;
    vec4 _m9;
    uvec4 _m10;
    vec2 _m11;
    uvec2 _m12;
    vec2 _m13;
    uvec2 _m14;
    vec2 _m15;
    uvec2 _m16;
    vec4 _m17;
    vec4 _m18;
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
layout(set = 0, binding = 8) uniform texture2D t1;
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
    precise float _120 = a.x * b.x;
    return fma(a.y, b.y, _120);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _103 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _103)));
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _88 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _88));
}

void main()
{
    precise float _130 = TEXCOORD1.x * 1000.0;
    precise float _133 = sin(roundEven(_130)) * 43758.546875;
    precise float _135 = fract(_133) - 0.5;
    precise float _140 = _135 * cb0._m17.w;
    precise float _143 = fma(_140, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _144 = _143 * 500.0;
    precise float _145 = _143 * 10.0;
    precise float _149 = sin(roundEven(_144)) * 43758.546875;
    precise float _151 = fract(_149) - 0.5;
    precise float _152 = _151 * cb0._m17.w;
    precise float _157 = roundEven(_145) + cb1.m.x;
    precise float _158 = _157 * 250.0;
    precise float _161 = sin(roundEven(_158)) * 43758.546875;
    precise float _163 = fract(_161) - 0.5;
    precise float _164 = fma(_163, 0.004999999888241291046142578125, fma(_152, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _165 = _164 * 10.0;
    precise float _167 = roundEven(_165) + cb1.m.x;
    precise float _168 = _167 * 250.0;
    precise float _171 = sin(roundEven(_168)) * 43758.546875;
    precise float _173 = fract(_171) - 0.5;
    precise float _174 = fma(_173, 0.004999999888241291046142578125, _143);
    float _176;
    float _181;
    _176 = 0.0;
    _181 = 100000.0;
    float _177;
    precise float _180;
    float _182;
    precise float _184;
    float _179 = 0.0;
    float _183 = 0.0;
    for (;;)
    {
        if (_183 > 1.0)
        {
            break;
        }
        precise float _191 = spvNMin(_183, 1.0);
        precise float _192 = 1.0 - _191;
        precise float _193 = _192 * _192;
        float _196 = dp2_f32(vec2(_191), vec2(_192));
        precise float _202 = _196 * cb0._m15.x;
        precise float _203 = _196 * cb0._m15.y;
        precise float _210 = _191 * _191;
        precise float _215 = fma(_210, cb0._m13.x, fma(_193, cb0._m11.x, _202));
        precise float _216 = fma(_210, cb0._m13.y, fma(_193, cb0._m11.y, _203));
        _184 = _183 + 0.100000001490116119384765625;
        precise float _217 = spvNMin(_184, 1.0);
        precise float _218 = 1.0 - _217;
        precise float _219 = _218 * _218;
        float _222 = dp2_f32(vec2(_217), vec2(_218));
        precise float _223 = _222 * cb0._m15.x;
        precise float _224 = _222 * cb0._m15.y;
        precise float _227 = _217 * _217;
        precise float _230 = fma(_227, cb0._m13.x, fma(_219, cb0._m11.x, _223)) - _215;
        precise float _231 = fma(_227, cb0._m13.y, fma(_219, cb0._m11.y, _224)) - _216;
        precise float _232 = _164 - _215;
        precise float _233 = _174 - _216;
        vec2 _234 = vec2(_232, _233);
        vec2 _235 = vec2(_230, _231);
        float _237 = dp2_f32(_235, _235);
        precise float _238 = dp2_f32(_234, _235) / _237;
        precise float _239 = spvNClamp(_238, 0.0, 1.0);
        precise float _245 = -_239;
        vec2 _248 = vec2(fma(_245, _230, _232), fma(_245, _231, _233));
        precise float _251 = sqrt(dp2_f32(_248, _248)) * ((dp2_f32(vec2(_231, -_230), _234) > 0.0) ? 1.0 : (-1.0));
        precise float _252 = sqrt(_237);
        bool _255 = abs(_251) < abs(_181);
        _177 = _255 ? fma(_239, _252, _179) : _176;
        _182 = _255 ? _251 : _181;
        _180 = _179 + _252;
        _176 = _177;
        _179 = _180;
        _181 = _182;
        _183 = _184;
        continue;
    }
    precise float _257 = _176 * 40.0;
    precise float _258 = sin(_257);
    precise float _270 = _164 - cb0._m13.x;
    precise float _271 = _174 - cb0._m13.y;
    vec2 _272 = vec2(_270, _271);
    precise float _275 = sqrt(dp2_f32(_272, _272)) - 0.02999999932944774627685546875;
    precise float _276 = abs(fma(_258, 0.0199999995529651641845703125, _181));
    float _278 = (cb0._m18.x > 0.5) ? spvNMin(_275, _276) : _276;
    precise float _283 = abs(dFdy(_278)) + abs(dFdx(_278));
    bool _286 = cb0._m18.y < 0.5;
    precise float _291 = cb0._m17.y + cb0._m17.x;
    precise float _292 = -_283;
    precise float _293 = fma(_292, 0.5, _291);
    precise float _294 = _278 - _293;
    precise float _296 = fma(_283, 0.5, _291) - _293;
    precise float _297 = _294 / _296;
    precise float _298 = spvNClamp(_297, 0.0, 1.0);
    precise float _312 = cb0._m9.x - cb0._m8.x;
    precise float _313 = cb0._m9.y - cb0._m8.y;
    precise float _314 = cb0._m9.z - cb0._m8.z;
    precise float _315 = cb0._m9.w - cb0._m8.w;
    precise float _316 = fma(_298, _312, cb0._m8.x);
    precise float _317 = fma(_298, _313, cb0._m8.y);
    precise float _318 = fma(_298, _314, cb0._m8.z);
    precise float _319 = fma(_298, _315, cb0._m8.w);
    bool _322 = fma(-_278, 40.0, -0.5) < cos(_257);
    precise float _323 = fma(_292, 0.5, cb0._m17.x);
    precise float _324 = _278 - _323;
    precise float _326 = fma(_283, 0.5, cb0._m17.x) - _323;
    precise float _327 = _324 / _326;
    precise float _328 = spvNClamp(_327, 0.0, 1.0);
    precise float _329 = cb0._m8.x - _316;
    precise float _330 = cb0._m8.y - _317;
    precise float _331 = cb0._m8.z - _318;
    precise float _332 = cb0._m8.w - _319;
    float _337 = _322 ? fma(_328, _329, _316) : _316;
    float _338 = _322 ? fma(_328, _330, _317) : _317;
    float _339 = _322 ? fma(_328, _331, _318) : _318;
    float _340 = _322 ? fma(_328, _332, _319) : _319;
    precise float _341 = fma(cb0._m17.y, 2.0, cb0._m17.x);
    precise float _342 = fma(_292, 0.5, _341);
    precise float _344 = _278 - _342;
    precise float _345 = fma(_283, 0.5, _341) - _342;
    precise float _346 = _344 / _345;
    precise float _348 = abs(fma(-_258, 0.0199999995529651641845703125, _181));
    precise float _349 = _348 - _293;
    precise float _350 = _349 / _296;
    precise float _351 = spvNClamp(_350, 0.0, 1.0);
    precise float _352 = cb0._m9.x - _337;
    precise float _353 = cb0._m9.y - _338;
    precise float _354 = cb0._m9.z - _339;
    precise float _355 = cb0._m9.w - _340;
    precise float _356 = fma(_351, _352, _337);
    precise float _357 = fma(_351, _353, _338);
    precise float _358 = fma(_351, _354, _339);
    precise float _359 = fma(_351, _355, _340);
    precise float _360 = _348 - _342;
    precise float _361 = _360 / _345;
    precise float _363 = spvNClamp(_361, 0.0, 1.0) * spvNClamp(_346, 0.0, 1.0);
    precise float _372 = fma(_328, _312, cb0._m8.x);
    precise float _373 = fma(_328, _313, cb0._m8.y);
    precise float _374 = fma(_328, _314, cb0._m8.z);
    precise float _375 = fma(_328, _315, cb0._m8.w);
    precise float _396 = TEXCOORD1.y * cb0._m5.x;
    precise float _397 = TEXCOORD1.y * cb0._m5.y;
    precise float _398 = TEXCOORD1.y * cb0._m5.z;
    precise float _399 = TEXCOORD1.y * cb0._m5.w;
    precise float _426 = fma(cb0._m6.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _396)) + cb0._m7.x;
    precise float _427 = fma(cb0._m6.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _397)) + cb0._m7.y;
    precise float _428 = fma(cb0._m6.z, TEXCOORD1.z, fma(cb0._m4.z, TEXCOORD1.x, _398)) + cb0._m7.z;
    precise float _429 = fma(cb0._m6.w, TEXCOORD1.z, fma(cb0._m4.w, TEXCOORD1.x, _399)) + cb0._m7.w;
    float _506;
    float _507;
    float _508;
    float _509;
    if (cb3._m0.x == 1.0)
    {
        bool _438 = cb3._m0.y == 1.0;
        precise float _445 = TEXCOORD1.y * cb3._m3.x;
        precise float _446 = TEXCOORD1.y * cb3._m3.y;
        precise float _447 = TEXCOORD1.y * cb3._m3.z;
        precise float _469 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _445)) + cb3._m7.x;
        precise float _470 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _446)) + cb3._m7.y;
        precise float _471 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _447)) + cb3._m7.z;
        precise float _480 = (_438 ? _469 : TEXCOORD1.x) - cb3._m11.x;
        precise float _481 = (_438 ? _470 : TEXCOORD1.y) - cb3._m11.y;
        precise float _482 = (_438 ? _471 : TEXCOORD1.z) - cb3._m11.z;
        precise float _488 = _480 * cb3._m9.x;
        precise float _489 = _481 * cb3._m9.y;
        precise float _490 = _482 * cb3._m9.z;
        vec4 _501 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_488, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _489, _490));
        _506 = _501.w;
        _507 = _501.z;
        _508 = _501.y;
        _509 = _501.x;
    }
    else
    {
        _506 = 1.0;
        _507 = 1.0;
        _508 = 1.0;
        _509 = 1.0;
    }
    precise float _518 = _426 / _429;
    precise float _519 = _427 / _429;
    precise float _520 = _518 + 0.5;
    precise float _521 = _519 + 0.5;
    precise float _529 = float(_428 > 0.0) * texture(sampler2D(t0, s1), vec2(_520, _521)).w;
    vec3 _530 = vec3(_426, _427, _428);
    precise float _538 = _529 * texture(sampler2D(t1, s2), vec2(dp3_f32(_530, _530))).x;
    precise float _539 = spvNClamp(dp4_f32(vec4(_509, _508, _507, _506), cb2._m46), 0.0, 1.0) * _538;
    precise float _540 = (_286 ? fma(_363, -_356, _356) : fma(_298, -_372, _372)) * _539;
    precise float _541 = (_286 ? fma(_363, -_357, _357) : fma(_298, -_373, _373)) * _539;
    precise float _542 = (_286 ? fma(_363, -_358, _358) : fma(_298, -_374, _374)) * _539;
    precise float _549 = _540 * cb0._m2.x;
    precise float _550 = _541 * cb0._m2.y;
    precise float _551 = _542 * cb0._m2.z;
    precise float _552 = (_286 ? fma(_363, -_359, _359) : fma(_298, -_375, _375)) * cb0._m2.w;
    SV_Target.x = _549;
    SV_Target.y = _550;
    SV_Target.z = _551;
    SV_Target.w = _552;
}

