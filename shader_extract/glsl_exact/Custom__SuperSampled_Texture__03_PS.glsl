#version 450
#extension GL_EXT_buffer_reference2 : require

layout(set = 0, binding = 0, std140) uniform cb0_buf
{
    uvec4 _m0;
    uvec4 _m1;
    vec4 _m2;
    vec4 _m3;
} cb0;

layout(set = 0, binding = 1) uniform sampler s0;
layout(set = 0, binding = 2) uniform texture2D t0;

layout(location = 1, component = 0) in vec2 TEXCOORD;
layout(location = 2, component = 0) in vec4 COLOR;
layout(location = 0, component = 0) out vec4 SV_Target;

void main()
{
    precise float _47 = TEXCOORD.x * cb0._m2.y;
    precise float _48 = TEXCOORD.y * cb0._m2.y;
    float _49 = dFdx(_47);
    float _50 = dFdx(_48);
    float _51 = dFdy(_47);
    float _52 = dFdy(_48);
    float _54;
    float _57;
    float _59;
    float _61;
    _54 = 0.0;
    _57 = 0.0;
    _59 = 0.0;
    _61 = 0.0;
    precise float _64;
    float _55;
    float _58;
    float _60;
    float _62;
    float _63 = 0.0;
    for (;;)
    {
        if (_63 >= 16.0)
        {
            break;
        }
        _64 = _63 + 1.0;
        precise float _71 = _63 - 7.5;
        precise float _72 = _71 * 0.0625;
        precise float _73 = fma(_72, _49, TEXCOORD.x);
        precise float _75 = fma(_72, _50, TEXCOORD.y);
        _55 = _54;
        _58 = _57;
        _60 = _59;
        _62 = _61;
        precise float _77;
        precise float _79;
        precise float _80;
        precise float _81;
        precise float _83;
        float _82 = 0.0;
        for (;;)
        {
            if (_82 >= 16.0)
            {
                break;
            }
            _83 = _82 + 1.0;
            precise float _89 = _82 - 7.5;
            precise float _90 = _89 * 0.0625;
            vec4 _98 = textureLod(sampler2D(t0, s0), vec2(fma(_90, _51, _73), fma(_90, _52, _75)), 0.0);
            _81 = _62 + _98.x;
            _80 = _60 + _98.y;
            _79 = _58 + _98.z;
            _77 = _55 + _98.w;
            _55 = _77;
            _58 = _79;
            _60 = _80;
            _62 = _81;
            _82 = _83;
            continue;
        }
        _54 = _55;
        _57 = _58;
        _59 = _60;
        _61 = _62;
        _63 = _64;
        continue;
    }
    precise float _103 = _61 * 0.00390625;
    precise float _104 = _59 * 0.00390625;
    precise float _105 = _57 * 0.00390625;
    precise float _106 = _54 * 0.00390625;
    precise float _114 = _103 * cb0._m3.x;
    precise float _115 = _104 * cb0._m3.y;
    precise float _116 = _105 * cb0._m3.z;
    precise float _117 = _106 * cb0._m3.w;
    precise float _126 = _114 * COLOR.x;
    precise float _127 = _115 * COLOR.y;
    precise float _128 = _116 * COLOR.z;
    precise float _129 = _117 * COLOR.w;
    SV_Target.x = _126;
    SV_Target.y = _127;
    SV_Target.z = _128;
    SV_Target.w = _129;
}

