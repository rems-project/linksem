# Claude: this Makefile is largely written by Claude (19 September 2026).
#
# Builds the `linksem` command-line tool (linksem.ml, using cmdliner) against
# the linksem library as built in-tree by `make -C ../src`, i.e.
# ../src/build_zarith/linksem.cmxa, so that no `opam install linksem` round
# trip is needed after a change to the Lem sources.  The Lem sources in
# ../src are not touched.

LINKSEM_SRC = ../src
BUILD       = $(LINKSEM_SRC)/build_zarith

# the same findlib packages as ../src/no_ocamlbuild.mk uses for main_elf.opt
# (with the zarith flavour of lem), plus cmdliner
PACKAGES = -package cmdliner -package num -package lem -package str -package unix

LINKSEMRELEASE := 0.8
LINKSEMVERSION := $(shell git describe --dirty --always 2>/dev/null || echo $(LINKSEMRELEASE))

BINDIR ?= $(shell opam var bin 2>/dev/null || echo /usr/local/bin)

.PHONY: all clean install uninstall library

all: linksem

linksem: version.ml linksem.ml $(BUILD)/linksem.cmxa
	ocamlfind ocamlopt -g $(PACKAGES) -I $(BUILD) $(BUILD)/linksem.cmxa version.ml linksem.ml -o $@ -linkpkg

# regenerated whenever the version string changes, and only then
version.ml: FORCE
	@echo 'let version = "$(LINKSEMVERSION)"' > version.ml.tmp; \
	 if cmp -s version.ml.tmp version.ml; then rm -f version.ml.tmp; else mv version.ml.tmp version.ml; fi

FORCE:

$(BUILD)/linksem.cmxa: library

library:
	$(MAKE) -C $(LINKSEM_SRC) build_zarith/linksem.cmxa

install: linksem
	install -d $(BINDIR)
	install -m 755 linksem $(BINDIR)/linksem

uninstall:
	rm -f $(BINDIR)/linksem

clean:
	rm -f linksem version.ml version.ml.tmp *.cmi *.cmo *.cmx *.cmt *.o *~
