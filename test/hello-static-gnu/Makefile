OUTPUTS := hello hello.map hello.cmd hello.repeat-cmd

default: $(OUTPUTS)

LDFLAGS := -static

# Avoid LTO/plugin cruft in our link commands, for now.
LDFLAGS += -fno-lto

# Cancel built-in rule
%: %.c
%: %.o

# We scrape the actual link command, 
# then produce local copies of all the inputs
# and rewrite the command to use these copies.
hello.cmd hello.map hello: build-hello

.PHONY: build-hello
build-hello: hello.o
	$(CC) -save-temps -\#\#\# -o hello hello.o -Wl,-Map=hello.map $(LDFLAGS) $(LDLIBS) 2>&1 | tee hello.cmd

hello.env: hello.cmd
	cat "$<" | grep '^[A-Z_]*=' | sed 's/^\([A-Z_]*=\)\(.*\)/\1"\2"/' > "$@"

hello.collect-cmd: hello.cmd
	cat "$<" | grep /collect > "$@"

hello.repeat-cmd: hello.collect-cmd hello.env
	for arg in $$( cat "$<" ); do \
		case "$$arg" in \
			(*/collect*) \
				echo "ld" ;; \
			(/*) cp "$$arg" ./ && echo $$(basename "$$arg" );; \
			(-l*) ( . ./hello.env && echo $$LIBRARY_PATH | tr ':' '\n' | while read line; do \
					search_fname="$$line"/lib$$( echo "$$arg" | sed 's/^-l//' ).a; \
					if [ -e "$$search_fname" ]; then \
						cp "$$search_fname" ./ && echo $$(basename "$$search_fname") && break; \
					else \
						echo "Did not find $$search_fname; trying next in path" 1>&2; \
					fi; \
				done ) \
				;; \
			(-L*) ;; \
			(-f*) ;; \
			(-*) echo "$$arg" ;; \
			(*) echo "$$arg" ;; \
		esac; \
	done | tr '\n' ' ' > "$@"; echo >> "$@"

.PHONY: repeat
repeat: hello.o hello.repeat-cmd
	eval $$( cat hello.repeat-cmd )
clean:
	rm -f $(OUTPUTS)
