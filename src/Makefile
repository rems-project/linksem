# This should work for everyone: 
# make
# (but make sure you've run `make' from the top level, like a user should.)

THIS_MAKEFILE := $(realpath $(lastword $(MAKEFILE_LIST)))
REPOROOT := $(dir $(THIS_MAKEFILE))/..

LEMDIR ?= ../../lem
LEM ?= $(LEMDIR)/lem


$(warning MAKECMDGOALS is $(MAKECMDGOALS))
ifneq ($(MAKECMDGOALS),clean)
# Lem optionally vendors the zarith dependency, but currently
# we don't use that -- just assume the host system has zarith.
ifeq ($(shell ocamlfind query zarith),)
$(error No zarith installed [anywhere ocamlfind can find it]; install it (opam install zarith || apt-get install libzarith-ocaml{,-dev} || yum install ocaml-zarith), or use make install_dependencies in lem/ocaml-lib, or hack $(THIS_MAKEFILE) to use Lem's vendored copy locally.)
endif
# assume the host system has lem
ifeq ($(shell ocamlfind query lem),)
$(error No lem installed [anywhere ocamlfind can find it]; please install it ('make install' from lem/ocaml-lib || 'make local-install' from lem/ocaml-lib and add lem/ocaml-lib/local to OCAMLPATH))
endif
endif


LEM_UTIL_SRC := default_printing.lem missing_pervasives.lem show.lem endianness.lem multimap.lem error.lem
# Some of the utility code is directly in ML, some in Lem; order matters!
# NOTE: LEM_UTIL_SRC and ALL_UTIL_ML need to be kept in sync manually.
# GAH. doing a topsort manually is a sign of failure.
ALL_UTIL_ML := \
	uint64_wrapper.ml uint32_wrapper.ml \
	show.ml endianness.ml error.ml ml_bindings.ml missing_pervasives.ml multimap.ml \
	multimapAuxiliary.ml \
	default_printing.ml \
	byte_sequence_wrapper.ml \
	# missing_pervasivesAuxiliary.ml
ALL_UTIL_ML_WO_LEM := $(filter-out $(patsubst %.lem,%.ml,$(LEM_UTIL_SRC)) $(patsubst %.lem,%Auxiliary.ml,$(LEM_UTIL_SRC)),$(ALL_UTIL_ML))

# Nasty cycle:
# show depends on missing_pervasives
# missing_pervasives depends on ml_bindings
# ml_bindings depends on endianness
# endianness depends on show
# -- Show should be split up. For now, just split off the problematic byte stuff into Missing_pervasives.

LEM_ELF_SRC := byte_sequence.lem archive.lem \
	elf_types_native_uint.lem hex_printing.lem \
	string_table.lem \
	elf_header.lem elf_symbol_table.lem elf_program_header_table.lem \
	elf_section_header_table.lem \
	elf_relocation.lem \
	elf_interpreted_segment.lem elf_interpreted_section.lem \
	elf_note.lem elf_file.lem elf_dynamic.lem \
	dwarf.lem

LEM_ABI_SRC := \
	abis/abi_classes.lem memory_image.lem memory_image_orderings.lem \
	abis/abi_utilities.lem \
	gnu_extensions/gnu_ext_abi.lem \
	abis/power64/abi_power64.lem \
	abis/power64/abi_power64_elf_header.lem \
	abis/power64/abi_power64_section_header_table.lem \
	abis/power64/abi_power64_dynamic.lem \
	abis/aarch64/abi_aarch64_le_elf_header.lem \
	abis/aarch64/abi_aarch64_symbol_table.lem \
	abis/aarch64/abi_aarch64_section_header_table.lem \
	abis/aarch64/abi_aarch64_program_header_table.lem \
	abis/aarch64/abi_aarch64_le_serialisation.lem \
	abis/aarch64/abi_aarch64_relocation.lem \
	abis/aarch64/abi_aarch64_le.lem \
	abstract_linker_script.lem \
	abis/amd64/abi_amd64_elf_header.lem \
	abis/amd64/abi_amd64_serialisation.lem \
	abis/amd64/abi_amd64_relocation.lem \
	abis/amd64/abi_amd64_program_header_table.lem \
	abis/amd64/abi_amd64_section_header_table.lem \
	abis/amd64/abi_amd64_symbol_table.lem \
	abis/amd64/abi_amd64.lem \
	abis/mips64/abi_mips64_elf_header.lem \
	abis/mips64/abi_mips64_serialisation.lem \
	abis/mips64/abi_mips64_program_header_table.lem \
	abis/mips64/abi_mips64_section_header_table.lem \
	abis/mips64/abi_mips64_symbol_table.lem \
	abis/mips64/abi_mips64.lem \
	abis/x86/abi_x86_relocation.lem \
	abis/power64/abi_power64_relocation.lem \
	gnu_extensions/gnu_ext_types_native_uint.lem \
	gnu_extensions/gnu_ext_section_header_table.lem \
	gnu_extensions/gnu_ext_dynamic.lem \
	gnu_extensions/gnu_ext_symbol_versioning.lem \
	gnu_extensions/gnu_ext_program_header_table.lem \
	gnu_extensions/gnu_ext_section_to_segment_mapping.lem \
	gnu_extensions/gnu_ext_note.lem \
	abis/abis.lem \
	adaptors/sail_interface.lem \
	adaptors/harness_interface.lem \

#	abis/mips64/abi_mips64_relocation.lem \

LEM_LINK_SRC := elf_memory_image.lem elf_memory_image_of_elf64_file.lem command_line.lem input_list.lem linkable_list.lem linker_script.lem link.lem elf64_file_of_elf_memory_image.lem test_image.lem

# LEM_MODEL_ML includes all OCaml except for the main programs
LEM_MODEL_ML := $(patsubst %.lem,%.ml,$(LEM_UTIL_SRC) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC))

LEM_MODEL_TP_THY := $(LEM_UTIL_SRC) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC) test_image.lem import_everything.lem

# WARNING: if you add packages that are not supported by js_of_ocaml the
# rmem/ppcmem2 web-interface will not build.
OCAMLFIND_PACKAGES := -package lem

OCAMLFLAGS := -I adaptors \
  -I abis -I abis/amd64 -I abis/power64 -I abis/aarch64 -I abis/x86 -I abis/mips64 \
  -I gnu_extensions \
  -g

# Want the following order:
# OCaml library
# Lem library objs
# OCaml helpers from this repo
# Lem utility code
# Lem ELF code
# Lem ABI code
# Lem linking code

.PHONY: default
default: lem_ocaml_sentinel
default: build_zarith/linksem.cma build_zarith/linksem.cmxa
default: build_num/linksem.cma build_num/linksem.cmxa
default: main_elf main_elf.opt main_link main_link.opt

ldgram.y.hacked: ldgram.y
	cat "$<" | \
	tr '\n' '\f' | \
	sed "s/\([^']\){[^}]*}/\1/g" | \
	tr '\f' '\n' | \
	grep '\([:|;]\|[A-Za-z0-9_]\{2,\}\)' | \
	tail -n+35 > "$@" || rm -f "$@"

lem_ocaml_sentinel: $(LEM_UTIL_SRC) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC) main_link.lem main_elf.lem scratch.lem
	$(LEM) -ocaml -only_changed_output $+
	touch $@

.PHONY: isa-extraction
isa-extraction:
	$(LEM) -isa -only_changed_output -add_full_isa_lib_path \
	$(LEM_MODEL_TP_THY)
	ls -1 *.thy | grep -v ^Error.thy | xargs -I{} mv {} ../auto_generated/isabelle/
	mv */*.thy ../auto_generated/isabelle/
	mv */*/*.thy ../auto_generated/isabelle/
	cd ../auto_generated/isabelle && ./massage_isabelle_imports.sh

.PHONY: hol-extraction
hol-extraction:
	$(LEM) -hol -only_changed_output \
	$(LEM_MODEL_TP_THY)
	ls -1 *.sml | grep -v ^errorScript.sml | xargs -I{} mv {} ../auto_generated/hol-kananaskis-10/
	mv */*Script.sml ../auto_generated/hol-kananaskis-10/
	mv */*/*Script.sml ../auto_generated/hol-kananaskis-10/

.PHONY: coq-extraction
coq-extraction:
	$(LEM) -coq -only_changed_output -add_full_isa_lib_path \
	$(LEM_MODEL_TP_THY)
	mv *.v ../auto_generated/coq/
	mv */*.v ../auto_generated/coq/
	mv */*/*.v ../auto_generated/coq/

clean:
	rm -f lem_ocaml_sentinel
	rm -rf build_zarith build_num
	rm -f $(LEM_MODEL_ML)
	rm -f main_elf.ml main_link.ml
	rm -f main_elf main_link main_elf.opt main_link.opt
	rm -rf *~
	rm -f *.cmi *.cmo *.cmx *.o
	rm -f abis/*.cmi abis/*.cmo abis/*.cmx abis/*.o
	rm -f abis/*/*.cmi abis/*/*.cmo abis/*/*.cmx abis/*/*.o
	rm -f adaptors/*.cmi adaptors/*.cmo adaptors/*.cmx adaptors/*.o
	rm -f gnu_extensions/*.cmi gnu_extensions/*.cmo gnu_extensions/*.cmx gnu_extensions/*.o
	rm -f $(patsubst %.lem,%.ml,$(LEM_UTIL_SRC)) $(patsubst %.lem,%Auxiliary.ml,$(LEM_UTIL_SRC))

ocaml: main_elf

scratch scratch.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC))

main_elf main_elf.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC))

main_link main_link.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
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
	cp META.$* "$(dir $@)"/META

INSTALLDIR := $(shell ocamlfind printconf destdir)
LINKSEMVERSION := $(shell git describe --dirty --always)

$(INSTALLDIR)/linksem_zarith/META $(INSTALLDIR)/linksem_num/META: $(INSTALLDIR)/linksem_%/META: build_%/linksem.cma build_%/linksem.cmxa
	-ocamlfind remove linksem_$*
	ocamlfind install -patch-version "$(LINKSEMVERSION)" linksem_$* \
	  build_$*/META \
	  $^ \
	  build_$*/linksem.a\
	  build_$*/*.cmi \
	  build_$*/*.cmx
	touch $@

.PHONY: install_zarith install_num
install_zarith install_num: install_%: $(INSTALLDIR)/linksem_%/META

$(INSTALLDIR)/linksem/META: META
	-ocamlfind remove linksem
	ocamlfind install -patch-version "$(LINKSEMVERSION)" linksem META
	touch $@

.PHONY: install
install: $(INSTALLDIR)/linksem/META install_zarith install_num

.PHONY: uninstall
uninstall:
	-ocamlfind remove linksem
	-ocamlfind remove linksem_zarith
	-ocamlfind remove linksem_num

main_elf main_link: OCAMLFIND_PACKAGES += -package unix -package str
main_elf main_link scratch: %: %.ml $(ALL_UTIL_ML_WO_LEM) lem_ocaml_sentinel
	ocamlfind ocamlc $(OCAMLFLAGS) -o "$@" -g \
	$(OCAMLFIND_PACKAGES) \
	$(ALL_UTIL_ML) \
	$(OCAML_LEM_SRC) \
	"$<" \
	-linkpkg

main_elf.opt main_link.opt: OCAMLFIND_PACKAGES += -package unix -package str
main_elf.opt main_link.opt scratch.opt: %.opt: %.ml $(ALL_UTIL_ML_WO_LEM) lem_ocaml_sentinel
	ocamlfind ocamlopt $(OCAMLFLAGS) -p -o "$@" -g \
	$(OCAMLFIND_PACKAGES) \
	$(ALL_UTIL_ML) \
	$(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC)) \
	"$<" \
	-linkpkg

ocaml_with_ocamlbuild: lem_ocaml_sentinel
	ocamlbuild -classic-display \
  -cflag -g \
  -pkg 'unix str lem' \
  main_elf.byte 

clean_with_ocamlbuild:
	ocamlbuild -classic-display -clean

stacktrace:
	export OCAMLRUNPARAM=b; \
	ocamlfind ocamlc -package unix -package str -package lem -linkpkg -g missing_pervasives.ml show.ml endianness.ml error.ml ml_bindings.ml default_printing.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml string_table.ml elf_section_header_table.ml elf_interpreted_segment.ml elf_symbol_table.ml elf_executable_file3.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml sail_interface.ml main_elf.ml

oldall: lem_ocaml_sentinel camlp4 ocaml

all: ocaml

execute:
	./a.out

go: all execute

go-debug: lem_ocaml_sentinel stacktrace execute
