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

layout(set = 0, binding = 2) uniform sampler s0;
layout(set = 0, binding = 3) uniform sampler s1;
layout(set = 0, binding = 4) uniform texture2D t0;
layout(set = 0, binding = 5) uniform texture2D t1;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 0, component = 0) out vec4 SV_Target;
layout(location = 1, component = 0) out vec4 SV_Target1;
layout(location = 2, component = 0) out vec4 SV_Target2;
layout(location = 3, component = 0) out vec4 SV_Target3;

spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

float dp2_f32(vec2 a, vec2 b)
{
    precise float _87 = a.x * b.x;
    return fma(a.y, b.y, _87);
}

float dp3_f32(vec3 a, vec3 b)
{
    precise float _72 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _72));
}

void main()
{
    precise float _97 = TEXCOORD.y * 150.0;
    precise float _100 = sin(roundEven(_97)) * 43758.546875;
    precise float _104 = fma(fract(_100), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _105 = _104 * 150.0;
    precise float _108 = sin(roundEven(_105)) * 43758.546875;
    precise float _110 = fma(fract(_108), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _119 = abs(dFdx(_104)) + abs(dFdy(_104));
    precise float _120 = abs(dFdx(_110)) + abs(dFdy(_110));
    precise float _121 = _104 - 0.1167768537998199462890625;
    precise float _122 = 0.88322317600250244140625 - _104;
    precise float _123 = _122 / _119;
    precise float _125 = _121 / _119;
    precise float _127 = spvNClamp(_123, 0.0, 1.0) * spvNClamp(_125, 0.0, 1.0);
    precise float _128 = _110 - 0.02999999932944774627685546875;
    precise float _129 = 0.9700000286102294921875 - _110;
    precise float _130 = _129 / _120;
    precise float _132 = _128 / _120;
    precise float _134 = spvNClamp(_132, 0.0, 1.0) * _127;
    precise float _135 = spvNClamp(_130, 0.0, 1.0) * _134;
    precise float _136 = TEXCOORD.x - 0.5;
    precise float _137 = TEXCOORD.y - 0.4000000059604644775390625;
    precise float _138 = fma(_136, 1.75, 0.5);
    precise float _139 = fma(_137, 1.75, 0.4000000059604644775390625);
    vec2 _142 = vec2(fma(_136, 1.75, 0.0), fma(_137, 1.75, -0.0999999940395355224609375));
    precise float _145 = sqrt(dp2_f32(_142, _142)) - 0.400390625;
    precise float _146 = _145 / _119;
    precise float _148 = 1.0 - spvNClamp(_146, 0.0, 1.0);
    precise float _161 = cb0._m7.x - cb0._m5.x;
    precise float _162 = cb0._m7.y - cb0._m5.y;
    precise float _163 = cb0._m7.z - cb0._m5.z;
    precise float _164 = fma(_148, _161, cb0._m5.x);
    precise float _165 = fma(_148, _162, cb0._m5.y);
    precise float _166 = fma(_148, _163, cb0._m5.z);
    vec4 _179 = texture(sampler2D(t0, s0), vec2(_138, _139));
    float _180 = _179.x;
    float _181 = _179.w;
    precise float _184 = float(_138 <= 1.0) * float(_138 >= 0.0);
    precise float _185 = float(_139 >= 0.0) * _184;
    precise float _187 = fma(-_185, float(_139 <= 1.0), 1.0);
    precise float _191 = fma(_187, -_181, _181);
    precise float _192 = 1.0 - fma(_187, -_180, _180);
    precise float _198 = cb0._m10.x - cb0._m5.x;
    precise float _199 = cb0._m10.y - cb0._m5.y;
    precise float _200 = cb0._m10.z - cb0._m5.z;
    precise float _204 = fma(_192, _198, cb0._m5.x) - _164;
    precise float _205 = fma(_192, _199, cb0._m5.y) - _165;
    precise float _206 = fma(_192, _200, cb0._m5.z) - _166;
    precise float _222 = TEXCOORD2.x - cb1._m4.x;
    precise float _223 = TEXCOORD2.y - cb1._m4.y;
    precise float _224 = TEXCOORD2.z - cb1._m4.z;
    vec3 _225 = vec3(_222, _223, _224);
    precise float _227 = inversesqrt(dp3_f32(_225, _225));
    precise float _228 = _227 * _222;
    precise float _229 = _227 * _224;
    precise float _230 = TEXCOORD.y + TEXCOORD.x;
    precise float _231 = TEXCOORD.y + TEXCOORD.y;
    precise float _235 = fma(-_229, 5.0, _231);
    precise float _236 = _235 * 10.0;
    precise float _238 = fma(sin(_236), 0.0199999995529651641845703125, fma(-_228, 5.0, _230));
    precise float _239 = _238 * 30.0;
    vec4 _246 = texture(sampler2D(t1, s1), vec2(_238, fma(cos(_239), 0.0199999995529651641845703125, _235)));
    precise float _250 = fma(_246.x, 0.5, fma(_191, _204, _164));
    precise float _251 = fma(_246.y, 0.5, fma(_191, _205, _165));
    precise float _252 = fma(_246.z, 0.5, fma(_191, _206, _166));
    precise float _253 = _250 * _135;
    precise float _254 = _251 * _135;
    precise float _255 = _252 * _135;
    SV_Target1.x = fma(cb0._m4.y, fma(_135, _250, -0.039999999105930328369140625), 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, fma(_135, _251, -0.039999999105930328369140625), 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, fma(_135, _252, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _270 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _271 = _270 * _253;
    precise float _272 = _270 * _254;
    precise float _273 = _270 * _255;
    SV_Target.x = _271;
    SV_Target.y = _272;
    SV_Target.z = _273;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.x = 0.0;
    SV_Target3.y = 0.0;
    SV_Target3.z = 0.0;
    SV_Target3.w = 1.0;
}

