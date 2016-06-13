# This should work for everyone: 
# make
# (but make sure you've run `make' in the contrib/ directory. Or 
#  run `make' from the top level, like a user should.)

THIS_MAKEFILE := $(realpath $(lastword $(MAKEFILE_LIST)))
REPOROOT := $(dir $(THIS_MAKEFILE))/..

LEMDIR ?= ../lem
LEM ?= $(LEMDIR)/lem
CONTRIB ?= ../contrib
UINT ?= $(CONTRIB)/ocaml-uint/_build/lib

OCAML_LEM_INCLUDES ?= -I $(LEMDIR)/ocaml-lib/ \
-I $(LEMDIR)/ocaml-lib/dependencies/zarith/

$(warning MAKECMDGOALS is $(MAKECMDGOALS))
ifneq ($(MAKECMDGOALS),clean)
ifeq ($(realpath $(UINT)),)
$(error Please run `make' in $(REPOROOT)/contrib or set UINT)
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

#uint16_wrapper.ml uint32_wrapper.ml uint64_wrapper.ml 

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
	elf_note.lem elf_file.lem elf_dynamic.lem
	
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
OCAML_LIB_OBJS := unix.cma str.cma nums.cma zarith.cma nat_num.cmo big_int_impl.cmo nat_big_num.cmo uint.cma
LEM_OCAML_OBJS := lem.cmo lem_basic_classes.cmo lem_function.cmo lem_list.cmo lem_num.cmo lem_sorting.cmo \
    xstring.cmo pset.cmo pmap.cmo lem_maybe.cmo lem_map.cmo lem_set.cmo lem_string_extra.cmo

OCAML_LIB_OBJS_OPT := $(patsubst %.cma,%.cmxa,$(patsubst %.cmo,%.cmx,$(OCAML_LIB_OBJS)))
LEM_OCAML_OBJS_OPT := $(patsubst %.cma,%.cmxa,$(patsubst %.cmo,%.cmx,$(LEM_OCAML_OBJS)))

# Want the following order:
# OCaml library
# Lem library objs
# OCaml helpers from this repo
# Lem utility code
# Lem ELF code
# Lem ABI code
# Lem linking code

default: lem-all-ocaml linksem.cma linksem.cmxa main_elf main_elf.opt main_link main_link.opt

ldgram.y.hacked: ldgram.y
	cat "$<" | \
	tr '\n' '\f' | \
	sed "s/\([^']\){[^}]*}/\1/g" | \
	tr '\f' '\n' | \
	grep '\([:|;]\|[A-Za-z0-9_]\{2,\}\)' | \
	tail -n+35 > "$@" || rm -f "$@"

.PHONY: lem-all-ocaml
lem-all-ocaml: $(filter-out error.lem,$(LEM_UTIL_SRC)) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC) main_link.lem main_elf.lem scratch.lem
	$(LEM) -ocaml -only_changed_output $+

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
	rm -f $(filter-out error.ml,$(LEM_MODEL_ML))
	rm -f main_elf.ml main_link.ml
	rm -f main_elf main_link main_elf.opt main_link.opt
	rm -rf *~
	rm -f *.cmi *.cmo *.cmx *.o
	rm -f abis/*.cmi abis/*.cmo abis/*.cmx abis/*.o
	rm -f abis/*/*.cmi abis/*/*.cmo abis/*/*.cmx abis/*/*.o
	rm -f adaptors/*.cmi adaptors/*.cmo adaptors/*.cmx adaptors/*.o
	rm -f gnu_extensions/*.cmi gnu_extensions/*.cmo gnu_extensions/*.cmx gnu_extensions/*.o
	rm -f $(filter-out error.ml,$(patsubst %.lem,%.ml,$(LEM_UTIL_SRC))) $(patsubst %.lem,%Auxiliary.ml,$(LEM_UTIL_SRC))

ocaml: main_elf

main_elf main_link main_elf.opt main_link.opt scratch linksem.cma linksem.cmxa: OCAMLFLAGS += \
-I $(UINT) \
$(OCAML_LEM_INCLUDES) \
-I adaptors \
-I abis -I abis/amd64 -I abis/power64 -I abis/aarch64 -I abis/x86 -I abis/mips64 -I gnu_extensions \
-g

main_elf main_link main_elf.opt main_link.opt scratch scratch.opt: OCAMLFIND_PACKAGES := #-package batteries -package uint

scratch scratch.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC))

main_elf main_elf.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC))

main_link main_link.opt: OCAML_LEM_SRC += $(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC))

linksem.cma: $(ALL_UTIL_ML) lem-all-ocaml
	ocamlfind ocamlc $(OCAMLFLAGS) -a -o "$@" \
	$(OCAML_LIB_OBJS) \
	$(LEM_OCAML_OBJS) \
	$(ALL_UTIL_ML) \
	$(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC))

linksem.cmxa: $(ALL_UTIL_ML) lem-all-ocaml
	ocamlfind ocamlopt $(OCAMLFLAGS) -a -o "$@" \
	-I $(sort $(dir $(patsubst %.cmx,%.cmi,$(LEM_OCAML_OBJS_OPT)))) \
	$(ALL_UTIL_ML) \
	$(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC))


main_elf main_link scratch: %: %.ml $(ALL_UTIL_ML) lem-all-ocaml
	ocamlfind ocamlc $(OCAMLFLAGS) -o "$@" -g \
	$(OCAML_LIB_OBJS) \
	$(LEM_OCAML_OBJS) \
	$(ALL_UTIL_ML) \
	$(OCAML_LEM_SRC) \
	"$<" $(OCAMLFIND_PACKAGES)

main_elf.opt main_link.opt scratch.opt: %.opt: %.ml $(ALL_UTIL_ML) lem-all-ocaml
	ocamlfind ocamlopt $(OCAMLFLAGS) -o "$@" -g \
	$(OCAML_LIB_OBJS_OPT) \
	$(LEM_OCAML_OBJS_OPT) \
	$(ALL_UTIL_ML) \
	$(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC)) \
	"$<" $(OCAMLFIND_PACKAGES)

ocaml_with_ocamlbuild: lem-all-ocaml
	ocamlbuild -classic-display \
  -X $(CONTRIB) \
  -cflag -g \
  -lflags 'unix.cma str.cma nums.cma' \
  -cflags '-I $(UINT)' \
  -lflags '-I $(UINT) uint.cma' \
  -cflags -dllpath,$(UINT) \
  main_elf.byte 

clean_with_ocamlbuild:
	ocamlbuild -classic-display -clean

stacktrace:
	export OCAMLRUNPARAM=b; \
	ocamlfind ocamlc -I $(LEMDIR)/ocaml-lib/_build/ unix.cma str.cma nums.cma nat_num.cmo lem.cmo lem_function.cmo lem_list.cmo -linkpkg -g missing_pervasives.ml show.ml endianness.ml error.ml ml_bindings.ml default_printing.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml string_table.ml elf_section_header_table.ml elf_interpreted_segment.ml elf_symbol_table.ml elf_executable_file3.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml sail_interface.ml main_elf.ml

oldall: lem-all-ocaml camlp4 ocaml

all: ocaml

execute:
	./a.out

go: all execute

go-debug: lem-all-ocaml stacktrace execute
