#!/bin/sh

# useful vars:
# EXT       -- ".opt" or ""
# DEBUGGER  -- e.g. "gdb --args" or "ocamldebug"

EXT="${EXT:-.opt}"

export OCAMLRUNPARAM=b

get_basename () {
 dir="$( dirname "$0" )"
 echo "dir is $dir" 1>&2
 basename "$( case "$dir" in (.) pwd ;; (*) echo "$dir" ;; esac)" | sed 's/-.*//'
}

basename="$(get_basename)"
echo "basename is $basename" 1>&2

outfile=`mktemp`
echo "outfile is $outfile" 1>&2

cd "$(dirname "$0")" && \
eval CAML_LD_LIBRARY_PATH=`pwd`/../../contrib/ocaml-uint/_build/lib:`pwd`/../../../lem/ocaml-lib/dependencies/zarith \
exec $DEBUGGER $( cat ./"$basename".repeat-cmd | sed 's#ld#../../src/main_link${EXT}#' )

