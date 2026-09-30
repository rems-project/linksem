#!/usr/bin/env python3
# Claude: run gdb_eval.py over all the variables of an expression file, restarting gdb
# when it aborts (gdb 15 has an internal error on some DW_OP_bra expressions).  The
# variable being evaluated when gdb dies is reported as
#   NAME = error: gdb aborted
# and evaluation resumes with the next one.
#
#   gdb_run.py GDB PROG STATE EXPRS [QEMU-COMMAND...]
#
# With a QEMU-COMMAND (e.g. qemu-aarch64 -g 1234 PROG) the program is run under qemu's
# gdb stub, restarted before each gdb session, and gdb connects to DWEXPR_REMOTE.
import os, subprocess, sys, time

def read_vars(path):
    names = []
    for line in open(path):
        line = line.split("#")[0].strip()
        if line: names.append(line.split(":")[0].strip())
    return names

def main():
    gdb, prog, state, exprs = sys.argv[1:5]
    qemu = sys.argv[5:]
    names = read_vars(exprs)
    here = os.path.dirname(os.path.abspath(__file__))
    done = 0
    while done < len(names):
        env = dict(os.environ, DWEXPR_STATE=state, DWEXPR_EXPRS=exprs, DWEXPR_SKIP=str(done))
        q = None
        if qemu:
            q = subprocess.Popen(qemu, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            time.sleep(0.5)
        cmd = [gdb, "-batch", "-x", os.path.join(here, "gdb_eval.py")] + ([] if qemu else ["--args", prog])
        if qemu: cmd.append(prog)
        r = subprocess.run(cmd, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)
        if q: q.kill(); q.wait()
        finished = False
        evaluating = None
        for line in r.stdout.splitlines():
            if line == "# done": finished = True; continue
            if line.startswith("# evaluating "): evaluating = line[len("# evaluating "):]; continue
            if line.startswith("#"): print(line); continue
            if " = " in line:
                print(line); done += 1; evaluating = None
        if not finished:
            # gdb died while evaluating `evaluating` (the variables are evaluated in stop
            # order, not file order, so the name comes from gdb_eval.py itself)
            if evaluating is not None:
                print("%s = error: gdb aborted" % evaluating); done += 1
            elif done < len(names):
                print("# gdb aborted before evaluating anything"); break
    sys.stdout.flush()

main()
