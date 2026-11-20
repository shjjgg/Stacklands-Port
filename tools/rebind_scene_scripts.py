"""把场景/prefab 里指向 DLL MonoScript 的 m_Script 重绑到源码脚本的 .meta GUID。

依据: AssetRipper 从 player build 恢复出的 MonoBehaviour 字段集合 == 该类
[SerializeField]/public 字段集合去掉取默认值的项。据此做字段签名匹配, 唯一命中才绑。
"""
import re, glob, os, hashlib, json, sys, collections

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STD_KEYS = {"m_ObjectHideFlags","m_CorrespondingSourceObject","m_PrefabInstance",
            "m_PrefabAsset","m_GameObject","m_Enabled","m_EditorHideFlags","m_Script",
            "m_Name","m_EditorClassIdentifier"}
FIELD_RE = re.compile(r"^(\s*)(?:\[SerializeField\]\s*)?(public|private|protected|internal)?\s*(?:readonly\s+)?(?:static\s+)?([A-Za-z_][\w<>\[\],\. ?]*)\s+([A-Za-z_]\w*)\s*(?:=[^;]*)?;", re.M)

def parse_classes():
    classes = {}
    for path in glob.glob(os.path.join(ROOT, "Assets/Scripts/**/*.cs"), recursive=True):
        src = open(path, encoding="utf-8", errors="ignore").read()
        ns = re.search(r"namespace\s+([\w\.]+)", src)
        for m in re.finditer(r"(?:public|internal|private)?\s*(?:sealed\s+)?class\s+([A-Za-z_]\w*)\s*(?::\s*([\w\.]+))?", src):
            name, base = m.group(1), (m.group(2) or "")
            # 找类体
            i = src.find("{", m.end())
            if i < 0: continue
            depth, j = 0, i
            while j < len(src):
                if src[j] == "{": depth += 1
                elif src[j] == "}":
                    depth -= 1
                    if depth == 0: break
                j += 1
            body = src[i+1:j]
            fields = set()
            for fm in FIELD_RE.finditer(body):
                if fm.group(2) == "public" or "[SerializeField]" in body[max(0,fm.start()-30):fm.start()+1]:
                    if fm.group(3) in ("class","void","return"): continue
                    fields.add(fm.group(4))
            full = (ns.group(1) + "." if ns else "") + name
            classes[full] = {"file": os.path.relpath(path, ROOT), "fields": fields,
                             "base": base.split(".")[-1], "own": set(fields)}
    return classes

def collect_refs():
    refs = collections.defaultdict(lambda: {"keys": None, "where": []})
    files = glob.glob(os.path.join(ROOT,"Assets/**/*.unity"), recursive=True) + \
            glob.glob(os.path.join(ROOT,"Assets/**/*.prefab"), recursive=True)
    blocks = []
    for f in files:
        s = open(f, encoding="utf-8", errors="ignore").read()
        for b in re.split(r"\n--- ", s):
            mm = re.search(r"m_Script:\s*\{fileID: (-?\d+), guid: ([0-9a-f]{32})", b)
            if not mm or "!u!114 " not in b.split("\n")[0]:
                continue
            keys = set(re.findall(r"\n  ([A-Za-z_]\w*):", b)) - STD_KEYS
            refs[(mm.group(2), mm.group(1))]["keys"] = refs[(mm.group(2), mm.group(1))]["keys"] or keys
            refs[(mm.group(2), mm.group(1))]["where"].append(os.path.relpath(f, ROOT))
            blocks.append((f, b, (mm.group(2), mm.group(1))))
    return refs, blocks

def main():
    classes = parse_classes()
    def all_fields(c, seen=()):
        f = set(c["fields"]) | set(c["own"])
        b = c["base"]
        if b and b not in seen:
            for full, cc in classes.items():
                if full.split(".")[-1] == b:
                    f |= all_fields(cc, seen + (b,))
                    break
        return f
    for full, c in classes.items():
        c["fields"] = all_fields(c)
    classes = {k: v for k, v in classes.items() if v["own"]}
    refs, blocks = collect_refs()
    plan, unresolved = {}, []
    for ref, info in refs.items():
        K = info["keys"] or set()
        scored = []
        for full, c in classes.items():
            if not c["own"]: continue
            F = c["fields"]
            hit, miss = len(K & F), len(K - F)
            cov = hit / max(1, len(K))
            scored.append((cov - miss * 0.02 + (len(K & c["own"]) / max(1, len(K))) * 0.1, cov, full, c))
        scored.sort(key=lambda x: -x[0])
        cands = [ (x[2], x[3]) for x in scored[:6] if x[1] >= 0.75 ]
        if cands and (len(cands) == 1 or scored[0][0] - scored[1][0] >= 0.05):
            plan[ref] = cands[0][0]
        elif not cands:
            plan[ref] = None
        else:
            plan[ref] = None
            unresolved.append((ref, sorted(cands, key=lambda c: len(c[1]["fields"]))[:6], sorted(K)))
    print(f"classes={len(classes)} refs={len(refs)} resolved={len(plan)} unresolved={len(unresolved)}")
    for u in unresolved[:20]:
        print("UNRES", u[0], "keys=", u[2][:8], "cands=", [(c[0], len(c[1]['fields'])) for c in u[1]])
    json.dump({"plan": {"|".join(k): v for k, v in plan.items()},
               "unresolved": [[list(u[0]), [c[0] for c in u[1]], u[2]] for u in unresolved]},
              open(os.path.join(ROOT,"docs/script_rebind.json"),"w"), indent=1, ensure_ascii=False)
    return plan, classes

if __name__ == "__main__":
    main()
