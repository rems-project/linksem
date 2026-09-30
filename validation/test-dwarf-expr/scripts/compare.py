#!/usr/bin/env python3
# Claude: compare the evaluations of each expression and write a report.
#
#   compare.py RUNDIR            (reads RUNDIR/exprs.txt and RUNDIR/{linksem,gdb,lldb}.txt,
#                                 writes RUNDIR/report.md)
#
# Each result file has lines "NAME = RESULT" with RESULT one of
#   addr 0xH | reg N | value 0xH | implicit {..} | composite ... | empty | error: MESSAGE
# A result file whose first line is "# not run: ..." means that evaluator was not
# available; the comparison is then over the evaluators that did run.
# Two results agree when they have the same kind and number (error messages are not
# compared).  Each expression is put in one class:
#   agree               every evaluator that ran agrees
#   linksem-unsupported linksem reports an operation it does not implement
#   linksem-differs     the debuggers agree with each other, linksem differs
#   gdb-differs         linksem and lldb agree, gdb differs
#   lldb-differs        linksem and gdb agree, lldb differs
#   all-differ          no two agree
#   incomparable        a composite location or a short implicit value, which the
#                       debuggers report as a value, so not compared
#   gdb-crash           gdb aborted with an internal error on this expression
#   not-run             no debugger ran, so nothing to compare against
import sys, collections, os, re

CLASSES = ["agree", "linksem-unsupported", "linksem-differs", "gdb-differs", "lldb-differs", "all-differ", "gdb-crash", "incomparable", "not-run"]

def read_results(path):
    """{name: result}, or None if the file says the evaluator was not run / is missing"""
    if not os.path.exists(path): return None
    d = {}
    for line in open(path):
        line = line.rstrip("\n")
        if line.startswith("# not run"): return None
        if not line or line.startswith("#") or " = " not in line: continue
        name, res = line.split(" = ", 1)
        d[name.strip()] = res.strip()
    return d

ANNOTATIONS = {}   # bare variable name -> its annotations ("@loclist@fb=reg"), from the last read_exprs

def read_exprs(path):
    """bare variable name -> expression body; the name's annotations go to ANNOTATIONS"""
    d = collections.OrderedDict()
    for line in open(path):
        line = line.split("#")[0].strip()
        if not line: continue
        name, body = line.split(":", 1)
        parts = name.strip().split("@")
        d[parts[0]] = body.strip()
        ANNOTATIONS[parts[0]] = "".join("@" + a for a in parts[1:])
    return d

def shown(name):
    """the name with its annotations, for the reports"""
    return name + ANNOTATIONS.get(name, "")

def norm(res):
    """(kind, number-or-None) for comparison"""
    f = res.split()
    if f[0] in ("addr", "value") and len(f) == 2: return (f[0], int(f[1], 0))
    if f[0] == "reg" and len(f) == 2:
        try: return ("reg", int(f[1]))
        except ValueError: return ("reg", f[1])   # a register gdb names but the harness does not number
    if f[0] == "composite": return ("composite", None)
    if f[0] == "implicit": return ("implicit", None)
    if f[0] == "empty": return ("empty", None)
    if res.startswith("error"): return ("error", None)
    return ("other", res)

def classify(l, g, d):
    """l, g, d: result strings, or None for an evaluator that did not run"""
    nl = norm(l)
    if nl[0] in ("composite", "implicit"): return "incomparable"
    if g is not None and "gdb aborted" in g: return "gdb-crash"
    if g is None and d is None: return "not-run"
    ng = norm(g) if g is not None else None
    nd = norm(d) if d is not None else None
    debuggers = [x for x in (ng, nd) if x is not None]
    if all(x == nl for x in debuggers): return "agree"
    if "not_supported" in l: return "linksem-unsupported"
    if ng is not None and nd is not None:
        if ng == nd: return "linksem-differs"
        if nl == nd: return "gdb-differs"
        if nl == ng: return "lldb-differs"
        return "all-differ"
    # one debugger only: it disagrees with linksem
    return "linksem-differs"

def signature(l, g, d):
    """what a minimised reproducer must preserve: the class, the kind (addr, reg,
    value, error, ...) of each evaluator's result, and for an error its message
    (without numbers), so that one failure is not reduced to a different one"""
    def kind(x):
        if x is None: return None
        k = norm(x)[0]
        if k == "error": return ("error", re.sub(r"0x[0-9a-f]+|\d+", "N", x))
        return k
    return (classify(l, g, d), kind(l), kind(g), kind(d))

def load(rundir):
    exprs = read_exprs(os.path.join(rundir, "exprs.txt"))
    L = read_results(os.path.join(rundir, "linksem.txt")) or {}
    G = read_results(os.path.join(rundir, "gdb.txt"))
    D = read_results(os.path.join(rundir, "lldb.txt"))
    rows = []
    for name, expr in exprs.items():
        l = L.get(name, "error: missing")
        g = None if G is None else G.get(name, "error: missing")
        d = None if D is None else D.get(name, "error: missing")
        rows.append((name, expr, l, g, d, classify(l, g, d)))
    return rows, G is not None, D is not None

def esc(s): return (s or "not run").replace("|", "\\|")

def write_report(rundir, rows, have_gdb, have_lldb, versions=()):
    counts = collections.Counter(r[5] for r in rows)
    dbg_differ = [r for r in rows if have_gdb and have_lldb and norm(r[3]) != norm(r[4]) and norm(r[2])[0] not in ("composite", "implicit")]
    out = []
    out.append("# Claude: DWARF expression cross-check report\n")
    out.append("Run directory: `%s`; evaluators: linksem%s%s.\n" % (rundir, ", gdb" if have_gdb else " (gdb not run)", ", lldb" if have_lldb else " (lldb not run)"))
    if versions:
        out.append("Tools: " + "; ".join(versions) + ".\n")
    out.append("## Summary\n")
    out.append("| class               | count |")
    out.append("|---------------------|-------|")
    for k in CLASSES:
        out.append("| %-19s | %5d |" % (k, counts.get(k, 0)))
    out.append("")
    if have_gdb and have_lldb:
        out.append("gdb and lldb differ from each other on %d expression(s) (see the last section).\n" % len(dbg_differ))
    out.append("## Operations involved in disagreements\n")
    ops_by_class = collections.defaultdict(collections.Counter)
    for name, expr, l, g, d, c in rows:
        if c in ("agree", "incomparable", "not-run"): continue
        for op in set(o.split()[0] for o in expr.split(";") if o.strip()):
            ops_by_class[c][op] += 1
    for c, cnt in ops_by_class.items():
        out.append("- **%s**: %s" % (c, ", ".join("%s (%d)" % (op, n) for op, n in cnt.most_common())))
    out.append("")
    out.append("## Disagreements\n")
    out.append("| name | class | expression | linksem | gdb | lldb |")
    out.append("|------|-------|------------|---------|-----|------|")
    for name, expr, l, g, d, c in rows:
        if c in ("agree", "not-run"): continue
        out.append("| %s | %s | `%s` | %s | %s | %s |" % (shown(name), c, esc(expr), esc(l), esc(g), esc(d)))
    out.append("")
    if have_gdb and have_lldb:
        out.append("## gdb versus lldb\n")
        out.append("| name | expression | gdb | lldb | linksem |")
        out.append("|------|------------|-----|------|---------|")
        for name, expr, l, g, d, c in dbg_differ:
            out.append("| %s | `%s` | %s | %s | %s |" % (shown(name), esc(expr), esc(g), esc(d), esc(l)))
        out.append("")
    open(os.path.join(rundir, "report.md"), "w").write("\n".join(out) + "\n")
    return "%d expressions: %s%s" % (len(rows), ", ".join("%s %d" % (k, v) for k, v in sorted(counts.items())),
                                      ("; gdb/lldb differ on %d" % len(dbg_differ)) if have_gdb and have_lldb else "")

def main():
    rundir = sys.argv[1]
    rows, have_gdb, have_lldb = load(rundir)
    print(write_report(rundir, rows, have_gdb, have_lldb))

if __name__ == "__main__":
    main()
