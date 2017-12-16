OCAML_STDINT_VERSION = 0.3.0

dummy: all

all: ocaml-stdint/_build/lib/stdint.cma

ocaml-stdint/_build/lib/stdint.cma: ocaml-stdint-$(OCAML_STDINT_VERSION).tar.gz
	mkdir -p ocaml-stdint
	tar -zxf $< -C ocaml-stdint --strip-components=1
	make -C ocaml-stdint configure > /dev/null
	make -C ocaml-stdint all

clean:
	rm -rf ocaml-uint
	rm -rf ocaml-stdint

.PHONY: dummy all clean
