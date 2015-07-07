#!/bin/bash

MAIN_ELF=../../src/main_elf.opt
TEST_FILES=/usr/bin

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
    printf "\tFor ""${EXECUTABLE_NAME}""\n\n"
    printf "Formal ELF model returned:\n\n"
    echo $MAIN_ELF_RESULT
    printf "\nWhereas readelf returned:\n\n"
    echo $READELF_RESULT
    printf "\nDIFF:\n"
    echo $RESULT
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
    printf "\tFor ""${EXECUTABLE_NAME}""\n\n"
    printf "Formal ELF model returned:\n\n"
    echo $MAIN_ELF_RESULT
    printf "\nWhereas readelf returned:\n\n"
    echo $READELF_RESULT
    printf "\nDIFF:\n"
    echo $RESULT
  fi
}

if [ $# -ne 1 ]; then
  printf "./harness.sh <flag>\n"
  exit -1
fi

FLAG=$1

for f in $(ls $TEST_FILES); do
  FTYPE=`file $TEST_FILES/$f | cut -f2 -d' '`
  echo $FTYPE
  if [ $FTYPE == "ELF" ]; then
    echo "testing: " $f
    if [ $FLAG == "--in-out" ]; then
      perform_hexdump_diff $TEST_FILES/$f
    else
      perform_readelf_diff $TEST_FILES/$f $FLAG
    fi
  fi
done
