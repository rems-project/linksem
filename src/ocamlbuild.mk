all: copy_elf.native main_elf.native main_link.native

include lem.mk

.PHONY: clean
clean: lem-clean
	ocamlbuild -clean

%.byte %.native: lem_ocaml_sentinel $(ALL_UTIL_ML)
	ocamlbuild -cflag -g -pkg 'unix str lem' $(INCLUDEFLAGS) "$@"
