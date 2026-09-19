#!/usr/bin/env python3
# Claude: this script is largely written by Claude (19 September 2026).
"""Run each applicable (oracle, linksem) command pair on every classified
object and record the outcome.  For each object and comparison a directory
RESULTS/objects/<object>/<comparison>/ holds oracle.out, linksem.out, diff,
the command lines, stderr and timing; RESULTS/comparisons.json summarises
every run with a status and, for differences, a signature of the first
differing line (numbers masked), which report.py uses to cluster them."""
import difflib, json, os, re, subprocess, sys, time, pathlib

READELF, OBJDUMP = "aarch64-linux-gnu-readelf", "aarch64-linux-gnu-objdump"
LINKSEM = os.environ.get("LINKSEM", str(pathlib.Path(__file__).resolve().parents[2] / "src_ocaml" / "linksem"))
TIMEOUT = int(os.environ.get("COMPARE_TIMEOUT", "180"))
# Claude: files above this size are skipped outright.  elfutils' testfile-dwp-5-cu-index-overflow.dwp
# is 4 GiB (a deliberate index overflow), and `hexdump -v` of it alone is 20 GB of output.
MAX_BYTES = int(os.environ.get("COMPARE_MAX_BYTES", str(64 << 20)))
# Claude: restrict a run to the objects whose names match this regular expression
# (for re-checking one cluster after a fix); the summary file is then not rewritten.
ONLY = os.environ.get("COMPARE_ONLY")

def is_aarch64(c): return c["machine"] == "AArch64"
def is_rel(c): return c["type"] == "REL"
def has_info(c): return ".debug_info" in c["debug_sections"]
def dwarf_ok(c): return not any(v >= 5 for v in c["dwarf_versions"])
def elf64(c): return c["class"] == "ELF64"

def dwarf_applicable(c):
    """DWARF comparisons: ELF64 only, DWARF <= 4, .debug_info present, and for
    relocatable objects only AArch64 (the only machine with a data-relocation
    interpreter in linksem)."""
    if not elf64(c): return "elf32"
    if not has_info(c): return "no .debug_info"
    if not dwarf_ok(c): return "dwarf5"
    if is_rel(c) and not is_aarch64(c): return "relocatable non-AArch64"
    if c["compressed_debug"]: return "compressed debug sections"
    return None

# name -> (row, oracle argv, linksem argv, applicability -> skip reason or None)
COMPARISONS = {
    # parsing row: byte-faithful dumps
    "objdump-abbrev-info": ("parse", [OBJDUMP, "--dwarf=abbrev,info"], [LINKSEM, "readelf", "--debug-dump=info<objdump>"], dwarf_applicable),
    "readelf-abbrev-info": ("parse", [READELF, "--debug-dump=abbrev,info"], [LINKSEM, "readelf", "--debug-dump=abbrev,info<readelf>"], dwarf_applicable),
    # ELF structure against readelf -W
    "readelf-h":   ("elf", [READELF, "-W", "-h"], [LINKSEM, "readelf", "-h"], lambda c: None),
    "readelf-S":   ("elf", [READELF, "-W", "-S"], [LINKSEM, "readelf", "-S"], lambda c: None),
    "readelf-l":   ("elf", [READELF, "-W", "-l"], [LINKSEM, "readelf", "-l"], lambda c: None),
    "readelf-r":   ("elf", [READELF, "-W", "-r"], [LINKSEM, "readelf", "-r"], lambda c: None),
    "readelf-s":   ("elf", [READELF, "-W", "-s"], [LINKSEM, "readelf", "-s"], lambda c: None),
    "readelf-tgnVI": ("elf", [READELF, "-W", "-t", "-g", "-n", "-V", "-I"], [LINKSEM, "readelf", "-t", "-g", "-n", "-V", "-I"], lambda c: None if elf64(c) else "elf32"),
    "readelf-a":   ("elf", [READELF, "-W", "-a"], [LINKSEM, "readelf", "-a"], lambda c: None if elf64(c) else "elf32"),
    "in-out":      ("elf", ["hexdump", "-v"], [LINKSEM, "readelf", "--in-out"], lambda c: None),
}

def oracle_for(argv, c):
    """The cross binutils are configured for AArch64 only: objdump's `file
    format` name and relocation names for other machines come out generic, so
    use the native tools for non-AArch64 files."""
    if argv and argv[0] in (READELF, OBJDUMP) and c["machine"] != "AArch64":
        return [argv[0].replace("aarch64-linux-gnu-", "")] + argv[1:]
    return argv

def run(argv, path):
    t0 = time.time()
    try:
        p = subprocess.run(argv + [str(path)], capture_output=True, timeout=TIMEOUT)
        return p.returncode, p.stdout, p.stderr.decode(errors="replace"), time.time() - t0
    except subprocess.TimeoutExpired:
        return None, b"", "timeout", time.time() - t0

def mask(s):
    return re.sub(r"0x[0-9a-fA-F]+|\b[0-9a-fA-F]{4,}\b|\b\d+\b", "N", s)

def signature(a, b):
    """The first differing (oracle, linksem) line pair, numbers masked."""
    al, bl = a.decode(errors="replace").splitlines(), b.decode(errors="replace").splitlines()
    for x, y in zip(al, bl):
        if x != y:
            return mask(x.strip())[:100] + " || " + mask(y.strip())[:100]
    if len(al) != len(bl):
        extra = al[len(bl):len(bl)+1] if len(al) > len(bl) else bl[len(al):len(al)+1]
        who = "oracle has more" if len(al) > len(bl) else "linksem has more"
        return f"{who}: " + mask(extra[0].strip())[:100] if extra else who
    return "identical?"

def main():
    objdir, results = pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2])
    corpus = sys.argv[3] if len(sys.argv) > 3 else objdir.name
    classes = json.loads((objdir / "classes.json").read_text())
    records = []
    for name, c in sorted(classes.items()):
        if not c.get("elf") or (ONLY and not re.search(ONLY, name)):
            continue
        path = objdir / name
        kind = {"REL": "object", "EXEC": "executable", "DYN": "shared"}.get(c["type"], c["type"])
        size = path.stat().st_size
        too_large = f"file too large ({size >> 20} MiB)" if size > MAX_BYTES else None
        for cname, (row, oracle, linksem, applicable) in COMPARISONS.items():
            rec = {"corpus": corpus, "object": name, "kind": kind, "machine": c["machine"], "class": c["class"],
                   "dwarf_versions": c["dwarf_versions"], "comparison": cname, "row": row}
            skip = too_large or applicable(c)
            if skip:
                rec.update(status="skipped", reason=skip); records.append(rec); continue
            d = results / "objects" / name / cname
            d.mkdir(parents=True, exist_ok=True)
            oracle = oracle_for(oracle, c)
            orc, oout, oerr, otime = run(oracle, path)
            lrc, lout, lerr, ltime = run(linksem, path)
            (d / "oracle.out").write_bytes(oout); (d / "linksem.out").write_bytes(lout)
            (d / "commands").write_text(" ".join(oracle + [str(path)]) + "\n" + " ".join(linksem + [str(path)]) + "\n")
            (d / "stderr").write_text(f"--- oracle (rc={orc}, {otime:.2f}s)\n{oerr}\n--- linksem (rc={lrc}, {ltime:.2f}s)\n{lerr}\n")
            rec.update(oracle_rc=orc, linksem_rc=lrc, oracle_time=round(otime, 2), linksem_time=round(ltime, 2),
                       oracle_bytes=len(oout), linksem_bytes=len(lout))
            if lrc is None: rec["status"] = "timeout"
            elif orc is None or orc != 0: rec["status"] = "oracle_failed"
            elif lrc != 0: rec["status"] = "linksem_failed"; rec["signature"] = "linksem: " + mask(lerr.strip().splitlines()[-1] if lerr.strip() else "")[:120]
            elif oout == lout: rec["status"] = "identical"
            else:
                rec["status"] = "differ"; rec["signature"] = signature(oout, lout)
                diff = difflib.unified_diff(oout.decode(errors="replace").splitlines(), lout.decode(errors="replace").splitlines(),
                                            "oracle", "linksem", lineterm="", n=2)
                (d / "diff").write_text("\n".join(list(diff)[:4000]) + "\n")
            records.append(rec)
        sys.stdout.write("."); sys.stdout.flush()
    print()
    out = results / ("comparisons-only.json" if ONLY else "comparisons.json")
    existing = json.loads(out.read_text()) if out.exists() and not ONLY else []
    existing = [r for r in existing if r["corpus"] != corpus] + records
    out.write_text(json.dumps(existing, indent=0))
    from collections import Counter
    print(f"compare: {corpus}: " + ", ".join(f"{k} {v}" for k, v in sorted(Counter(r['status'] for r in records).items())))

if __name__ == "__main__":
    main()
