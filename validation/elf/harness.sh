#!/bin/bash

MAIN_ELF=../../src/main_elf.opt
TEST_FILES=/mnt/bimfs
DIFF_TOOL=meld

function perform_readelf_diff
{
  EXECUTABLE_NAME=$1
  FLAG=$2
  READELF_RESULT=`readelf --wide $FLAG $EXECUTABLE_NAME`
  MAIN_ELF_RESULT=`$MAIN_ELF $FLAG $EXECUTABLE_NAME`
  RESULT=`diff <(echo "$MAIN_ELF_RESULT") <(echo "$READELF_RESULT")`
  if [ $? -eq 0 ]; then
    echo $(tput setaf 2)
    echo "PASSED:"
    echo $(tput sgr0)
    printf "\tFor ""$EXECUTABLE_NAME""\n"
  else
    echo $(tput setaf 1)
    echo "TEST FAILED:"
    echo $(tput sgr0)
    printf "\tFor ""${EXECUTABLE_NAME}""\n"
    printf "\tDiffs written on mainelf-output and oracle-output\n"
    (echo "$READELF_RESULT") > oracle-output
    (echo "$MAIN_ELF_RESULT") > mainelf-output
    `$DIFF_TOOL mainelf-output oracle-output`
    exit -1
  fi
}

function perform_hexdump_diff
{
  EXECUTABLE_NAME=$1
  HEXDUMP_RESULT=`hexdump --no-squeezing $EXECUTABLE_NAME`
  MAIN_ELF_RESULT=`$MAIN_ELF --in-out $EXECUTABLE_NAME`
  RESULT=`diff <(echo "$MAIN_ELF_RESULT") <(echo "$HEXDUMP_RESULT")`
  if [ $? -eq 0 ]; then
    echo $(tput setaf 2)
    echo "PASSED:"
    echo $(tput sgr0)
    printf "\tFor ""$EXECUTABLE_NAME""\n"
  else
    echo $(tput setaf 1)
    echo "TEST FAILED:"
    echo $(tput sgr0)
    printf "\tFor ""${EXECUTABLE_NAME}""\n"
    printf "\tDiffs written on mainelf-output and oracle-output\n"
    (echo "$HEXDUMP_RESULT") > oracle-output
    (echo "$MAIN_ELF_RESULT") > mainelf-output
    `$DIFF_TOOL mainelf-output oracle-output`
    exit -1
  fi
}

if [ $# -ne 1 ]; then
  printf "./harness.sh <flag>\n"
  exit -1
fi

FLAG=$1

for f in $(ls -rS $TEST_FILES); do
  # These are ELF32 files present on the Power machine that we use for testing.
  # We have not formalised the 32-bit Power ABI yet so they cause problems when
  # automatically testing conformance for PowerPC64.
  if [[ $f != "gdk-pixbuf-query-loaders-32" &&
        $f != "pango-querymodules-32" &&
        $f != "gtk-query-immodules-2.0-32" &&
        $f != "strace32" ]]; then
    FTYPE=`file $TEST_FILES/$f | cut -f2 -d' '`
    if [ $FTYPE == "ELF" ]; then
      echo "testing: " $f
      if [ $FLAG == "--in-out" ]; then
        perform_hexdump_diff $TEST_FILES/$f
      else
        perform_readelf_diff $TEST_FILES/$f $FLAG
      fi
    fi
  fi
done
