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
layout(set = 0, binding = 4) uniform sampler s1;
layout(set = 0, binding = 5) uniform texture2D t0;
layout(set = 0, binding = 6) uniform texture3D t1;

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

float dp4_f32(vec4 a, vec4 b)
{
    precise float _76 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _76)));
}

void main()
{
    vec4 _100 = texture(sampler2D(t0, s1), vec2(TEXCOORD.x, TEXCOORD.y));
    precise float _111 = _100.x * cb0._m5.x;
    precise float _112 = _100.y * cb0._m5.y;
    precise float _113 = _100.z * cb0._m5.z;
    precise float _114 = TEXCOORD.y + TEXCOORD.x;
    precise float _115 = _114 * 10.0;
    precise float _118 = roundEven(fract(_115)) + 0.800000011920928955078125;
    precise float _119 = spvNMin(_118, 1.0);
    precise float _120 = _119 * _111;
    precise float _121 = _119 * _112;
    precise float _122 = _119 * _113;
    bool _130 = (((TEXCOORD.x > 0.863223135471343994140625) || (TEXCOORD.x < 0.13677684962749481201171875)) || (TEXCOORD.y < 0.0500000007450580596923828125)) || (TEXCOORD.y > 0.949999988079071044921875);
    float _131 = _130 ? 0.0 : _120;
    float _132 = _130 ? 0.0 : _121;
    float _133 = _130 ? 0.0 : _122;
    vec4 _145 = vec4(TEXCOORD1.x, TEXCOORD1.y, TEXCOORD1.z, 1.0);
    float _247;
    float _248;
    float _249;
    if (cb2._m0.x == 1.0)
    {
        bool _151 = cb2._m0.y == 1.0;
        precise float _159 = TEXCOORD2.y * cb2._m3.x;
        precise float _160 = TEXCOORD2.y * cb2._m3.y;
        precise float _161 = TEXCOORD2.y * cb2._m3.z;
        precise float _187 = fma(cb2._m5.x, TEXCOORD2.z, fma(cb2._m1.x, TEXCOORD2.x, _159)) + cb2._m7.x;
        precise float _188 = fma(cb2._m5.y, TEXCOORD2.z, fma(cb2._m1.y, TEXCOORD2.x, _160)) + cb2._m7.y;
        precise float _189 = fma(cb2._m5.z, TEXCOORD2.z, fma(cb2._m1.z, TEXCOORD2.x, _161)) + cb2._m7.z;
        precise float _198 = (_151 ? _187 : TEXCOORD2.x) - cb2._m11.x;
        precise float _199 = (_151 ? _188 : TEXCOORD2.y) - cb2._m11.y;
        precise float _200 = (_151 ? _189 : TEXCOORD2.z) - cb2._m11.z;
        precise float _206 = _198 * cb2._m9.x;
        precise float _207 = _199 * cb2._m9.y;
        precise float _208 = _200 * cb2._m9.z;
        precise float _209 = _206 * 0.25;
        precise float _212 = cb2._m0.z * 0.5;
        precise float _216 = spvNMin(fma(-cb2._m0.z, 0.5, 0.25), spvNMax(_209, _212));
        precise float _223 = _216 + 0.25;
        precise float _224 = _207 + 0.0;
        precise float _225 = _208 + 0.0;
        precise float _229 = _216 + 0.5;
        _247 = dp4_f32(texture(sampler3D(t1, s0), vec3(_229, _224, _225)), _145);
        _248 = dp4_f32(texture(sampler3D(t1, s0), vec3(_223, _224, _225)), _145);
        _249 = dp4_f32(texture(sampler3D(t1, s0), vec3(_216, _207, _208)), _145);
    }
    else
    {
        _247 = dp4_f32(cb1._m41, _145);
        _248 = dp4_f32(cb1._m40, _145);
        _249 = dp4_f32(cb1._m39, _145);
    }
    precise float _256 = _249 + TEXCOORD5.x;
    precise float _257 = _248 + TEXCOORD5.y;
    precise float _258 = _247 + TEXCOORD5.z;
    precise float _262 = _131 - 0.039999999105930328369140625;
    precise float _263 = _132 - 0.039999999105930328369140625;
    precise float _264 = _133 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _262, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _263, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _264, 0.039999999105930328369140625);
    precise float _275 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _276 = _275 * _131;
    precise float _277 = _275 * _132;
    precise float _278 = _275 * _133;
    precise float _279 = spvNMax(_256, 0.0) * _276;
    precise float _280 = spvNMax(_257, 0.0) * _277;
    precise float _281 = spvNMax(_258, 0.0) * _278;
    SV_Target3.x = _279;
    SV_Target3.y = _280;
    SV_Target3.z = _281;
    SV_Target.x = _276;
    SV_Target.y = _277;
    SV_Target.z = _278;
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
}

