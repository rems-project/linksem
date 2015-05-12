#include "fcntl.h"
#include "stdio.h"
#include "stdlib.h"

#include "libelf.h"

#include "caml/alloc.h"
#include "caml/mlvalues.h"
#include "caml/memory.h"
#include "caml/callback.h"

/* Opens the binary file pointed to by filename "fname", parses the ELF file
 * placing contents in "elf_file" and places file descriptor of open file in
 * "fd".
 * Returns -1 if any step fails, 0 on success.
 */
int
open_and_parse_elf_binary(char* fname, Elf* elf_file, int* fd) {
	printf("Attempting to open \"%s\"\n", fname);
	*fd = open(fname, O_RDONLY, 0);
	
	if(fd < 0) {
		printf("Error reading file \"%s\"!\n", fname);
		return -1;
	}
	
	printf("Success...\n");
	
	printf("Attempting to parse \"%s\"\n", fname);
	elf_file = elf_begin(*fd, ELF_C_READ, NULL);
	
	if(elf_file == NULL) {
		printf("Error parsing ELF binary!\n");
		return -1;
	}
	
	printf("Success...\n");
	
	return 0;
}

int
main(int argc, char** argv) {
	if(argc < 2) {
		printf("USAGE: harness <fname>\n");
		return -1;
	}
	
	char* fname = argv[1];
	Elf* elf_file = NULL;
	int fd = 0;
	
	/* caml_startup(argv); */
	
	if(elf_version(EV_CURRENT) == EV_NONE) {
		printf("Error initialising libelf: EV_CURRENT == EV_NONE!\n");
		return -1;
	}
	
	if(open_and_parse_elf_binary(fname, elf_file, &fd) < 0) {
		return -1;
	}
}
