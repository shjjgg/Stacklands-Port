#!/usr/bin/env python3
"""glsl_ref.py — 用 glsl_exact 的原版 PS 离线算参考像素 (moderngl/EGL, 无需 dxbc 工具链)。

原版 GLSL 里剩余的 SPIR-V 内建名(spvNClamp/spvNMin/spvNMax/dpN_f32)由本脚本的预置头补全,
uniform block 直接按 cb0..cb4 内存填充, 采样器按 t0..t6 绑定。

用法:
  python3 tools/glsl_ref.py --glsl shader_extract/glsl_exact/Custom__BoosterShaderTop__08_PS.glsl \
      --out /tmp/ref.png --w 256 --h 320 --set cb0._m6=0.125,0.125,0.216 \
      --tex t0=white --tex t1=Assets/Texture2D/Traveling-Cart.png
"""
import argparse, os, re, struct, subprocess, sys
import numpy as np
from PIL import Image

PRELUDE = """
float spvNClamp(float x,float a,float b){return clamp(x,a,b);}
vec2 spvNClamp(vec2 x,vec2 a,vec2 b){return clamp(x,a,b);}
vec3 spvNClamp(vec3 x,vec3 a,vec3 b){return clamp(x,a,b);}
vec4 spvNClamp(vec4 x,vec4 a,vec4 b){return clamp(x,a,b);}
float spvNMin(float a,float b){return min(a,b);}
vec2 spvNMin(vec2 a,vec2 b){return min(a,b);}
vec3 spvNMin(vec3 a,vec3 b){return min(a,b);}
vec4 spvNMin(vec4 a,vec4 b){return min(a,b);}
float spvNMax(float a,float b){return max(a,b);}
vec2 spvNMax(vec2 a,vec2 b){return max(a,b);}
vec3 spvNMax(vec3 a,vec3 b){return max(a,b);}
vec4 spvNMax(vec4 a,vec4 b){return max(a,b);}
"""

FILL = 1.0
BASE = {"float":4,"vec2":8,"vec3":12,"vec4":16,"int":4,"uint":4,"ivec2":8,"ivec3":12,
        "ivec4":16,"uvec2":8,"uvec3":12,"uvec4":16,"mat4":64,"mat3":48,"mat2":32}
BLOCK_RE = re.compile(r"layout\((?:(?:set\s*=\s*0,\s*)?)binding\s*=\s*(\d+)[^\n]*\)\s*uniform\s+([A-Za-z_0-9]+)\n\{\n(.*?)\n\}\s*([A-Za-z_0-9]+);", re.S)


def prepare(path):
    src = open(path, errors="ignore").read()
    src = src.replace("#extension GL_EXT_buffer_reference2 : require", "")
    src = src.replace("#extension GL_EXT_spirv_intrinsics : require", "")
    src = re.sub(r"[ \t]*spirv_instruction\([^\n]*\);", "", src)
    # 先摘掉 separate sampler/texture 对象声明(GL 里统一成合并采样器)
    tmap = {}
    for m in re.finditer(r"uniform (texture2D|textureCube|texture3D|texture2DArray) (t\d+);", src):
        tmap[m.group(2)] = {"texture2D": "sampler2D", "textureCube": "samplerCube",
                            "texture3D": "sampler3D", "texture2DArray": "sampler2DArray"}[m.group(1)]
    src = re.sub(r"[ \t]*layout\([^\n]*\)\s*uniform sampler s\d+;", "", src)
    src = re.sub(r"[ \t]*layout\([^\n]*\)\s*uniform texture(2D|Cube|3D|2DArray) t\d+;", "", src)
    # layout(set=0, binding=N, std140) -> layout(binding=N, std140)
    src = re.sub(r"layout\(set\s*=\s*0,\s*(binding)", r"layout(\1", src)
    # sampler2D(t0, s2) -> t0
    for name, typ in tmap.items():
        src = re.sub(typ + r"\(\s*" + name + r"\s*,\s*s\d+\s*\)", name, src)
    decls = "\n".join(f"uniform {typ} {name};" for name, typ in tmap.items())
    src = src.replace("void main()", decls + "\n\nvoid main()", 1)
    return src


def parse_blocks(src):
    """返回 [(binding, block_name, [(type,name,count)...]), ...] (按 std140 计算偏移)。"""
    out = []
    for m in BLOCK_RE.finditer(src):
        binding, bname, body, inst = int(m.group(1)), m.group(2), m.group(3), m.group(4)
        mem, off = [], 0
        for line in body.split("\n"):
            line = line.strip().rstrip(";")
            if not line or line.startswith("//"):
                continue
            mm = re.match(r"([A-Za-z_0-9]+)\s+([A-Za-z_0-9]+)(\[\d+\])?", line)
            if not mm:
                continue
            typ, nm, arr = mm.group(1), mm.group(2), mm.group(3)
            size = BASE.get(typ, 4)
            cnt = int(arr[1:-1]) if arr else 1
            align = 16 if size >= 16 else (8 if size == 8 else 4)
            off = (off + align - 1) // align * align
            mem.append((off, typ, nm, size, cnt))
            off += size * cnt
        out.append((binding, bname, inst, mem, off))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--glsl", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--w", type=int, default=256)
    ap.add_argument("--h", type=int, default=256)
    ap.add_argument("--set", action="append", default=[], help="cbN._mX=v,v,v 或 float")
    ap.add_argument("--tex", action="append", default=[], help="tN=path|white|black")
    ap.add_argument("--uv", default="1,1", help="TEXCOORD 缩放")
    ap.add_argument("--fill", type=float, default=1.0, help="未指定 uniform 成员的填充值")
    a = ap.parse_args()

    import moderngl
    global FILL
    FILL = a.fill
    src = prepare(a.glsl)
    # 去掉 layout(...) in/out 的 component 限定, GL 4.5 不认
    src = re.sub(r"layout\(location = (\d+)(, component = 0)?\)", r"layout(location = \1)", src)
    # 原版 vert 输入命名在 PS 里是 in 变量, 这里统一改名为 v_
    glsl = src.replace("#version 450", "#version 450\n" + PRELUDE, 1)

    ctx = moderngl.create_standalone_context(backend="egl")
    try:
        prog = ctx.program(vertex_shader=VERT, fragment_shader=glsl)
    except Exception as e:
        print("编译失败:", str(e)[:1500]); sys.exit(2)

    blocks = parse_blocks(src)
    vals = {}
    for s in a.set:
        k, v = s.split("=", 1)
        vals[k] = [float(x) for x in v.split(",")]

    for binding, bname, inst, mem, total in blocks:
        raw = bytearray(max(total, 16))
        for off, typ, nm, size, cnt in mem:
            for k in range(cnt):
                key = f"{inst}.{nm}" if cnt == 1 else f"{inst}.{nm}[{k}]"
                if key in vals:
                    v = vals[key]
                    for c in range(size // 4):
                        struct.pack_into("<f", raw, off + k * size + c * 4, v[c] if c < len(v) else 0.0)
                else:
                    for c in range(size // 4):   # 未指定的成员填 fill(默认 1.0), 否则光照项全 0 出黑图
                        struct.pack_into("<f", raw, off + k * size + c * 4, FILL)
        buf = ctx.buffer(bytes(raw))
        buf.bind_to_uniform_block(binding)
        try: prog[inst].binding = binding
        except Exception: pass

    # 纹理
    texmap = dict(s.split("=", 1) for s in a.tex)
    for name in [n for n in prog]:
        pass
    def load_tex(path):
        im = Image.open(path).convert("RGBA")
        t = ctx.texture(im.size, 4, np.asarray(im, dtype=np.uint8).tobytes())
        t.repeat_x = t.repeat_y = True; t.use(0)
        t.build_mipmaps(); t.filter = (moderngl.LINEAR_MIPMAP_LINEAR, moderngl.LINEAR)
        return t
    white = ctx.texture((1, 1), 4, bytes([255, 255, 255, 255]))
    white.build_mipmaps()
    for tname, path in texmap.items():
        t = white if path == "white" else load_tex(path)
        t.use(0)
        if tname in prog:
            try: prog[tname].value = 0
            except Exception as e: print("绑定失败", tname, e)
        # spirv-cross 生成的采样器名形如 SPIRV_Cross_Combinedt0s2
        for n in [x for x in prog if "Combined" in x]:
            if tname in n:
                try: prog[n].value = 0; t.use(0)
                except Exception: pass
        for n in [x for x in prog if x == "t" + tname[1:]]:
            try: prog[n].value = 0; t.use(0)
            except Exception: pass

    fbo = ctx.simple_framebuffer((a.w, a.h))
    fbo.use(); ctx.clear(0.0, 0.0, 0.0, 1.0)
    vao = ctx.vertex_array(prog, [])
    vao.render(moderngl.TRIANGLES, vertices=3)
    data = fbo.read(components=4)
    img = Image.frombytes("RGBA", fbo.size, data).transpose(Image.FLIP_TOP_BOTTOM)
    img.save(a.out)
    arr = np.asarray(img, dtype=np.float32) / 255.0
    print(f"ok {a.out} {a.w}x{a.h} mean={arr[..., :3].mean():.4f}")


VERT = """#version 450
layout(location = 1) in vec2 inUV;
layout(location = 2) in vec3 inN;
layout(location = 3) in vec3 inP;
layout(location = 1) out vec2 TEXCOORD;
layout(location = 2) out vec3 TEXCOORD1;
layout(location = 3) out vec3 TEXCOORD2;
void main(){
    vec2 p = vec2((gl_VertexID << 1) & 2, gl_VertexID & 2);
    gl_Position = vec4(p * 2.0 - 1.0, 0.0, 1.0);
    TEXCOORD = p * 0.5;             // 0..1 铺满
    TEXCOORD.y = 1.0 - TEXCOORD.y;
    TEXCOORD1 = normalize(vec3(0.2, 0.9, 0.3));
    TEXCOORD2 = vec3(0.0, 0.5, 0.0);
}
"""

if __name__ == "__main__":
    main()
