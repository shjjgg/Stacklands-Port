#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

invariant gl_Position;

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    vec3 _m0;
    float _m1;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    vec4 _m5;
} cb1;

layout(set = 0, binding = 2, std140) uniform cb2_buf
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
} cb2;

layout(set = 0, binding = 3, std140) uniform cb3_buf
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
} cb3;

layout(location = 0, component = 0) in vec4 POSITION;
layout(location = 2, component = 0) in vec3 NORMAL;
layout(location = 1, component = 0) out vec3 TEXCOORD1;

spirv_instruction(set = "GLSL.std.450", id = 79) float spvNMin(float, float);
spirv_instruction(set = "GLSL.std.450", id = 79) vec2 spvNMin(vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 79) vec3 spvNMin(vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 79) vec4 spvNMin(vec4, vec4);

float dp3_f32(vec3 a, vec3 b)
{
    precise float _52 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _52));
}

void main()
{
    vec3 _70 = vec3(NORMAL.x, NORMAL.y, NORMAL.z);
    float _75 = dp3_f32(_70, cb2._m4);
    float _78 = dp3_f32(_70, cb2._m6);
    float _81 = dp3_f32(_70, cb2._m8);
    vec3 _82 = vec3(_75, _78, _81);
    float _83 = dp3_f32(_82, _82);
    precise float _84 = inversesqrt(_83);
    precise float _85 = _84 * _75;
    precise float _86 = _84 * _78;
    precise float _87 = _84 * _81;
    precise float _97 = POSITION.y * cb2._m1.x;
    precise float _98 = POSITION.y * cb2._m1.y;
    precise float _99 = POSITION.y * cb2._m1.z;
    precise float _100 = POSITION.y * cb2._m1.w;
    precise float _109 = fma(cb2._m0.x, POSITION.x, _97);
    precise float _110 = fma(cb2._m0.y, POSITION.x, _98);
    precise float _111 = fma(cb2._m0.z, POSITION.x, _99);
    precise float _112 = fma(cb2._m0.w, POSITION.x, _100);
    precise float _121 = fma(cb2._m2.x, POSITION.z, _109);
    precise float _122 = fma(cb2._m2.y, POSITION.z, _110);
    precise float _123 = fma(cb2._m2.z, POSITION.z, _111);
    precise float _124 = fma(cb2._m2.w, POSITION.z, _112);
    precise float _133 = fma(cb2._m3.x, POSITION.w, _121);
    precise float _134 = fma(cb2._m3.y, POSITION.w, _122);
    precise float _135 = fma(cb2._m3.z, POSITION.w, _123);
    precise float _136 = fma(cb2._m3.w, POSITION.w, _124);
    precise float _149 = fma(-_133, cb0._m1, cb0._m0.x);
    precise float _150 = fma(-_134, cb0._m1, cb0._m0.y);
    precise float _151 = fma(-_135, cb0._m1, cb0._m0.z);
    vec3 _152 = vec3(_149, _150, _151);
    precise float _154 = inversesqrt(dp3_f32(_152, _152));
    precise float _155 = _154 * _149;
    precise float _156 = _154 * _150;
    precise float _157 = _154 * _151;
    float _160 = dp3_f32(vec3(_85, _86, _87), vec3(_155, _156, _157));
    precise float _161 = -_160;
    precise float _162 = fma(_161, _160, 1.0);
    precise float _163 = sqrt(_162);
    precise float _167 = _163 * cb1._m5.z;
    precise float _168 = -_85;
    precise float _169 = -_86;
    precise float _170 = -_87;
    precise float _171 = fma(_168, _167, _133);
    precise float _172 = fma(_169, _167, _134);
    precise float _173 = fma(_170, _167, _135);
    bool _174 = cb1._m5.z == 0.0;
    float _176 = _174 ? _133 : _171;
    float _177 = _174 ? _134 : _172;
    float _178 = _174 ? _135 : _173;
    precise float _186 = _177 * cb3._m18.x;
    precise float _187 = _177 * cb3._m18.y;
    precise float _188 = _177 * cb3._m18.z;
    precise float _189 = _177 * cb3._m18.w;
    precise float _196 = fma(cb3._m17.x, _176, _186);
    precise float _197 = fma(cb3._m17.y, _176, _187);
    precise float _198 = fma(cb3._m17.z, _176, _188);
    precise float _199 = fma(cb3._m17.w, _176, _189);
    precise float _206 = fma(cb3._m19.x, _178, _196);
    precise float _207 = fma(cb3._m19.y, _178, _197);
    precise float _208 = fma(cb3._m19.z, _178, _198);
    precise float _209 = fma(cb3._m19.w, _178, _199);
    precise float _216 = fma(cb3._m20.x, _136, _206);
    precise float _217 = fma(cb3._m20.y, _136, _207);
    precise float _218 = fma(cb3._m20.z, _136, _208);
    precise float _219 = fma(cb3._m20.w, _136, _209);
    precise float _220 = spvNMin(_219, _218);
    precise float _221 = _220 - _218;
    precise float _224 = fma(cb1._m5.y, _221, _218);
    gl_Position.z = _224;
    gl_Position.x = _216;
    gl_Position.y = _217;
    gl_Position.w = _219;
    precise float _237 = POSITION.y * cb2._m1.x;
    precise float _238 = POSITION.y * cb2._m1.y;
    precise float _239 = POSITION.y * cb2._m1.z;
    TEXCOORD1.x = fma(cb2._m3.x, POSITION.w, fma(cb2._m2.x, POSITION.z, fma(cb2._m0.x, POSITION.x, _237)));
    TEXCOORD1.y = fma(cb2._m3.y, POSITION.w, fma(cb2._m2.y, POSITION.z, fma(cb2._m0.y, POSITION.x, _238)));
    TEXCOORD1.z = fma(cb2._m3.z, POSITION.w, fma(cb2._m2.z, POSITION.z, fma(cb2._m0.z, POSITION.x, _239)));
}

