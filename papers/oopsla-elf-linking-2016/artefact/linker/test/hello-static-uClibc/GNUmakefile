THIS_MAKEFILE := $(lastword $(MAKEFILE_LIST))
CONTRIB := $(realpath $(dir $(THIS_MAKEFILE))/../../contrib)
BUILDROOT ?= $(CONTRIB)/buildroot-2015.08.1
$(warning BUILDROOT is $(BUILDROOT))

CC := $(BUILDROOT)/output/host/usr/bin/$(shell uname -m)-buildroot-linux-uclibc-gcc
CXX := $(BUILDROOT)/output/host/usr/bin/$(shell uname -m)-buildroot-linux-uclibc-g++

include Makefile
