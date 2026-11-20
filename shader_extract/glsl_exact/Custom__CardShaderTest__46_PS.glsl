#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require
#extension GL_EXT_demote_to_helper_invocation : require

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
    uvec4 _m11;
    vec3 _m12;
    uint _m13;
    vec2 _m14;
    uvec2 _m15;
    uvec4 _m16;
    vec2 _m17;
    vec2 _m18;
} cb0;

layout(set = 0, binding = 1, std140) uniform cb1_buf
{
    vec4 _m0;
    uvec4 _m1;
    uvec4 _m2;
    uvec4 _m3;
    vec3 _m4;
    uint _m5;
} cb1;

layout(set = 0, binding = 2) uniform sampler s0;
layout(set = 0, binding = 3) uniform sampler s1;
layout(set = 0, binding = 4) uniform sampler s2;
layout(set = 0, binding = 5) uniform sampler s3;
layout(set = 0, binding = 6) uniform texture2D t0;
layout(set = 0, binding = 7) uniform texture2D t1;
layout(set = 0, binding = 8) uniform texture2D t2;
layout(set = 0, binding = 9) uniform texture2D t3;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 0, component = 0) out vec4 SV_Target;
layout(location = 1, component = 0) out vec4 SV_Target1;
layout(location = 2, component = 0) out vec4 SV_Target2;
layout(location = 3, component = 0) out vec4 SV_Target3;

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
    precise float _107 = a.x * b.x;
    return fma(a.z, b.z, fma(a.y, b.y, _107));
}

float dp2_f32(vec2 a, vec2 b)
{
    precise float _95 = a.x * b.x;
    return fma(a.y, b.y, _95);
}

void main()
{
    precise float _120 = TEXCOORD.y * 150.0;
    precise float _123 = sin(roundEven(_120)) * 43758.546875;
    precise float _127 = fma(fract(_123), 0.004999999888241291046142578125, TEXCOORD.x);
    precise float _128 = _127 * 150.0;
    precise float _129 = _127 * 10.0;
    precise float _132 = sin(roundEven(_128)) * 43758.546875;
    precise float _134 = fma(fract(_132), 0.004999999888241291046142578125, TEXCOORD.y);
    precise float _143 = abs(dFdy(_127)) + abs(dFdx(_127));
    precise float _144 = abs(dFdy(_134)) + abs(dFdx(_134));
    precise float _145 = 1.0 - TEXCOORD.x;
    precise float _146 = 1.0 - TEXCOORD.y;
    bool _153 = cb0._m18.x > 0.5;
    bool _155 = cb0._m18.y > 0.5;
    float _158 = _155 ? (_153 ? 0.550000011920928955078125 : 0.5) : (_153 ? 0.5 : 0.449999988079071044921875);
    float _160 = (_153 || _155) ? 2.0 : 1.75;
    precise float _161 = _145 - 0.5;
    precise float _162 = _146 - _158;
    precise float _163 = _160 * _161;
    precise float _164 = fma(_161, _160, 0.5);
    precise float _165 = fma(_162, _160, _158);
    precise float _174 = float(_164 >= 0.0) * float(_164 <= 1.0);
    precise float _175 = float(_165 >= 0.0) * _174;
    vec2 _178 = vec2(_164, _165);
    vec4 _181 = texture(sampler2D(t0, s0), _178);
    float _182 = _181.x;
    float _183 = _181.w;
    vec4 _187 = texture(sampler2D(t1, s2), _178);
    float _188 = _187.x;
    float _189 = _187.w;
    precise float _191 = fma(-_175, float(_165 <= 1.0), 1.0);
    precise float _195 = fma(_191, -_183, _183);
    precise float _199 = fma(_191, -_189, _189);
    precise float _213 = TEXCOORD2.x - cb1._m4.x;
    precise float _214 = TEXCOORD2.y - cb1._m4.y;
    precise float _215 = TEXCOORD2.z - cb1._m4.z;
    vec3 _216 = vec3(_213, _214, _215);
    precise float _218 = inversesqrt(dp3_f32(_216, _216));
    precise float _219 = _218 * _213;
    precise float _220 = _218 * _215;
    precise float _221 = TEXCOORD.y + TEXCOORD.x;
    precise float _222 = TEXCOORD.y + TEXCOORD.y;
    precise float _226 = fma(-_220, 5.0, _222);
    precise float _227 = _226 * 10.0;
    precise float _229 = fma(sin(_227), 0.0199999995529651641845703125, fma(-_219, 5.0, _221));
    precise float _230 = _229 * 30.0;
    vec4 _237 = texture(sampler2D(t2, s1), vec2(_229, fma(cos(_230), 0.0199999995529651641845703125, _226)));
    precise float _245 = fma(cb1._m0.z, 2.0, _221) * 0.0199999995529651641845703125;
    float _248 = float(fract(_245) >= 0.9900000095367431640625);
    bool _253 = cb0._m14.x > 0.5;
    bool _254 = cb0._m14.y > 0.5;
    float _265 = _253 ? fma(_248, cb0._m17.y, cb0._m5.x) : cb0._m5.x;
    float _266 = _253 ? fma(_248, cb0._m17.y, cb0._m5.y) : cb0._m5.y;
    float _267 = _253 ? fma(_248, cb0._m17.y, cb0._m5.z) : cb0._m5.z;
    precise float _268 = _163 + 0.0;
    precise float _269 = _165 - 0.5;
    vec2 _270 = vec2(_268, _269);
    precise float _277 = (_153 ? spvNMax(abs(_269), abs(_268)) : sqrt(dp2_f32(_270, _270))) - 0.400390625;
    precise float _278 = _277 / _143;
    precise float _280 = 1.0 - spvNClamp(_278, 0.0, 1.0);
    precise float _286 = cb0._m7.x - _265;
    precise float _287 = cb0._m7.y - _266;
    precise float _288 = cb0._m7.z - _267;
    precise float _289 = fma(_280, _286, _265);
    precise float _290 = fma(_280, _287, _266);
    precise float _291 = fma(_280, _288, _267);
    float _293 = (_134 >= 0.20000000298023223876953125) ? 0.0 : 1.0;
    precise float _294 = cb0._m7.x - _289;
    precise float _295 = cb0._m7.y - _290;
    precise float _296 = cb0._m7.z - _291;
    precise float _297 = fma(_293, _294, _289);
    precise float _298 = fma(_293, _295, _290);
    precise float _299 = fma(_293, _296, _291);
    precise float _300 = 1.0 - fma(_191, -_182, _182);
    precise float _306 = cb0._m12.x - cb0._m5.x;
    precise float _307 = cb0._m12.y - cb0._m5.y;
    precise float _308 = cb0._m12.z - cb0._m5.z;
    precise float _312 = fma(_300, _306, cb0._m5.x) - _297;
    precise float _313 = fma(_300, _307, cb0._m5.y) - _298;
    precise float _314 = fma(_300, _308, cb0._m5.z) - _299;
    precise float _315 = fma(_195, _312, _297);
    precise float _316 = fma(_195, _313, _298);
    precise float _317 = fma(_195, _314, _299);
    bool _320 = (cb0._m18.y == 0.0) && (cb0._m18.x == 0.0);
    precise float _321 = 1.0 - fma(_191, -_188, _188);
    precise float _325 = fma(_321, _306, cb0._m5.x) - _315;
    precise float _326 = fma(_321, _307, cb0._m5.y) - _316;
    precise float _327 = fma(_321, _308, cb0._m5.z) - _317;
    float _331 = _320 ? _315 : fma(_199, _325, _315);
    float _332 = _320 ? _316 : fma(_199, _326, _316);
    float _333 = _320 ? _317 : fma(_199, _327, _317);
    precise float _334 = -_144;
    precise float _335 = fma(_334, 0.5, 0.189999997615814208984375);
    precise float _336 = fma(_334, 0.5, 0.2100000083446502685546875);
    precise float _339 = _134 - _335;
    precise float _340 = _134 - _336;
    precise float _343 = fma(_144, 0.5, -_335) + 0.189999997615814208984375;
    precise float _344 = fma(_144, 0.5, -_336) + 0.2100000083446502685546875;
    precise float _345 = _339 / _343;
    precise float _346 = _340 / _344;
    precise float _349 = 1.0 - spvNClamp(_346, 0.0, 1.0);
    precise float _352 = _127 - 0.1167768537998199462890625;
    precise float _353 = _134 - 0.02999999932944774627685546875;
    precise float _354 = _352 / _143;
    precise float _355 = _353 / _144;
    precise float _358 = 0.88322317600250244140625 - _127;
    precise float _359 = 0.9700000286102294921875 - _134;
    precise float _360 = _358 / _143;
    precise float _361 = _359 / _144;
    precise float _364 = spvNClamp(_354, 0.0, 1.0) * spvNClamp(_360, 0.0, 1.0);
    precise float _365 = spvNClamp(_355, 0.0, 1.0) * _364;
    precise float _366 = spvNClamp(_361, 0.0, 1.0) * _365;
    precise float _367 = fma(-spvNClamp(_345, 0.0, 1.0), _349, 1.0) * _366;
    precise float _368 = _134 * 10.0;
    precise float _372 = abs(fma(fract(_368), 2.0, -1.0)) - 0.5;
    precise float _374 = sin(_368) * _372;
    precise float _378 = abs(fma(fract(_129), 2.0, -1.0)) - 0.5;
    precise float _380 = sin(_129) * _378;
    precise float _381 = fma(_374, 0.0199999995529651641845703125, _127);
    precise float _382 = fma(_380, 0.0199999995529651641845703125, _134);
    precise float _383 = _381 - 0.089776851236820220947265625;
    precise float _384 = _382 - 0.0030000000260770320892333984375;
    precise float _385 = _383 / _143;
    precise float _386 = _384 / _144;
    precise float _389 = 0.91022312641143798828125 - _381;
    precise float _390 = 0.9969999790191650390625 - _382;
    precise float _391 = _389 / _143;
    precise float _392 = _390 / _144;
    precise float _395 = spvNClamp(_391, 0.0, 1.0) * spvNClamp(_385, 0.0, 1.0);
    precise float _396 = spvNClamp(_386, 0.0, 1.0) * _395;
    if ((fma(_396, spvNClamp(_392, 0.0, 1.0), -0.100000001490116119384765625) < 0.0) && _254)
    {
        demote;
    }
    precise float _415 = (_253 ? fma(_237.x, cb0._m17.x, _331) : _331) - cb0._m9.x;
    precise float _416 = (_253 ? fma(_237.y, cb0._m17.x, _332) : _332) - cb0._m9.y;
    precise float _417 = (_253 ? fma(_237.z, cb0._m17.x, _333) : _333) - cb0._m9.z;
    precise float _418 = fma(_367, _415, cb0._m9.x);
    precise float _419 = fma(_367, _416, cb0._m9.y);
    precise float _420 = fma(_367, _417, cb0._m9.z);
    float _442;
    float _443;
    float _444;
    if (cb0._m14.y != 0.0)
    {
        float _435 = float(texture(sampler2D(t3, s3), vec2(_254 ? _381 : _127, _254 ? _382 : _134)).w >= 0.5);
        precise float _436 = _418 * (-0.39999997615814208984375);
        precise float _437 = _419 * (-0.39999997615814208984375);
        precise float _438 = _420 * (-0.39999997615814208984375);
        _442 = fma(_435, _438, _420);
        _443 = fma(_435, _437, _419);
        _444 = fma(_435, _436, _418);
    }
    else
    {
        _442 = _420;
        _443 = _419;
        _444 = _418;
    }
    precise float _445 = _444 - 0.039999999105930328369140625;
    precise float _446 = _443 - 0.039999999105930328369140625;
    precise float _447 = _442 - 0.039999999105930328369140625;
    SV_Target1.x = fma(cb0._m4.y, _445, 0.039999999105930328369140625);
    SV_Target1.y = fma(cb0._m4.y, _446, 0.039999999105930328369140625);
    SV_Target1.z = fma(cb0._m4.y, _447, 0.039999999105930328369140625);
    precise float _458 = fma(-cb0._m4.y, 0.959999978542327880859375, 0.959999978542327880859375);
    precise float _459 = _458 * _444;
    precise float _460 = _458 * _443;
    precise float _461 = _458 * _442;
    SV_Target.x = _459;
    SV_Target.y = _460;
    SV_Target.z = _461;
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

