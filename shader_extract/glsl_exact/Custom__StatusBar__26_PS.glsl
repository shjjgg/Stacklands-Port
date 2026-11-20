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
    vec3 _m9;
    uint _m10;
    vec3 _m11;
    uint _m12;
    vec4 _m13;
} cb0;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 0, component = 0) out vec4 SV_Target;
layout(location = 1, component = 0) out vec4 SV_Target1;
layout(location = 2, component = 0) out vec4 SV_Target2;
layout(location = 3, component = 0) out vec4 SV_Target3;

spirv_instruction(set = "GLSL.std.450", id = 81) float spvNClamp(float, float, float);
spirv_instruction(set = "GLSL.std.450", id = 81) vec2 spvNClamp(vec2, vec2, vec2);
spirv_instruction(set = "GLSL.std.450", id = 81) vec3 spvNClamp(vec3, vec3, vec3);
spirv_instruction(set = "GLSL.std.450", id = 81) vec4 spvNClamp(vec4, vec4, vec4);

void main()
{
    precise float _57 = TEXCOORD.y * 150.0;
    precise float _61 = sin(roundEven(_57)) * 43758.546875;
    precise float _63 = fract(_61) - 0.5;
    precise float _66 = fma(_63, 0.00999999977648258209228515625, TEXCOORD.x);
    precise float _67 = _66 * 150.0;
    precise float _70 = sin(roundEven(_67)) * 43758.546875;
    precise float _72 = fract(_70) - 0.5;
    precise float _73 = fma(_72, 0.0500000007450580596923828125, TEXCOORD.y);
    precise float _78 = _73 - 0.5;
    precise float _85 = abs(dFdx(_66)) + abs(dFdy(_66));
    precise float _86 = abs(dFdx(_73)) + abs(dFdy(_73));
    precise float _87 = 0.569999992847442626953125 - fma(_78, 0.2666666805744171142578125, 0.5);
    precise float _88 = 0.9700000286102294921875 - _66;
    precise float _89 = _66 - 0.02999999932944774627685546875;
    precise float _90 = _88 / _85;
    precise float _92 = _89 / _85;
    precise float _95 = fma(-_89, 1.06382977962493896484375, 1.0);
    precise float _96 = _86 * 0.2666666805744171142578125;
    precise float _97 = spvNClamp(_90, 0.0, 1.0) * spvNClamp(_92, 0.0, 1.0);
    precise float _98 = _87 / _96;
    precise float _99 = fma(_78, 0.2666666805744171142578125, 0.069999992847442626953125) / _96;
    precise float _102 = spvNClamp(_99, 0.0, 1.0) * _97;
    precise float _103 = spvNClamp(_98, 0.0, 1.0) * _102;
    precise float _112 = _95 - cb0._m13.y;
    precise float _115 = abs(dFdx(_95)) + abs(dFdy(_95));
    precise float _116 = _112 / _115;
    float _118 = (_103 <= 0.0) ? 0.0 : spvNClamp(_116, 0.0, 1.0);
    precise float _130 = cb0._m7.x - cb0._m5.x;
    precise float _131 = cb0._m7.y - cb0._m5.y;
    precise float _132 = cb0._m7.z - cb0._m5.z;
    precise float _133 = fma(_103, _130, cb0._m5.x);
    precise float _134 = fma(_103, _131, cb0._m5.y);
    precise float _135 = fma(_103, _132, cb0._m5.z);
    float _139 = float(cb0._m13.x >= 0.5);
    precise float _150 = cb0._m11.x - cb0._m9.x;
    precise float _151 = cb0._m11.y - cb0._m9.y;
    precise float _152 = cb0._m11.z - cb0._m9.z;
    precise float _156 = fma(_139, _150, cb0._m9.x) - _133;
    precise float _157 = fma(_139, _151, cb0._m9.y) - _134;
    precise float _158 = fma(_139, _152, cb0._m9.z) - _135;
    precise float _159 = fma(_118, _156, _133);
    precise float _160 = fma(_118, _157, _134);
    precise float _161 = fma(_118, _158, _135);
    precise float _165 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _166 = _165 * _159;
    precise float _167 = _165 * _160;
    precise float _168 = _165 * _161;
    SV_Target.x = _166;
    SV_Target.y = _167;
    SV_Target.z = _168;
    precise float _173 = _159 - 0.039999999105930328369140625;
    precise float _174 = _160 - 0.039999999105930328369140625;
    precise float _175 = _161 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _173, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _174, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _175, 0.039999999105930328369140625);
    SV_Target.w = 1.0;
    SV_Target1.w = cb0._m4.x;
    SV_Target2.x = fma(TEXCOORD1.x, 0.5, 0.5);
    SV_Target2.y = fma(TEXCOORD1.y, 0.5, 0.5);
    SV_Target2.z = fma(TEXCOORD1.z, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.x = 1.0;
    SV_Target3.y = 1.0;
    SV_Target3.z = 1.0;
    SV_Target3.w = 1.0;
}

