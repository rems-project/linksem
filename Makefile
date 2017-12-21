.PHONY: default
default: build

.PHONY: build
build:
	$(MAKE) -C src

.PHONY: install
install:
	$(MAKE) -C src install

.PHONY: uninstall
uninstall:
	$(MAKE) -C src uninstall

.PHONY: clean
clean:
	$(MAKE) -C src clean
