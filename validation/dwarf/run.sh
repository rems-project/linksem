#!/bin/bash
# Claude: this script is largely written by Claude (19 September 2026).
# run.sh CORPUS...  : fetch, build objects and executables, classify, compare
# against the oracles, report.  Results in validation/results/<timestamp>/.
set -eu
here=$(cd "$(dirname "$0")/.." && pwd)
stamp=${RESULTS_NAME:-$(date +%Y%m%d-%H%M%S)}
results="$here/results/$stamp"; mkdir -p "$results"
for corpus in "$@"; do
  "$here/dwarf/corpora/$corpus/fetch.sh"
  case $corpus in
    binutils) src="$here/cache/src/binutils/binutils/testsuite/binutils-all" ;;
    llvm)     src="$here/cache/src/llvm" ;;
    elfutils) src="$here/cache/src/elfutils" ;;
    *) echo "unknown corpus $corpus"; exit 1 ;;
  esac
  objs="$here/cache/objects/$corpus"
  python3 "$here/common/build_objects.py" "$corpus" "$src" "$objs"
  python3 "$here/common/classify.py" "$objs"
  python3 "$here/common/compare.py" "$objs" "$results" "$corpus"
done
python3 "$here/common/report.py" "$results" ${AGAINST:+--against "$AGAINST"}
echo "results: $results"
