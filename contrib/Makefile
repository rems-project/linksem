dummy: all

all: ocaml-uint/_build/lib/uint.cma

ocaml-uint/_build/lib/uint.cma: ocaml-uint-master.tar.gz
	mkdir -p ocaml-uint
	tar -zxf ocaml-uint-master.tar.gz -C ocaml-uint --strip-components=1
	make -C ocaml-uint configure > /dev/null
	make -C ocaml-uint all

clean:
	rm -rf ocaml-uint

.PHONY: dummy all clean
