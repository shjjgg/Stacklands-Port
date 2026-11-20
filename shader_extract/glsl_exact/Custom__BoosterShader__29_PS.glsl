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
    uvec4 _m9;
    vec3 _m10;
    uint _m11;
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
    precise float _134 = TEXCOORD.y * 150.0;
    precise float _137 = sin(roundEven(_134)) * 43758.546875;
    precise float _141 = fma(fract(_137), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _142 = _141 * 150.0;
    precise float _145 = sin(roundEven(_142)) * 43758.546875;
    precise float _147 = fma(fract(_145), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _156 = abs(dFdx(_141)) + abs(dFdy(_141));
    precise float _157 = abs(dFdx(_147)) + abs(dFdy(_147));
    precise float _158 = TEXCOORD.x - 0.5;
    precise float _159 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _160 = fma(_158, 1.75, 0.5);
    precise float _161 = fma(_159, 1.75, 0.4000000059604644775390625);
    precise float _173 = float(_160 <= 1.0) * float(_160 >= 0.0);
    precise float _174 = float(_161 >= 0.0) * _173;
    vec4 _180 = texture(sampler2D(t0, s1), vec2(_160, _161));
    float _181 = _180.x;
    float _182 = _180.w;
    precise float _184 = fma(-_174, float(_161 <= 1.0), 1.0);
    precise float _188 = fma(_184, -_182, _182);
    precise float _202 = TEXCOORD2.x - cb1._m4.x;
    precise float _203 = TEXCOORD2.y - cb1._m4.y;
    precise float _204 = TEXCOORD2.z - cb1._m4.z;
    vec3 _205 = vec3(_202, _203, _204);
    precise float _207 = inversesqrt(dp3_f32(_205, _205));
    precise float _208 = _207 * _202;
    precise float _209 = _207 * _204;
    precise float _210 = TEXCOORD.y + TEXCOORD.x;
    precise float _211 = TEXCOORD.y + TEXCOORD.y;
    precise float _215 = fma(-_209, 5.0, _211);
    precise float _216 = _215 * 10.0;
    precise float _218 = fma(sin(_216), 0.0199999995529651641845703125, fma(-_208, 5.0, _210));
    precise float _219 = _218 * 30.0;
    vec4 _226 = texture(sampler2D(t1, s2), vec2(_218, fma(cos(_219), 0.0199999995529651641845703125, _215)));
    vec2 _230 = vec2(fma(_158, 1.75, 0.0), fma(_159, 1.75, -0.0999999940395355224609375));
    precise float _233 = sqrt(dp2_f32(_230, _230)) - 0.400390625;
    precise float _234 = _233 / _156;
    precise float _236 = 1.0 - spvNClamp(_234, 0.0, 1.0);
    precise float _248 = cb0._m7.x - cb0._m5.x;
    precise float _249 = cb0._m7.y - cb0._m5.y;
    precise float _250 = cb0._m7.z - cb0._m5.z;
    precise float _251 = fma(_236, _248, cb0._m5.x);
    precise float _252 = fma(_236, _249, cb0._m5.y);
    precise float _253 = fma(_236, _250, cb0._m5.z);
    precise float _254 = 1.0 - fma(_184, -_181, _181);
    precise float _260 = cb0._m10.x - cb0._m5.x;
    precise float _261 = cb0._m10.y - cb0._m5.y;
    precise float _262 = cb0._m10.z - cb0._m5.z;
    precise float _266 = fma(_254, _260, cb0._m5.x) - _251;
    precise float _267 = fma(_254, _261, cb0._m5.y) - _252;
    precise float _268 = fma(_254, _262, cb0._m5.z) - _253;
    precise float _272 = _141 - 0.1167768537998199462890625;
    precise float _273 = _272 / _156;
    precise float _275 = 0.88322317600250244140625 - _141;
    precise float _276 = _275 / _156;
    precise float _278 = spvNClamp(_276, 0.0, 1.0) * spvNClamp(_273, 0.0, 1.0);
    precise float _279 = _147 - 0.02999999932944774627685546875;
    precise float _280 = _279 / _157;
    precise float _282 = spvNClamp(_280, 0.0, 1.0) * _278;
    precise float _283 = 0.9700000286102294921875 - _147;
    precise float _284 = _283 / _157;
    precise float _286 = spvNClamp(_284, 0.0, 1.0) * _282;
    precise float _287 = fma(_226.x, 0.5, fma(_188, _266, _251));
    precise float _288 = fma(_226.y, 0.5, fma(_188, _267, _252));
    precise float _289 = fma(_226.z, 0.5, fma(_188, _268, _253));
    precise float _290 = _287 * _286;
    precise float _291 = _288 * _286;
    precise float _292 = _289 * _286;
    vec4 _304 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _400;
    float _401;
    float _402;
    if (cb3._m0.x == 1.0)
    {
        bool _310 = cb3._m0.y == 1.0;
        precise float _316 = TEXCOORD2.y * cb3._m3.x;
        precise float _317 = TEXCOORD2.y * cb3._m3.y;
        precise float _318 = TEXCOORD2.y * cb3._m3.z;
        precise float _340 = fma(cb3._m5.x, TEXCOORD2.z, fma(cb3._m1.x, TEXCOORD2.x, _316)) + cb3._m7.x;
        precise float _341 = fma(cb3._m5.y, TEXCOORD2.z, fma(cb3._m1.y, TEXCOORD2.x, _317)) + cb3._m7.y;
        precise float _342 = fma(cb3._m5.z, TEXCOORD2.z, fma(cb3._m1.z, TEXCOORD2.x, _318)) + cb3._m7.z;
        precise float _351 = (_310 ? _340 : TEXCOORD2.x) - cb3._m11.x;
        precise float _352 = (_310 ? _341 : TEXCOORD2.y) - cb3._m11.y;
        precise float _353 = (_310 ? _342 : TEXCOORD2.z) - cb3._m11.z;
        precise float _359 = _351 * cb3._m9.x;
        precise float _360 = _352 * cb3._m9.y;
        precise float _361 = _353 * cb3._m9.z;
        precise float _362 = _359 * 0.25;
        precise float _365 = cb3._m0.z * 0.5;
        precise float _369 = spvNMin(fma(-cb3._m0.z, 0.5, 0.25), spvNMax(_362, _365));
        precise float _376 = _369 + 0.25;
        precise float _377 = _360 + 0.0;
        precise float _378 = _361 + 0.0;
        precise float _382 = _369 + 0.5;
        _400 = dp4_f32(texture(sampler3D(t2, s0), vec3(_382, _377, _378)), _304);
        _401 = dp4_f32(texture(sampler3D(t2, s0), vec3(_376, _377, _378)), _304);
        _402 = dp4_f32(texture(sampler3D(t2, s0), vec3(_369, _360, _361)), _304);
    }
    else
    {
        _400 = dp4_f32(cb2._m41, _304);
        _401 = dp4_f32(cb2._m40, _304);
        _402 = dp4_f32(cb2._m39, _304);
    }
    precise float _409 = _402 + TEXCOORD5.x;
    precise float _410 = _401 + TEXCOORD5.y;
    precise float _411 = _400 + TEXCOORD5.z;
    SV_Target1.x = fma(cb0._m4.y, fma(_286, _287, -0.039999999105930328369140625), 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, fma(_286, _288, -0.039999999105930328369140625), 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, fma(_286, _289, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _428 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _429 = _428 * _290;
    precise float _430 = _428 * _291;
    precise float _431 = _428 * _292;
    precise float _432 = spvNMax(_409, 0.0) * _429;
    precise float _433 = spvNMax(_410, 0.0) * _430;
    precise float _434 = spvNMax(_411, 0.0) * _431;
    SV_Target3.x = _432;
    SV_Target3.y = _433;
    SV_Target3.z = _434;
    SV_Target.x = _429;
    SV_Target.y = _430;
    SV_Target.z = _431;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

