dummy: all

lem-model:
	../../../lem/lem -ocaml -only_changed_output missing_pervasives.lem show.lem endianness.lem elf_types.lem elf_header.lem elf_file1.lem elf_program_header_table.lem elf_executable_file2.lem elf_section_header_table.lem elf_executable_file3.lem main.lem

clean:
	rm missing_pervasives.ml show.ml endianness.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml elf_section_header_table.ml elf_executable_file3.ml main.ml

ocaml:
	ocamlfind ocamlc -package bitstring.syntax -package batteries -syntax camlp4o -I ../../../lem/ocaml-lib/_build/ unix.cma bitstring.cma nums.cma nat_num.cmo lem.cmo lem_function.cmo lem_list.cmo -linkpkg missing_pervasives.ml show.ml endianness.ml error.ml ml_bindings.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml elf_section_header_table.ml elf_executable_file3.ml main.ml

all: lem-model ocaml

execute:
	./a.out

build-and-run: all execute
	
