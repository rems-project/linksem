.PHONY: default
default: build-all

.PHONY: build-all
build-all: build-contrib build

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
