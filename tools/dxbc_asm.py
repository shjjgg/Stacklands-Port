"""DXBC 指令级反汇编: 解出操作数(寄存器类型/编号/分量掩码/立即数), 供 HLSL 复原使用。
token 布局依据对真实 DXBC 的反推验证:
  opcode = tok & 0x7FF;  operand type = (otok>>12)&0xFF;
  index dimension = (otok>>20)&0x3;  extended = otok>>31;  mask = otok & 0xF
"""
import struct, sys, json, os, glob

TYPES = {0:"temp",1:"input",2:"output",3:"indexable_temp",4:"immediate32",
         5:"immediate64",6:"cb",7:"sampler",8:"resource",9:"uav",
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

if __name__ == "__main__":
    if sys.argv[1:]:
        for p in sys.argv[1:]:
            for i, ins in enumerate(disasm(p)[:12]):
                print(i, ins["op"], ins["len"], ins["ops"])
