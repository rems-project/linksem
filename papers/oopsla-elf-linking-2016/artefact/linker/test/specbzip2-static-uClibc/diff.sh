#!/bin/bash

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
errfile=`mktemp`
echo "outfile is $outfile" 1>&2
echo "errfile is $errfile" 1>&2

( $(dirname "$0")/run.sh 3>&1 1>&2 2>&3 ) 2>"$outfile" | tee "$errfile"

diff -u <( cat "$outfile" | \
sed -n '/^Archive member included/,/Allocating common symbols/ p' | sort | cut -c1-36  ) \
<( cat "$(dirname "$0")"/"$basename".map | \
sed -n '/^Archive member included/,/Allocating common symbols/ p' | sort | cut -c1-36 )

diff -u <( cat "$outfile" | \
sed -n '/^Allocating common symbols/,/Discarded input sections/ p' | sort | cut -c1-38 ) \
<( cat "$(dirname "$0")"/"$basename".map | \
sed -n '/^Allocating common symbols/,/Discarded input sections/ p' | sort | cut -c1-38 )

diff -u <( cat "$outfile" | \
sed -n '/^Discarded input sections/,/Memory Configuration/ p' | sort ) \
<( cat "$(dirname "$0")"/"$basename".map | \
sed -n '/^Discarded input sections/,/Memory Configuration/ p' | sort )

diff -u <( cat "$outfile" | \
sed -n '/^\(Linker script and m\|M\)emory map/,/OUTPUT/ p' ) \
<( cat "$(dirname "$0")"/"$basename".map | "$(dirname "$( readlink -f "$0" )" )"/bfd-filter.sh | \
sed -n '/^\(Linker script and m\|M\)emory map/,/OUTPUT/ p' )
