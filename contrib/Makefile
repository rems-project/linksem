OCAML_STDINT_VERSION = 0.5.0

dummy:
	@echo "did you mean 'make install'?"

ocaml-stdint/_build/lib/stdint.cma: ocaml-stdint-$(OCAML_STDINT_VERSION).tar.gz
	mkdir -p ocaml-stdint
	tar -zxf $< -C ocaml-stdint --strip-components=1
	make -C ocaml-stdint configure > /dev/null
	make -C ocaml-stdint all

install: ocaml-stdint/_build/lib/stdint.cma
	make -C ocaml-stdint install

clean:
	rm -rf ocaml-uint
	rm -rf ocaml-stdint

.PHONY: dummy all clean
