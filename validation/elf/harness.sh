#!/bin/bash

MAIN_ELF=../../src/main_elf.opt
TEST_FILES=test

function perform_diff
{
  EXECUTABLE_NAME=$1
  READELF_RESULT=`readelf --file-header $EXECUTABLE_NAME`
  MAIN_ELF_RESULT=`$MAIN_ELF $EXECUTABLE_NAME`
  RESULT=`diff <(echo $MAIN_ELF_RESULT) <(echo $READELF_RESULT)`
  if [ $? -eq 0 ]; then
    echo $(tput setaf 1)
    echo "PASSED:"
    echo $(tput sgr0)
    printf "\tFor ""$EXECUTABLE_NAME"""
  else
    echo $(tput setaf 1)
    echo "TEST FAILED:"
    echo $(tput sgr0)
    printf "\tFor ""${EXECUTABLE_NAME}""\n\n"
    printf "Formal ELF model returned:\n\n"
    echo $MAIN_ELF_RESULT
    printf "\nWhereas readelf returned:\n\n"
    echo $READELF_RESULT
  fi
}

for f in $(ls $TEST_FILES); do
  echo "testing: " $f
  perform_diff $TEST_FILES/$f
done
