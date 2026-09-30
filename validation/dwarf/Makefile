# Claude: the DWARF parsing and printing harness (see README.md).
#
#   make go              build the linksem library and tool, then fetch, build, classify,
#                        compare and report on the three corpora (results/<timestamp>/)
#   make go CORPORA=elfutils
#   make build           just the library (../../src) and the tool (../../src_ocaml)
#   make set-expected-results [RUN=results/<timestamp>]
#                        make that run (default: the most recent) the baseline that
#                        `make go` and scripts/quickcheck.py report regressions and fixes
#                        against (results/baseline, a symlink)
#   make clean           remove the fetched sources and built objects (cache/) and the
#                        locally built oracles (tools/); results/ is kept
#   make clean-results   remove results/ too

CORPORA ?= binutils llvm elfutils
RUN     ?= $(shell ls -td results/2*/ 2>/dev/null | head -1)

.PHONY: go build set-expected-results clean clean-results

go: build
	AGAINST=$$([ -e results/baseline ] && echo results/baseline) ./run.sh $(CORPORA)

set-expected-results:
	@test -n "$(RUN)" || { echo "no run under results/; run make go first"; exit 1; }
	rm -rf results/baseline
	ln -s $(notdir $(patsubst %/,%,$(RUN))) results/baseline
	@echo "results/baseline -> $$(readlink results/baseline)"

build:
	$(MAKE) -C ../../src
	$(MAKE) -C ../../src_ocaml

clean:
	rm -rf cache tools

clean-results:
	rm -rf results
