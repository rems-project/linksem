#!/bin/bash
# Claude: the elfutils test binaries (tests/testfile*.bz2), from sourceware.
# GPLv3+; used in place only.
set -eu
here=$(cd "$(dirname "$0")/../../.." && pwd)
exec "$here/common/fetch.sh" elfutils https://sourceware.org/git/elfutils.git \
  "${ELFUTILS_REF:-main}" tests
