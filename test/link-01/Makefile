OUTPUTS := file1.o file2.o a.out

default: $(OUTPUTS)

# To avoid the complication of eh_frame, 
# i.e. an ABI-specific section masquerading as a "normal" progbits section,
# we disable that for the moment.
CFLAGS := -ffreestanding -g -fno-omit-frame-pointer -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-dwarf2-cfi-asm
LDFLAGS := -static -nostdlib -nostartfiles -Wl,--defsym,_start=main -Wl,-Map,a.out.map -Wl,--no-ld-generated-unwind-info

a.out: file1.o file2.o
	$(CC) -o "$@" $+ $(LDFLAGS) $(LDLIBS)

clean:
	rm -f $(OUTPUTS)
