"""DXBC 指令级反汇编: 解出操作数(寄存器类型/编号/分量掩码/立即数), 供 HLSL 复原使用。
token 布局依据对真实 DXBC 的反推验证:
  opcode = tok & 0x7FF;  operand type = (otok>>12)&0xFF;
  index dimension = (otok>>20)&0x3;  extended = otok>>31;  mask = otok & 0xF
"""
import struct, sys, json, os, glob

# 类型枚举经 504 段统计校准: 88/89/90 三条 DCL 声明的操作数类型在全部样本里
# 稳定落在 7/8/6, 且与 DCL_RESOURCE/CONSTANT_BUFFER/SAMPLER 语义一一对应,
# 故 6=sampler, 7=resource, 8=cb (与公开枚举表的高段顺序不同, 以字节流为准)。
TYPES = {0:"temp",1:"input",2:"output",3:"indexable_temp",4:"immediate32",
         5:"immediate64",6:"sampler",7:"resource",8:"cb",9:"uav",
         10:"input_ps",11:"output_ps",12:"gs_out",13:"stream",14:"function_body",
         15:"function_table",16:"thread_group"}

def chunks(b):
    i = b.find(b"SHDR");  assert i > 0, "no SHDR"
    return struct.unpack_from("<I", b, i+4)[0], struct.unpack_from("<%dI" % (struct.unpack_from("<I", b, i+4)[0]//4), b, i+8)

def disasm(path):
    n, w = chunks(open(path,"rb").read())
    out, ip = [], 2  # w[0]=version, w[1]=dword count
    while ip < len(w):
        tok = w[ip]; op = tok & 0x7FF; ln = (tok >> 24) & 0x7F
        if ln == 0 or ip + ln > len(w): break
        ops, nxt = [], ip + 1
        while nxt < ip + ln:
            o = w[nxt]; typ = (o >> 12) & 0xFF; dim = (o >> 20) & 0x3; mask = o & 0xF
            ext = o >> 31; idx, swz, imm = [], None, None
            nxt += 1
            if ext: nxt += 1  # skip extended token
            for _ in range(dim):
                if nxt < len(w): idx.append(w[nxt]); nxt += 1
            if typ == 4:  # immediate32 float
                vals = struct.unpack("<4f", struct.pack("<4I", *w[nxt:nxt+4])) if nxt+4 <= len(w) else ()
                imm = tuple(round(v,6) for v in vals); nxt += 4
            elif typ == 5:
                nxt += 8
            ops.append({"type": TYPES.get(typ, "t%d" % typ), "mask": mask, "dim": dim,
                        "idx": idx, "imm": imm})
        out.append({"op": op, "len": ln, "ops": ops})
        ip += ln
    return out

if __name__ == "__main__" and sys.argv[1:2] != ["--all"]:
    if sys.argv[1:]:
        for p in sys.argv[1:]:
            for i, ins in enumerate(disasm(p)[:12]):
                print(i, ins["op"], ins["len"], ins["ops"])

MASKNAME = ["","x","y","xy","z","xz","yz","xyz","w","xw","yw","xyw","zw","xzw","yzw","xyzw"]

def fmt(ins, opnames):
    op = opnames.get(str(ins["op"]), "op%d" % ins["op"])
    parts = []
    for i, o in enumerate(ins["ops"]):
        reg = "%s%d" % (o["type"][:5], (o["idx"][0] if o["idx"] else 0))
        if o["imm"] is not None:
            parts.append("(%s)" % ",".join("%g" % v for v in o["imm"]))
        else:
            if o["dim"] and len(o["idx"]) > 1:
                reg += "[%d]" % o["idx"][1]
            parts.append("%s.%s" % (reg, MASKNAME[o["mask"]] or "-"))
    return "%-18s %s" % (op, ", ".join(parts))

def main():
    import json
    names = json.load(open(os.path.join(ROOT, "docs/dxbc_opcodes.json")))["opcodes"] if False else None
    names = json.load(open("docs/dxbc_opcodes.json"))["opcodes"]
    outdir = "shader_extract/asm_full"
    os.makedirs(outdir, exist_ok=True)
    files = sorted(glob.glob("shader_extract/dxbc/*.dxbc"))
    n = 0
    for p in files:
        lines = [fmt(i, names) for i in disasm(p)]
        open(os.path.join(outdir, os.path.basename(p).replace(".dxbc", ".asm")), "w").write("\n".join(lines) + "\n")
        n += 1
    print("produced", n, "asm files ->", outdir)

if __name__ == "__main__" and len(sys.argv) > 1 and sys.argv[1] == "--all":
    main()
