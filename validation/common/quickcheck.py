#!/usr/bin/env python3
# Claude: this script is written by Claude (19 September 2026).
"""Re-run the comparisons on the objects whose names match a regular expression
and report every (object, comparison) whose status changed against one or
more earlier runs, so that a fix can be checked on the files it concerns (and
a few it should not affect) without a full run.  Exit status 2 if anything
got worse (identical or skipped -> differ, differ -> linksem failed, ...).

    common/quickcheck.py 'strip-1[345]|^testfile$'                 # all corpora
    common/quickcheck.py --corpora binutils,elfutils 'dw2-3'
    common/quickcheck.py --against results/run2 --against results/run4 REGEX

The baseline defaults to results/baseline/comparisons.json (or, if that does
not exist, the most recent results/*/comparisons.json).  Results of the
partial run go to results/quickcheck/ (overwritten each time), with the same
per-object directories as a full run, so a changed comparison can be looked
at in results/quickcheck/objects/<object>/<comparison>/."""
import argparse, collections, json, os, pathlib, subprocess, sys

HERE = pathlib.Path(__file__).resolve().parent
VALIDATION = HERE.parent
RANK = {"identical": 0, "skipped": 0, "(new)": 0, "differ": 1, "oracle_failed": 1, "linksem_failed": 2, "timeout": 3}

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("regex", help="regular expression over object names (Python re.search)")
    ap.add_argument("--against", action="append", default=[], metavar="DIR", help="results directory to compare against (repeatable)")
    ap.add_argument("--corpora", default=None, help="comma-separated corpus names (default: every cache/objects/* directory)")
    ap.add_argument("--results", default=str(VALIDATION / "results" / "quickcheck"), metavar="DIR")
    ap.add_argument("-v", "--verbose", action="store_true", help="also list comparisons that became identical")
    args = ap.parse_args()

    if not args.against:
        base = VALIDATION / "results" / "baseline"
        if not (base / "comparisons.json").exists():
            runs = sorted((p for p in (VALIDATION / "results").glob("*/comparisons.json")), key=lambda p: p.stat().st_mtime)
            if not runs:
                sys.exit("no earlier results to compare against; pass --against")
            base = runs[-1].parent
        args.against = [str(base)]
    baseline = {}
    for d in args.against:
        for r in json.load(open(pathlib.Path(d) / "comparisons.json")):
            baseline[(r["corpus"], r["object"], r["comparison"])] = r["status"]

    corpora = args.corpora.split(",") if args.corpora else sorted(p.name for p in (VALIDATION / "cache" / "objects").iterdir() if p.is_dir())
    results = pathlib.Path(args.results); results.mkdir(parents=True, exist_ok=True)
    records = []
    for c in corpora:
        env = dict(os.environ, COMPARE_ONLY=args.regex)
        p = subprocess.run([sys.executable, str(HERE / "compare.py"), str(VALIDATION / "cache" / "objects" / c), str(results), c],
                           env=env, capture_output=True, text=True)
        if p.returncode:
            sys.exit(f"compare.py failed for {c}:\n{p.stdout[-500:]}\n{p.stderr[-2000:]}")
        f = results / "comparisons-only.json"
        if f.exists():
            records += json.load(open(f)); f.unlink()

    objects = {(r["corpus"], r["object"]) for r in records}
    print("now:", dict(collections.Counter(r["status"] for r in records)), "over", len(objects), "objects")
    changes = collections.Counter(); regressions = 0
    for r in records:
        before = baseline.get((r["corpus"], r["object"], r["comparison"]), "(new)")
        if before == r["status"]:
            continue
        changes[(before, r["status"])] += 1
        worse = RANK.get(r["status"], 1) > RANK.get(before, 1)
        regressions += worse
        if worse or r["status"] != "identical" or args.verbose:
            print(f"  {before:15s} -> {r['status']:15s} {r['corpus']}/{r['object']} {r['comparison']} :: {str(r.get('signature', ''))[:150]}")
    print("transitions:", {f"{a}->{b}": n for (a, b), n in changes.items()})
    remaining = collections.Counter((r["status"], str(r.get("signature"))) for r in records if r["status"] in ("differ", "linksem_failed", "timeout"))
    for (st, sg), n in remaining.most_common(12):
        print(f"  remaining {n:4d} {st:14s} {sg[:160]}")
    if regressions:
        print(f"REGRESSIONS: {regressions}")
    sys.exit(2 if regressions else 0)

if __name__ == "__main__":
    main()
