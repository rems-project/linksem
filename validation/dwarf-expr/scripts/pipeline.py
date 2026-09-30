#!/usr/bin/env python3
# Claude: the driver of the DWARF expression cross-check harness (see ../README.md).
#
#   pipeline.py tools                        what is installed, what to install
#   pipeline.py run ARCH EXPRS RUNDIR [BATCH [JOBS]]
#                                            build the test program from EXPRS, evaluate
#                                            with linksem, gdb and lldb, write RUNDIR/report.md;
#                                            with BATCH, split the expressions into programs of
#                                            BATCH variables (RUNDIR/batchNN/), JOBS at a time
#   pipeline.py check ARCH NAME [NAME...]     run tests/NAME.txt (or the random set NAME =
#                                            random-seedS or random-frames-seedS) into
#                                            output/ARCH-NAME and compare
#                                            with expected/ARCH-NAME; exit 1 on a difference
#   pipeline.py accept ARCH NAME [NAME...]    copy output/ARCH-NAME results into expected/
#   pipeline.py minimize RUNDIR               a minimal standalone example for each disagreement,
#                                            in RUNDIR/discrepancies/
#   pipeline.py diff RUNDIR1 RUNDIR2          expressions whose results or class differ
#
# ARCH is x86_64 or aarch64.  The host's own architecture runs natively; the other runs
# under qemu-user with the debuggers attached to its gdb stub.  Missing tools are
# reported with the Ubuntu package to install, and the run proceeds with the evaluators
# that are present (a result file then starts with "# not run: ...").
import os, sys, shutil, subprocess, platform, time, re, collections

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
BIN = os.path.join(ROOT, "ocaml", "_build", "default", "bin")
ARCHES = ["x86_64", "aarch64"]
RANDOM_N, RANDOM_MAXOPS = 1000, 8          # the random regression set (random-seedS)

sys.path.insert(0, HERE)
import compare

def host_arch():
    m = platform.machine()
    return {"x86_64": "x86_64", "amd64": "x86_64", "aarch64": "aarch64", "arm64": "aarch64"}.get(m, m)

# ---- tools ----

class Tools:
    """the external tools for one target architecture, or the reason each is missing"""
    def __init__(self, arch):
        self.arch = arch
        self.native = (arch == host_arch())
        self.missing = []                      # (what, package) pairs
        prefix = "" if self.native else {"x86_64": "x86_64-linux-gnu-", "aarch64": "aarch64-linux-gnu-"}[arch]
        cross_pkg = {"x86_64": "binutils-x86-64-linux-gnu", "aarch64": "binutils-aarch64-linux-gnu"}[arch]
        self.as_ = self.find(prefix + "as", "binutils" if self.native else cross_pkg)
        self.ld = self.find(prefix + "ld", "binutils" if self.native else cross_pkg)
        if self.native:
            self.emu = None
        else:
            self.emu = self.find("qemu-" + arch, "qemu-user")
        # gdb: the native one for the host architecture, gdb-multiarch for the other
        if self.native:
            self.gdb = self.find("gdb", "gdb")
        else:
            self.gdb = shutil.which("gdb-multiarch") or self.find("gdb-multiarch", "gdb-multiarch")
        self.lldb = self.find("lldb", "lldb")
        if self.lldb:
            # the Python bindings must load inside lldb
            r = subprocess.run([self.lldb, "-b", "-o", "script import lldb"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            if "error" in r.stdout.lower() or r.returncode != 0:
                self.missing.append(("lldb Python scripting (lldb -b -o 'script import lldb' fails)", "python3-lldb"))
                self.lldb = None
        self.can_build = bool(self.as_ and self.ld)
        self.can_run = self.can_build and (self.native or bool(self.emu))

    def find(self, name, package):
        p = shutil.which(name)
        if not p: self.missing.append((name, package))
        return p

    def versions(self):
        """one line per tool: the first line of its --version output"""
        out = []
        for tool in (self.as_, self.gdb, self.lldb, self.emu):
            if tool:
                try:
                    v = subprocess.run([tool, "--version"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=20).stdout.splitlines()[0]
                except Exception as e:
                    v = "(%s)" % e
                out.append("%s: %s" % (os.path.basename(tool), v))
        try:
            v = subprocess.run(["ocamlfind", "list"], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True).stdout
            m = re.search(r"^linksem\s+\(version: ([^)]*)\)", v, re.M)
            if m: out.append("linksem: " + m.group(1))
        except Exception:
            pass
        return out

    def report(self):
        lines = ["%s (%s):" % (self.arch, "native" if self.native else "emulated")]
        for what, tool in [("assembler", self.as_), ("linker", self.ld), ("emulator", self.emu if not self.native else "(not needed)"), ("gdb", self.gdb), ("lldb", self.lldb)]:
            lines.append("  %-10s %s" % (what, tool or "MISSING"))
        if self.missing:
            lines.append("  to install (Ubuntu/Debian): sudo apt-get install " + " ".join(sorted(set(p for _, p in self.missing))))
        return "\n".join(lines)

def cmd_tools():
    print("host: %s\n" % host_arch())
    for a in ARCHES:
        print(Tools(a).report())
        print()

# ---- one run ----

def sh(args, **kw):
    r = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, **kw)
    if r.returncode != 0:
        raise RuntimeError("%s failed:\n%s%s" % (" ".join(args), r.stdout, r.stderr))
    return r.stdout

def build(arch, exprs, rundir, tools=None):
    """exprs (a file) -> rundir/{exprs.txt,prog.s,state.txt,prog}; returns tools"""
    tools = tools or Tools(arch)
    os.makedirs(rundir, exist_ok=True)
    dst = os.path.join(rundir, "exprs.txt")
    if os.path.abspath(exprs) != os.path.abspath(dst): shutil.copy(exprs, dst)
    sh([os.path.join(BIN, "dwexpr_build.exe"), arch, dst, os.path.join(rundir, "prog.s"), os.path.join(rundir, "state.txt")])
    if not tools.can_build:
        print("cannot assemble for %s: %s" % (arch, "; ".join("%s missing (%s)" % m for m in tools.missing)))
        return tools
    sh([tools.as_, "-o", os.path.join(rundir, "prog.o"), os.path.join(rundir, "prog.s")])
    sh([tools.ld, "-static", "-o", os.path.join(rundir, "prog"), os.path.join(rundir, "prog.o")])
    return tools

def not_run(path, why):
    open(path, "w").write("# not run: %s\n" % why)

def eval_linksem(rundir):
    prog = os.path.join(rundir, "prog")
    if not os.path.exists(prog):
        return not_run(os.path.join(rundir, "linksem.txt"), "no test program (assembler or linker missing)")
    out = sh([os.path.join(BIN, "dwexpr_eval.exe"), prog, os.path.join(rundir, "state.txt"), os.path.join(rundir, "exprs.txt")])
    open(os.path.join(rundir, "linksem.txt"), "w").write(out)

PORT = int(os.environ.get("DWEXPR_PORT", "1234"))

def emulator_cmd(tools, prog, port):
    return [tools.emu, "-g", str(port), prog] if tools.emu else None

def eval_gdb(rundir, tools, port=PORT):
    path = os.path.join(rundir, "gdb.txt")
    prog = os.path.join(rundir, "prog")
    if not os.path.exists(prog): return not_run(path, "no test program")
    if not tools.gdb: return not_run(path, "gdb not found (sudo apt-get install %s)" % ("gdb" if tools.native else "gdb-multiarch"))
    if not tools.native and not tools.emu: return not_run(path, "no emulator for %s (sudo apt-get install qemu-user)" % tools.arch)
    env = dict(os.environ)
    if not tools.native: env["DWEXPR_REMOTE"] = ":%d" % port
    args = [os.path.join(HERE, "gdb_run.py"), tools.gdb, prog, os.path.join(rundir, "state.txt"), os.path.join(rundir, "exprs.txt")]
    if not tools.native: args += emulator_cmd(tools, prog, port)
    out = subprocess.run(args, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True).stdout
    open(path, "w").write(out)

def eval_lldb(rundir, tools, port=PORT):
    path = os.path.join(rundir, "lldb.txt")
    prog = os.path.join(rundir, "prog")
    if not os.path.exists(prog): return not_run(path, "no test program")
    if not tools.lldb: return not_run(path, "lldb not found (sudo apt-get install lldb)")
    if not tools.native and not tools.emu: return not_run(path, "no emulator for %s (sudo apt-get install qemu-user)" % tools.arch)
    env = dict(os.environ, DWEXPR_PROG=prog, DWEXPR_STATE=os.path.join(rundir, "state.txt"), DWEXPR_EXPRS=os.path.join(rundir, "exprs.txt"))
    q = None
    if not tools.native:
        env["DWEXPR_REMOTE"] = "127.0.0.1:%d" % port
        q = subprocess.Popen(emulator_cmd(tools, prog, port), stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        time.sleep(0.5)
    r = subprocess.run([tools.lldb, "-b", "-o", "command script import " + os.path.join(HERE, "lldb_eval.py")], env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)
    if q: q.kill(); q.wait()
    lines = [l for l in r.stdout.splitlines() if re.match(r"^(#|[A-Za-z_0-9]+ = )", l)]
    open(path, "w").write("\n".join(lines) + "\n")

def run_one(arch, exprs, rundir, tools, port):
    """one program: build and the three evaluations"""
    tools = build(arch, exprs, rundir, tools)
    eval_linksem(rundir)
    eval_gdb(rundir, tools, port)
    eval_lldb(rundir, tools, port)
    return tools

def run(arch, exprs, rundir, tools=None, quiet=False, batch=None, jobs=1):
    """batch: split the expressions into programs of that many variables (the
    debuggers' start-up and gdb's restarts after a crash grow with the program's
    DWARF, so large sets are faster in pieces), run them JOBS at a time, and
    concatenate the results"""
    tools = tools or Tools(arch)
    lines = [l for l in open(exprs).read().splitlines() if l.split("#")[0].strip()]
    if batch and len(lines) > batch:
        import concurrent.futures
        os.makedirs(rundir, exist_ok=True)
        if os.path.abspath(exprs) != os.path.abspath(os.path.join(rundir, "exprs.txt")): shutil.copy(exprs, os.path.join(rundir, "exprs.txt"))
        chunks = [lines[i:i + batch] for i in range(0, len(lines), batch)]
        dirs = []
        for k, c in enumerate(chunks):
            d = os.path.join(rundir, "batch%02d" % k)
            os.makedirs(d, exist_ok=True)
            open(os.path.join(d, "exprs.txt"), "w").write("\n".join(c) + "\n")
            dirs.append(d)
        def job(k):
            run_one(arch, os.path.join(dirs[k], "exprs.txt"), dirs[k], tools, PORT + k)
            return k
        with concurrent.futures.ThreadPoolExecutor(max_workers=max(1, jobs)) as ex:
            for k in ex.map(job, range(len(dirs))):
                if not quiet: print("  batch %d/%d done" % (k + 1, len(dirs)), flush=True)
        for f in RESULT_FILES:
            with open(os.path.join(rundir, f), "w") as out:
                for d in dirs:
                    p = os.path.join(d, f)
                    if os.path.exists(p): out.write(open(p).read())
        shutil.copy(os.path.join(dirs[0], "state.txt"), os.path.join(rundir, "state.txt"))
    else:
        run_one(arch, exprs, rundir, tools, PORT)
    rows, hg, hl = compare.load(rundir)
    summary = compare.write_report(rundir, rows, hg, hl, tools.versions())
    if not quiet:
        for what, pkg in tools.missing:
            print("  %s not found: %s (Ubuntu/Debian: sudo apt-get install %s)" % (what, "that evaluator or architecture was skipped", pkg))
        print("%s: %s" % (rundir, summary))
    return rows

# ---- regression ----

def exprs_for(arch, name):
    """the expression file for a named set: tests/NAME.txt, or a generated random set"""
    m = re.match(r"random(-frames)?(-typed)?-seed(\d+)$", name)
    if m:
        path = os.path.join(ROOT, "output", "%s-%s" % (arch, name), "exprs.txt")
        os.makedirs(os.path.dirname(path), exist_ok=True)
        flags = (["--frames"] if m.group(1) else []) + (["--typed"] if m.group(2) else [])
        open(path, "w").write(sh([os.path.join(BIN, "dwexpr_gen.exe"), arch, str(RANDOM_N), m.group(3), str(RANDOM_MAXOPS)] + flags))
        return path
    return os.path.join(ROOT, "tests", name + ".txt")

RESULT_FILES = ["linksem.txt", "gdb.txt", "lldb.txt"]

def strip_comments(path):
    if not os.path.exists(path): return None
    return [l for l in open(path).read().splitlines() if not l.startswith("#")]

def cmd_check(arch, names):
    tools = Tools(arch)
    if not tools.can_run:
        print(tools.report()); print("cannot run %s programs on this host; skipping" % arch); return 0
    failed = 0
    for name in names:
        failed_before = failed
        rundir = os.path.join(ROOT, "output", "%s-%s" % (arch, name))
        expected = os.path.join(ROOT, "expected", "%s-%s" % (arch, name))
        run(arch, exprs_for(arch, name), rundir, tools)
        if not os.path.isdir(expected):
            print("  no expected results in %s (run: make set-expected-results ARCH=%s SET=%s)" % (expected, arch, name)); failed += 1; continue
        for f in RESULT_FILES:
            got, want = strip_comments(os.path.join(rundir, f)), strip_comments(os.path.join(expected, f))
            if want is None: continue
            if got != want:
                if (got and got[0].startswith("not run")) or (want and want[0].startswith("not run")):
                    print("  %s: %s was not run in one of the two (not counted as a failure)" % (name, f)); continue
                failed += 1
                diffs = [(i, a, b) for i, (a, b) in enumerate(zip(got, want)) if a != b]
                print("  FAIL %s/%s: %d line(s) differ from expected/ (first: got %r, expected %r)" % (name, f, len(diffs) + abs(len(got) - len(want)), diffs[0][1] if diffs else None, diffs[0][2] if diffs else None))
        if failed == failed_before: print("  %s: as expected" % name)
    return 1 if failed else 0

def cmd_accept(arch, names):
    for name in names:
        rundir = os.path.join(ROOT, "output", "%s-%s" % (arch, name))
        expected = os.path.join(ROOT, "expected", "%s-%s" % (arch, name))
        os.makedirs(expected, exist_ok=True)
        for f in RESULT_FILES + ["report.md", "exprs.txt"]:
            if os.path.exists(os.path.join(rundir, f)): shutil.copy(os.path.join(rundir, f), os.path.join(expected, f))
        print("accepted %s -> %s" % (rundir, expected))

# ---- diff between runs ----

def cmd_diff(a, b):
    ra, _, _ = compare.load(a)
    rb, _, _ = compare.load(b)
    da = {r[0]: r for r in ra}; db = {r[0]: r for r in rb}
    print("| name | expression | class %s -> %s | linksem | gdb | lldb |" % (os.path.basename(a.rstrip('/')), os.path.basename(b.rstrip('/'))))
    print("|------|------------|-------|---------|-----|------|")
    n = 0
    for name in da:
        if name not in db: continue
        x, y = da[name], db[name]
        if x[1] != y[1]: continue          # different expression under the same name
        changed = [(x[i], y[i]) for i in (2, 3, 4) if (x[i] or "") != (y[i] or "")]
        if x[5] == y[5] and not changed: continue
        n += 1
        cell = lambda i: ("%s -> %s" % (x[i], y[i])) if (x[i] or "") != (y[i] or "") else (x[i] or "not run")
        print("| %s | `%s` | %s -> %s | %s | %s | %s |" % (name, compare.esc(x[1]), x[5], y[5], compare.esc(cell(2)), compare.esc(cell(3)), compare.esc(cell(4))))
    print("\n%d expression(s) differ between the two runs" % n)

# ---- minimal standalone examples ----

def parse_expr(body):
    return [o.strip() for o in body.split(";") if o.strip()]

def branches_ok(ops):
    """do the DW_OP_skip/DW_OP_bra operands (counts of operations) stay inside the expression?"""
    for i, o in enumerate(ops):
        f = o.split()
        if f[0] in ("DW_OP_skip", "DW_OP_bra"):
            k = int(f[1])
            if i + k < 0 or i + k >= len(ops): return False
    return True

def candidates(ops):
    """shorter variants of an expression: each single operation removed, and each prefix"""
    out = []
    for i in range(len(ops)):
        c = ops[:i] + ops[i+1:]
        if c and branches_ok(c): out.append(c)
    for i in range(1, len(ops)):
        if branches_ok(ops[:i]): out.append(ops[:i])
    # dedupe, shortest first
    seen, res = set(), []
    for c in sorted(out, key=len):
        k = tuple(c)
        if k not in seen: seen.add(k); res.append(c)
    return res

def cmd_minimize(rundir):
    st = [l.split() for l in open(os.path.join(rundir, "state.txt")) if l.startswith("arch ")]
    arch = st[0][1]
    tools = Tools(arch)
    rows, hg, hl = compare.load(rundir)
    targets = [r for r in rows if r[5] not in ("agree", "incomparable", "not-run")]
    if not targets: print("no disagreements to minimise"); return
    # current best per target: (ops, signature)
    best = {r[0]: (parse_expr(r[1]), compare.signature(r[2], r[3], r[4]), (r[2], r[3], r[4])) for r in targets}
    annots = dict(compare.ANNOTATIONS)
    work = os.path.join(rundir, "minimize")
    rnd = 0
    while True:
        rnd += 1
        cand = collections.OrderedDict()   # candidate name -> (target, ops)
        for name, (ops, sig, _) in best.items():
            for j, c in enumerate(candidates(ops)):
                cand["%s__%d" % (name, j)] = (name, c)
        if not cand: break
        cdir = os.path.join(work, "round%d" % rnd)
        os.makedirs(cdir, exist_ok=True)
        with open(os.path.join(cdir, "exprs.txt"), "w") as f:
            for cname, (tname, c) in cand.items(): f.write("%s%s: %s\n" % (cname, annots.get(tname, ""), "; ".join(c)))
        crow = run(arch, os.path.join(cdir, "exprs.txt"), cdir, tools, quiet=True)
        byname = {r[0]: r for r in crow}
        improved = False
        for name in list(best):
            ops, sig, res = best[name]
            for cname, (tname, c) in cand.items():
                if tname != name or len(c) >= len(ops): continue
                r = byname.get(cname)
                if r and compare.signature(r[2], r[3], r[4]) == sig:
                    best[name] = (c, sig, (r[2], r[3], r[4])); improved = True
                    break
        print("round %d: %d candidates; %s" % (rnd, len(cand), ", ".join("%s: %d op(s)" % (n, len(b[0])) for n, b in best.items())))
        if not improved: break
    # standalone examples: the minimal expressions are evaluated together in one final
    # run (one debugger session), then each gets its own directory with a one-variable
    # program and its lines of the results
    fdir = os.path.join(work, "final")
    os.makedirs(fdir, exist_ok=True)
    with open(os.path.join(fdir, "exprs.txt"), "w") as f:
        for name, (ops, sig, res) in best.items(): f.write("%s%s: %s\n" % (name, annots.get(name, ""), "; ".join(ops)))
    frows = {r[0]: r for r in run(arch, os.path.join(fdir, "exprs.txt"), fdir, tools, quiet=True)}
    ddir = os.path.join(rundir, "discrepancies")
    if os.path.isdir(ddir): shutil.rmtree(ddir)
    index = ["# Claude: minimal standalone examples of the disagreements in %s\n" % rundir,
             "Each directory holds a one-variable test program, the three results, and a README with the commands to reproduce them without the harness.\n",
             "| name | class | minimal expression | linksem | gdb | lldb |", "|------|-------|--------------------|---------|-----|------|"]
    for name, (ops, sig, res) in best.items():
        d = os.path.join(ddir, name)
        exprs = os.path.join(d, "expr.txt")
        os.makedirs(d, exist_ok=True)
        open(exprs, "w").write("%s%s: %s\n" % (name, annots.get(name, ""), "; ".join(ops)))
        build(arch, exprs, d, tools)
        r = frows[name]
        for f, i in (("linksem.txt", 2), ("gdb.txt", 3), ("lldb.txt", 4)):
            open(os.path.join(d, f), "w").write("%s = %s\n" % (name, r[i]) if r[i] is not None else "# not run\n")
        write_standalone_readme(d, arch, tools, name, ops, r)
        index.append("| [%s](%s/README.md) | %s | `%s` | %s | %s | %s |" % (name + annots.get(name, ""), name, r[5], compare.esc(r[1]), compare.esc(r[2]), compare.esc(r[3]), compare.esc(r[4])))
    open(os.path.join(ddir, "README.md"), "w").write("\n".join(index) + "\n")
    print("wrote %s/README.md and one directory per disagreement" % ddir)

def write_standalone_readme(d, arch, tools, name, ops, r):
    _, expr, l, g, dd, c = r
    gdb_cmd = "%s -batch -ex 'break *dw_here' -ex run -ex 'print/x &%s' -ex 'print/x %s' prog" % (os.path.basename(tools.gdb or "gdb"), name, name)
    lldb_cmd = "%s -b -o 'settings set target.disable-aslr false' -o 'b dw_here' -o run -o 'frame variable -L %s' prog" % (os.path.basename(tools.lldb or "lldb"), name)
    if not tools.native:
        gdb_cmd = "qemu-%s -g %d prog & %s -batch -ex 'target remote :%d' -ex 'break *dw_here' -ex continue -ex 'print/x &%s' -ex 'print/x %s' prog" % (arch, PORT, os.path.basename(tools.gdb or "gdb-multiarch"), PORT, name, name)
        lldb_cmd = "qemu-%s -g %d prog & %s -b -o 'gdb-remote %d' -o 'b dw_here' -o continue -o 'frame variable -L %s' prog" % (arch, PORT, os.path.basename(tools.lldb or "lldb"), PORT, name)
    txt = """# Claude: a minimal standalone example of a DWARF expression disagreement

Expression (the `DW_AT_location` of the variable `%s` in `prog`; annotations after the
name say whether it is a location list and which frame-base kind its function has):

    %s%s: %s

Results at `dw_here` (class `%s`):

| evaluator | result |
|-----------|--------|
| linksem   | %s |
| gdb       | %s |
| lldb      | %s |

`addr X` means the expression denotes memory at X (the debugger's `&%s`); `reg N`
a register location; `value X` an implicit value (`DW_OP_stack_value` /
`DW_OP_implicit_value`); `error: ...` the evaluator's message.  linksem's result
follows the DWARF 4 text (sections 2.5.1.1 to 2.5.1.5), with the unspecified cases
(shift counts of 64 or more, `DW_OP_mod` by zero, `DW_OP_abs`/`DW_OP_neg` of the most
negative value) decided as gdb decides them; see the harness README.

Files: `prog.s` (the whole test program: `_start` sets registers to known values and
stops at `dw_here`; `dw_mem` is 256 known bytes; DWARF 4 `.debug_info` with this one
variable), `prog` (assembled and linked, static, %s), `state.txt` (the register
values and CFA rule at `dw_here`), `linksem.txt`, `gdb.txt`, `lldb.txt`.

Reproduce without the harness (%s):

    %s -o prog.o prog.s && %s -static -o prog prog.o
    %s
    %s

Tool versions of this run:

%s
""" % (name, name, compare.ANNOTATIONS.get(name, ""), expr, c, l, g or "not run", dd or "not run", name, arch,
       "native" if tools.native else "under qemu-user with the debuggers attached to its gdb stub",
       os.path.basename(tools.as_ or "as"), os.path.basename(tools.ld or "ld"), gdb_cmd, lldb_cmd,
       "\n".join("    " + v for v in tools.versions()))
    open(os.path.join(d, "README.md"), "w").write(txt)
    for f in ("prog.o",):
        p = os.path.join(d, f)
        if os.path.exists(p): os.remove(p)

# ---- main ----

def main():
    a = sys.argv[1:]
    if not a: print(__doc__); sys.exit(2)
    if a[0] == "tools": cmd_tools()
    elif a[0] == "run": run(a[1], a[2], a[3], batch=int(a[4]) if len(a) > 4 else None, jobs=int(a[5]) if len(a) > 5 else 1)
    elif a[0] == "check": sys.exit(cmd_check(a[1], a[2:]))
    elif a[0] == "accept": cmd_accept(a[1], a[2:])
    elif a[0] == "minimize": cmd_minimize(a[1])
    elif a[0] == "diff": cmd_diff(a[1], a[2])
    else: print(__doc__); sys.exit(2)

if __name__ == "__main__":
    main()
