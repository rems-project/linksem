# Claude: the DWARF parsing and printing harness (see README.md).
#
#   make go              build the linksem library and tool, then fetch, build, classify,
#                        compare and report on the three corpora (results/<timestamp>/)
#   make go CORPORA=elfutils
#   make build           just the library (../../src) and the tool (../../src_ocaml)
#   make clean           remove the fetched sources and built objects (cache/) and the
#                        locally built oracles (tools/); results/ is kept
#   make clean-results   remove results/ too

CORPORA ?= binutils llvm elfutils

.PHONY: go build clean clean-results

go: build
	./run.sh $(CORPORA)

build:
	$(MAKE) -C ../../src
	$(MAKE) -C ../../src_ocaml

clean:
	rm -rf cache tools

clean-results:
	rm -rf results
