# this works for PS: 
# make clean
# make lem-model
# make -C libraries
# make ocaml

LEMDIR ?= ../../lem
LEM ?= $(LEMDIR)/lem

dummy: all

lem-model:
	$(LEM) -ocaml -only_changed_output \
	missing_pervasives.lem show.lem \
	endianness.lem default_printing.lem uint32.lem uint64.lem byte_sequence.lem byte_sequence_extra.lem \
	elf_types.lem elf_interpreted_segment.lem elf_interpreted_section.lem elf_symbol_table.lem \
	elf_header.lem elf_program_header_table.lem \
	abis/amd64/abi_amd64_elf_header.lem \
	abis/power64/abi_power64_elf_header.lem \
	abis/abis.lem \
	elf_section_header_table.lem \
	string_table.lem elf_executable_file.lem \
	elf_relocation.lem \
	adaptors/sail_interface.lem \
	abis/amd64/abi_amd64_serialisation.lem abis/amd64/abi_amd64_relocation.lem \
	main_elf.lem

isa-extraction:
	$(LEM) -isa -only_changed_output \
	missing_pervasives.lem show.lem \
	endianness.lem byte_sequence.lem \
	elf_types.lem elf_interpreted_segment.lem elf_interpreted_section.lem elf_symbol_table.lem \
	elf_header.lem elf_program_header_table.lem \
	elf_section_header_table.lem \
	string_table.lem elf_executable_file.lem

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

ocaml:
	ocamlfind ocamlc \
-I libraries/batteries/_build/src \
-I $(LEMDIR)/ocaml-lib/_build/ \
-I adaptors \
-I abis -I abis/amd64 -I abis/power64 \
-g \
unix.cma nums.cma batteries.cma nat_num.cmo \
lem.cmo lem_function.cmo lem_list.cmo lem_num.cmo xstring.cmo \
missing_pervasives.ml \
show.ml endianness.ml error.ml uint32.ml uint64.ml uint16_wrapper.ml uint32_wrapper.ml \
uint64_wrapper.ml byte_sequence_wrapper.ml byte_sequence.ml byte_sequence_extra.ml ml_bindings.ml default_printing.ml \
elf_types.ml elf_header.ml \
abis/amd64/abi_amd64_elf_header.ml \
abis/power64/abi_power64_elf_header.ml \
abis/abis.ml \
elf_program_header_table.ml string_table.ml \
elf_section_header_table.ml elf_interpreted_segment.ml elf_interpreted_section.ml elf_symbol_table.ml \
elf_executable_file.ml \
elf_relocation.ml \
adaptors/sail_interface.ml \
abis/amd64/abi_amd64_serialisation.ml abis/amd64/abi_amd64_relocation.ml \
main_elf.ml \
-package batteries

#  -lib batteries\
#  -lib bitstring\
#  -lib uint\

#-package bitstring -package uint -package batteries

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



ocaml_with_ocamlbuild:
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

oldall: lem-model camlp4 ocaml

all: ocaml

execute:
	./a.out

go: all execute

go-debug: lem-model stacktrace execute
