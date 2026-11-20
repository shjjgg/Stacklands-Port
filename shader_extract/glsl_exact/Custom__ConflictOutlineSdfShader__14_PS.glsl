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
    vec2 _m14;
    uvec2 _m15;
    vec4 _m16;
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
layout(set = 0, binding = 7) uniform texture2D t0;
layout(set = 0, binding = 8) uniform texture3D t1;

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

float dp2_f32(vec2 a, vec2 b)
{
    precise float _99 = a.x * b.x;
    return fma(a.y, b.y, _99);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _81 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _81)));
}

void main()
{
    precise float _109 = TEXCOORD1.x * 800.0;
    precise float _112 = sin(roundEven(_109)) * 43758.546875;
    precise float _114 = fract(_112) - 0.5;
    precise float _117 = fma(_114, 0.007000000216066837310791015625, TEXCOORD1.z);
    precise float _118 = _117 * 400.0;
    precise float _119 = _117 * 10.0;
    precise float _123 = sin(roundEven(_118)) * 43758.546875;
    precise float _125 = fract(_123) - 0.5;
    precise float _131 = roundEven(_119) + cb1.m.x;
    precise float _132 = _131 * 200.0;
    precise float _135 = sin(roundEven(_132)) * 43758.546875;
    precise float _137 = fract(_135) - 0.5;
    precise float _138 = fma(_137, 0.00999999977648258209228515625, fma(_125, 0.007000000216066837310791015625, TEXCOORD1.x));
    precise float _139 = _138 * 10.0;
    precise float _141 = roundEven(_139) + cb1.m.x;
    precise float _142 = _141 * 200.0;
    precise float _145 = sin(roundEven(_142)) * 43758.546875;
    precise float _147 = fract(_145) - 0.5;
    precise float _154 = _138 - cb3._m3.x;
    precise float _155 = fma(_147, 0.00999999977648258209228515625, _117) - cb3._m3.z;
    vec2 _170 = vec2(spvNMax(fma(-cb0._m14.x, 0.5, abs(_154)), 0.0), spvNMax(fma(-cb0._m14.y, 0.5, abs(_155)), 0.0));
    precise float _172 = sqrt(dp2_f32(_170, _170));
    precise float _177 = abs(dFdy(_172)) + abs(dFdx(_172));
    precise float _178 = -_177;
    precise float _181 = fma(_178, 0.5, cb0._m16.x);
    precise float _182 = _172 - _181;
    precise float _184 = fma(_177, 0.5, cb0._m16.x) - _181;
    precise float _185 = _182 / _184;
    precise float _186 = spvNClamp(_185, 0.0, 1.0);
    precise float _200 = cb0._m13.x - cb0._m12.x;
    precise float _201 = cb0._m13.y - cb0._m12.y;
    precise float _202 = cb0._m13.z - cb0._m12.z;
    precise float _203 = cb0._m13.w - cb0._m12.w;
    precise float _204 = fma(_186, _200, cb0._m12.x);
    precise float _205 = fma(_186, _201, cb0._m12.y);
    precise float _206 = fma(_186, _202, cb0._m12.z);
    precise float _207 = fma(_186, _203, cb0._m12.w);
    precise float _208 = cb0._m16.x + cb0._m16.x;
    precise float _209 = fma(_178, 0.5, _208);
    precise float _211 = _172 - _209;
    precise float _212 = fma(_177, 0.5, _208) - _209;
    precise float _213 = _211 / _212;
    precise float _214 = spvNClamp(_213, 0.0, 1.0);
    precise float _229 = TEXCOORD1.y * cb0._m6.x;
    precise float _230 = TEXCOORD1.y * cb0._m6.y;
    precise float _247 = fma(cb0._m8.x, TEXCOORD1.z, fma(cb0._m4.x, TEXCOORD1.x, _229)) + cb0._m10.x;
    precise float _248 = fma(cb0._m8.y, TEXCOORD1.z, fma(cb0._m4.y, TEXCOORD1.x, _230)) + cb0._m10.y;
    float _326;
    float _327;
    float _328;
    float _329;
    if (cb4._m0.x == 1.0)
    {
        bool _258 = cb4._m0.y == 1.0;
        precise float _265 = TEXCOORD1.y * cb4._m3.x;
        precise float _266 = TEXCOORD1.y * cb4._m3.y;
        precise float _267 = TEXCOORD1.y * cb4._m3.z;
        precise float _289 = fma(cb4._m5.x, TEXCOORD1.z, fma(cb4._m1.x, TEXCOORD1.x, _265)) + cb4._m7.x;
        precise float _290 = fma(cb4._m5.y, TEXCOORD1.z, fma(cb4._m1.y, TEXCOORD1.x, _266)) + cb4._m7.y;
        precise float _291 = fma(cb4._m5.z, TEXCOORD1.z, fma(cb4._m1.z, TEXCOORD1.x, _267)) + cb4._m7.z;
        precise float _300 = (_258 ? _289 : TEXCOORD1.x) - cb4._m11.x;
        precise float _301 = (_258 ? _290 : TEXCOORD1.y) - cb4._m11.y;
        precise float _302 = (_258 ? _291 : TEXCOORD1.z) - cb4._m11.z;
        precise float _308 = _300 * cb4._m9.x;
        precise float _309 = _301 * cb4._m9.y;
        precise float _310 = _302 * cb4._m9.z;
        vec4 _321 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(cb4._m0.z, 0.5, 0.75), fma(_308, 0.25, 0.75)), _309, _310));
        _326 = _321.w;
        _327 = _321.z;
        _328 = _321.y;
        _329 = _321.x;
    }
    else
    {
        _326 = 1.0;
        _327 = 1.0;
        _328 = 1.0;
        _329 = 1.0;
    }
    precise float _343 = spvNClamp(dp4_f32(vec4(_329, _328, _327, _326), cb2._m46), 0.0, 1.0) * texture(sampler2D(t0, s1), vec2(_247, _248)).w;
    precise float _344 = fma(_214, -_204, _204) * _343;
    precise float _345 = fma(_214, -_205, _205) * _343;
    precise float _346 = fma(_214, -_206, _206) * _343;
    precise float _353 = _344 * cb0._m2.x;
    precise float _354 = _345 * cb0._m2.y;
    precise float _355 = _346 * cb0._m2.z;
    precise float _356 = fma(_214, -_207, _207) * cb0._m2.w;
    SV_Target.x = _353;
    SV_Target.y = _354;
    SV_Target.z = _355;
    SV_Target.w = _356;
}

