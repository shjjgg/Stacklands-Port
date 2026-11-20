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
    vec2 _m6;
    uvec2 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec4 _m10;
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
layout(set = 0, binding = 5) uniform texture3D t0;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
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
    precise float _88 = a.x * b.x;
    return fma(a.y, b.y, _88);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _70 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _70)));
}

void main()
{
    precise float _98 = TEXCOORD1.x * 1000.0;
    precise float _101 = sin(roundEven(_98)) * 43758.546875;
    precise float _103 = fract(_101) - 0.5;
    precise float _108 = _103 * cb0._m10.w;
    precise float _111 = fma(_108, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _112 = _111 * 500.0;
    precise float _113 = _111 * 10.0;
    precise float _117 = sin(roundEven(_112)) * 43758.546875;
    precise float _119 = fract(_117) - 0.5;
    precise float _120 = _119 * cb0._m10.w;
    precise float _125 = roundEven(_113) + cb1.m.x;
    precise float _126 = _125 * 250.0;
    precise float _129 = sin(roundEven(_126)) * 43758.546875;
    precise float _131 = fract(_129) - 0.5;
    precise float _132 = fma(_131, 0.004999999888241291046142578125, fma(_120, 0.004999999888241291046142578125, TEXCOORD1.x));
    precise float _133 = _132 * 10.0;
    precise float _135 = roundEven(_133) + cb1.m.x;
    precise float _136 = _135 * 250.0;
    precise float _139 = sin(roundEven(_136)) * 43758.546875;
    precise float _141 = fract(_139) - 0.5;
    precise float _142 = fma(_141, 0.004999999888241291046142578125, _111);
    precise float _152 = cb0._m8.x - cb0._m6.x;
    precise float _153 = cb0._m8.y - cb0._m6.y;
    vec2 _154 = vec2(_152, _153);
    float _155 = dp2_f32(_154, _154);
    precise float _156 = inversesqrt(_155);
    precise float _157 = _156 * _152;
    precise float _158 = _156 * _153;
    precise float _159 = 0.0 - _158;
    precise float _164 = fma(_152, _156, _159) * cb0._m10.z;
    precise float _165 = fma(_153, _156, _157) * cb0._m10.z;
    precise float _170 = fma(_152, _156, -_159) * cb0._m10.z;
    precise float _171 = fma(_153, _156, -_157) * cb0._m10.z;
    precise float _172 = _132 - cb0._m6.x;
    precise float _173 = _142 - cb0._m6.y;
    precise float _176 = dp2_f32(vec2(_172, _173), _154) / _155;
    precise float _178 = -spvNClamp(_176, 0.0, 1.0);
    vec2 _181 = vec2(fma(_178, _152, _172), fma(_178, _153, _173));
    precise float _183 = _132 - cb0._m8.x;
    precise float _184 = _142 - cb0._m8.y;
    vec2 _185 = vec2(_183, _184);
    precise float _186 = -_164;
    precise float _187 = -_165;
    vec2 _188 = vec2(_186, _187);
    precise float _191 = dp2_f32(_185, _188) / dp2_f32(_188, _188);
    precise float _193 = -spvNClamp(_191, 0.0, 1.0);
    vec2 _196 = vec2(fma(_193, _186, _183), fma(_193, _187, _184));
    precise float _201 = -_170;
    precise float _202 = -_171;
    vec2 _203 = vec2(_201, _202);
    precise float _206 = dp2_f32(_185, _203) / dp2_f32(_203, _203);
    precise float _208 = -spvNClamp(_206, 0.0, 1.0);
    vec2 _211 = vec2(fma(_208, _201, _183), fma(_208, _202, _184));
    precise float _214 = spvNMin(sqrt(dp2_f32(_211, _211)), spvNMin(sqrt(dp2_f32(_196, _196)), sqrt(dp2_f32(_181, _181))));
    precise float _219 = abs(dFdy(_214)) + abs(dFdx(_214));
    precise float _223 = fma(-_219, 0.5, cb0._m10.x);
    precise float _225 = _214 - _223;
    precise float _226 = fma(_219, 0.5, cb0._m10.x) - _223;
    precise float _227 = _225 / _226;
    precise float _228 = spvNClamp(_227, 0.0, 1.0);
    precise float _242 = cb0._m5.x - cb0._m4.x;
    precise float _243 = cb0._m5.y - cb0._m4.y;
    precise float _244 = cb0._m5.z - cb0._m4.z;
    precise float _245 = cb0._m5.w - cb0._m4.w;
    precise float _246 = fma(_228, _242, cb0._m4.x);
    precise float _247 = fma(_228, _243, cb0._m4.y);
    precise float _248 = fma(_228, _244, cb0._m4.z);
    precise float _249 = fma(_228, _245, cb0._m4.w);
    precise float _254 = fma(_228, -_246, _246);
    precise float _255 = fma(_228, -_247, _247);
    precise float _256 = fma(_228, -_248, _248);
    float _337;
    float _338;
    float _339;
    float _340;
    if (cb3._m0.x == 1.0)
    {
        bool _267 = cb3._m0.y == 1.0;
        precise float _276 = TEXCOORD1.y * cb3._m3.x;
        precise float _277 = TEXCOORD1.y * cb3._m3.y;
        precise float _278 = TEXCOORD1.y * cb3._m3.z;
        precise float _300 = fma(cb3._m5.x, TEXCOORD1.z, fma(cb3._m1.x, TEXCOORD1.x, _276)) + cb3._m7.x;
        precise float _301 = fma(cb3._m5.y, TEXCOORD1.z, fma(cb3._m1.y, TEXCOORD1.x, _277)) + cb3._m7.y;
        precise float _302 = fma(cb3._m5.z, TEXCOORD1.z, fma(cb3._m1.z, TEXCOORD1.x, _278)) + cb3._m7.z;
        precise float _311 = (_267 ? _300 : TEXCOORD1.x) - cb3._m11.x;
        precise float _312 = (_267 ? _301 : TEXCOORD1.y) - cb3._m11.y;
        precise float _313 = (_267 ? _302 : TEXCOORD1.z) - cb3._m11.z;
        precise float _319 = _311 * cb3._m9.x;
        precise float _320 = _312 * cb3._m9.y;
        precise float _321 = _313 * cb3._m9.z;
        vec4 _332 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_319, 0.25, 0.75), fma(cb3._m0.z, 0.5, 0.75)), _320, _321));
        _337 = _332.w;
        _338 = _332.z;
        _339 = _332.y;
        _340 = _332.x;
    }
    else
    {
        _337 = 1.0;
        _338 = 1.0;
        _339 = 1.0;
        _340 = 1.0;
    }
    precise float _346 = spvNClamp(dp4_f32(vec4(_340, _339, _338, _337), cb2._m46), 0.0, 1.0);
    precise float _353 = _254 * TEXCOORD2.x;
    precise float _354 = _255 * TEXCOORD2.y;
    precise float _355 = _256 * TEXCOORD2.z;
    precise float _356 = _254 * _346;
    precise float _357 = _255 * _346;
    precise float _358 = _256 * _346;
    SV_Target.x = fma(_356, cb0._m2.x, _353);
    SV_Target.y = fma(_357, cb0._m2.y, _354);
    SV_Target.z = fma(_358, cb0._m2.z, _355);
    SV_Target.w = fma(fma(_228, -_249, _249), cb0._m2.w, 0.0);
}

