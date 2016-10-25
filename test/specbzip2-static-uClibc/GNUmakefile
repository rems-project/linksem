THIS_MAKEFILE := $(lastword $(MAKEFILE_LIST))
CONTRIB := $(realpath $(dir $(THIS_MAKEFILE))/../../contrib)
BUILDROOT ?= $(CONTRIB)/buildroot-2015.08.1
$(warning BUILDROOT is $(BUILDROOT))

CC := $(BUILDROOT)/output/host/usr/bin/$(shell uname -m)-buildroot-linux-uclibc-gcc
CXX := $(BUILDROOT)/output/host/usr/bin/$(shell uname -m)-buildroot-linux-uclibc-g++

CFLAGS := -DSPEC_CPU -DNDEBUG -I.   -O2 
LDLIBS := -lm
OBJECTS := blocksort.o bzip2.o bzlib.o compress.o crctable.o decompress.o huffman.o randtable.o spec.o 

export USE_LD := ld.bfd

include Makefile


