#!/bin/bash

# convert gold's '** X' lines to '*X*' to be more like bfd

# gold does not always print fills. so we delete them both here and in bfd-filter.sh

sed -r 's/\*\*\*? ([a-z]+( [a-z]+)?) /*\1* /' | \
 grep -v '^ \?\*(' | \
grep -v '\*fill\*'

