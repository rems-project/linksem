THIS_MAKEFILE = $(lastword $(MAKEFILE_LIST))
DIRNAME := $(realpath .)
BASENAME := $(shell basename "$(DIRNAME)" | sed 's/-.*//' )
# $(warning BASENAME is $(BASENAME))

OUTPUTS := $(BASENAME) $(BASENAME).map $(BASENAME).cmd $(BASENAME).repeat-cmd $(BASENAME).collect-cmd $(BASENAME).env

OBJECTS ?= $(BASENAME).o

default: $(OUTPUTS) repeat

LDFLAGS := -static

# Avoid LTO/plugin cruft in our link commands, for now.
LDFLAGS += -fno-lto

# Avoid relaxation, for now. ARGH: this seems not to prevent all instruction rewriting.
LDFLAGS += -Wl,--no-relax

# Cancel built-in rules -- why?
%: %.c
%: %.cc
%: %.o

.SECONDARY: $(OBJECTS)

# We scrape the actual link command, 
# then produce local copies of all the inputs
# and rewrite the command to use these copies.
$(BASENAME).cmd $(BASENAME).map $(BASENAME): build-$(BASENAME)

# Which compiler we need to use to drive the linker
# depends on the source binary.
ifeq ($(shell basename "$(DIRNAME)" | sed 's/.*c++.*/c++/'),c++)
COMPILER := $(CXX)
else
COMPILER := $(CC)
endif
$(warning COMPILER is $(COMPILER))

.PHONY: build-$(BASENAME)
build-$(BASENAME): $(OBJECTS)
	$(COMPILER) -save-temps         -o "$(BASENAME)" $+ -Wl,-Map=$(BASENAME).map $(LDFLAGS) $(LDLIBS)
	$(COMPILER) -save-temps -\#\#\# -o "$(BASENAME)" $+ -Wl,-Map=$(BASENAME).map $(LDFLAGS) $(LDLIBS) 2>&1 | tee $(BASENAME).cmd

$(BASENAME).env: $(BASENAME).cmd
	cat "$<" | grep '^[A-Z_]*=' | sed 's/^\([A-Z_]*=\)\(.*\)/\1"\2"/' > "$@"

$(BASENAME).collect-cmd: $(BASENAME).cmd
	cat "$<" | grep /collect > "$@"

$(BASENAME).repeat-cmd: $(BASENAME).collect-cmd $(BASENAME).env
	unquote () { \
		eval echo "$$1"; \
	}; \
	for arg in $$( cat "$<" ); do \
		unquoted_arg="$$( unquote "$$arg" )"; \
		case "$$unquoted_arg" in \
			(*/collect*) \
				echo "ld" ;; \
			(/*) cp "$$unquoted_arg" ./ && echo $$(basename "$$unquoted_arg" );; \
			(-l*) ( . ./$(BASENAME).env && echo $$LIBRARY_PATH | tr ':' '\n' | while read line; do \
					search_fname="$$line"/lib$$( echo "$$unquoted_arg" | sed 's/^-l//' ).a; \
					if [ -e "$$search_fname" ]; then \
						cp "$$search_fname" ./ && echo $$(basename "$$search_fname") && break; \
					else \
						echo "Did not find $$search_fname; trying next in path" 1>&2; \
					fi; \
				done ) \
				;; \
			(-L*) ;; \
			(-f*) ;; \
			(-*) echo "$$unquoted_arg" ;; \
			(*) echo "$$unquoted_arg" ;; \
		esac; \
	done | tr '\n' ' ' > "$@"; echo >> "$@"

.PHONY: repeat
repeat: $(OBJECTS) $(BASENAME).repeat-cmd
	eval $$( cat $(BASENAME).repeat-cmd )

.PHONY: repeat
$(BASENAME).with-relocs: $(OBJECTS) $(BASENAME).repeat-cmd
	eval $$( cat $(BASENAME).repeat-cmd | sed 's/^ld/ld -q/' | sed 's#-o $(BASENAME)#-o $@#' )
clean:
	rm -f $(OUTPUTS) *.o *.a
