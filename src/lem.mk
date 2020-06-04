# This should work for everyone:
# make
# (but make sure you've run `make' from the top level, like a user should.)

THIS_MAKEFILE := $(realpath $(lastword $(MAKEFILE_LIST)))
REPOROOT := $(dir $(THIS_MAKEFILE))/..

LEM ?= lem
USE_GENERIC_BYTE_SEQUENCE ?= false

$(info OCAMLPATH is $(OCAMLPATH))
export OCAMLPATH := $(OCAMLPATH)
$(warning MAKECMDGOALS is $(MAKECMDGOALS))
ifneq ($(MAKECMDGOALS),clean)
# Lem optionally vendors the zarith dependency, but currently
# we don't use that -- just assume the host system has zarith.
ifeq ($(shell ocamlfind query zarith),)
$(error No zarith installed [anywhere ocamlfind can find it]; install it (opam install zarith || apt-get install libzarith-ocaml{,-dev} || yum install ocaml-zarith), or use make install_dependencies in lem/ocaml-lib, or hack $(THIS_MAKEFILE) to use the Lem vendored copy locally.)
endif
# assume the host system has lem
ifeq ($(shell printenv | grep CAML 1>&2 && env OCAMLPATH=$(OCAMLPATH) ocamlfind query lem),)
$(error No lem installed [anywhere ocamlfind can find it]; please install it (opam install lem || 'make install' from lem/ocaml-lib || 'make local-install' from lem/ocaml-lib and add lem/ocaml-lib/local to OCAMLPATH))
endif
endif

ifeq "$(USE_GENERIC_BYTE_SEQUENCE)" "true"
OCAML_BYTE_SEQUENCE_IMPL=byte_sequence_generic.lem
else
OCAML_BYTE_SEQUENCE_IMPL=byte_sequence_ocaml.lem
endif

LEM_UTIL_SRC := default_printing.lem missing_pervasives.lem show.lem endianness.lem multimap.lem error.lem filesystem.lem
# Some of the utility code is directly in ML, some in Lem; order matters!
# NOTE: LEM_UTIL_SRC and ALL_UTIL_ML need to be kept in sync manually.
# GAH. doing a topsort manually is a sign of failure.
ALL_UTIL_ML := \
	uint64_wrapper.ml uint32_wrapper.ml \
	show.ml endianness.ml error.ml ml_bindings.ml missing_pervasives.ml multimap.ml \
	default_printing.ml byte_sequence_wrapper.ml byte_sequence_impl.ml \
	filesystem.ml filesystem_wrapper.ml
	# missing_pervasivesAuxiliary.ml multimapAuxiliary.ml 
ALL_UTIL_ML_WO_LEM := $(filter-out $(patsubst %.lem,%.ml,$(LEM_UTIL_SRC)) $(patsubst %.lem,%Auxiliary.ml,$(LEM_UTIL_SRC)),$(ALL_UTIL_ML))

# Nasty cycle:
# show depends on missing_pervasives
# missing_pervasives depends on ml_bindings
# ml_bindings depends on endianness
# endianness depends on show
# -- Show should be split up. For now, just split off the problematic byte stuff into Missing_pervasives.

LEM_ELF_SRC := byte_sequence.lem byte_pattern.lem byte_pattern_extra.lem \
	archive.lem elf_types_native_uint.lem hex_printing.lem \
	string_table.lem auxv.lem \
	elf_header.lem elf_symbol_table.lem elf_program_header_table.lem \
	elf_section_header_table.lem \
	elf_relocation.lem \
	elf_interpreted_segment.lem elf_interpreted_section.lem \
	elf_note.lem elf_file.lem elf_dynamic.lem \
	dwarf_ctypes.lem dwarf.lem ldconfig.lem

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
	abis/mips64/abi_mips64_dynamic.lem \
	abis/mips64/abi_mips64_elf_header.lem \
	abis/mips64/abi_mips64_relocation.lem \
	abis/mips64/abi_mips64_serialisation.lem \
	abis/mips64/abi_mips64_program_header_table.lem \
	abis/mips64/abi_mips64_section_header_table.lem \
	abis/mips64/abi_mips64_symbol_table.lem \
	abis/mips64/abi_mips64.lem \
	abis/x86/abi_x86_relocation.lem \
	abis/power64/abi_power64_relocation.lem \
	abis/riscv/abi_riscv_elf_header.lem \
	abis/riscv/abi_riscv_program_header_table.lem \
	abis/riscv/abi_riscv_relocation.lem \
	abis/riscv/abi_riscv_section_header_table.lem \
	abis/riscv/abi_riscv_serialisation.lem \
	abis/riscv/abi_riscv_symbol_table.lem \
	abis/riscv/abi_riscv.lem \
	abis/cheri_mips64/abi_cheri_mips64_capability.lem \
	abis/cheri_mips64/abi_cheri_mips64_dynamic.lem \
	abis/cheri_mips64/abi_cheri_mips64_elf_header.lem \
	abis/cheri_mips64/abi_cheri_mips64_relocation.lem \
	abis/cheri_mips64/abi_cheri_mips64.lem \
	gnu_extensions/gnu_ext_types_native_uint.lem \
	gnu_extensions/gnu_ext_section_header_table.lem \
	gnu_extensions/gnu_ext_dynamic.lem \
	gnu_extensions/gnu_ext_symbol_versioning.lem \
	gnu_extensions/gnu_ext_program_header_table.lem \
	gnu_extensions/gnu_ext_section_to_segment_mapping.lem \
	gnu_extensions/gnu_ext_note.lem \
	abis/abis.lem \
	adaptors/sail_interface.lem \
	adaptors/harness_interface.lem

LEM_LINK_SRC := elf_memory_image.lem elf_memory_image_of_elf64_file.lem command_line.lem input_list.lem linkable_list.lem linker_script.lem link.lem load.lem elf64_file_of_elf_memory_image.lem test_image.lem

# LEM_MODEL_ML includes all OCaml except for the main programs
LEM_MODEL_ML := $(patsubst %.lem,%.ml,$(LEM_UTIL_SRC) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC))

LEM_MODEL_TP_THY := $(LEM_UTIL_SRC) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC) byte_sequence_generic.lem test_image.lem import_everything.lem

# WARNING: if you add packages that are not supported by js_of_ocaml the
# rmem/ppcmem2 web-interface will not build.
OCAMLFIND_PACKAGES := -package num -package lem

INCLUDEFLAGS := -I adaptors -I abis -I abis/amd64 -I abis/power64 \
  -I abis/aarch64 -I abis/x86 -I abis/mips64 -I abis/riscv \
  -I abis/cheri_mips64 -I gnu_extensions

OCAMLFLAGS := -g $(INCLUDEFLAGS)

# Want the following order:
# OCaml library
# Lem library objs
# OCaml helpers from this repo
# Lem utility code
# Lem ELF code
# Lem ABI code
# Lem linking code

ldgram.y.hacked: ldgram.y
	cat "$<" | \
	tr '\n' '\f' | \
	sed "s/\([^']\){[^}]*}/\1/g" | \
	tr '\f' '\n' | \
	grep '\([:|;]\|[A-Za-z0-9_]\{2,\}\)' | \
	tail -n+35 > "$@" || rm -f "$@"

byte_sequence_impl.ml: lem_ocaml_sentinel $(OCAML_BYTE_SEQUENCE_IMPL)

ALL_LEM_SRC := $(LEM_UTIL_SRC) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC) $(OCAML_BYTE_SEQUENCE_IMPL) main_link.lem main_elf.lem scratch.lem copy_elf.lem main_load.lem
$(patsubst %.lem,%.ml,$(ALL_LEM_SRC)): lem_ocaml_sentinel
lem_ocaml_sentinel: $(ALL_LEM_SRC)
	cp $(OCAML_BYTE_SEQUENCE_IMPL) byte_sequence_impl.lem
	$(LEM) -ocaml -only_changed_output $+ byte_sequence_impl.lem
	touch $@

.PHONY: isa-extraction
isa-extraction:
	cp byte_sequence_generic.lem byte_sequence_impl.lem
	$(LEM) -isa -only_changed_output -add_full_isa_lib_path \
	$(LEM_MODEL_TP_THY) byte_sequence_impl.lem
	ls -1 *.thy | grep -v ^Error.thy | xargs -I{} mv {} ../auto_generated/isabelle/
	mv */*.thy ../auto_generated/isabelle/
	mv */*/*.thy ../auto_generated/isabelle/
	cd ../auto_generated/isabelle && ./massage_isabelle_imports.sh

.PHONY: hol-extraction
hol-extraction:
	cp byte_sequence_generic.lem byte_sequence_impl.lem
	$(LEM) -hol -only_changed_output \
	$(LEM_MODEL_TP_THY) byte_sequence_impl.lem
	ls -1 *.sml | grep -v ^errorScript.sml | xargs -I{} mv {} ../auto_generated/hol-kananaskis-10/
	mv */*Script.sml ../auto_generated/hol-kananaskis-10/
	mv */*/*Script.sml ../auto_generated/hol-kananaskis-10/

.PHONY: coq-extraction
coq-extraction:
	cp byte_sequence_generic.lem byte_sequence_impl.lem
	$(LEM) -coq -only_changed_output -add_full_isa_lib_path \
	$(LEM_MODEL_TP_THY) byte_sequence_impl.lem
	mv *.v ../auto_generated/coq/
	mv */*.v ../auto_generated/coq/
	mv */*/*.v ../auto_generated/coq/

lem-clean:
	rm -f lem_ocaml_sentinel
	rm -f $(LEM_MODEL_ML)
	rm -f main_elf.ml main_link.ml copy_elf.ml main_load.ml
	rm -f $(patsubst %.lem,%.ml,$(LEM_UTIL_SRC)) $(patsubst %.lem,%Auxiliary.ml,$(LEM_UTIL_SRC))
	rm -f scratch.ml
	rm -f byte_sequence_impl.lem byte_sequence_impl.ml byte_sequence_generic.ml byte_sequence_ocaml.ml
