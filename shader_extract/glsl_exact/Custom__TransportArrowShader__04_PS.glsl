#version 450
#extension GL_EXT_buffer_reference2 : require
#extension GL_EXT_spirv_intrinsics : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    uvec4 _m3;
    vec4 _m4;
    vec4 _m5;
    vec4 _m6;
    vec4 _m7;
    vec2 _m8;
    uvec2 _m9;
    vec2 _m10;
    uvec2 _m11;
    vec2 _m12;
    uvec2 _m13;
    vec4 _m14;
    vec4 _m15;
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
    uvec4 _m39;
    uvec4 _m40;
    uvec4 _m41;
    uvec4 _m42;
    uvec4 _m43;
    uvec4 _m44;
    uvec4 _m45;
    vec4 _m46;
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
layout(set = 0, binding = 4) uniform texture3D t0;

layout(location = 2, component = 0) in vec3 TEXCOORD1;
layout(location = 3, component = 0) in vec3 TEXCOORD2;
layout(location = 0, component = 0) out vec4 SV_Target;

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

float dp2_f32(vec2 a, vec2 b)
{
    precise float _98 = a.x * b.x;
    return fma(a.y, b.y, _98);
}

float dp4_f32(vec4 a, vec4 b)
{
    precise float _80 = a.x * b.x;
    return fma(a.w, b.w, fma(a.z, b.z, fma(a.y, b.y, _80)));
}

void main()
{
    precise float _108 = TEXCOORD1.x * 1000.0;
    precise float _111 = sin(roundEven(_108)) * 43758.546875;
    precise float _113 = fract(_111) - 0.5;
    precise float _118 = _113 * cb0._m14.z;
    precise float _121 = fma(_118, 0.004999999888241291046142578125, TEXCOORD1.z);
    precise float _122 = _121 * 500.0;
    precise float _125 = sin(roundEven(_122)) * 43758.546875;
    precise float _127 = fract(_125) - 0.5;
    precise float _128 = _127 * cb0._m14.z;
    precise float _129 = fma(_128, 0.004999999888241291046142578125, TEXCOORD1.x);
    float _131;
    float _136;
    _131 = 0.0;
    _136 = 100000.0;
    float _132;
    precise float _135;
    float _137;
    precise float _139;
    float _134 = 0.0;
    float _138 = 0.0;
    for (;;)
    {
        if (_138 > 1.0)
        {
            break;
        }
        precise float _146 = spvNMin(_138, 1.0);
        precise float _147 = 1.0 - _146;
        precise float _148 = _147 * _147;
        float _151 = dp2_f32(vec2(_146), vec2(_147));
        precise float _157 = _151 * cb0._m12.x;
        precise float _158 = _151 * cb0._m12.y;
        precise float _165 = _146 * _146;
        precise float _170 = fma(_165, cb0._m10.x, fma(_148, cb0._m8.x, _157));
        precise float _171 = fma(_165, cb0._m10.y, fma(_148, cb0._m8.y, _158));
        _139 = _138 + 0.100000001490116119384765625;
        precise float _172 = spvNMin(_139, 1.0);
        precise float _173 = 1.0 - _172;
        precise float _174 = _173 * _173;
        float _177 = dp2_f32(vec2(_172), vec2(_173));
        precise float _178 = _177 * cb0._m12.x;
        precise float _179 = _177 * cb0._m12.y;
        precise float _182 = _172 * _172;
        precise float _185 = fma(_182, cb0._m10.x, fma(_174, cb0._m8.x, _178)) - _170;
        precise float _186 = fma(_182, cb0._m10.y, fma(_174, cb0._m8.y, _179)) - _171;
        precise float _187 = _129 - _170;
        precise float _188 = _121 - _171;
        vec2 _189 = vec2(_187, _188);
        vec2 _190 = vec2(_185, _186);
        float _192 = dp2_f32(_190, _190);
        precise float _193 = dp2_f32(_189, _190) / _192;
        precise float _194 = spvNClamp(_193, 0.0, 1.0);
        precise float _200 = -_194;
        vec2 _203 = vec2(fma(_200, _185, _187), fma(_200, _186, _188));
        precise float _206 = sqrt(dp2_f32(_203, _203)) * ((dp2_f32(vec2(_186, -_185), _189) > 0.0) ? 1.0 : (-1.0));
        precise float _207 = sqrt(_192);
        bool _210 = abs(_206) < abs(_136);
        _132 = _210 ? fma(_194, _207, _134) : _131;
        _137 = _210 ? _206 : _136;
        _135 = _207 + _134;
        _131 = _132;
        _134 = _135;
        _136 = _137;
        _138 = _139;
        continue;
    }
    precise float _212 = abs(_136);
    precise float _217 = abs(dFdx(_212)) + abs(dFdy(_212));
    precise float _218 = _131 * 8.0;
    precise float _219 = _131 * 2.5;
    precise float _221 = fract(_219);
    precise float _225 = cb0._m14.x * 0.5;
    bool _227 = (fract(_218) > 0.800000011920928955078125) && (_212 < _225);
    float _247 = (_219 >= 0.0) ? _221 : (-_221);
    precise float _248 = _247 * 4.0;
    precise float _251 = cb0._m15.x * 0.5;
    precise float _258 = ((_136 < 0.0) ? fma(-_247, 4.0, 4.0) : _248) - fma(fract(_251), 4.0, 2.0);
    precise float _259 = _258 + 4.0;
    bool _267 = ((spvNMin(abs(_259), abs(_258)) < 0.300000011920928955078125) && (_212 > 0.00999999977648258209228515625)) && (_212 < 0.02999999932944774627685546875);
    float _274 = _267 ? cb0._m7.x : (_227 ? cb0._m6.x : cb0._m4.x);
    float _275 = _267 ? cb0._m7.y : (_227 ? cb0._m6.y : cb0._m4.y);
    float _276 = _267 ? cb0._m7.z : (_227 ? cb0._m6.z : cb0._m4.z);
    float _277 = _267 ? cb0._m7.w : (_227 ? cb0._m6.w : cb0._m4.w);
    precise float _280 = cb0._m14.y + cb0._m14.x;
    precise float _281 = -_217;
    precise float _282 = fma(_281, 0.5, _280);
    precise float _283 = _212 - _282;
    precise float _285 = fma(_217, 0.5, _280) - _282;
    precise float _286 = _283 / _285;
    precise float _287 = spvNClamp(_286, 0.0, 1.0);
    precise float _294 = cb0._m5.x - _274;
    precise float _295 = cb0._m5.y - _275;
    precise float _296 = cb0._m5.z - _276;
    precise float _297 = cb0._m5.w - _277;
    precise float _298 = fma(_287, _294, _274);
    precise float _299 = fma(_287, _295, _275);
    precise float _300 = fma(_287, _296, _276);
    precise float _301 = fma(_287, _297, _277);
    precise float _302 = fma(cb0._m14.y, 2.0, cb0._m14.x);
    precise float _303 = fma(_281, 0.5, _302);
    precise float _305 = _212 - _303;
    precise float _306 = fma(_217, 0.5, _302) - _303;
    precise float _307 = _305 / _306;
    precise float _308 = spvNClamp(_307, 0.0, 1.0);
    precise float _313 = fma(_308, -_298, _298);
    precise float _314 = fma(_308, -_299, _299);
    precise float _315 = fma(_308, -_300, _300);
    float _395;
    float _396;
    float _397;
    float _398;
    if (cb2._m0.x == 1.0)
    {
        bool _325 = cb2._m0.y == 1.0;
        precise float _334 = TEXCOORD1.y * cb2._m3.x;
        precise float _335 = TEXCOORD1.y * cb2._m3.y;
        precise float _336 = TEXCOORD1.y * cb2._m3.z;
        precise float _358 = fma(cb2._m5.x, TEXCOORD1.z, fma(cb2._m1.x, TEXCOORD1.x, _334)) + cb2._m7.x;
        precise float _359 = fma(cb2._m5.y, TEXCOORD1.z, fma(cb2._m1.y, TEXCOORD1.x, _335)) + cb2._m7.y;
        precise float _360 = fma(cb2._m5.z, TEXCOORD1.z, fma(cb2._m1.z, TEXCOORD1.x, _336)) + cb2._m7.z;
        precise float _369 = (_325 ? _358 : TEXCOORD1.x) - cb2._m11.x;
        precise float _370 = (_325 ? _359 : TEXCOORD1.y) - cb2._m11.y;
        precise float _371 = (_325 ? _360 : TEXCOORD1.z) - cb2._m11.z;
        precise float _377 = _369 * cb2._m9.x;
        precise float _378 = _370 * cb2._m9.y;
        precise float _379 = _371 * cb2._m9.z;
        vec4 _390 = texture(sampler3D(t0, s0), vec3(spvNMax(fma(_377, 0.25, 0.75), fma(cb2._m0.z, 0.5, 0.75)), _378, _379));
        _395 = _390.w;
        _396 = _390.z;
        _397 = _390.y;
        _398 = _390.x;
    }
    else
    {
        _395 = 1.0;
        _396 = 1.0;
        _397 = 1.0;
        _398 = 1.0;
    }
    precise float _404 = spvNClamp(dp4_f32(vec4(_398, _397, _396, _395), cb1._m46), 0.0, 1.0);
    precise float _411 = _313 * TEXCOORD2.x;
    precise float _412 = _314 * TEXCOORD2.y;
    precise float _413 = _315 * TEXCOORD2.z;
    precise float _414 = _313 * _404;
    precise float _415 = _314 * _404;
    precise float _416 = _315 * _404;
    SV_Target.x = fma(_414, cb0._m2.x, _411);
    SV_Target.y = fma(_415, cb0._m2.y, _412);
    SV_Target.z = fma(_416, cb0._m2.z, _413);
    SV_Target.w = fma(fma(_308, -_301, _301), cb0._m2.w, 0.0);
}

