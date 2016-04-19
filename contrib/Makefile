dummy: all

all: batteries/_build/src/batteries.cma ocaml-uint/_build/lib/uint.cma

batteries/_build/src/batteries.cma: batteries-2.2.tar.gz
	mkdir -p batteries
	tar -zxf batteries-2.2.tar.gz -C batteries --strip-components=1
	make -C batteries all > /dev/null

ocaml-uint/_build/lib/uint.cma: ocaml-uint-master.tar.gz
	mkdir -p ocaml-uint
	tar -zxf ocaml-uint-master.tar.gz -C ocaml-uint --strip-components=1
	make -C ocaml-uint configure > /dev/null
	make -C ocaml-uint all

clean:
	rm -rf batteries
	rm -rf ocaml-uint

.PHONY: dummy all clean
