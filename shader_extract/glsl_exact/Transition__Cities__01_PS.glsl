#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    vec3 _m3;
    uint _m4;
    vec4 _m5;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    uvec4 _m4;
    uvec4 _m5;
    vec4 _m6;
} cb1;

layout(set = 0, binding = 2) uniform sampler s0;
layout(set = 0, binding = 3) uniform texture2D t0;

layout(location = 2, component = 0) in vec2 TEXCOORD;
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
    precise float _69 = a.x * b.x;
    return fma(a.y, b.y, _69);
}

void main()
{
    precise float _83 = cb1._m6.x / cb1._m6.y;
    precise float _87 = TEXCOORD.y - 0.5;
    precise float _88 = _87 / _83;
    precise float _89 = _88 + 0.5;
    precise float _92 = cb1._m0.x * 0.20000000298023223876953125;
    vec4 _102 = texture(sampler2D(t0, s0), vec2(fma(TEXCOORD.x, 0.20000000298023223876953125, _92), fma(_89, 0.20000000298023223876953125, _92)));
    precise float _105 = fma(_102.x, 0.0500000007450580596923828125, TEXCOORD.x);
    precise float _106 = fma(_102.y, 0.0500000007450580596923828125, _89);
    vec4 _111 = texture(sampler2D(t0, s0), vec2(fma(cb1._m0.x, 0.20000000298023223876953125, _105), fma(cb1._m0.x, 0.20000000298023223876953125, _106)));
    precise float _114 = fma(_111.x, 0.02999999932944774627685546875, _105);
    precise float _115 = fma(_111.y, 0.02999999932944774627685546875, _106);
    precise float _119 = fma(cb0._m5.x, 0.07500000298023223876953125, 0.20000000298023223876953125);
    precise float _121 = fma(cb0._m5.x, 0.4000000059604644775390625, -0.100000001490116119384765625);
    precise float _122 = fma(cb0._m5.x, 0.4000000059604644775390625, -0.14000000059604644775390625);
    precise float _123 = _114 - _119;
    precise float _124 = _115 - fma(cb0._m5.x, -0.0875000059604644775390625, 0.85000002384185791015625);
    vec2 _125 = vec2(_123, _124);
    precise float _128 = sqrt(dp2_f32(_125, _125)) - _121;
    precise float _129 = fma(cb0._m5.x, 0.100000001490116119384765625, 0.100000001490116119384765625);
    precise float _130 = fma(cb0._m5.x, -0.0999999940395355224609375, 0.89999997615814208984375);
    precise float _132 = _114 - _129;
    precise float _133 = _115 - _119;
    precise float _134 = _114 - _130;
    precise float _135 = _115 - fma(cb0._m5.x, 0.0625, 0.25);
    vec2 _136 = vec2(_132, _133);
    vec2 _138 = vec2(_134, _135);
    precise float _141 = sqrt(dp2_f32(_138, _138)) - _121;
    precise float _142 = spvNMax(_141, 0.0);
    precise float _144 = sqrt(dp2_f32(_136, _136)) - _121;
    precise float _145 = spvNMax(_128, 0.0);
    precise float _146 = spvNMax(_144, 0.0);
    precise float _147 = _146 - _145;
    precise float _148 = _145 - _146;
    precise float _150 = spvNClamp(fma(_148, 25.0, 0.5), 0.0, 1.0);
    precise float _152 = _150 * 0.0199999995529651641845703125;
    precise float _153 = 1.0 - _150;
    precise float _155 = fma(-_152, _153, fma(_150, _147, _145));
    precise float _156 = _142 - _155;
    precise float _157 = _155 - _142;
    precise float _159 = spvNClamp(fma(_157, 25.0, 0.5), 0.0, 1.0);
    precise float _161 = _159 * 0.0199999995529651641845703125;
    precise float _162 = 1.0 - _159;
    precise float _164 = fma(-_161, _162, fma(_159, _156, _155));
    precise float _166 = fma(cb0._m5.x, 0.0, 0.5);
    precise float _167 = _114 - fma(cb0._m5.x, -0.11249999701976776123046875, 0.949999988079071044921875);
    precise float _168 = _115 - _130;
    precise float _169 = _114 - _166;
    precise float _170 = _115 - _129;
    vec2 _171 = vec2(_167, _168);
    vec2 _173 = vec2(_169, _170);
    precise float _176 = sqrt(dp2_f32(_173, _173)) - _122;
    precise float _177 = spvNMax(_176, 0.0);
    precise float _179 = sqrt(dp2_f32(_171, _171)) - _121;
    precise float _180 = spvNMax(_179, 0.0);
    precise float _181 = _180 - _164;
    precise float _182 = _164 - _180;
    precise float _184 = spvNClamp(fma(_182, 25.0, 0.5), 0.0, 1.0);
    precise float _186 = _184 * 0.0199999995529651641845703125;
    precise float _187 = 1.0 - _184;
    precise float _189 = fma(-_186, _187, fma(_184, _181, _164));
    precise float _190 = _177 - _189;
    precise float _191 = _189 - _177;
    precise float _193 = spvNClamp(fma(_191, 25.0, 0.5), 0.0, 1.0);
    precise float _195 = _193 * 0.0199999995529651641845703125;
    precise float _196 = 1.0 - _193;
    precise float _198 = fma(-_195, _196, fma(_193, _190, _189));
    precise float _201 = _115 - fma(cb0._m5.x, -0.10750000178813934326171875, 0.930000007152557373046875);
    precise float _202 = _114 - fma(cb0._m5.x, 0.125, 0.0);
    precise float _203 = _115 - _166;
    vec2 _204 = vec2(_169, _201);
    vec2 _206 = vec2(_202, _203);
    precise float _209 = sqrt(dp2_f32(_206, _206)) - _122;
    precise float _210 = spvNMax(_209, 0.0);
    precise float _212 = sqrt(dp2_f32(_204, _204)) - _122;
    precise float _213 = spvNMax(_212, 0.0);
    precise float _214 = _213 - _198;
    precise float _215 = _198 - _213;
    precise float _217 = spvNClamp(fma(_215, 25.0, 0.5), 0.0, 1.0);
    precise float _219 = _217 * 0.0199999995529651641845703125;
    precise float _220 = 1.0 - _217;
    precise float _222 = fma(-_219, _220, fma(_217, _214, _198));
    precise float _223 = _210 - _222;
    precise float _224 = _222 - _210;
    precise float _226 = spvNClamp(fma(_224, 25.0, 0.5), 0.0, 1.0);
    precise float _228 = _226 * 0.0199999995529651641845703125;
    precise float _229 = 1.0 - _226;
    precise float _231 = fma(-_228, _229, fma(_226, _223, _222));
    precise float _233 = _114 - fma(cb0._m5.x, -0.125, 1.0);
    vec2 _234 = vec2(_233, _203);
    precise float _237 = sqrt(dp2_f32(_234, _234)) - _122;
    precise float _238 = spvNMax(_237, 0.0);
    precise float _239 = _238 - _231;
    precise float _240 = _231 - _238;
    precise float _242 = spvNClamp(fma(_240, 25.0, 0.5), 0.0, 1.0);
    precise float _244 = _242 * 0.0199999995529651641845703125;
    precise float _245 = 1.0 - _242;
    precise float _247 = fma(-_244, _245, fma(_242, _239, _231));
    bool _250 = _247 < 0.0900000035762786865234375;
    SV_Target.x = _250 ? 0.0 : cb0._m3.x;
    SV_Target.y = _250 ? 0.0 : cb0._m3.y;
    SV_Target.z = _250 ? 0.0 : cb0._m3.z;
    SV_Target.w = float((_247 < 0.100000001490116119384765625) && (_247 > (-0.100000001490116119384765625)));
}

