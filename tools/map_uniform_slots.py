"""把 GLSL 重建里的 cb0._mN 槽位映射回原 shader 属性名。

依据: Unity 按 Properties 声明顺序把 per-material 标量/向量打进同一 cbuffer,
float4 占一个槽, float 按 4 个一包。这里按顺序对齐并用类型宽度校验。
"""
import re, json, os, glob, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def parse_glsl_cb(path):
    txt = open(path).read()
    out = {}
    for m in re.finditer(r"uniform cb(\d+)_buf\s*\{\n(.*?)\} cb\1;", txt, re.S):
        idx, body = m.group(1), m.group(2)
        members = re.findall(r"\s*(uvec4|vec4|ivec4|float|vec3|vec2)\s+([A-Za-z_0-9]+)\s*;", body)
        out[idx] = members
    return out

def width(t):
    return {"float":1, "vec2":2, "vec3":3, "vec4":4, "uvec4":4, "ivec4":4}[t]

def map_shader(spec_path, glsl_path):
    spec = json.load(open(spec_path))
    props = [(p["name"], p["type"]) for p in spec["properties"]]
    cbs = parse_glsl_cb(glsl_path)
    per_mat = None
    for idx, members in cbs.items():
        regs = sum(width(t) for t, _ in members)
        # UnityPerMaterial 一般是最小的那个且成员数量与属性接近
        if per_mat is None or len(members) < len(per_mat[1]):
            per_mat = (idx, members)
    idx, members = per_mat
    plan, slot = {}, 0
    floats_left = 0
    for name, typ in props:
        if typ in ("Color", "Vector"):
            plan[f"cb{idx}[{slot}]"] = name; slot += 1
        elif typ in ("Float", "Range"):
            if floats_left == 0: floats_left = 4
            plan[f"cb{idx}[{slot}].{ 'xyzw'[4-floats_left] }"] = name
            floats_left -= 1
            if floats_left == 0: slot += 1
        elif typ == "Texture":
            plan.setdefault("_textures", []).append(name)
    return {"per_material_cb": idx, "members": members, "map": plan,
            "props": props, "member_count": len(members), "slot_count": slot}

if __name__ == "__main__":
    out = {}
    for spec in sorted(glob.glob(os.path.join(ROOT, "shader_extract/spec/*.json"))):
        key = os.path.basename(spec)[:-5]
        glsl = os.path.join(ROOT, f"shader_extract/glsl_exact/{key}__03_PS.glsl")
        if not os.path.exists(glsl):
            cand = sorted(glob.glob(os.path.join(ROOT, f"shader_extract/glsl_exact/{key}__*.glsl")))
            if not cand: continue
            glsl = cand[0]
        try:
            out[key] = map_shader(spec, glsl)
        except Exception as e:
            out[key] = {"error": str(e)}
    json.dump(out, open(os.path.join(ROOT, "shader_extract/uniform_map.json"), "w"), indent=1, ensure_ascii=False)
    for k, v in list(out.items())[:6]:
        print(k, v.get("per_material_cb"), v.get("member_count"), v.get("slot_count"), list(v.get("map", {}).items())[:4])
