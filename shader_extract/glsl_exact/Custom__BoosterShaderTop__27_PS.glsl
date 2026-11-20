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
    vec4 _m39;
    vec4 _m40;
    vec4 _m41;
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

float dp3_f32(vec3 a, vec3 b)
{
    precise float _121 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _121));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _110 = a.x * b.x;
    return fma(a.y, b.y, _110);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _92 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _92)));
}

void main()
{
    precise float _136 = TEXCOORD.y * 150.0;
    precise float _137 = TEXCOORD.x * 20.0;
    precise float _138 = TEXCOORD.y * 1.0;
    precise float _141 = sin(roundEven(_136)) * 43758.546875;
    precise float _143 = fma(fract(_141), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _144 = _143 * 150.0;
    precise float _147 = sin(roundEven(_144)) * 43758.546875;
    precise float _149 = fma(fract(_147), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _158 = abs(dFdx(_143)) + abs(dFdy(_143));
    precise float _159 = abs(dFdx(_149)) + abs(dFdy(_149));
    precise float _160 = 0.5 - TEXCOORD.x;
    precise float _161 = 0.550000011920928955078125 - TEXCOORD.y;
    vec4 _167 = texture(sampler2D(t0, s1), vec2(_137, _138));
    float _168 = _167.x;
    float _169 = _167.y;
    float _170 = _167.z;
    precise float _178 = _168 * cb0._m5.x;
    precise float _179 = _169 * cb0._m5.y;
    precise float _180 = _170 * cb0._m5.z;
    precise float _193 = TEXCOORD2.x - cb1._m4.x;
    precise float _194 = TEXCOORD2.y - cb1._m4.y;
    precise float _195 = TEXCOORD2.z - cb1._m4.z;
    vec3 _196 = vec3(_193, _194, _195);
    precise float _198 = inversesqrt(dp3_f32(_196, _196));
    precise float _199 = _198 * _193;
    precise float _200 = _198 * _195;
    precise float _201 = TEXCOORD.y + TEXCOORD.x;
    precise float _202 = TEXCOORD.y + TEXCOORD.y;
    precise float _206 = fma(-_200, 5.0, _202);
    precise float _207 = _206 * 10.0;
    precise float _209 = fma(sin(_207), 0.0199999995529651641845703125, fma(-_199, 5.0, _201));
    precise float _210 = _209 * 30.0;
    vec4 _217 = texture(sampler2D(t1, s2), vec2(_209, fma(cos(_210), 0.0199999995529651641845703125, _206)));
    vec2 _223 = vec2(fma(_160, 1.75, 0.0), fma(_161, 1.75, -0.050000011920928955078125));
    precise float _226 = sqrt(dp2_f32(_223, _223)) - 0.400390625;
    precise float _227 = _226 / _158;
    precise float _229 = 1.0 - spvNClamp(_227, 0.0, 1.0);
    precise float _244 = _143 - 0.1167768537998199462890625;
    precise float _245 = 0.88322317600250244140625 - _143;
    precise float _246 = _245 / _158;
    precise float _247 = _244 / _158;
    precise float _250 = spvNClamp(_246, 0.0, 1.0) * spvNClamp(_247, 0.0, 1.0);
    precise float _251 = _149 - 0.02999999932944774627685546875;
    precise float _252 = _251 / _159;
    precise float _254 = spvNClamp(_252, 0.0, 1.0) * _250;
    precise float _255 = 0.9700000286102294921875 - _149;
    precise float _256 = _255 / _159;
    precise float _258 = spvNClamp(_256, 0.0, 1.0) * _254;
    precise float _259 = fma(_217.x, 0.5, fma(_229, fma(-cb0._m5.x, _168, cb0._m7.x), _178));
    precise float _260 = fma(_217.y, 0.5, fma(_229, fma(-cb0._m5.y, _169, cb0._m7.y), _179));
    precise float _261 = fma(_217.z, 0.5, fma(_229, fma(-cb0._m5.z, _170, cb0._m7.z), _180));
    precise float _262 = _259 * _258;
    precise float _263 = _260 * _258;
    precise float _264 = _261 * _258;
    vec4 _277 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _373;
    float _374;
    float _375;
    if (cb3._m0.x == 1.0)
    {
        bool _283 = cb3._m0.y == 1.0;
        precise float _289 = TEXCOORD2.y * cb3._m3.x;
        precise float _290 = TEXCOORD2.y * cb3._m3.y;
        precise float _291 = TEXCOORD2.y * cb3._m3.z;
        precise float _313 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _289)) + cb3._m7.x;
        precise float _314 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _290)) + cb3._m7.y;
        precise float _315 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _291)) + cb3._m7.z;
        precise float _324 = (_283 ? _313 : TEXCOORD2.x) - cb3._m11.x;
        precise float _325 = (_283 ? _314 : TEXCOORD2.y) - cb3._m11.y;
        precise float _326 = (_283 ? _315 : TEXCOORD2.z) - cb3._m11.z;
        precise float _332 = _324 * cb3._m9.x;
        precise float _333 = _325 * cb3._m9.y;
        precise float _334 = _326 * cb3._m9.z;
        precise float _335 = _332 * 0.25;
        precise float _338 = cb3._m0.z * 0.5;
        precise float _342 = spvNMin(fma(-cb3._m0.z, 0.5, 0.25), spvNMax(_335, _338));
        precise float _349 = _342 + 0.25;
        precise float _350 = _333 + 0.0;
        precise float _351 = _334 + 0.0;
        precise float _355 = _342 + 0.5;
        _373 = dp4_f32(texture(sampler3D(t2, s0), vec3(_355, _350, _351)), _277);
        _374 = dp4_f32(texture(sampler3D(t2, s0), vec3(_349, _350, _351)), _277);
        _375 = dp4_f32(texture(sampler3D(t2, s0), vec3(_342, _333, _334)), _277);
    }
    else
    {
        _373 = dp4_f32(cb2._m41, _277);
        _374 = dp4_f32(cb2._m40, _277);
        _375 = dp4_f32(cb2._m39, _277);
    }
    precise float _382 = _375 + TEXCOORD5.x;
    precise float _383 = _374 + TEXCOORD5.y;
    precise float _384 = _373 + TEXCOORD5.z;
    SV_Target1.x = fma(cb0._m4.y, fma(_258, _259, -0.039999999105930328369140625), 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, fma(_258, _260, -0.039999999105930328369140625), 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, fma(_258, _261, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _401 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _402 = _401 * _262;
    precise float _403 = _401 * _263;
    precise float _404 = _401 * _264;
    precise float _405 = spvNMax(_382, 0.0) * _402;
    precise float _406 = spvNMax(_383, 0.0) * _403;
    precise float _407 = spvNMax(_384, 0.0) * _404;
    SV_Target3.x = exp2(-_405);
    SV_Target3.y = exp2(-_406);
    SV_Target3.z = exp2(-_407);
    SV_Target.x = _402;
    SV_Target.y = _403;
    SV_Target.z = _404;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

