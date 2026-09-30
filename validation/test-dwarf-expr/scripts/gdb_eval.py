# Claude: evaluate the DW_AT_location of each variable of EXPRS.txt in gdb, at the stop
# label of the function the variable belongs to (its @fb= annotation; see Expr).
#
#   DWEXPR_STATE=state.txt DWEXPR_EXPRS=exprs.txt [DWEXPR_REMOTE=:1234] [DWEXPR_SKIP=n] \
#     gdb -batch -x gdb_eval.py --args PROG
# (normally via gdb_run.py, which restarts gdb after an abort; DWEXPR_SKIP skips the first
# n variables in evaluation order, which is stop order then file order; "# evaluating NAME"
# precedes each result and "# done" marks a complete run)
#
# Output lines have the same form as dwexpr_eval's:
#   NAME = addr 0x...  |  reg N  |  value 0x...  |  error: MESSAGE
# For a memory location the address of the variable (&NAME) is printed without reading
# memory; for a register location gdb refuses &NAME naming the register; for an
# implicit value (stack_value / implicit_value / composite) &NAME is refused as not an
# lvalue and the value itself is printed.  The live registers are checked against the
# state file at the first stop; any mismatch is reported as a "# register mismatch" line.
import gdb, os, re, sys

REGNAMES = {
    "x86_64": {0:"rax",1:"rdx",2:"rcx",3:"rbx",4:"rsi",5:"rdi",6:"rbp",7:"rsp",8:"r8",9:"r9",10:"r10",11:"r11",12:"r12",13:"r13",14:"r14",15:"r15",16:"rip"},
    "aarch64": {**{i: "x%d" % i for i in range(31)}, 31: "sp", **{64 + i: "v%d" % i for i in range(32)}, **{96 + i: "z%d" % i for i in range(32)}},
}
MASK = (1 << 64) - 1

def read_state(path):
    st = {"regs": [], "stops": []}
    for line in open(path):
        line = line.split("#")[0].strip()
        if not line: continue
        f = line.split()
        if f[0] == "arch": st["arch"] = f[1]
        elif f[0] == "pc": st["pc"] = f[1]
        elif f[0] == "cfa": st["cfa"] = (int(f[1]), int(f[2]))
        elif f[0] == "stop": st["stops"].append((f[1], f[2]))
        elif f[0] == "reg": st["regs"].append((int(f[1]), f[2]))
    if not st["stops"]: st["stops"] = [("main", st["pc"])]
    return st

def read_vars(path):
    """[(bare name, function)] in file order; the function is main or f_<kind>"""
    out = []
    for line in open(path):
        line = line.split("#")[0].strip()
        if not line: continue
        full = line.split(":")[0].strip()
        parts = full.split("@")
        fb = "cfa"
        for a in parts[1:]:
            if a.startswith("fb="): fb = a[3:]
        out.append((parts[0], "main" if fb == "cfa" else "f_" + fb))
    return out

def regval(spec, dw_mem):
    if spec.startswith("dw_mem+"): return (dw_mem + int(spec[7:])) & MASK
    return int(spec, 0) & MASK

def evaluate(name, name_to_num):
    try:
        a = gdb.parse_and_eval("&" + name)
        print("%s = addr 0x%x" % (name, int(a) & MASK))
        return
    except gdb.error as e:
        msg = str(e)
    m = re.search(r"in register \$(\w+)", msg)
    if m:
        reg = m.group(1)
        print("%s = reg %s" % (name, name_to_num.get(reg, reg)))
        return
    if "lvalue" in msg:
        try:
            v = gdb.parse_and_eval(name)
            print("%s = value 0x%x" % (name, int(v) & MASK))
        except gdb.error as e2:
            print("%s = error: %s" % (name, str(e2).replace("\n", " ")))
        return
    print("%s = error: %s" % (name, msg.replace("\n", " ")))

def main():
    st = read_state(os.environ["DWEXPR_STATE"])
    vars_ = read_vars(os.environ["DWEXPR_EXPRS"])
    skip = int(os.environ.get("DWEXPR_SKIP", "0"))
    regnames = REGNAMES[st["arch"]]
    name_to_num = {v: k for k, v in regnames.items()}
    gdb.execute("set pagination off")
    gdb.execute("set confirm off")
    gdb.execute("set print address on")
    # keep going after a gdb internal error (it is reported as the result of that variable)
    gdb.execute("maint set internal-error quit no")
    gdb.execute("maint set internal-error corefile no")
    gdb.execute("maint set internal-error backtrace off")
    remote = os.environ.get("DWEXPR_REMOTE")
    if remote:
        gdb.execute("target remote " + remote)
    # the plan: stops in program order, each with its variables in file order
    plan = [(label, [n for n, f in vars_ if f == func]) for func, label in st["stops"]]
    plan = [(label, names) for label, names in plan if names]
    # skip the first `skip` variables of the plan
    for i, (label, names) in enumerate(plan):
        if skip >= len(names): skip -= len(names); plan[i] = (label, [])
        else: plan[i] = (label, names[skip:]); skip = 0
    plan = [(label, names) for label, names in plan if names]
    addr_of = {}
    for label, _ in plan:
        addr_of[label] = int(gdb.parse_and_eval("(unsigned long)&" + label))
        gdb.execute("break *0x%x" % addr_of[label])
    first = True
    for label, names in plan:
        gdb.execute("continue" if (remote or not first) else "run")
        first = False
        frame = gdb.selected_frame()
        if frame.pc() != addr_of[label]:
            print("# not stopped at %s: pc = 0x%x" % (label, frame.pc()))
        if label == plan[0][0]:
            dw_mem = int(gdb.parse_and_eval("(unsigned long)&dw_mem"))
            for r, spec in st["regs"]:
                actual = int(frame.read_register(regnames[r])) & MASK
                expected = regval(spec, dw_mem)
                if actual != expected:
                    print("# register mismatch: %s (DWARF %d) = 0x%x, state says 0x%x" % (regnames[r], r, actual, expected))
        for name in names:
            print("# evaluating " + name, flush=True)   # so that gdb_run.py knows which variable an abort hit
            evaluate(name, name_to_num)
    print("# done")
    gdb.execute("kill")

main()
