# Claude: cross-check DWARF expression evaluation between linksem, gdb and lldb
# (see README.md).  The work is done by scripts/pipeline.py; this Makefile is the interface.
#
#   make tools                    what is installed for each architecture, what to install
#   make build                    the OCaml programs (needs the linksem library installed:
#                                 make -C ../../src install)
#   make check-native-arch        regression: the basic, minimal and random-seed1 sets on
#                                 the host architecture, compared with expected/
#   make check-all-archs          the same for both architectures (the other one under qemu)
#   make validate SEED=7 N=2000 MAXOPS=12 [BATCH=2000 JOBS=4 MINIMIZE=no]
#                                 an extensive random run, with minimal examples of every
#                                 disagreement, in output/$(ARCH)-validate-seed7/; sets larger
#                                 than BATCH are split into several programs, run JOBS at a time
#   make one EXPR='DW_OP_lit1; DW_OP_lit2; DW_OP_minus'
#                                 a single expression, all three evaluators, and its
#                                 standalone example, in output/$(ARCH)-one/
#   make minimize RUN=output/x86_64-random-seed1
#                                 minimal standalone examples of a run's disagreements
#   make diff A=output/x86_64-basic B=expected/x86_64-basic
#                                 expressions whose results or class differ between two runs
#   make accept SET=basic         adopt output/$(ARCH)-$(SET) as the expected results
#   make clean
#
# ARCH defaults to the host's architecture (x86_64 or aarch64).

ARCH   ?= $(shell uname -m | sed 's/amd64/x86_64/;s/arm64/aarch64/')
OTHER   = $(if $(filter x86_64,$(ARCH)),aarch64,x86_64)
SETS   ?= basic minimal frames random-seed1 random-frames-seed1
SEED   ?= 1
N      ?= 2000
MAXOPS ?= 12
BATCH  ?= 2000
JOBS   ?= 4
MINIMIZE ?= yes
OPAM   ?= opam exec --switch ocaml551 --
P       = scripts/pipeline.py
BIN     = ocaml/_build/default/bin

.PHONY: tools build check-native-arch check-all-archs validate one minimize diff accept clean

tools:
	$(P) tools

build:
	cd ocaml && $(OPAM) dune build 2>&1 | head -40

check-native-arch: build
	$(P) check $(ARCH) $(SETS)

check-all-archs: build
	$(P) check $(ARCH) $(SETS); $(P) check $(OTHER) $(SETS)

validate: build
	mkdir -p output/$(ARCH)-validate-seed$(SEED)
	$(BIN)/dwexpr_gen.exe $(ARCH) $(N) $(SEED) $(MAXOPS) > output/$(ARCH)-validate-seed$(SEED)/exprs.txt
	$(P) run $(ARCH) output/$(ARCH)-validate-seed$(SEED)/exprs.txt output/$(ARCH)-validate-seed$(SEED) $(BATCH) $(JOBS)
	if [ "$(MINIMIZE)" = yes ]; then $(P) minimize output/$(ARCH)-validate-seed$(SEED); fi

one: build
	mkdir -p output/$(ARCH)-one
	echo "one: $(EXPR)" > output/$(ARCH)-one/exprs.txt
	$(P) run $(ARCH) output/$(ARCH)-one/exprs.txt output/$(ARCH)-one
	@cat output/$(ARCH)-one/linksem.txt output/$(ARCH)-one/gdb.txt output/$(ARCH)-one/lldb.txt
	@$(P) minimize output/$(ARCH)-one > /dev/null 2>&1 || true
	@test -d output/$(ARCH)-one/discrepancies && echo "standalone example: output/$(ARCH)-one/discrepancies/one/README.md" || true

minimize:
	$(P) minimize $(RUN)

diff:
	$(P) diff $(A) $(B)

accept:
	$(P) accept $(ARCH) $(SET)

clean:
	rm -rf output ocaml/_build
