# this works for PS: 
# make clean
# make lem-model
# make -C libraries
# make ocaml

dummy: all

lem-model:
	../../lem/lem -ocaml -only_changed_output missing_pervasives.lem show.lem endianness.lem default_printing.lem byte_sequence.lem uint32.lem elf_types.lem elf_interpreted_segment.lem elf_symbol_table.lem elf_header.lem elf_file1.lem elf_program_header_table.lem elf_executable_file2.lem elf_section_header_table.lem elf_executable_file3.lem string_table.lem elf_linking_file2.lem elf_linking_file3.lem elf_relocation.lem sail_interface.lem main_elf.lem

clean:
	rm -rf missing_pervasives.ml show.ml endianness.ml byte_sequence.ml default_printing.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml elf_section_header_table.ml elf_executable_file3.ml string_table.ml elf_interpreted_segment.ml elf_symbol_table.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml elf_symbol_table.ml sail_interface.ml main_elf.ml
	make -C src_elf_libraries clean
	rm -rf elf_section_header.ml elf_symbol_table.ml
	rm -rf *~
	rm -rf *.cmi *.cmo

ocaml:
	ocamlfind ocamlc \
-I libraries/batteries/_build/src \
-I libraries/uint/_build/lib  \
-I ../../lem/ocaml-lib/_build/ \
unix.cma nums.cma  batteries.cma uint.cma nat_num.cmo \
lem.cmo lem_function.cmo lem_list.cmo \
missing_pervasives.ml \
show.ml endianness.ml error.ml ml_bindings.ml default_printing.ml byte_sequence.ml byte_sequence_wrapper.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml string_table.ml elf_section_header_table.ml elf_interpreted_segment.ml elf_symbol_table.ml elf_executable_file3.ml elf_linking_file2.ml elf_linking_file3.ml elf_relocation.ml sail_interface.ml main_elf.ml \
-dllpath libraries/uint/_build/lib \
-package uint -package batteries





#  -lib batteries\
#  -lib bitstring\
#  -lib uint\

#-package bitstring -package uint -package batteries

make_elf_libraries:
	-chmod u+w src_elf_libraries/batteries
	rm -rf src_elf_libraries/batteries
	$(MAKE) -C src_elf_libraries all

clean_elf_libraries:
	$(MAKE) -C src_elf_libraries clean



ocaml_with_ocamlbuild:
	ocamlbuild -classic-display \
  -X src_elf_libraries \
  -cflag -g \
  -lflags 'unix.cma nums.cma' \
  -cflags '-I ../src_elf_libraries/batteries/_build/src'   \
  -lflags '-I ../src_elf_libraries/batteries/_build/src batteries.cma'   \
  main_elf.byte 

clean_with_ocamlbuild:
	ocamlbuild -classic-display -clean


all: ocaml

execute:
	./a.out

go: all execute


