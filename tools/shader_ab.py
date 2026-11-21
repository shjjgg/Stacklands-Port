#!/usr/bin/env python3
"""DXBC 原版 shader 的离线渲染 oracle (软件 GL 4.5 / llvmpipe)。

链路: DXBC -> SPIR-V(dxbc-spirv, Logical 寻址) -> GLSL 450(spirv-cross) -> moderngl 渲染
目的: 在没有 Windows/D3D11 的 Linux 上, 用原版机器码算出"正确像素", 作为移植版
      shader 的 A/B 基准。所有输入 (uniform/纹理/顶点插值) 由本脚本固定, 可复现。

用法:
  python3 tools/shader_ab.py --dxbc shader_extract_all/dxbc/<name>__NN_PS.dxbc \
      --out /tmp/ref.png [--width 256 --height 256 --time 3.0]
"""
import argparse
import re
import struct
import subprocess
import sys
from pathlib import Path

import moderngl
import numpy as np
from PIL import Image

HERE = Path(__file__).resolve().parent
BIN = HERE / "bin"

VS_SRC = """#version 450
layout(location = 1) in vec4 inColor;
layout(location = 2) in vec2 inUV;
layout(location = 1) out vec4 vColor;
layout(location = 2) out vec2 vUV;
void main() {
    vec2 p = vec2((gl_VertexID << 1) & 2, gl_VertexID & 2);
    gl_Position = vec4(p * 2.0 - 1.0, 0.0, 1.0);
    vUV = (p + 0.5) * 0.5;      // 覆盖 0..1
    vColor = vec4(1.0);
}
"""


def dxbc_to_glsl(dxbc: Path) -> str:
    spv = Path("/tmp") / (dxbc.stem + ".spv")
    env = {"DXBC_LOGICAL_ADDRESSING": "1"}
    r = subprocess.run([str(BIN / "dxbc_compiler"), "--spv", str(spv), str(dxbc)],
                       capture_output=True, env={**__import__("os").environ, **env})
    if r.returncode != 0:
        raise SystemExit(f"dxbc_compiler 失败 {dxbc}: {r.stderr.decode()[:400]}")
    r = subprocess.run([str(BIN / "spirv-cross"), str(spv), "--version", "450"],
                       capture_output=True)
    if r.returncode != 0:
        raise SystemExit(f"spirv-cross 失败: {r.stderr.decode()[:400]}")
    return r.stdout.decode()


def build_program(ctx, frag_glsl: str):
    prog = ctx.program(vertex_shader=VS_SRC, fragment_shader=frag_glsl)
    return prog


BASE = {"float": 4, "vec2": 8, "vec3": 12, "vec4": 16, "int": 4, "uint": 4, "ivec2": 8,
        "ivec3": 12, "ivec4": 16, "uvec2": 8, "uvec3": 12, "uvec4": 16, "mat4": 64, "mat3": 48, "mat2": 32}

BLOCK_RE = re.compile(r"layout\(binding\s*=\s*(\d+).*?\) uniform ([A-Za-z_][A-Za-z0-9_]*)\n\{\n(.*?)\n\} ([A-Za-z_][A-Za-z0-9_]*);", re.S)


def fill_uniform_blocks(ctx, prog, glsl, seed_val):
    """按 std140 规则填每个 uniform block, 让 A/B 两侧输入完全一致。"""
    import struct as _s
    np.random.seed(4321)
    bufs = []
    for m in BLOCK_RE.finditer(glsl):
        binding = int(m.group(1))
        body = m.group(3)
        offset = 0
        data = []
        for line in body.split("\n"):
            line = line.strip().rstrip(";")
            if not line or line.startswith("//"):
                continue
            # 形如: vec4 m;  或  uvec4 m[4];
            mm = re.match(r"([A-Za-z0-9_]+)\s+([A-Za-z0-9_]+)(\[\d+\])?", line)
            if not mm:
                continue
            typ, nm, arr = mm.group(1), mm.group(2), mm.group(3)
            size = BASE.get(typ, 4)
            count = int(arr[1:-1]) if arr else 1
            align = 16 if size % 16 == 0 and size >= 16 else max(4, size)
            if typ in ("mat4",):
                align = 16
            offset = (offset + align - 1) // align * align
            for k in range(count):
                vals = np.random.uniform(0, 1, 4)
                vals[3] = seed_val / 10.0
                for comp in range(size // 4):
                    data.append((offset + k * size + comp * 4, float(seed_val if comp == 2 else vals[comp % 4])))
            offset += size * count
        raw = bytearray(offset)
        for off, val in data:
            if off + 4 <= len(raw):
                struct.pack_into("<f", raw, off, val)
        buf = ctx.buffer(bytes(raw))
        buf.bind_to_uniform_block(binding)
        try:
            prog[m.group(4)].binding = binding
        except Exception:
            pass
        bufs.append(buf)
    # 纹理单元
    for name in [n for n in prog]:
        if name.startswith("SPIRV_Cross_Combined") or "sampler" in name:
            pass
    return bufs


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dxbc", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--width", type=int, default=256)
    ap.add_argument("--height", type=int, default=256)
    ap.add_argument("--time", type=float, default=3.0)
    args = ap.parse_args()

    frag = dxbc_to_glsl(Path(args.dxbc))
    ctx = moderngl.create_standalone_context(backend="egl")
    prog = build_program(ctx, frag)

    # 输入纹理: 棋盘 + 彩色渐变, 便于看出 uv/wrap 差异
    w = h = 64
    yy, xx = np.mgrid[0:h, 0:w]
    checker = ((xx // 8 + yy // 8) % 2).astype(np.float32)
    tex = np.dstack([checker, np.linspace(0, 1, w, dtype=np.float32)[None, :].repeat(h, 0),
                     1.0 - checker, np.ones_like(checker)]).astype(np.float32)
    tex_img = ctx.texture((w, h), 4, (tex * 255).astype(np.uint8).tobytes())
    tex_img.build_mipmaps()
    tex_img.use(0)
    for name in [n for n in prog]:
        if name.lower().startswith("spirv_cross_combined") or "tex" in name.lower():
            try:
                prog[name].value = 0
            except Exception:
                pass

    np.random.seed(1234)
    ubo_bytes = fill_uniform_blocks(ctx, prog, frag, args.time)

    fbo = ctx.simple_framebuffer((args.width, args.height))
    fbo.use()
    ctx.clear(0.0, 0.0, 0.0, 1.0)
    vao = ctx.vertex_array(prog, [])
    vao.render(moderngl.TRIANGLES, vertices=3)

    data = fbo.read(components=4)
    img = Image.frombytes("RGBA", fbo.size, data).transpose(Image.FLIP_TOP_BOTTOM)
    img.save(args.out)
    arr = np.asarray(img, dtype=np.float32) / 255.0
    print(f"ok {args.out} mean={arr.mean():.4f} min={arr.min():.3f} max={arr.max():.3f}")


if __name__ == "__main__":
    main()
