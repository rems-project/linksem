#!/usr/bin/env python3
# Claude: this script is largely written by Claude (19 September 2026).
"""Turn a corpus of test sources into ELF objects and, from each object, a
minimal linked executable, so that both the relocatable and the linked view
of the same DWARF are tested.  Writes OUT/manifest.json describing every
attempt (source, tool chain, result, stderr)."""
import json, os, subprocess, sys, pathlib

TOOLCHAINS = {
    # name: (assembler for .s, compiler for .S (needs cpp), linker)
    "x86_64":  (["as"], ["gcc", "-c"], ["ld"]),
    "i386":    (["as", "--32"], ["gcc", "-m32", "-c"], ["ld", "-m", "elf_i386"]),
    "aarch64": (["aarch64-linux-gnu-as"], ["aarch64-linux-gnu-gcc", "-c"], ["aarch64-linux-gnu-ld"]),
}
LINK_FLAGS = ["-nostdlib", "--entry=0", "--unresolved-symbols=ignore-all", "--no-relax"]

def run(cmd, timeout=60):
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, errors="replace", timeout=timeout)
        return p.returncode, p.stderr.strip()
    except subprocess.TimeoutExpired:
        return -1, "timeout"
    except FileNotFoundError as e:
        return -2, str(e)

def build_binutils(src, out):
    """binutils-all: assemble every .s/.S with each toolchain that accepts it."""
    entries = []
    for f in sorted(src.glob("*.[sS]")):
        for tc, (as_cmd, cc_cmd, ld_cmd) in TOOLCHAINS.items():
            stem = f"{f.stem}.{tc}"
            obj = out / f"{stem}.o"
            cmd = (cc_cmd + [str(f), "-o", str(obj)]) if f.suffix == ".S" else (as_cmd + [str(f), "-o", str(obj)])
            rc, err = run(cmd)
            e = {"source": str(f.relative_to(src)), "toolchain": tc, "object": obj.name if rc == 0 else None,
                 "assemble_cmd": " ".join(cmd), "assemble_rc": rc, "assemble_err": err[:2000]}
            if rc == 0:
                exe = out / f"{stem}.exe"
                lcmd = ld_cmd + LINK_FLAGS + [str(obj), "-o", str(exe)]
                lrc, lerr = run(lcmd)
                e.update({"executable": exe.name if lrc == 0 else None, "link_cmd": " ".join(lcmd),
                          "link_rc": lrc, "link_err": lerr[:2000]})
                if lrc != 0 and exe.exists(): exe.unlink()
            elif obj.exists():
                obj.unlink()
            entries.append(e)
    return entries

# --- LLVM: objects from the tests' own producers -------------------------------
import re, shlex, shutil

def run_lines(f):
    """The RUN lines of a lit test, with line continuations joined."""
    text = f.read_text(errors="replace")
    lines = re.findall(r"^[;#/]*\s*RUN:\s*(.*)$", text, re.M)
    out, cur = [], ""
    for l in lines:
        if l.rstrip().endswith("\\"):
            cur += l.rstrip()[:-1] + " "
        else:
            out.append(cur + l); cur = ""
    return out

def first_producer(f, tool, tmp):
    """The first RUN command that invokes TOOL on the test file itself, split
    into argv, with lit's %s / %S / %p / %t substituted (all absolute, %t
    inside the per-test scratch directory TMP); None if there is none or the
    line cannot be parsed."""
    subst = lambda a: (a.replace("%llc_dwarf", "llc").replace("%s", str(f)).replace("%S", str(f.parent))
                        .replace("%p", str(f.parent)).replace("%T", str(tmp)).replace("%t", str(tmp / "t")))
    for l in run_lines(f):
        for part in l.split("|"):
            try:
                argv = shlex.split(subst(part.strip()))
            except ValueError:
                continue
            # shell redirections: `< file` feeds the input, which llc/llvm-mc
            # also accept as a positional argument; drop `> file` and `2>&1`
            out_argv, i = [], 0
            while i < len(argv):
                a = argv[i]
                if a == "<" and i + 1 < len(argv): out_argv.append(argv[i + 1]); i += 2
                elif a in (">", ">>", "2>") and i + 1 < len(argv): i += 2
                elif a in ("2>&1", "&>"): i += 1
                elif a == "-o" and i + 1 < len(argv) and argv[i + 1] == "-": out_argv += ["-o", str(tmp / "t.o")]; i += 2
                else: out_argv.append(a); i += 1
            argv = out_argv
            if argv and argv[0].split("/")[-1] == tool and any(str(f) in a or str(tmp) in a for a in argv[1:]):
                return argv
    return None

def output_of(argv, default):
    """The path a producer writes to: its -o argument, else DEFAULT (added)."""
    if "-o" in argv:
        return pathlib.Path(argv[argv.index("-o") + 1]), argv
    return default, argv + ["-o", str(default)]

def link_one(tc, obj, exe):
    ld = TOOLCHAINS.get(tc, TOOLCHAINS["x86_64"])[2]
    rc, err = run(ld + LINK_FLAGS + [str(obj), "-o", str(exe)])
    if rc != 0 and exe.exists(): exe.unlink()
    return rc, err

def machine_of(obj):
    p = subprocess.run(["aarch64-linux-gnu-readelf", "-h", str(obj)], capture_output=True, text=True, errors="replace")
    m = re.search(r"Machine:\s*(.*)", p.stdout)
    return {"AArch64": "aarch64", "Advanced Micro Devices X86-64": "x86_64", "Intel 80386": "i386"}.get(m.group(1).strip() if m else "", "other")

def build_llvm(src, out):
    """yaml2obj YAMLs, llvm-mc assembly and llc IR from llvm/test/DebugInfo and
    llvm/test/tools/llvm-dwarfdump, driven by each test's own RUN line, plus
    the precompiled ELF Inputs; each object is also linked into an executable
    where a toolchain exists.  Producers run in a per-test scratch directory."""
    entries = []
    roots = [src / "llvm/test/tools/llvm-dwarfdump", src / "llvm/test/DebugInfo"]
    for root in roots:
        for f in sorted(root.rglob("*")):
            if not f.is_file() or ("Inputs" in f.parts and f.suffix in (".yaml", ".s", ".ll")):
                continue
            rel = f.relative_to(src / "llvm/test")
            stem = str(rel).replace("/", "__")
            e = {"source": str(rel)}
            tmp = out / "tmp" / stem
            obj = out / (stem + ".o")
            produced = None
            if f.suffix in (".yaml", ".s", ".ll"):
                tool = {".yaml": "yaml2obj", ".s": "llvm-mc", ".ll": "llc"}[f.suffix]
                tmp.mkdir(parents=True, exist_ok=True)
                argv = first_producer(f, tool, tmp)
                if argv is None and f.suffix == ".yaml":
                    argv = ["yaml2obj", str(f)]
                if argv is None:
                    e.update(assemble_rc=-3, assemble_err=f"no {tool} RUN line"); entries.append(e); continue
                if f.suffix == ".s" and "-filetype=obj" not in argv: argv.append("-filetype=obj")
                if f.suffix == ".ll":
                    argv = [a for a in argv if not a.startswith("-filetype")] + ["-filetype=obj"]
                produced, argv = output_of(argv, tmp / "t.o")
                try:
                    p = subprocess.run(argv, capture_output=True, text=True, errors="replace", timeout=120, cwd=tmp)
                    rc, err = p.returncode, p.stderr.strip()
                except subprocess.TimeoutExpired:
                    rc, err = -1, "timeout"
                except FileNotFoundError as ex:
                    rc, err = -2, str(ex)
                e.update(assemble_cmd=" ".join(argv), assemble_rc=rc, assemble_err=err[:2000])
                if rc == 0 and produced.exists() and produced.is_file() and produced.read_bytes()[:4] == b"\x7fELF":
                    shutil.copy(produced, obj)
                else:
                    rc = rc or 1
            elif "Inputs" in f.parts and (f.suffix in (".o", ".elf", ".so") or ".elf" in f.name):
                if f.read_bytes()[:4] != b"\x7fELF": continue
                obj = out / (stem if stem.endswith((".o", ".so")) else stem + ".elf")
                shutil.copy(f, obj); rc = 0; e.update(assemble_cmd="copy", assemble_rc=0, assemble_err="")
            else:
                continue
            if rc == 0 and obj.exists():
                e["object"] = obj.name
                tc = machine_of(obj)
                if tc in TOOLCHAINS and obj.suffix == ".o":
                    exe = out / (stem + ".exe")
                    lrc, lerr = link_one(tc, obj, exe)
                    e.update(executable=exe.name if lrc == 0 else None, link_rc=lrc, link_err=lerr[:2000])
            else:
                e["object"] = None
            entries.append(e)
    shutil.rmtree(out / "tmp", ignore_errors=True)
    return entries

# --- elfutils: the checked-in test binaries -----------------------------------
import bz2

def build_elfutils(src, out):
    entries = []
    for f in sorted((src / "tests").glob("testfile*.bz2")):
        name = f.name[:-4]
        dst = out / name
        try:
            dst.write_bytes(bz2.decompress(f.read_bytes()))
            ok = dst.read_bytes()[:4] == b"\x7fELF"
            if not ok: dst.unlink()
            entries.append({"source": f.name, "object": name if ok else None, "assemble_cmd": "bunzip2", "assemble_rc": 0 if ok else 1, "assemble_err": "" if ok else "not ELF"})
        except Exception as ex:
            entries.append({"source": f.name, "object": None, "assemble_rc": 1, "assemble_err": str(ex)})
    return entries

BUILDERS = {"binutils": build_binutils, "llvm": build_llvm, "elfutils": build_elfutils}

def main():
    corpus, src, out = sys.argv[1], pathlib.Path(sys.argv[2]), pathlib.Path(sys.argv[3])
    out.mkdir(parents=True, exist_ok=True)
    entries = BUILDERS[corpus](src, out)
    (out / "manifest.json").write_text(json.dumps(entries, indent=1))
    objs = sum(1 for e in entries if e.get("object")); exes = sum(1 for e in entries if e.get("executable"))
    print(f"build: {corpus}: {len(entries)} attempts, {objs} objects, {exes} executables -> {out}")

if __name__ == "__main__":
    main()
