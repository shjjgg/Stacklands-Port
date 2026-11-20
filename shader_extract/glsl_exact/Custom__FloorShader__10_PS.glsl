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
    uvec4 _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
    vec3 _m10;
    uint _m11;
    vec3 _m12;
    uint _m13;
    uvec4 _m14;
    vec4 _m15;
    vec4 _m16;
    uvec4 _m17;
    vec4 _m18;
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
    precise float _126 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _126));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _108 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _108)));
}

void main()
{
    precise float _142 = cb0._m15.y + cb0._m16.x;
    precise float _145 = fma(cb0._m15.y, 0.579999983310699462890625, cb0._m16.z);
    precise float _156 = TEXCOORD1.x - cb4._m3.x;
    precise float _157 = TEXCOORD1.z - cb4._m3.z;
    precise float _158 = _156 * 600.0;
    precise float _161 = sin(roundEven(_158)) * 43758.546875;
    precise float _163 = fract(_161) - 0.5;
    precise float _164 = fma(_163, 0.004999999888241291046142578125, _157);
    precise float _165 = _164 * 300.0;
    precise float _168 = sin(roundEven(_165)) * 43758.546875;
    precise float _170 = fract(_168) - 0.5;
    precise float _171 = fma(_170, 0.004999999888241291046142578125, _156);
    precise float _172 = _171 * 1.5;
    precise float _173 = _164 * 1.5;
    precise float _174 = _171 * 600.0;
    vec4 _181 = texture(sampler2D(t0, s2), vec2(_172, _173));
    precise float _192 = abs(_171);
    precise float _193 = abs(TEXCOORD1.y);
    precise float _194 = abs(_164);
    precise float _195 = _192 - _142;
    precise float _196 = _193 - cb0._m16.y;
    precise float _197 = _194 - _145;
    vec3 _201 = vec3(spvNMax(_195, 0.0), spvNMax(_196, 0.0), spvNMax(_197, 0.0));
    precise float _206 = sqrt(dp3_f32(_201, _201)) - cb0._m16.w;
    precise float _207 = 1.0 - _206;
    precise float _208 = _142 + 0.02999999932944774627685546875;
    precise float _209 = cb0._m16.y + 0.02999999932944774627685546875;
    precise float _210 = _145 + 0.02999999932944774627685546875;
    precise float _211 = cb0._m16.w + 0.02999999932944774627685546875;
    precise float _212 = _192 - _208;
    precise float _213 = _193 - _209;
    precise float _214 = _194 - _210;
    vec3 _218 = vec3(spvNMax(_212, 0.0), spvNMax(_213, 0.0), spvNMax(_214, 0.0));
    precise float _221 = sqrt(dp3_f32(_218, _218)) - _211;
    precise float _222 = 1.0 - _221;
    precise float _225 = sin(roundEven(_174)) * 43758.546875;
    precise float _227 = fract(_225) - 0.5;
    precise float _229 = fma(_227, 0.00200000009499490261077880859375, TEXCOORD1.z);
    precise float _230 = fma(_170, 0.00200000009499490261077880859375, TEXCOORD1.x);
    precise float _231 = 1.0 - _222;
    float _234 = float(_231 <= 0.5);
    precise float _241 = 1.0 - cb0._m6.x;
    precise float _242 = 1.0 - cb0._m6.y;
    precise float _243 = 1.0 - cb0._m6.z;
    precise float _244 = fma(_234, _241, cb0._m6.x);
    precise float _245 = fma(_234, _242, cb0._m6.y);
    precise float _246 = fma(_234, _243, cb0._m6.z);
    precise float _251 = abs(dFdy(_207)) + abs(dFdx(_207));
    precise float _252 = -_251;
    precise float _253 = fma(_252, 0.5, 0.5);
    precise float _255 = _207 - _253;
    precise float _257 = fma(_251, 0.5, -_253) + 0.5;
    precise float _258 = _255 / _257;
    precise float _259 = spvNClamp(_258, 0.0, 1.0);
    precise float _271 = fma(_259, fma(cb0._m8.x, spvNClamp(_181.x, 0.0, 1.0), -_244), _244);
    precise float _272 = fma(_259, fma(cb0._m8.y, spvNClamp(_181.y, 0.0, 1.0), -_245), _245);
    precise float _273 = fma(_259, fma(cb0._m8.z, spvNClamp(_181.z, 0.0, 1.0), -_246), _246);
    precise float _274 = _145 - 0.89999997615814208984375;
    precise float _275 = _145 - 0.90999996662139892578125;
    precise float _276 = _145 - 0.88999998569488525390625;
    float _280 = float(_207 >= 0.5);
    precise float _281 = _280 * float(fma(_227, 0.004999999888241291046142578125, TEXCOORD1.z) >= _274);
    precise float _287 = cb0._m12.x - _271;
    precise float _288 = cb0._m12.y - _272;
    precise float _289 = cb0._m12.z - _273;
    precise float _290 = fma(_281, _287, _271);
    precise float _291 = fma(_281, _288, _272);
    precise float _292 = fma(_281, _289, _273);
    precise float _297 = abs(dFdy(_230)) + abs(dFdx(_230));
    precise float _298 = _229 - _275;
    precise float _299 = _229 - _276;
    precise float _300 = _298 / _297;
    precise float _301 = _299 / _297;
    precise float _304 = 1.0 - spvNClamp(_301, 0.0, 1.0);
    precise float _305 = _304 * spvNClamp(_300, 0.0, 1.0);
    precise float _306 = _280 * _305;
    precise float _310 = fma(_306, -_290, _290);
    precise float _311 = fma(_306, -_291, _291);
    precise float _312 = fma(_306, -_292, _292);
    precise float _315 = 0.5 - cb0._m18.x;
    precise float _316 = fma(_252, 0.5, _315);
    precise float _317 = _207 - _316;
    precise float _319 = fma(_251, 0.5, _315) - _316;
    precise float _320 = _317 / _319;
    precise float _322 = 1.0 - _207;
    precise float _323 = _322 - _316;
    precise float _324 = _323 / _319;
    precise float _326 = spvNClamp(_324, 0.0, 1.0) * spvNClamp(_320, 0.0, 1.0);
    precise float _332 = cb0._m10.x - _310;
    precise float _333 = cb0._m10.y - _311;
    precise float _334 = cb0._m10.z - _312;
    precise float _335 = fma(_326, _332, _310);
    precise float _336 = fma(_326, _333, _311);
    precise float _337 = fma(_326, _334, _312);
    precise float _344 = cb1._m4.x - TEXCOORD1.x;
    precise float _345 = cb1._m4.y - TEXCOORD1.y;
    precise float _346 = cb1._m4.z - TEXCOORD1.z;
    float _356 = dp3_f32(vec3(_344, _345, _346), vec3(cb5._m9.z, cb5._m10.z, cb5._m11.z));
    precise float _363 = TEXCOORD1.x - cb3._m25.x;
    precise float _364 = TEXCOORD1.y - cb3._m25.y;
    precise float _365 = TEXCOORD1.z - cb3._m25.z;
    vec3 _366 = vec3(_363, _364, _365);
    precise float _369 = sqrt(dp3_f32(_366, _366)) - _356;
    float _454;
    float _455;
    float _456;
    float _457;
    if (cb6._m0.x == 1.0)
    {
        bool _387 = cb6._m0.y == 1.0;
        precise float _393 = TEXCOORD1.y * cb6._m3.x;
        precise float _394 = TEXCOORD1.y * cb6._m3.y;
        precise float _395 = TEXCOORD1.y * cb6._m3.z;
        precise float _417 = fma(cb6._m5.x, TEXCOORD1.z, fma(cb6._m1.x, TEXCOORD1.x, _393)) + cb6._m7.x;
        precise float _418 = fma(cb6._m5.y, TEXCOORD1.z, fma(cb6._m1.y, TEXCOORD1.x, _394)) + cb6._m7.y;
        precise float _419 = fma(cb6._m5.z, TEXCOORD1.z, fma(cb6._m1.z, TEXCOORD1.x, _395)) + cb6._m7.z;
        precise float _428 = (_387 ? _417 : TEXCOORD1.x) - cb6._m11.x;
        precise float _429 = (_387 ? _418 : TEXCOORD1.y) - cb6._m11.y;
        precise float _430 = (_387 ? _419 : TEXCOORD1.z) - cb6._m11.z;
        precise float _436 = _428 * cb6._m9.x;
        precise float _437 = _429 * cb6._m9.y;
        precise float _438 = _430 * cb6._m9.z;
        vec4 _449 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_436, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _437, _438));
        _454 = _449.w;
        _455 = _449.z;
        _456 = _449.y;
        _457 = _449.x;
    }
    else
    {
        _454 = 1.0;
        _455 = 1.0;
        _456 = 1.0;
        _457 = 1.0;
    }
    precise float _471 = TEXCOORD4.x / TEXCOORD4.w;
    precise float _472 = TEXCOORD4.y / TEXCOORD4.w;
    vec4 _477 = texture(sampler2D(t1, s1), vec2(_471, _472));
    float _478 = _477.x;
    precise float _479 = spvNClamp(dp4_f32(vec4(_457, _456, _455, _454), cb2._m46), 0.0, 1.0) - _478;
    precise float _480 = fma(spvNClamp(fma(fma(cb3._m26, _369, _356), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _479, _478);
    precise float _481 = _480 * _335;
    precise float _482 = _480 * _336;
    precise float _483 = _480 * _337;
    precise float _489 = _481 * cb0._m2.x;
    precise float _490 = _482 * cb0._m2.y;
    precise float _491 = _483 * cb0._m2.z;
    SV_Target.x = fma(_335, TEXCOORD2.x, _489);
    SV_Target.y = fma(_336, TEXCOORD2.y, _490);
    SV_Target.z = fma(_337, TEXCOORD2.z, _491);
    SV_Target.w = 1.0;
}

