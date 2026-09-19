#!/bin/bash
# Claude: the binutils readelf/objdump testsuite, at the tag matching the
# installed binutils (2.42), from sourceware.  GPLv3+; used in place only.
set -eu
here=$(cd "$(dirname "$0")/../../.." && pwd)
exec "$here/common/fetch.sh" binutils https://sourceware.org/git/binutils-gdb.git \
  "${BINUTILS_REF:-binutils-2_42}" binutils/testsuite/binutils-all
