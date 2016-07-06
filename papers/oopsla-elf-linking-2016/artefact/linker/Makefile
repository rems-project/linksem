.PHONY: default
default: build-all

.PHONY: build-all
build-all: build-lem build-contrib build

.PHONY: build-lem
build-lem:
	$(MAKE) -C lem
	$(MAKE) -C lem ocaml-libs

.PHONY: build-contrib
build-contrib:
	$(MAKE) -C contrib

.PHONY: build
build:
	$(MAKE) -C src

.PHONY: clean
clean:
	$(MAKE) -C contrib clean
	$(MAKE) -C src clean
