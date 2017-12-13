THIS_MAKEFILE = $(lastword $(MAKEFILE_LIST))
DIRNAME := $(realpath .)
BASENAME := $(shell basename "$(DIRNAME)" | sed 's/-.*//' )
# $(warning BASENAME is $(BASENAME))

OUTPUTS := $(BASENAME) $(BASENAME).map $(BASENAME).cmd $(BASENAME).repeat-cmd $(BASENAME).collect-cmd $(BASENAME).env

OBJECTS ?= $(BASENAME).o

default: $(OUTPUTS) repeat

LDFLAGS ?= -static

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

ifeq ($(filter -static,$(LDFLAGS)),)
LIB_SUFFIXES := so a
else
LIB_SUFFIXES := a
endif

$(BASENAME).repeat-cmd: $(BASENAME).collect-cmd $(BASENAME).env
	unquote () { \
		eval echo "$$1"; \
	}; \
	lds_to_cmdline () { \
		sed 's/AS_NEEDED *(\([^)]*\))/--as-needed \1 --no-as-needed/g' | \
		sed 's/OUTPUT_FORMAT(\([^)]*\))//g' | \
		sed 's/GROUP *(\([^)]*\))/--start-group \1 --end-group/g' | \
		tr '\n' ' ' | sed 's^/\*.*\*/^^'; \
	}; \
	for arg in $$( cat "$<" ); do \
		unquoted_arg="$$( unquote "$$arg" )"; \
		case "$$unquoted_arg" in \
			(*/collect*) \
				echo "ld" ;; \
			(/*) cp "$$unquoted_arg" ./ && echo $$(basename "$$unquoted_arg" );; \
			(-l*) ( . ./$(BASENAME).env && \
					tmpfile=$$(mktemp) && \
					echo $$LIBRARY_PATH | tr ':' '\n' > $$tmpfile && \
					found="" && for suffix in $(LIB_SUFFIXES); do while read line ; do \
					search_fname_stem="$$line"/lib$$( echo "$$unquoted_arg" | sed 's/^-l//'); \
					if [ -e "$$search_fname_stem".$$suffix ]; then \
						echo -n "Found: " 1>&2; \
						cp "$$search_fname_stem".$$suffix ./ && \
						found="$$search_fname_stem".$$suffix && \
						(file "$$found" 2>&1 | grep ASCII >/dev/null && (for word in $$(cat "$$found" | lds_to_cmdline); do \
							case "$$word" in \
								(/*) cp "$$word" ./ && basename "$$word";; \
								(*) echo "$$word" ;; \
							esac; \
						    done) || \
						    echo $$(basename "$$search_fname_stem".$$suffix) ) | tee /dev/stderr; break 2; \
					else \
						echo "Did not find $$search_fname_stem.$$suffix; trying next in path" 1>&2; \
					fi; \
				done < "$$tmpfile"; \
				if [ -z "$$found" ]; then echo "Did not find $$unquoted_arg with suffix $$suffix" 1>&2; fi; done; \
				rm -f "$$tmpfile"; \
				) \
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
	rm -f $(OUTPUTS) *.o *.a *.so *.so.*
