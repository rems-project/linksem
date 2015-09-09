#!/bin/sh

# useful vars:
# EXT       -- ".opt" or ""
# DEBUGGER  -- e.g. "gdb --args" or "ocamldebug"

EXT="${EXT:-.opt}"

export OCAMLRUNPARAM=b

outfile=`mktemp`
echo "outfile is $outfile" 1>&2

# diff -u <( cat "$outfile" | sort | cut -c1-36 ) <( cat ../test/hello-static-gnu/hello.map | sed -n '/^Archive member included/,/Allocating common symbols/ p' | sort | cut -c1-36 )

cd "$(dirname "$0")" && \
eval CAML_LD_LIBRARY_PATH=`pwd`/../../contrib/ocaml-uint/_build/lib:`pwd`/../../../lem/ocaml-lib/dependencies/zarith \
exec $DEBUGGER $( cat hello.repeat-cmd | sed 's#ld#../../src/main_link${EXT}#' )

