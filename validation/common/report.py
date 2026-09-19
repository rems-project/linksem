#!/usr/bin/env python3
# Claude: this script is largely written by Claude (19 September 2026).
"""summary.md / summary.json (the matrix of outcomes), triage.md (differences
clustered by first-line signature, with examples), and with --against a
regression list relative to an earlier run."""
import json, sys, pathlib
from collections import Counter, defaultdict

STATUSES = ["identical", "differ", "linksem_failed", "oracle_failed", "timeout", "skipped"]

def main():
    results = pathlib.Path(sys.argv[1])
    against = pathlib.Path(sys.argv[3]) if len(sys.argv) > 3 and sys.argv[2] == "--against" else None
    recs = json.loads((results / "comparisons.json").read_text())
    rows = defaultdict(Counter)
    for r in recs:
        rows[(r["corpus"], r["kind"], r["comparison"])][r["status"]] += 1
    comps = sorted({r["comparison"] for r in recs}, key=lambda c: (next(r["row"] for r in recs if r["comparison"] == c), c))
    lines = ["# Validation summary", "", f"{len(recs)} comparison runs over {len({r['object'] for r in recs})} files.", ""]
    for (corpus, kind) in sorted({(r["corpus"], r["kind"]) for r in recs}):
        lines += [f"## {corpus} / {kind}", "", "| comparison | " + " | ".join(STATUSES) + " |", "|---|" + "---|" * len(STATUSES)]
        for c in comps:
            cnt = rows[(corpus, kind, c)]
            if sum(cnt.values()) == 0: continue
            lines.append(f"| {c} | " + " | ".join(str(cnt[s]) if cnt[s] else "" for s in STATUSES) + " |")
        skips = Counter(r["reason"] for r in recs if r["corpus"] == corpus and r["kind"] == kind and r["status"] == "skipped")
        if skips:
            lines += ["", "skipped: " + ", ".join(f"{v} {k}" for k, v in skips.most_common())]
        lines.append("")
    (results / "summary.md").write_text("\n".join(lines))
    (results / "summary.json").write_text(json.dumps({"rows": {"|".join(k): dict(v) for k, v in rows.items()},
                                                       "runs": [{k: r[k] for k in ("corpus", "object", "comparison", "status")} for r in recs]}, indent=0))
    # triage
    groups = defaultdict(list)
    for r in recs:
        if r["status"] in ("differ", "linksem_failed", "timeout"):
            groups[(r["comparison"], r.get("signature", r["status"]))].append(r)
    t = ["# Triage: differences clustered by first differing line (numbers masked)", ""]
    for (c, sig), rs in sorted(groups.items(), key=lambda kv: -len(kv[1])):
        t += [f"## {c}: {len(rs)} files", "", f"    {sig}", "",
              "examples: " + ", ".join(f"objects/{r['object']}/{c}" for r in rs[:3]), ""]
    (results / "triage.md").write_text("\n".join(t))
    if against:
        prev = {(x["corpus"], x["object"], x["comparison"]): x["status"] for x in json.loads((against / "summary.json").read_text())["runs"]}
        reg = [(r, prev[(r["corpus"], r["object"], r["comparison"])]) for r in recs
               if (r["corpus"], r["object"], r["comparison"]) in prev and prev[(r["corpus"], r["object"], r["comparison"])] == "identical" and r["status"] != "identical"]
        fixed = [r for r in recs if prev.get((r["corpus"], r["object"], r["comparison"])) not in (None, "identical", "skipped") and r["status"] == "identical"]
        print(f"against {against}: {len(reg)} regressions, {len(fixed)} fixed")
        for r, p in reg: print(f"  REGRESSION {r['object']} {r['comparison']}: {p} -> {r['status']}")
    print(f"report: {results}/summary.md, triage.md ({len(groups)} signatures)")

if __name__ == "__main__":
    main()
