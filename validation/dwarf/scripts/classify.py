#!/usr/bin/env python3
# Claude: this script is largely written by Claude (19 September 2026).
"""Classify every ELF file in a directory: class, type, machine, DWARF
versions present, debug sections, relocations against debug sections,
compression.  Writes DIR/classes.json, used to decide which comparisons
apply and to keep the report's buckets apart."""
import json, re, subprocess, sys, pathlib

READELF = "aarch64-linux-gnu-readelf"

def out(cmd):
    p = subprocess.run(cmd, capture_output=True, text=True, errors="replace", timeout=120)
    return p.stdout

def classify(path):
    h = out([READELF, "-h", str(path)])
    if "ELF Header" not in h:
        return {"elf": False}
    g = lambda k: (re.search(rf"^\s*{k}:\s*(.*)$", h, re.M) or [None, ""])[1].strip()
    sections = out([READELF, "-S", "-W", str(path)])
    names = re.findall(r"^\s*\[\s*\d+\]\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S*)\s+\d+", sections, re.M)
    secs = [n for n, t, f in names]
    debug = sorted(s for s in secs if s.startswith((".debug_", ".zdebug_")))
    reloc_debug = sorted(s for s in secs if re.match(r"\.rela?\.z?debug_", s))
    compressed = [n for n, t, f in names if "C" in f and n.startswith(".debug")]
    versions = sorted(set(int(v) for v in re.findall(r"^\s*Version:\s+(\d+)\s*$", out([READELF, "--dwarf-depth=0", "--debug-dump=info", str(path)]), re.M)))
    return {"elf": True, "class": g("Class"), "type": g("Type").split()[0], "machine": g("Machine"),
            "data": g("Data"), "sections": secs, "debug_sections": debug, "debug_relocs": reloc_debug,
            "compressed_debug": compressed, "dwarf_versions": versions, "size": path.stat().st_size}

def main():
    d = pathlib.Path(sys.argv[1])
    classes = {}
    for f in sorted(d.iterdir()):
        if f.suffix in (".o", ".exe", ".so", ".elf") or f.name.startswith("testfile"):
            try:
                classes[f.name] = classify(f)
            except Exception as e:
                classes[f.name] = {"elf": False, "error": str(e)}
    (d / "classes.json").write_text(json.dumps(classes, indent=1))
    n = sum(1 for c in classes.values() if c.get("elf"))
    print(f"classify: {n} ELF files of {len(classes)} in {d}")

if __name__ == "__main__":
    main()
