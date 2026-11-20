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
    precise float _99 = TEXCOORD.y * 150.0;
    precise float _100 = TEXCOORD.x * 20.0;
    precise float _101 = TEXCOORD.y * 1.0;
    vec4 _108 = texture(sampler2D(t0, s0), vec2(_100, _101));
    float _109 = _108.x;
    float _110 = _108.y;
    float _111 = _108.z;
    precise float _113 = sin(roundEven(_99)) * 43758.546875;
    precise float _115 = fma(fract(_113), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _116 = _115 * 150.0;
    precise float _119 = sin(roundEven(_116)) * 43758.546875;
    precise float _121 = fma(fract(_119), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _130 = abs(dFdx(_115)) + abs(dFdy(_115));
    precise float _131 = abs(dFdx(_121)) + abs(dFdy(_121));
    precise float _132 = _115 - 0.1167768537998199462890625;
    precise float _133 = 0.88322317600250244140625 - _115;
    precise float _134 = _133 / _130;
    precise float _136 = _132 / _130;
    precise float _138 = spvNClamp(_134, 0.0, 1.0) * spvNClamp(_136, 0.0, 1.0);
    precise float _139 = _121 - 0.02999999932944774627685546875;
    precise float _140 = 0.9700000286102294921875 - _121;
    precise float _141 = _140 / _131;
    precise float _143 = _139 / _131;
    precise float _145 = spvNClamp(_143, 0.0, 1.0) * _138;
    precise float _146 = spvNClamp(_141, 0.0, 1.0) * _145;
    precise float _147 = 0.5 - TEXCOORD.x;
    precise float _148 = 0.550000011920928955078125 - TEXCOORD.y;
    vec2 _151 = vec2(fma(_147, 1.75, 0.0), fma(_148, 1.75, -0.050000011920928955078125));
    precise float _154 = sqrt(dp2_f32(_151, _151)) - 0.400390625;
    precise float _155 = _154 / _130;
    precise float _157 = 1.0 - spvNClamp(_155, 0.0, 1.0);
    precise float _165 = _109 * cb0._m5.x;
    precise float _166 = _110 * cb0._m5.y;
    precise float _167 = _111 * cb0._m5.z;
    precise float _194 = TEXCOORD2.x - cb1._m4.x;
    precise float _195 = TEXCOORD2.y - cb1._m4.y;
    precise float _196 = TEXCOORD2.z - cb1._m4.z;
    vec3 _197 = vec3(_194, _195, _196);
    precise float _199 = inversesqrt(dp3_f32(_197, _197));
    precise float _200 = _199 * _194;
    precise float _201 = _199 * _196;
    precise float _202 = TEXCOORD.y + TEXCOORD.x;
    precise float _203 = TEXCOORD.y + TEXCOORD.y;
    precise float _207 = fma(-_201, 5.0, _203);
    precise float _208 = _207 * 10.0;
    precise float _210 = fma(sin(_208), 0.0199999995529651641845703125, fma(-_200, 5.0, _202));
    precise float _211 = _210 * 30.0;
    vec4 _218 = texture(sampler2D(t1, s1), vec2(_210, fma(cos(_211), 0.0199999995529651641845703125, _207)));
    precise float _222 = fma(_218.x, 0.5, fma(_157, fma(-cb0._m5.x, _109, cb0._m7.x), _165));
    precise float _223 = fma(_218.y, 0.5, fma(_157, fma(-cb0._m5.y, _110, cb0._m7.y), _166));
    precise float _224 = fma(_218.z, 0.5, fma(_157, fma(-cb0._m5.z, _111, cb0._m7.z), _167));
    precise float _225 = _222 * _146;
    precise float _226 = _223 * _146;
    precise float _227 = _224 * _146;
    SV_Target1.x = fma(cb0._m4.y, fma(_146, _222, -0.039999999105930328369140625), 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, fma(_146, _223, -0.039999999105930328369140625), 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, fma(_146, _224, -0.039999999105930328369140625), 0.039999999105930328369140625);
    precise float _242 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _243 = _242 * _225;
    precise float _244 = _242 * _226;
    precise float _245 = _242 * _227;
    SV_Target.x = _243;
    SV_Target.y = _244;
    SV_Target.z = _245;
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

