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
    uvec4 _m12;
    uvec4 _m13;
    vec4 _m14;
    vec4 _m15;
    uvec4 _m16;
    vec4 _m17;
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
    precise float _121 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _121));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _103 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _103)));
}

void main()
{
    precise float _137 = cb0._m14.y + cb0._m15.x;
    precise float _140 = fma(cb0._m14.y, 0.579999983310699462890625, cb0._m15.z);
    precise float _151 = TEXCOORD1.x - cb4._m3.x;
    precise float _152 = TEXCOORD1.z - cb4._m3.z;
    precise float _153 = _151 * 600.0;
    precise float _156 = sin(roundEven(_153)) * 43758.546875;
    precise float _158 = fract(_156) - 0.5;
    precise float _159 = fma(_158, 0.004999999888241291046142578125, _152);
    precise float _160 = _159 * 300.0;
    precise float _163 = sin(roundEven(_160)) * 43758.546875;
    precise float _165 = fract(_163) - 0.5;
    precise float _166 = fma(_165, 0.004999999888241291046142578125, _151);
    precise float _167 = _166 * 1.5;
    precise float _168 = _159 * 1.5;
    vec4 _175 = texture(sampler2D(t0, s2), vec2(_167, _168));
    precise float _186 = abs(_166);
    precise float _187 = abs(TEXCOORD1.y);
    precise float _188 = abs(_159);
    precise float _189 = _186 - _137;
    precise float _190 = _187 - cb0._m15.y;
    precise float _191 = _188 - _140;
    vec3 _195 = vec3(spvNMax(_189, 0.0), spvNMax(_190, 0.0), spvNMax(_191, 0.0));
    precise float _200 = sqrt(dp3_f32(_195, _195)) - cb0._m15.w;
    precise float _201 = _137 + 0.02999999932944774627685546875;
    precise float _202 = cb0._m15.y + 0.02999999932944774627685546875;
    precise float _203 = _140 + 0.02999999932944774627685546875;
    precise float _204 = cb0._m15.w + 0.02999999932944774627685546875;
    precise float _205 = _186 - _201;
    precise float _206 = _187 - _202;
    precise float _207 = _188 - _203;
    vec3 _211 = vec3(spvNMax(_205, 0.0), spvNMax(_206, 0.0), spvNMax(_207, 0.0));
    precise float _214 = sqrt(dp3_f32(_211, _211)) - _204;
    precise float _215 = 1.0 - _214;
    precise float _216 = 1.0 - _200;
    precise float _217 = 1.0 - _215;
    float _220 = float(_217 <= 0.5);
    precise float _227 = 1.0 - cb0._m6.x;
    precise float _228 = 1.0 - cb0._m6.y;
    precise float _229 = 1.0 - cb0._m6.z;
    precise float _230 = fma(_220, _227, cb0._m6.x);
    precise float _231 = fma(_220, _228, cb0._m6.y);
    precise float _232 = fma(_220, _229, cb0._m6.z);
    precise float _237 = abs(dFdx(_216)) + abs(dFdy(_216));
    precise float _238 = -_237;
    precise float _239 = fma(_238, 0.5, 0.5);
    precise float _241 = _216 - _239;
    precise float _243 = fma(_237, 0.5, -_239) + 0.5;
    precise float _244 = _241 / _243;
    precise float _245 = spvNClamp(_244, 0.0, 1.0);
    precise float _257 = fma(_245, fma(cb0._m8.x, spvNClamp(_175.x, 0.0, 1.0), -_230), _230);
    precise float _258 = fma(_245, fma(cb0._m8.y, spvNClamp(_175.y, 0.0, 1.0), -_231), _231);
    precise float _259 = fma(_245, fma(cb0._m8.z, spvNClamp(_175.z, 0.0, 1.0), -_232), _232);
    precise float _262 = 0.5 - cb0._m17.x;
    precise float _263 = fma(_238, 0.5, _262);
    precise float _264 = _216 - _263;
    precise float _266 = fma(_237, 0.5, _262) - _263;
    precise float _267 = _264 / _266;
    precise float _269 = 1.0 - _216;
    precise float _270 = _269 - _263;
    precise float _271 = _270 / _266;
    precise float _273 = spvNClamp(_271, 0.0, 1.0) * spvNClamp(_267, 0.0, 1.0);
    precise float _279 = cb0._m10.x - _257;
    precise float _280 = cb0._m10.y - _258;
    precise float _281 = cb0._m10.z - _259;
    precise float _282 = fma(_273, _279, _257);
    precise float _283 = fma(_273, _280, _258);
    precise float _284 = fma(_273, _281, _259);
    precise float _291 = cb1._m4.x - TEXCOORD1.x;
    precise float _292 = cb1._m4.y - TEXCOORD1.y;
    precise float _293 = cb1._m4.z - TEXCOORD1.z;
    float _303 = dp3_f32(vec3(_291, _292, _293), vec3(cb5._m9.z, cb5._m10.z, cb5._m11.z));
    precise float _310 = TEXCOORD1.x - cb3._m25.x;
    precise float _311 = TEXCOORD1.y - cb3._m25.y;
    precise float _312 = TEXCOORD1.z - cb3._m25.z;
    vec3 _313 = vec3(_310, _311, _312);
    precise float _316 = sqrt(dp3_f32(_313, _313)) - _303;
    float _401;
    float _402;
    float _403;
    float _404;
    if (cb6._m0.x == 1.0)
    {
        bool _334 = cb6._m0.y == 1.0;
        precise float _340 = TEXCOORD1.y * cb6._m3.x;
        precise float _341 = TEXCOORD1.y * cb6._m3.y;
        precise float _342 = TEXCOORD1.y * cb6._m3.z;
        precise float _364 = fma(cb6._m5.x, TEXCOORD1.z, fma(cb6._m1.x, TEXCOORD1.x, _340)) + cb6._m7.x;
        precise float _365 = fma(cb6._m5.y, TEXCOORD1.z, fma(cb6._m1.y, TEXCOORD1.x, _341)) + cb6._m7.y;
        precise float _366 = fma(cb6._m5.z, TEXCOORD1.z, fma(cb6._m1.z, TEXCOORD1.x, _342)) + cb6._m7.z;
        precise float _375 = (_334 ? _364 : TEXCOORD1.x) - cb6._m11.x;
        precise float _376 = (_334 ? _365 : TEXCOORD1.y) - cb6._m11.y;
        precise float _377 = (_334 ? _366 : TEXCOORD1.z) - cb6._m11.z;
        precise float _383 = _375 * cb6._m9.x;
        precise float _384 = _376 * cb6._m9.y;
        precise float _385 = _377 * cb6._m9.z;
        vec4 _396 = texture(sampler3D(t2, s0), vec3(spvNMax(fma(_383, 0.25, 0.75), fma(cb6._m0.z, 0.5, 0.75)), _384, _385));
        _401 = _396.w;
        _402 = _396.z;
        _403 = _396.y;
        _404 = _396.x;
    }
    else
    {
        _401 = 1.0;
        _402 = 1.0;
        _403 = 1.0;
        _404 = 1.0;
    }
    precise float _418 = TEXCOORD4.x / TEXCOORD4.w;
    precise float _419 = TEXCOORD4.y / TEXCOORD4.w;
    vec4 _424 = texture(sampler2D(t1, s1), vec2(_418, _419));
    float _425 = _424.x;
    precise float _426 = spvNClamp(dp4_f32(vec4(_404, _403, _402, _401), cb2._m46), 0.0, 1.0) - _425;
    precise float _427 = fma(spvNClamp(fma(fma(cb3._m26, _316, _303), cb3._m24.z, cb3._m24.w), 0.0, 1.0), _426, _425);
    precise float _428 = _427 * _282;
    precise float _429 = _427 * _283;
    precise float _430 = _427 * _284;
    precise float _436 = _428 * cb0._m2.x;
    precise float _437 = _429 * cb0._m2.y;
    precise float _438 = _430 * cb0._m2.z;
    SV_Target.x = fma(_282, TEXCOORD2.x, _436);
    SV_Target.y = fma(_283, TEXCOORD2.y, _437);
    SV_Target.z = fma(_284, TEXCOORD2.z, _438);
    SV_Target.w = 1.0;
}

