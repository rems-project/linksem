USE_OCAMLBUILD ?= false

ifeq "$(USE_OCAMLBUILD)" "false"
	include no_ocamlbuild.mk
else
	include ocamlbuild.mk
endif

.PHONY: clean
clean:
	$(MAKE) -f ocamlbuild.mk clean
	$(MAKE) -f no_ocamlbuild.mk clean
