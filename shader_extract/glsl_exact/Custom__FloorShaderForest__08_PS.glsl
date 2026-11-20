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
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture3D t1;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
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
    precise float _99 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _99));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _81 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _81)));
}

void main()
{
    precise float _115 = cb0._m14.y + cb0._m15.x;
    precise float _118 = fma(cb0._m14.y, 0.579999983310699462890625, cb0._m15.z);
    precise float _129 = TEXCOORD1.x - cb2._m3.x;
    precise float _130 = TEXCOORD1.z - cb2._m3.z;
    precise float _131 = _129 * 600.0;
    precise float _134 = sin(roundEven(_131)) * 43758.546875;
    precise float _136 = fract(_134) - 0.5;
    precise float _137 = fma(_136, 0.004999999888241291046142578125, _130);
    precise float _138 = _137 * 300.0;
    precise float _141 = sin(roundEven(_138)) * 43758.546875;
    precise float _143 = fract(_141) - 0.5;
    precise float _144 = fma(_143, 0.004999999888241291046142578125, _129);
    precise float _145 = _144 * 1.5;
    precise float _146 = _137 * 1.5;
    vec4 _153 = texture(sampler2D(t0, s1), vec2(_145, _146));
    precise float _164 = abs(_144);
    precise float _165 = abs(TEXCOORD1.y);
    precise float _166 = abs(_137);
    precise float _167 = _164 - _115;
    precise float _168 = _165 - cb0._m15.y;
    precise float _169 = _166 - _118;
    vec3 _173 = vec3(spvNMax(_167, 0.0), spvNMax(_168, 0.0), spvNMax(_169, 0.0));
    precise float _178 = sqrt(dp3_f32(_173, _173)) - cb0._m15.w;
    precise float _179 = _115 + 0.02999999932944774627685546875;
    precise float _180 = cb0._m15.y + 0.02999999932944774627685546875;
    precise float _181 = _118 + 0.02999999932944774627685546875;
    precise float _182 = cb0._m15.w + 0.02999999932944774627685546875;
    precise float _183 = _164 - _179;
    precise float _184 = _165 - _180;
    precise float _185 = _166 - _181;
    vec3 _189 = vec3(spvNMax(_183, 0.0), spvNMax(_184, 0.0), spvNMax(_185, 0.0));
    precise float _192 = sqrt(dp3_f32(_189, _189)) - _182;
    precise float _193 = 1.0 - _192;
    precise float _194 = 1.0 - _178;
    precise float _195 = 1.0 - _193;
    float _198 = float(_195 <= 0.5);
    precise float _205 = 1.0 - cb0._m6.x;
    precise float _206 = 1.0 - cb0._m6.y;
    precise float _207 = 1.0 - cb0._m6.z;
    precise float _208 = fma(_198, _205, cb0._m6.x);
    precise float _209 = fma(_198, _206, cb0._m6.y);
    precise float _210 = fma(_198, _207, cb0._m6.z);
    precise float _215 = abs(dFdx(_194)) + abs(dFdy(_194));
    precise float _216 = -_215;
    precise float _217 = fma(_216, 0.5, 0.5);
    precise float _219 = _194 - _217;
    precise float _221 = fma(_215, 0.5, -_217) + 0.5;
    precise float _222 = _219 / _221;
    precise float _223 = spvNClamp(_222, 0.0, 1.0);
    precise float _235 = fma(_223, fma(cb0._m8.x, spvNClamp(_153.x, 0.0, 1.0), -_208), _208);
    precise float _236 = fma(_223, fma(cb0._m8.y, spvNClamp(_153.y, 0.0, 1.0), -_209), _209);
    precise float _237 = fma(_223, fma(cb0._m8.z, spvNClamp(_153.z, 0.0, 1.0), -_210), _210);
    precise float _240 = 0.5 - cb0._m17.x;
    precise float _241 = fma(_216, 0.5, _240);
    precise float _242 = _194 - _241;
    precise float _244 = fma(_215, 0.5, _240) - _241;
    precise float _245 = _242 / _244;
    precise float _247 = 1.0 - _194;
    precise float _248 = _247 - _241;
    precise float _249 = _248 / _244;
    precise float _251 = spvNClamp(_249, 0.0, 1.0) * spvNClamp(_245, 0.0, 1.0);
    precise float _257 = cb0._m10.x - _235;
    precise float _258 = cb0._m10.y - _236;
    precise float _259 = cb0._m10.z - _237;
    precise float _260 = fma(_251, _257, _235);
    precise float _261 = fma(_251, _258, _236);
    precise float _262 = fma(_251, _259, _237);
    float _338;
    float _339;
    float _340;
    float _341;
    if (cb3._m0.x == 1.0)
    {
        bool _271 = cb3._m0.y == 1.0;
        precise float _277 = TEXCOORD1.y * cb3._m3.x;
        precise float _278 = TEXCOORD1.y * cb3._m3.y;
        precise float _279 = TEXCOORD1.y * cb3._m3.z;
        precise float _301 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _277)) + cb3._m7.x;
        precise float _302 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _278)) + cb3._m7.y;
        precise float _303 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _279)) + cb3._m7.z;
        precise float _312 = (_271 ? _301 : TEXCOORD1.x) - cb3._m11.x;
        precise float _313 = (_271 ? _302 : TEXCOORD1.y) - cb3._m11.y;
        precise float _314 = (_271 ? _303 : TEXCOORD1.z) - cb3._m11.z;
        precise float _320 = _312 * cb3._m9.x;
        precise float _321 = _313 * cb3._m9.y;
        precise float _322 = _314 * cb3._m9.z;
        vec4 _333 = texture(sampler3D(t1, s0), vec3(spvNMax(fma(_320, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _321, _322));
        _338 = _333.w;
        _339 = _333.z;
        _340 = _333.y;
        _341 = _333.x;
    }
    else
    {
        _338 = 1.0;
        _339 = 1.0;
        _340 = 1.0;
        _341 = 1.0;
    }
    precise float _348 = spvNClamp(dp4_f32(vec4(_341, _340, _339, _338), cb1._m46), 0.0, 1.0);
    precise float _349 = _348 * _260;
    precise float _350 = _348 * _261;
    precise float _351 = _348 * _262;
    precise float _357 = _349 * cb0._m2.x;
    precise float _358 = _350 * cb0._m2.y;
    precise float _359 = _351 * cb0._m2.z;
    SV_Target.x = fma(_260, TEXCOORD2.x, _357);
    SV_Target.y = fma(_261, TEXCOORD2.y, _358);
    SV_Target.z = fma(_262, TEXCOORD2.z, _359);
    SV_Target.w = 1.0;
}

