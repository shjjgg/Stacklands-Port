#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec3 _m7;
    uint _m8;
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    vec3 _m13;
    uint _m14;
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
    vec4 _m47;
    vec4 _m48;
    vec3 _m49;
    uint _m50;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
    vec4 _m1;
    vec4 _m2;
    vec4 _m3;
    vec3 _m4;
    uint _m5;
    vec3 _m6;
    uint _m7;
    vec3 _m8;
    uint _m9;
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
    vec4 _m17;
    vec4 _m18;
    vec4 _m19;
    vec4 _m20;
} cb2;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 1, component = 0) out vec3 TEXCOORD;
layout(location = 2, component = 0) out vec3 TEXCOORD1;
layout(location = 3, component = 0) out vec3 TEXCOORD2;
layout(location = 4, component = 0) out vec4 TEXCOORD5;

spirv_instruction(set = "GLSL.std.450", id = 80) float spvNMax(float, float);
spirv_instruction(set = "GLSL.std.450", id = 80) vec2 spvNMax(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 80) vec3 spvNMax(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 80) vec4 spvNMax(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _76 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _76));
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _58 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _58)));
}

void main()
{
    precise float _97 = POSITION.y * cb1._m1.x;
    precise float _98 = POSITION.y * cb1._m1.y;
    precise float _99 = POSITION.y * cb1._m1.z;
    precise float _100 = POSITION.y * cb1._m1.w;
    precise float _109 = fma(cb1._m0.x, POSITION.x, _97);
    precise float _110 = fma(cb1._m0.y, POSITION.x, _98);
    precise float _111 = fma(cb1._m0.z, POSITION.x, _99);
    precise float _112 = fma(cb1._m0.w, POSITION.x, _100);
    precise float _121 = fma(cb1._m2.x, POSITION.z, _109);
    precise float _122 = fma(cb1._m2.y, POSITION.z, _110);
    precise float _123 = fma(cb1._m2.z, POSITION.z, _111);
    precise float _124 = fma(cb1._m2.w, POSITION.z, _112);
    precise float _131 = _121 + cb1._m3.x;
    precise float _132 = _122 + cb1._m3.y;
    precise float _133 = _123 + cb1._m3.z;
    precise float _134 = _124 + cb1._m3.w;
    precise float _142 = fma(cb1._m3.x, POSITION.w, _121);
    precise float _143 = fma(cb1._m3.y, POSITION.w, _122);
    precise float _144 = fma(cb1._m3.z, POSITION.w, _123);
    precise float _152 = _132 * cb2._m18.x;
    precise float _153 = _132 * cb2._m18.y;
    precise float _154 = _132 * cb2._m18.z;
    precise float _155 = _132 * cb2._m18.w;
    precise float _162 = fma(cb2._m17.x, _131, _152);
    precise float _163 = fma(cb2._m17.y, _131, _153);
    precise float _164 = fma(cb2._m17.z, _131, _154);
    precise float _165 = fma(cb2._m17.w, _131, _155);
    precise float _172 = fma(cb2._m19.x, _133, _162);
    precise float _173 = fma(cb2._m19.y, _133, _163);
    precise float _174 = fma(cb2._m19.z, _133, _164);
    precise float _175 = fma(cb2._m19.w, _133, _165);
    precise float _182 = fma(cb2._m20.x, _134, _172);
    precise float _183 = fma(cb2._m20.y, _134, _173);
    precise float _184 = fma(cb2._m20.z, _134, _174);
    precise float _185 = fma(cb2._m20.w, _134, _175);
    gl_Position.x = _182;
    gl_Position.y = _183;
    gl_Position.z = _184;
    gl_Position.w = _185;
    vec3 _197 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _201 = dp3_f32(_197, cb1._m4);
    float _204 = dp3_f32(_197, cb1._m6);
    float _207 = dp3_f32(_197, cb1._m8);
    vec3 _208 = vec3(_201, _204, _207);
    precise float _210 = inversesqrt(dp3_f32(_208, _208));
    precise float _211 = _210 * _201;
    precise float _212 = _210 * _204;
    precise float _213 = _210 * _207;
    TEXCOORD.x = _211;
    TEXCOORD.y = _212;
    TEXCOORD.z = _213;
    TEXCOORD1.x = _142;
    TEXCOORD1.y = _143;
    TEXCOORD1.z = _144;
    precise float _227 = cb0._m3.x - _142;
    precise float _228 = cb0._m3.y - _142;
    precise float _229 = cb0._m3.z - _142;
    precise float _230 = cb0._m3.w - _142;
    precise float _237 = cb0._m4.x - _143;
    precise float _238 = cb0._m4.y - _143;
    precise float _239 = cb0._m4.z - _143;
    precise float _240 = cb0._m4.w - _143;
    precise float _247 = cb0._m5.x - _144;
    precise float _248 = cb0._m5.y - _144;
    precise float _249 = cb0._m5.z - _144;
    precise float _250 = cb0._m5.w - _144;
    precise float _251 = _212 * _237;
    precise float _252 = _212 * _238;
    precise float _253 = _212 * _239;
    precise float _254 = _212 * _240;
    precise float _255 = _237 * _237;
    precise float _256 = _238 * _238;
    precise float _257 = _239 * _239;
    precise float _258 = _240 * _240;
    precise float _275 = spvNMax(fma(_247, _247, fma(_227, _227, _255)), 9.9999999747524270787835121154785e-07);
    precise float _276 = spvNMax(fma(_248, _248, fma(_228, _228, _256)), 9.9999999747524270787835121154785e-07);
    precise float _277 = spvNMax(fma(_249, _249, fma(_229, _229, _257)), 9.9999999747524270787835121154785e-07);
    precise float _278 = spvNMax(fma(_250, _250, fma(_230, _230, _258)), 9.9999999747524270787835121154785e-07);
    precise float _293 = 1.0 / fma(_275, cb0._m6.x, 1.0);
    precise float _294 = 1.0 / fma(_276, cb0._m6.y, 1.0);
    precise float _295 = 1.0 / fma(_277, cb0._m6.z, 1.0);
    precise float _296 = 1.0 / fma(_278, cb0._m6.w, 1.0);
    precise float _297 = fma(_247, _213, fma(_227, _211, _251)) * inversesqrt(_275);
    precise float _298 = fma(_248, _213, fma(_228, _211, _252)) * inversesqrt(_276);
    precise float _299 = fma(_249, _213, fma(_229, _211, _253)) * inversesqrt(_277);
    precise float _300 = fma(_250, _213, fma(_230, _211, _254)) * inversesqrt(_278);
    precise float _305 = _293 * spvNMax(_297, 0.0);
    precise float _306 = _294 * spvNMax(_298, 0.0);
    precise float _307 = _295 * spvNMax(_299, 0.0);
    precise float _308 = _296 * spvNMax(_300, 0.0);
    precise float _314 = _306 * cb0._m9.x;
    precise float _315 = _306 * cb0._m9.y;
    precise float _316 = _306 * cb0._m9.z;
    precise float _341 = _212 * _212;
    precise float _343 = fma(_211, _211, -_341);
    precise float _344 = _212 * _211;
    precise float _345 = _213 * _212;
    precise float _346 = _213 * _213;
    precise float _347 = _211 * _213;
    vec4 _350 = vec4(_344, _345, _346, _347);
    precise float _366 = fma(cb0._m13.x, _308, fma(cb0._m11.x, _307, fma(cb0._m7.x, _305, _314))) + fma(cb0._m49.x, _343, dp4_f32(cb0._m46, _350));
    precise float _367 = fma(cb0._m13.y, _308, fma(cb0._m11.y, _307, fma(cb0._m7.y, _305, _315))) + fma(cb0._m49.y, _343, dp4_f32(cb0._m47, _350));
    precise float _368 = fma(cb0._m13.z, _308, fma(cb0._m11.z, _307, fma(cb0._m7.z, _305, _316))) + fma(cb0._m49.z, _343, dp4_f32(cb0._m48, _350));
    TEXCOORD2.x = _366;
    TEXCOORD2.y = _367;
    TEXCOORD2.z = _368;
    TEXCOORD5.x = 0.0;
    TEXCOORD5.y = 0.0;
    TEXCOORD5.z = 0.0;
    TEXCOORD5.w = 0.0;
}

