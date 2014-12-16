# this works for PS: 
# make clean
# make lem-model
# make -C libraries
# make ocaml
# srk says: so why doesn't a single target implement this recipe? (That's what make is for!)

LEMDIR ?= ../../lem
LEM ?= $(LEMDIR)/lem

dummy: all

lem-model:
	$(LEM) -ocaml -only_changed_output missing_pervasives.lem show.lem endianness.lem default_printing.lem bitstring.lem elf_types.lem elf_interpreted_segment.lem elf_symbol_table.lem elf_header.lem elf_file1.lem elf_program_header_table.lem elf_executable_file2.lem elf_section_header_table.lem elf_executable_file3.lem string_table.lem elf_linking_file2.lem elf_linking_file3.lem elf_relocation.lem sail_interface.lem main_elf.lem

clean:
	rm -rf missing_pervasives.ml show.ml endianness.ml bitstring_local.ml default_printing.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml elf_section_header_table.ml elf_executable_file3.ml string_table.ml elf_interpreted_segment.ml elf_symbol_table.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml elf_symbol_table.ml sail_interface.ml main_elf.ml
	make -C src_elf_libraries clean
	rm -rf elf_section_header.ml elf_symbol_table.ml
	rm -rf *~
	rm -rf *.cmi *.cmo

.PHONY: ocaml
ocaml: make_elf_libraries
	ocamlc \
-I src_elf_libraries/batteries/_build/src \
-I src_elf_libraries/bitstring \
-I src_elf_libraries/uint/_build/lib  \
-I $(LEMDIR)/ocaml-lib/_build/ \
unix.cma nums.cma  batteries.cma uint.cma bitstring.cma nat_num.cmo \
lem.cmo lem_function.cmo lem_list.cmo \
missing_pervasives.ml \
show.ml endianness.ml error.ml ml_bindings.ml default_printing.ml \
bitstring_local.ml elf_types.ml elf_header.ml elf_file1.ml \
elf_program_header_table.ml elf_executable_file2.ml \
string_table.ml elf_section_header_table.ml elf_interpreted_segment.ml \
elf_symbol_table.ml elf_executable_file3.ml elf_linking_file2.ml elf_linking_file3.ml \
elf_relocation.ml sail_interface.ml main_elf.ml \
-dllpath src_elf_libraries/uint/_build/lib -dllpath src_elf_libraries/bitstring 

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
	ocamlfind ocamlc -package bitstring -package batteries \
	-I $(LEMDIR)/ocaml-lib/_build/ unix.cma bitstring.cma \
	nums.cma nat_num.cmo lem.cmo lem_function.cmo lem_list.cmo \
	-linkpkg -g \
	missing_pervasives.ml show.ml endianness.ml error.ml ml_bindings.ml \
	default_printing.ml bitstring_local.ml elf_types.ml elf_header.ml \
	elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml \
	string_table.ml elf_section_header_table.ml elf_interpreted_segment.ml \
	elf_symbol_table.ml elf_executable_file3.ml elf_executable_file5.ml \
	elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml sail_interface.ml \
	main_elf.ml

# srk says: get rid?
oldall: lem-model camlp4 ocaml

all: ocaml

# srk says: necessary? also added the missing dependency
execute: all
	./a.out

go: all execute

go-debug: lem-model stacktrace execute
