#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec3 _m5;
    uint _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    vec4 _m13;
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
    vec4 _m39;
    vec4 _m40;
    vec4 _m41;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
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
} cb2;

layout(set = 0, binding = 3) uniform sampler s0;
layout(set = 0, binding = 4) uniform texture3D t0;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 5, component = 0) in vec3 TEXCOORD5;
layout(location = 0, component = 0) out vec4 SV_Target;
layout(location = 1, component = 0) out vec4 SV_Target1;
layout(location = 2, component = 0) out vec4 SV_Target2;
layout(location = 3, component = 0) out vec4 SV_Target3;

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

float dp4_f32(vec4 a, vec4 b)
{
    precise float _79 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _79)));
}

void main()
{
    precise float _96 = TEXCOORD.y * 150.0;
    precise float _99 = sin(roundEven(_96)) * 43758.546875;
    precise float _101 = fract(_99) - 0.5;
    precise float _104 = fma(_101, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _105 = _104 * 150.0;
    precise float _108 = sin(roundEven(_105)) * 43758.546875;
    precise float _110 = fract(_108) - 0.5;
    precise float _111 = fma(_110, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _120 = abs(dFdx(_104)) + abs(dFdy(_104));
    precise float _121 = abs(dFdx(_111)) + abs(dFdy(_111));
    precise float _122 = _121 * 0.2666666805744171142578125;
    precise float _123 = _111 - 0.5;
    precise float _124 = _104 - 0.02999999932944774627685546875;
    precise float _126 = fma(-_124, 1.06382977962493896484375, 1.0);
    precise float _127 = _124 / _120;
    precise float _129 = 0.9700000286102294921875 - _104;
    precise float _130 = _129 / _120;
    precise float _132 = spvNClamp(_130, 0.0, 1.0) * spvNClamp(_127, 0.0, 1.0);
    precise float _135 = fma(_123, 0.2666666805744171142578125, 0.069999992847442626953125) / _122;
    precise float _137 = spvNClamp(_135, 0.0, 1.0) * _132;
    precise float _138 = 0.569999992847442626953125 - fma(_123, 0.2666666805744171142578125, 0.5);
    precise float _139 = _138 / _122;
    precise float _141 = spvNClamp(_139, 0.0, 1.0) * _137;
    precise float _154 = cb0._m7.x - cb0._m5.x;
    precise float _155 = cb0._m7.y - cb0._m5.y;
    precise float _156 = cb0._m7.z - cb0._m5.z;
    precise float _157 = fma(_141, _154, cb0._m5.x);
    precise float _158 = fma(_141, _155, cb0._m5.y);
    precise float _159 = fma(_141, _156, cb0._m5.z);
    float _165 = float(cb0._m13.x >= 0.5);
    precise float _176 = cb0._m11.x - cb0._m9.x;
    precise float _177 = cb0._m11.y - cb0._m9.y;
    precise float _178 = cb0._m11.z - cb0._m9.z;
    precise float _184 = _126 - cb0._m13.y;
    precise float _189 = abs(dFdy(_126)) + abs(dFdx(_126));
    precise float _190 = _184 / _189;
    float _193 = (_141 <= 0.0) ? 0.0 : spvNClamp(_190, 0.0, 1.0);
    precise float _194 = fma(_165, _176, cb0._m9.x) - _157;
    precise float _195 = fma(_165, _177, cb0._m9.y) - _158;
    precise float _196 = fma(_165, _178, cb0._m9.z) - _159;
    precise float _197 = fma(_193, _194, _157);
    precise float _198 = fma(_193, _195, _158);
    precise float _199 = fma(_193, _196, _159);
    vec4 _210 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _312;
    float _313;
    float _314;
    if (cb2._m0.x == 1.0)
    {
        bool _216 = cb2._m0.y == 1.0;
        precise float _224 = TEXCOORD2.y * cb2._m3.x;
        precise float _225 = TEXCOORD2.y * cb2._m3.y;
        precise float _226 = TEXCOORD2.y * cb2._m3.z;
        precise float _252 = fma(cb2._m5.x, TEXCOORD2.z, fma(cb2._m1.x, TEXCOORD2.x, _224)) + cb2._m7.x;
        precise float _253 = fma(cb2._m5.y, TEXCOORD2.z, fma(cb2._m1.y, TEXCOORD2.x, _225)) + cb2._m7.y;
        precise float _254 = fma(cb2._m5.z, TEXCOORD2.z, fma(cb2._m1.z, TEXCOORD2.x, _226)) + cb2._m7.z;
        precise float _263 = (_216 ? _252 : TEXCOORD2.x) - cb2._m11.x;
        precise float _264 = (_216 ? _253 : TEXCOORD2.y) - cb2._m11.y;
        precise float _265 = (_216 ? _254 : TEXCOORD2.z) - cb2._m11.z;
        precise float _271 = _263 * cb2._m9.x;
        precise float _272 = _264 * cb2._m9.y;
        precise float _273 = _265 * cb2._m9.z;
        precise float _274 = _271 * 0.25;
        precise float _277 = cb2._m0.z * 0.5;
        precise float _281 = spvNMin(fma(-cb2._m0.z, 0.5, 0.25), spvNMax(_274, _277));
        precise float _288 = _281 + 0.25;
        precise float _289 = _272 + 0.0;
        precise float _290 = _273 + 0.0;
        precise float _294 = _281 + 0.5;
        _312 = dp4_f32(texture(sampler3D(t0, s0), vec3(_294, _289, _290)), _210);
        _313 = dp4_f32(texture(sampler3D(t0, s0), vec3(_288, _289, _290)), _210);
        _314 = dp4_f32(texture(sampler3D(t0, s0), vec3(_281, _272, _273)), _210);
    }
    else
    {
        _312 = dp4_f32(cb1._m41, _210);
        _313 = dp4_f32(cb1._m40, _210);
        _314 = dp4_f32(cb1._m39, _210);
    }
    precise float _321 = _314 + TEXCOORD5.x;
    precise float _322 = _313 + TEXCOORD5.y;
    precise float _323 = _312 + TEXCOORD5.z;
    precise float _327 = _197 - 0.039999999105930328369140625;
    precise float _328 = _198 - 0.039999999105930328369140625;
    precise float _329 = _199 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _327, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _328, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _329, 0.039999999105930328369140625);
    precise float _340 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _341 = _340 * _197;
    precise float _342 = _340 * _198;
    precise float _343 = _340 * _199;
    precise float _344 = spvNMax(_321, 0.0) * _341;
    precise float _345 = spvNMax(_322, 0.0) * _342;
    precise float _346 = spvNMax(_323, 0.0) * _343;
    SV_Target3.x = exp2(-_344);
    SV_Target3.y = exp2(-_345);
    SV_Target3.z = exp2(-_346);
    SV_Target.x = _341;
    SV_Target.y = _342;
    SV_Target.z = _343;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

