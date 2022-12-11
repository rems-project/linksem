.PHONY: default
default: lem_ocaml_sentinel
default: build_zarith/linksem.cma build_zarith/linksem.cmxa
default: build_num/linksem.cma build_num/linksem.cmxa
default: main_elf main_elf.opt main_link main_link.opt copy_elf copy_elf.opt

include lem.mk

OCAMLFLAGS += -bin-annot

ocaml: main_elf copy_elf

scratch scratch.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC))

main_elf main_elf.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC))

main_link main_link.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC))

copy_elf copy_elf.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC))

build_zarith/linksem.cma build_zarith/linksem.cmxa build_num/linksem.cma build_num/linksem.cmxa: ML_SOURCES := $(ALL_UTIL_ML) \
  $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
  $(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
  $(patsubst %.lem,%.ml,$(LEM_LINK_SRC))

build_num/linksem.cma: OCAMLFIND_PACKAGES += -predicates nozarith
build_zarith/linksem.cma build_num/linksem.cma: build_%/linksem.cma: $(ALL_UTIL_ML_WO_LEM) lem_ocaml_sentinel
	mkdir -p "$(dir $@)"
	ocamlfind ocamlc -c $(OCAMLFLAGS) $(OCAMLFIND_PACKAGES) $(ML_SOURCES)
	ocamlfind ocamlc -a -o "$@" $(OCAMLFLAGS) $(patsubst %.ml,%.cmo,$(ML_SOURCES))
	mv $(patsubst %.ml,%.cmi,$(ML_SOURCES)) "$(dir $@)"
	cp META.$* "$(dir $@)"/META

build_num/linksem.cmxa: OCAMLFIND_PACKAGES += -predicates nozarith
build_zarith/linksem.cmxa build_num/linksem.cmxa: build_%/linksem.cmxa: $(ALL_UTIL_ML_WO_LEM) lem_ocaml_sentinel
	mkdir -p "$(dir $@)"
	ocamlfind ocamlopt -c $(OCAMLFLAGS) $(OCAMLFIND_PACKAGES) $(ML_SOURCES)
	ocamlfind ocamlopt -a -o "$@" $(OCAMLFLAGS) $(patsubst %.ml,%.cmx,$(ML_SOURCES))
	mv $(patsubst %.ml,%.cmi,$(ML_SOURCES)) "$(dir $@)"
	mv $(patsubst %.ml,%.cmx,$(ML_SOURCES)) "$(dir $@)"
	mv $(patsubst %.ml,%.cmt,$(ML_SOURCES)) "$(dir $@)"
	cp META.$* "$(dir $@)"/META

INSTALLDIR := $(shell ocamlfind printconf destdir)
LINKSEMRELEASE := 0.8
LINKSEMVERSION := $(shell git describe --dirty --always || echo $(LINKSEMRELEASE))

$(INSTALLDIR)/linksem_zarith/META $(INSTALLDIR)/linksem_num/META: $(INSTALLDIR)/linksem_%/META: build_%/linksem.cma build_%/linksem.cmxa
	-ocamlfind remove -destdir $(INSTALLDIR) linksem_$*
	ocamlfind install -destdir $(INSTALLDIR) -patch-version "$(LINKSEMVERSION)" linksem_$* \
	  build_$*/META \
	  $^ \
	  build_$*/linksem.a\
	  build_$*/*.cmi \
	  build_$*/*.cmx \
	  build_$*/*.cmt \
	  $(ALL_UTIL_ML) \
	  $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	  $(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	  $(patsubst %.lem,%.ml,$(LEM_LINK_SRC))
	touch $@

.PHONY: install_zarith install_num
install_zarith install_num: install_%: $(INSTALLDIR)/linksem_%/META

$(INSTALLDIR)/linksem/META: META
	-ocamlfind remove -destdir $(INSTALLDIR) linksem
	ocamlfind install -destdir $(INSTALLDIR) -patch-version "$(LINKSEMVERSION)" linksem META
	touch $@

.PHONY: install
install: $(INSTALLDIR)/linksem/META install_zarith install_num

LOCALINSTALDIR := local
.PHONY: local-install
local-install:
	mkdir -p $(LOCALINSTALDIR)
	$(MAKE) INSTALLDIR=$(LOCALINSTALDIR) install

.PHONY: uninstall
uninstall:
	-ocamlfind remove -destdir $(INSTALLDIR) linksem
	-ocamlfind remove -destdir $(INSTALLDIR) linksem_zarith
	-ocamlfind remove -destdir $(INSTALLDIR) linksem_num


copy_elf main_elf main_link: OCAMLFIND_PACKAGES += -package unix -package str
copy_elf main_elf main_link scratch: %: %.ml $(ALL_UTIL_ML_WO_LEM) lem_ocaml_sentinel
	ocamlfind ocamlc $(OCAMLFLAGS) -o "$@" -g \
	$(OCAMLFIND_PACKAGES) \
	$(ALL_UTIL_ML) \
	$(OCAML_LEM_SRC) \
	"$<" \
	-linkpkg

copy_elf.opt main_elf.opt main_link.opt: OCAMLFIND_PACKAGES += -package unix -package str
copy_elf.opt main_elf.opt main_link.opt scratch.opt: %.opt: %.ml $(ALL_UTIL_ML_WO_LEM) lem_ocaml_sentinel
	ocamlfind ocamlopt $(OCAMLFLAGS) -o "$@" -g \
	$(OCAMLFIND_PACKAGES) \
	$(ALL_UTIL_ML) \
	$(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC)) \
	"$<" \
	-linkpkg

.PHONY: clean
clean: lem-clean
	rm -rf build_zarith build_num
	rm -f main_elf main_link main_elf.opt main_link.opt copy_elf copy_elf.opt
	rm -rf *~
	rm -f *.cmi *.cmo *.cmx *.cmt *.o
	rm -f abis/*.cmi abis/*.cmo abis/*.cmx abis/*.cmt abis/*.o
	rm -f abis/*/*.cmi abis/*/*.cmo abis/*/*.cmx abis/*/*.cmt abis/*/*.o
	rm -f adaptors/*.cmi adaptors/*.cmo adaptors/*.cmx adaptors/*.cmt adaptors/*.o
	rm -f gnu_extensions/*.cmi gnu_extensions/*.cmo gnu_extensions/*.cmx gnu_extensions/*.cmt gnu_extensions/*.o

stacktrace:
	export OCAMLRUNPARAM=b; \
	ocamlfind ocamlc -package unix -package str -package lem -linkpkg -g missing_pervasives.ml show.ml endianness.ml error.ml ml_bindings.ml default_printing.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml string_table.ml elf_section_header_table.ml elf_interpreted_segment.ml elf_symbol_table.ml elf_executable_file3.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml sail_interface.ml main_elf.ml copy_elf.ml

oldall: lem_ocaml_sentinel camlp4 ocaml

all: ocaml

execute:
	./a.out

go: all execute

go-debug: lem_ocaml_sentinel stacktrace execute
