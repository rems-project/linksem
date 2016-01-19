.PHONY: default all extract clean make-uint

default: all

extract:
	mkdir -p ocaml-uint
	tar -zxvf ocaml-uint-master.tar.gz -C ocaml-uint --strip-components=1

clean:
	rm -rf ocaml-uint

make-uint:
	$(MAKE) -C ocaml-uint configure
	$(MAKE) -C ocaml-uint all

all: extract make-uint
