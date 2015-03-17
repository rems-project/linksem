# this works for PS: 
# make clean
# make lem-all-ocaml
# make -C libraries
# make ocaml

LEMDIR ?= ../../lem
LEM ?= $(LEMDIR)/lem

LEM_UTIL_SRC := default_printing.lem missing_pervasives.lem show.lem endianness.lem error.lem
# Some of the utility code is directly in ML, some in Lem; order matters!
# GAH. doing a topsort manually is a sign of failure.
ALL_UTIL_ML :=   uint16_wrapper.ml uint32_wrapper.ml uint64_wrapper.ml \
show.ml endianness.ml error.ml ml_bindings.ml missing_pervasives.ml \
 default_printing.ml \
 byte_sequence_wrapper.ml

# Nasty cycle:
# show depends on missing_pervasives
# missing_pervasives depends on ml_bindings
# ml_bindings depends on endianness
# endianness depends on show
# -- Show should be split up. For now, just split off the problematic byte stuff into Missing_pervasives.

LEM_ELF_SRC := byte_sequence.lem archive.lem \
	elf_types.lem elf_interpreted_segment.lem elf_interpreted_section.lem string_table.lem elf_symbol_table.lem \
	elf_header.lem elf_program_header_table.lem \
	elf_section_header_table.lem \
	elf_file.lem 
	
LEM_ABI_SRC := abstract_abi.lem abis/amd64/abi_amd64_elf_header.lem \
	abis/power64/abi_power64_elf_header.lem \
	abis/abis.lem \
	elf_relocation.lem abstract_linker_script.lem \
	adaptors/sail_interface.lem \
	abis/amd64/abi_amd64_serialisation.lem abis/amd64/abi_amd64_relocation.lem

LEM_LINK_SRC := command_line.lem input_list.lem

LEM_MODEL_ML := $(patsubst %.lem,%.ml,$(LEM_UTIL_SRC) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC))

OCAML_LIB_OBJS := unix.cma nums.cma batteries.cma nat_num.cmo 
LEM_OCAML_OBJS := lem.cmo lem_function.cmo lem_list.cmo lem_num.cmo lem_sorting.cmo xstring.cmo

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

default: lem-all-ocaml main_elf main_elf.opt main_link main_link.opt

ldgram.y.hacked: ldgram.y
	cat "$<" | \
	tr '\n' '\f' | \
	sed "s/\([^']\){[^}]*}/\1/g" | \
	tr '\f' '\n' | \
	grep '\([:|;]\|[A-Za-z0-9_]\{2,\}\)' | \
	tail -n+35 > "$@" || rm -f "$@"

lem-all-ocaml: $(filter-out error.lem,$(LEM_UTIL_SRC)) $(LEM_ELF_SRC) $(LEM_ABI_SRC) $(LEM_LINK_SRC) main_link.lem main_elf.lem
	$(LEM) -ocaml -only_changed_output $+

isa-extraction:
	$(LEM) -isa -only_changed_output \
	$(LEM_ELF_SRC)
	mv *.thy ../auto_generated/isabelle/

clean:
	rm -rf missing_pervasives.ml show.ml abis.ml endianness.ml uint32.ml uint64.ml byte_sequence.ml byte_sequence_extra.ml default_printing.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml elf_section_header_table.ml elf_executable_file3.ml string_table.ml elf_interpreted_segment.ml elf_symbol_table.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml elf_symbol_table.ml sail_interface.ml elf_executable_file.ml elf_interpreted_section.ml main_elf.ml
	$(MAKE) -C src_elf_libraries clean
	rm -rf elf_section_header.ml elf_symbol_table.ml
	rm -rf abis/abis.ml abis/amd64/*.ml abis/power64/*.ml
	rm -rf *~
	rm -rf *.cmi *.cmo
	rm -rf abis/*.cmi abis/*.cmo
	rm -rf abis/*/*.cmi abis/*/*.cmo

ocaml: main_elf

main_elf main_link main_elf.opt main_link.opt: OCAMLFLAGS += -I src_elf_libraries/batteries/_build/src \
-I $(LEMDIR)/ocaml-lib/_build/ \
-I adaptors \
-I abis -I abis/amd64 -I abis/power64 \
-g

main_elf main_link main_elf.opt main_link.opt: OCAMLFIND_PACKAGES := -package batteries

main_elf main_link: %: %.ml $(ALL_UTIL_ML) lem-all-ocaml
	ocamlfind ocamlc $(OCAMLFLAGS) -o "$@" \
	$(OCAML_LIB_OBJS) \
	$(LEM_OCAML_OBJS) \
	$(ALL_UTIL_ML) \
	$(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC)) \
	"$<" $(OCAMLFIND_PACKAGES)

main_elf.opt main_link.opt: %.opt: %.ml $(ALL_UTIL_ML) lem-all-ocaml
	ocamlfind ocamlopt $(OCAMLFLAGS) -o "$@" \
	$(OCAML_LIB_OBJS_OPT) \
	$(LEM_OCAML_OBJS_OPT) \
	$(ALL_UTIL_ML) \
	$(patsubst %.lem,%.ml,$(LEM_ELF_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_ABI_SRC)) \
	$(patsubst %.lem,%.ml,$(LEM_LINK_SRC)) \
	"$<" $(OCAMLFIND_PACKAGES)

make_elf_libraries:
	-chmod u+w src_elf_libraries/batteries
	-chmod u+w src_elf_libraries/bitstring
	-chmod u+w src_elf_libraries/uint
	rm -rf src_elf_libraries/batteries
	rm -rf src_elf_libraries/bitstring
	rm -rf src_elf_libraries/uint
	$(MAKE) -C src_elf_libraries all

clean_elf_libraries:
	$(MAKE) -C src_elf_libraries clean

ocaml_with_ocamlbuild: lem-all-ocaml
	ocamlbuild -classic-display \
  -X src_elf_libraries \
  -cflag -g \
  -lflags 'unix.cma nums.cma' \
  -cflags '-I ../src_elf_libraries/bitstring' \
  -lflags '-I ../src_elf_libraries/bitstring bitstring.cma' \
  -cflags '-I ../src_elf_libraries/uint/_build/lib' \
  -lflags '-I ../src_elf_libraries/uint/_build/lib uint.cma' \
  -cflags '-I ../src_elf_libraries/batteries/_build/src'   \
  -lflags '-I ../src_elf_libraries/batteries/_build/src batteries.cma'   \
  -cflags -dllpath,../src_elf_libraries/uint/_build/lib \
  -cflags -dllpath,../src_elf_libraries/bitstring \
  main_elf.byte 

clean_with_ocamlbuild:
	ocamlbuild -classic-display -clean

stacktrace:
	export OCAMLRUNPARAM=b; \
	ocamlfind ocamlc -package bitstring -package batteries -I $(LEMDIR)/ocaml-lib/_build/ unix.cma bitstring.cma nums.cma nat_num.cmo lem.cmo lem_function.cmo lem_list.cmo -linkpkg -g missing_pervasives.ml show.ml endianness.ml error.ml ml_bindings.ml default_printing.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml string_table.ml elf_section_header_table.ml elf_interpreted_segment.ml elf_symbol_table.ml elf_executable_file3.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml sail_interface.ml main_elf.ml

oldall: lem-all-ocaml camlp4 ocaml

all: ocaml

execute:
	./a.out

go: all execute

go-debug: lem-all-ocaml stacktrace execute
