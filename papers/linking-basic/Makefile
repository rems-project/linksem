LATEX ?= pdflatex

BASENAME ?= $(shell basename $(shell pwd) | sed -r 's/-[0-9]+(\..*)?$$//' )
$(warning BASENAME is $(BASENAME))

SPELLING_LANG ?= en_GB-ise-w_accents

.PHONY: default
default: $(BASENAME).ps.gz $(BASENAME).pdf

# collect included .tex files and depended-upon .bib files
basename_included_files := $(shell cat $(BASENAME).tex | sed 's^%.*^^' | grep '\\in\(clude\|put\)[^{]*{' | sed 's^\\in\(clude\|put\)[^{]*{^\n\f^g' | grep '^[[:space:]]' | tr -d '\f' | sed 's^}.*^^' | sed 's/^[^\.]*$$/&.tex/' )
#$(warning $(BASENAME).tex includes files: $(basename_included_files))
bibliography_deps := $(shell expr='.*\\bibliography{\([^}]*\)}.*'; cat $(BASENAME).tex | grep "$$expr" | sed "s/$$expr/\1.bib/" )
#$(warning bibliography dependencies: $(bibliography_deps))

# filter out dependencies that don't live in the current directory
basename_included_files := $(filter $(wildcard *),$(basename_included_files))
bibliography_deps := $(filter $(wildcard *),$(bibliography_deps))

$(BASENAME)-sources.zip: $(BASENAME).tex $(bibliography_deps) $(basename_included_files)
	zip -u "$@" $+

$(BASENAME).pdf: $(BASENAME).tex $(bibliography_deps) $(basename_included_files)
	$(LATEX) "$<"
	bibtex $(BASENAME)
	$(LATEX) "$<"
	tty=`tty`; $(LATEX) "$<" | tee $${tty} | (grep 'ndefined' > "$(BASENAME).undefined" || true )

.PHONY: spellcheck
spellcheck: $(BASENAME).tex $(filter %.tex,$(basename_included_files))
	@echo "Unrecognised words in $+: "
	@cat $+ | aspell -d "$(SPELLING_LANG)" -t --dont-suggest --dont-tex-check-comments -a | grep -v '^[[:space:]]*\*\?$$' | tr -s '\n'

.PHONY: wc
wc: $(BASENAME).tex $(filter $(wildcard *.tex),$(basename_included_files))
	@echo -n "Word count of *.tex (excluding Appendices): "
	cat $(BASENAME).tex | sed -r '/\\appendix[[:space:]]*(\{|$$)/ q' | \
		awk 'BEGIN { begun=0; }; /\\pagestyle\{fancy\}/ { begun=1; }; { if (begun) print $$0; }' | \
		detex | \
		awk -f assert --source 'BEGIN { inlisting=0; }; /lstlisting.*\[/ { assert(inlisting == 0, "Error in lstlistings environments"); inlisting=1; }; /lstlisting[^\[]*$$/ { assert(inlisting == 1, "Error in lstlistings environments"); inlisting=0; }; { if (!inlisting) print $$0; }' | \
		sed 's/---/ /g' | tr '\200-\377' '_' | wc -w
	if [ -n "$$PDFS_FOR_WORD_COUNT" ]; then for PDF in $$PDFS_FOR_WORD_COUNT; do pdftotext "$$PDF" /dev/stdout | wc -w ; done; fi

%.ps.gz: %.ps
	gzip -cf $< > $@

%.epsi: %-crop.ps
	tmpfile=$$(mktemp) && \
	ps2epsi "$<" "$${tmpfile}" && \
	eps2eps "$${tmpfile}" "$@" && \
	rm -f "$${tmpfile}"

%.eps: %.epsi
	cp "$<" "$@"

# disabled to avoid conflict with ps->pdf->crop route
#%-crop.pdf: %.eps
#	epstopdf --outfile "$@" "$<"

%-crop.ps: %-crop.pdf
	pdf2ps "$<" "$@"

#.PHONY: %-pages.ps
%-pages.ps: %.ps
	gs -sDEVICE=psrgb -sOutputFile="$*-page%d.ps" -dNOPAUSE -dBATCH "$<"

# Bundle in one rule to prevent circular dependency droppage
%-page*.epsi: %.ps
	gs -sDEVICE=psrgb -sOutputFile="$*-page%d.ps" -dNOPAUSE -dBATCH "$<"
	for target in $@ ; do \
		ps2pdf "$$target"; \
		pdfcrop --gscmd=gsfake-convertbb $$( echo "$$target" | sed 's/\.epsi$$/\.pdf/' ); \
		pdf2ps $$( echo "$$target" | sed 's/\.epsi$$/-crop.pdf/' )
		tmpfile=$$(mktemp); \
		ps2epsi $$( echo "$$target" | sed 's/\.epsi$$/-crop.ps/' )" "$${tmpfile}"; \
		eps2eps "$${tmpfile}" "$$target"; \
	done

# TODO: can replace with rule like the one for page%.epsi?
%-page1.ps %-page2.ps: %.ps
	gs -sDEVICE=psrgb -sOutputFile="$*-page%d.ps" -dNOPAUSE -dBATCH "$<"

%.pdf: %.ps
	ps2pdf -dEmbedAllFonts=true "$<"

%.ps: %.pdf
	pdf2ps $< "$@"

clean:
	rm -f *.bbl *.blg *.dvi *.aux *.log $(BASENAME)*.ps.gz $(BASENAME)*.pdf $(BASENAME).undefined
