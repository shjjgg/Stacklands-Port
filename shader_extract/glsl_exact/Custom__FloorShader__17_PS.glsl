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
    uvec4 _m13;
    vec3 _m14;
    uint _m15;
    vec3 _m16;
    uint _m17;
    vec3 _m18;
    uint _m19;
    vec3 _m20;
    uint _m21;
    uvec4 _m22;
    vec4 _m23;
    vec4 _m24;
    uvec4 _m25;
    vec4 _m26;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
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
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
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
    precise float _105 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _105));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _87)));
}

void main()
{
    precise float _121 = cb0._m23.y + cb0._m24.x;
    precise float _124 = fma(cb0._m23.y, 0.579999983310699462890625, cb0._m24.z);
    precise float _135 = TEXCOORD1.x - cb2._m3.x;
    precise float _136 = TEXCOORD1.z - cb2._m3.z;
    precise float _137 = _135 * 600.0;
    precise float _140 = sin(roundEven(_137)) * 43758.546875;
    precise float _142 = fract(_140) - 0.5;
    precise float _143 = fma(_142, 0.004999999888241291046142578125, _136);
    precise float _144 = _143 * 300.0;
    precise float _147 = sin(roundEven(_144)) * 43758.546875;
    precise float _149 = fract(_147) - 0.5;
    precise float _150 = fma(_149, 0.004999999888241291046142578125, _135);
    precise float _151 = _150 * 1.5;
    precise float _152 = _143 * 1.5;
    precise float _153 = _150 * 600.0;
    vec4 _160 = texture(sampler2D(t0, s2), vec2(_151, _152));
    precise float _171 = abs(_150);
    precise float _172 = abs(TEXCOORD1.y);
    precise float _173 = abs(_143);
    precise float _174 = _171 - _121;
    precise float _175 = _172 - cb0._m24.y;
    precise float _176 = _173 - _124;
    vec3 _180 = vec3(spvNMax(_174, 0.0), spvNMax(_175, 0.0), spvNMax(_176, 0.0));
    precise float _185 = sqrt(dp3_f32(_180, _180)) - cb0._m24.w;
    precise float _186 = 1.0 - _185;
    precise float _187 = _121 + 0.02999999932944774627685546875;
    precise float _188 = cb0._m24.y + 0.02999999932944774627685546875;
    precise float _189 = _124 + 0.02999999932944774627685546875;
    precise float _190 = cb0._m24.w + 0.02999999932944774627685546875;
    precise float _191 = _171 - _187;
    precise float _192 = _172 - _188;
    precise float _193 = _173 - _189;
    vec3 _197 = vec3(spvNMax(_191, 0.0), spvNMax(_192, 0.0), spvNMax(_193, 0.0));
    precise float _200 = sqrt(dp3_f32(_197, _197)) - _190;
    precise float _201 = 1.0 - _200;
    precise float _204 = sin(roundEven(_153)) * 43758.546875;
    precise float _206 = fract(_204) - 0.5;
    precise float _208 = fma(_206, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _209 = fma(_149, 0.00200000009499490261077880859375, TEXCOORD1.x);
    precise float _210 = 1.0 - _201;
    float _213 = float(_210 <= 0.5);
    precise float _220 = 1.0 - cb0._m14.x;
    precise float _221 = 1.0 - cb0._m14.y;
    precise float _222 = 1.0 - cb0._m14.z;
    precise float _223 = fma(_213, _220, cb0._m14.x);
    precise float _224 = fma(_213, _221, cb0._m14.y);
    precise float _225 = fma(_213, _222, cb0._m14.z);
    precise float _230 = abs(dFdy(_186)) + abs(dFdx(_186));
    precise float _231 = -_230;
    precise float _232 = fma(_231, 0.5, 0.5);
    precise float _234 = _186 - _232;
    precise float _236 = fma(_230, 0.5, -_232) + 0.5;
    precise float _237 = _234 / _236;
    precise float _238 = spvNClamp(_237, 0.0, 1.0);
    precise float _250 = fma(_238, fma(cb0._m16.x, spvNClamp(_160.x, 0.0, 1.0), -_223), _223);
    precise float _251 = fma(_238, fma(cb0._m16.y, spvNClamp(_160.y, 0.0, 1.0), -_224), _224);
    precise float _252 = fma(_238, fma(cb0._m16.z, spvNClamp(_160.z, 0.0, 1.0), -_225), _225);
    precise float _253 = _124 - 0.89999997615814208984375;
    precise float _254 = _124 - 0.90999996662139892578125;
    precise float _255 = _124 - 0.88999998569488525390625;
    float _259 = float(_186 >= 0.5);
    precise float _260 = _259 * float(fma(_206, 0.004999999888241291046142578125, TEXCOORD1.z) >= _253);
    precise float _266 = cb0._m20.x - _250;
    precise float _267 = cb0._m20.y - _251;
    precise float _268 = cb0._m20.z - _252;
    precise float _269 = fma(_260, _266, _250);
    precise float _270 = fma(_260, _267, _251);
    precise float _271 = fma(_260, _268, _252);
    precise float _276 = abs(dFdy(_209)) + abs(dFdx(_209));
    precise float _277 = _208 - _254;
    precise float _278 = _208 - _255;
    precise float _279 = _277 / _276;
    precise float _280 = _278 / _276;
    precise float _283 = 1.0 - spvNClamp(_280, 0.0, 1.0);
    precise float _284 = _283 * spvNClamp(_279, 0.0, 1.0);
    precise float _285 = _259 * _284;
    precise float _289 = fma(_285, -_269, _269);
    precise float _290 = fma(_285, -_270, _270);
    precise float _291 = fma(_285, -_271, _271);
    precise float _294 = 0.5 - cb0._m26.x;
    precise float _295 = fma(_231, 0.5, _294);
    precise float _296 = _186 - _295;
    precise float _298 = fma(_230, 0.5, _294) - _295;
    precise float _299 = _296 / _298;
    precise float _301 = 1.0 - _186;
    precise float _302 = _301 - _295;
    precise float _303 = _302 / _298;
    precise float _305 = spvNClamp(_303, 0.0, 1.0) * spvNClamp(_299, 0.0, 1.0);
    precise float _311 = cb0._m18.x - _289;
    precise float _312 = cb0._m18.y - _290;
    precise float _313 = cb0._m18.z - _291;
    precise float _322 = TEXCOORD1.y * cb0._m7.x;
    precise float _323 = TEXCOORD1.y * cb0._m7.y;
    precise float _324 = TEXCOORD1.y * cb0._m7.z;
    precise float _346 = fma(cb0._m9.x, TEXCOORD1.z, fma(cb0._m5.x, TEXCOORD1.x, _322)) + cb0._m11.x;
    precise float _347 = fma(cb0._m9.y, TEXCOORD1.z, fma(cb0._m5.y, TEXCOORD1.x, _323)) + cb0._m11.y;
    precise float _348 = fma(cb0._m9.z, TEXCOORD1.z, fma(cb0._m5.z, TEXCOORD1.x, _324)) + cb0._m11.z;
    float _424;
    float _425;
    float _426;
    float _427;
    if (cb3._m0.x == 1.0)
    {
        bool _357 = cb3._m0.y == 1.0;
        precise float _363 = TEXCOORD1.y * cb3._m3.x;
        precise float _364 = TEXCOORD1.y * cb3._m3.y;
        precise float _365 = TEXCOORD1.y * cb3._m3.z;
        precise float _387 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _363)) + cb3._m7.x;
        precise float _388 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _364)) + cb3._m7.y;
        precise float _389 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _365)) + cb3._m7.z;
        precise float _398 = (_357 ? _387 : TEXCOORD1.x) - cb3._m11.x;
        precise float _399 = (_357 ? _388 : TEXCOORD1.y) - cb3._m11.y;
        precise float _400 = (_357 ? _389 : TEXCOORD1.z) - cb3._m11.z;
        precise float _406 = _398 * cb3._m9.x;
        precise float _407 = _399 * cb3._m9.y;
        precise float _408 = _400 * cb3._m9.z;
        vec4 _419 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_406, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _407, _408));
        _424 = _419.w;
        _425 = _419.z;
        _426 = _419.y;
        _427 = _419.x;
    }
    else
    {
        _424 = 1.0;
        _425 = 1.0;
        _426 = 1.0;
        _427 = 1.0;
    }
    vec3 _435 = vec3(_346, _347, _348);
    precise float _443 = spvNClamp(dp4_f32(vec4(_427, _426, _425, _424), cb1._m46), 0.0, 1.0) * texture(sampler2D(t1, s1), vec2(dp3_f32(_435, _435))).x;
    precise float _444 = _443 * fma(_305, _311, _289);
    precise float _445 = _443 * fma(_305, _312, _290);
    precise float _446 = _443 * fma(_305, _313, _291);
    precise float _452 = _444 * cb0._m2.x;
    precise float _453 = _445 * cb0._m2.y;
    precise float _454 = _446 * cb0._m2.z;
    SV_Target.x = _452;
    SV_Target.y = _453;
    SV_Target.z = _454;
    SV_Target.w = 1.0;
}

