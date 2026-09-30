# Claude: evaluate the DW_AT_location of each variable of EXPRS.txt in lldb, at dw_here.
#
#   DWEXPR_PROG=prog DWEXPR_STATE=state.txt DWEXPR_EXPRS=exprs.txt [DWEXPR_REMOTE=host:port] \
#     lldb -b -o "command script import lldb_eval.py"
#
# Output lines have the same form as dwexpr_eval's:
#   NAME = addr 0x...  |  reg N  |  value 0x...  |  error: MESSAGE
# lldb (SBValue) reports a memory location's address directly only when the memory is
# readable; otherwise the address is taken from its "read memory from 0x... failed"
# message.  A register location is reported by register name (mapped back to the DWARF
# number); a stack value has location "scalar"; an implicit value or a composite is
# materialised in host memory and reported here as its value.  The live registers are
# checked against the state file first; mismatches are "# register mismatch" lines.
import lldb, os, re, sys

REGNAMES = {
    "x86_64": {0:"rax",1:"rdx",2:"rcx",3:"rbx",4:"rsi",5:"rdi",6:"rbp",7:"rsp",8:"r8",9:"r9",10:"r10",11:"r11",12:"r12",13:"r13",14:"r14",15:"r15",16:"rip"},
    "aarch64": {**{i: "x%d" % i for i in range(31)}, 31: "sp", **{64 + i: "v%d" % i for i in range(32)}, **{96 + i: "z%d" % i for i in range(32)}},
}
MASK = (1 << 64) - 1
INVALID = 0xffffffffffffffff

def read_state(path):
    st = {"regs": []}
    for line in open(path):
        line = line.split("#")[0].strip()
        if not line: continue
        f = line.split()
        if f[0] == "arch": st["arch"] = f[1]
        elif f[0] == "pc": st["pc"] = f[1]
        elif f[0] == "cfa": st["cfa"] = (int(f[1]), int(f[2]))
        elif f[0] == "reg": st["regs"].append((int(f[1]), f[2]))
    return st

def read_vars(path):
    names = []
    for line in open(path):
        line = line.split("#")[0].strip()
        if line: names.append(line.split(":")[0].strip())
    return names

def regval(spec, dw_mem):
    if spec.startswith("dw_mem+"): return (dw_mem + int(spec[7:])) & MASK
    return int(spec, 0) & MASK

def main():
    prog = os.environ["DWEXPR_PROG"]
    st = read_state(os.environ["DWEXPR_STATE"])
    names = read_vars(os.environ["DWEXPR_EXPRS"])
    regnames = REGNAMES[st["arch"]]
    name_to_num = {v: k for k, v in regnames.items()}
    dbg = lldb.SBDebugger.Create()
    dbg.SetAsync(False)
    dbg.HandleCommand("settings set target.disable-aslr false")
    target = dbg.CreateTarget(prog)
    error = lldb.SBError()
    remote = os.environ.get("DWEXPR_REMOTE")
    here_sym = target.FindSymbols(st["pc"])[0].GetSymbol()
    here = here_sym.GetStartAddress().GetFileAddress()
    if remote:
        process = target.ConnectRemote(dbg.GetListener(), "connect://" + remote, "gdb-remote", error)
        if error.Fail(): print("# connect failed: " + error.GetCString()); return
        target.BreakpointCreateBySBAddress(here_sym.GetStartAddress())
        process.Continue()
    else:
        target.BreakpointCreateBySBAddress(here_sym.GetStartAddress())
        process = target.Launch(dbg.GetListener(), None, None, None, None, None, os.getcwd(), 0, False, error)
        if error.Fail(): print("# launch failed: " + error.GetCString()); return
    frame = process.GetSelectedThread().GetFrameAtIndex(0)
    if frame.GetPC() != here:
        print("# not stopped at %s: pc = 0x%x (state %d)" % (st["pc"], frame.GetPC(), process.GetState()))
    dw_mem = target.FindSymbols("dw_mem")[0].GetSymbol().GetStartAddress().GetFileAddress()
    for r, spec in st["regs"]:
        actual = frame.FindRegister(regnames[r]).GetValueAsUnsigned() & MASK
        expected = regval(spec, dw_mem)
        if actual != expected:
            print("# register mismatch: %s (DWARF %d) = 0x%x, state says 0x%x" % (regnames[r], r, actual, expected))
    for name in names:
        v = frame.FindVariable(name)
        loc = v.GetLocation() or ""
        addr = v.GetLoadAddress()
        err = v.GetError().GetCString() if v.GetError().Fail() else None
        if err:
            m = re.match(r"read memory from 0x([0-9a-f]+) failed", err)
            if m:
                print("%s = addr 0x%x" % (name, int(m.group(1), 16)))
            else:
                print("%s = error: %s" % (name, err))
        elif loc in name_to_num:
            print("%s = reg %d" % (name, name_to_num[loc]))
        elif loc == "scalar":
            print("%s = value 0x%x" % (name, v.GetValueAsUnsigned() & MASK))
        elif addr != INVALID:
            print("%s = addr 0x%x" % (name, addr & MASK))
        elif loc.startswith("0x"):
            print("%s = value 0x%x" % (name, v.GetValueAsUnsigned() & MASK))
        else:
            print("%s = error: unclassified lldb result (location %r, value %r)" % (name, loc, v.GetValue()))
    process.Kill()

main()
