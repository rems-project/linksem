OUTPUTS := file1.o file2.o file3.o a.out

default: $(OUTPUTS)

CFLAGS := -ffreestanding -g
LDFLAGS := -static -nostdlib -nostartfiles -Wl,--defsym,_start=main -Wl,-M -Wl,--gc-sections

a.out: file1.o file2.o file3.o
	$(CC) -o "$@" $+ $(LDFLAGS) $(LDLIBS)

clean:
	rm -f $(OUTPUTS)
