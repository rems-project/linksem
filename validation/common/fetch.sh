#!/bin/bash
# Claude: this script is largely written by Claude (19 September 2026).
#
# fetch.sh NAME URL REF PATH...
#
# Sparse, blobless, depth-1 clone of REF (a tag or branch) of URL into
# validation/cache/src/NAME, checking out only the given PATHs.  Idempotent:
# an existing clone is reused (re-run with FETCH_REFRESH=1 to re-fetch).
# Nothing fetched is ever checked in; see the licence note in README.md.
set -eu
name=$1; url=$2; ref=$3; shift 3
here=$(cd "$(dirname "$0")/.." && pwd)
dst="$here/cache/src/$name"
mkdir -p "$here/cache/src"
if [ -d "$dst/.git" ] && [ -z "${FETCH_REFRESH:-}" ]; then
  echo "fetch: $name already present at $dst ($(git -C "$dst" rev-parse --short HEAD))"
else
  rm -rf "$dst"
  echo "fetch: cloning $url at $ref into $dst"
  git clone -q --depth 1 --filter=blob:none --sparse --branch "$ref" "$url" "$dst"
fi
git -C "$dst" sparse-checkout set "$@" >/dev/null
echo "fetch: $name @ $(git -C "$dst" rev-parse HEAD) with $*"
