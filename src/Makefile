dummy: all

lem-model:
	../../lem/lem -ocaml -only_changed_output missing_pervasives.lem show.lem endianness.lem default_printing.lem bitstring.lem elf_types.lem elf_interpreted_segment.lem elf_header.lem elf_file1.lem elf_program_header_table.lem elf_executable_file2.lem elf_section_header_table.lem elf_executable_file3.lem string_table.lem elf_executable_file4.lem elf_executable_file5.lem elf_linking_file2.lem elf_linking_file3.lem elf_linking_file4.lem elf_relocation.lem elf_symbol_table.lem sail_interface.lem main.lem

clean:
	rm missing_pervasives.ml show.ml endianness.ml bitstring_local.ml default_printing.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml elf_section_header_table.ml elf_executable_file3.ml string_table.ml elf_executable_file4.ml elf_interpreted_segment.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_linking_file4.ml elf_relocation.ml elf_symbol_table.ml sail_interface.ml main.ml

camlp4:
	camlp4 '-I' '/home/dpm/.opam/4.01.0/lib/ocaml/camlp4' '-I' '/home/dpm/.opam/4.01.0/lib/bitstring' '-parser' 'o' '-parser' 'op' '-printer' 'p' 'unix.cma' 'bitstring.cma' 'bitstring_persistent.cma' 'pa_bitstring.cmo' pa_o.cmo pr_o.cmo -oml_bindings.ml 'ml_bindings_camlp4_sugared.ml'

ocaml:
	ocamlfind ocamlc -package bitstring -package batteries -package uint -I ../../lem/ocaml-lib/_build/ unix.cma bitstring.cma nums.cma nat_num.cmo lem.cmo lem_function.cmo lem_list.cmo -linkpkg missing_pervasives.ml show.ml endianness.ml error.ml ml_bindings.ml default_printing.ml bitstring_local.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml string_table.ml elf_section_header_table.ml elf_executable_file3.ml elf_executable_file4.ml elf_interpreted_segment.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_linking_file4.ml elf_relocation.ml elf_symbol_table.ml sail_interface.ml main.ml

stacktrace:
	export OCAMLRUNPARAM=b
	ocamlfind ocamlc -package bitstring -package batteries -I ../../lem/ocaml-lib/_build/ unix.cma bitstring.cma nums.cma nat_num.cmo lem.cmo lem_function.cmo lem_list.cmo -linkpkg -g missing_pervasives.ml show.ml endianness.ml error.ml ml_bindings.ml default_printing.ml bitstring_local.ml elf_types.ml elf_header.ml elf_file1.ml elf_program_header_table.ml elf_executable_file2.ml string_table.ml elf_section_header_table.ml elf_executable_file3.ml elf_executable_file4.ml elf_interpreted_segment.ml elf_executable_file5.ml elf_linking_file2.ml elf_linking_file3.ml elf_linking_file4.ml elf_relocation.ml elf_symbol_table.ml sail_interface.ml main.ml

all: lem-model camlp4 ocaml

execute:
	./a.out

go: all execute

go-debug: lem-model stacktrace execute
	
