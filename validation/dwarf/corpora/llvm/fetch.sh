#!/bin/bash
# Claude: the LLVM DWARF tests, at the tag matching the installed LLVM tools
# (18.1.3).  Apache-2.0 with LLVM exception; used in place only.
set -eu
here=$(cd "$(dirname "$0")/../../.." && pwd)
exec "$here/common/fetch.sh" llvm https://github.com/llvm/llvm-project.git \
  "${LLVM_REF:-llvmorg-18.1.3}" llvm/test/tools/llvm-dwarfdump llvm/test/DebugInfo
