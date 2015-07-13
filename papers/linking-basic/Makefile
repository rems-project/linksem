LATEX ?= pdflatex
PAPER ?= a4

# if $(QUICK) is non-empty, we skip the latex-bibtex-latex-latex cycle
QUICK ?= 

BASENAME ?= $(shell basename $(shell pwd) | sed -r 's/-[0-9]+(\..*)?$$//' )
$(warning BASENAME is $(BASENAME))

SPELLING_LANG ?= en_GB-ise-w_accents

.PHONY: default
default: wc spellcheck $(BASENAME).ps.gz $(BASENAME).pdf $(BASENAME)-printable.pdf

# scrape some useful stuff out of the tex file
DOCUMENT_CLASS_LINE := $(shell cat $(BASENAME).tex |  egrep '^[^%]*(\\\\usepackage|\\documentclass|\\documentstyle)' )
#$(warning DOCUMENT_CLASS_LINE is $(DOCUMENT_CLASS_LINE))
DOCUMENT_CLASS ?= $(shell echo '$(DOCUMENT_CLASS_LINE)' | sed 's/.*{\(.*\)}.*/\1/' | grep -v article | head -n1 )
#$(warning DOCUMENT_CLASS is $(DOCUMENT_CLASS))

# two-column styles don't need a separate printable version, but
# single-column styles usually do. We assume by default that it's
# a single-column style; list all the two-column styles here.
ifneq ($(DOCUMENT_CLASS),sig-alternate)
ifneq ($(DOCUMENT_CLASS),sigplanconf)
ifneq ($(DOCUMENT_CLASS),latex8)
	CROP_FOR_PRINTABLE ?= yes
endif
endif
endif
CROP_FOR_PRINTABLE ?= no
#$(warning CROP_FOR_PRINTABLE is $(CROP_FOR_PRINTABLE))

# collect included .tex files and depended-upon .bib files
basename_included_files := $(shell cat $(BASENAME).tex | sed 's^%.*^^' | grep '\\in\(clude\|put\)[^{]*{' | sed 's^\\in\(clude\|put\)[^{]*{^\n\f^g' | grep '^[[:space:]]' | tr -d '\f' | sed 's^}.*^^' | sed 's/^[^\.]*$$/&.tex/' )
#$(warning $(BASENAME).tex includes files: $(basename_included_files))

bibliography_deps := $(shell expr='.*\\bibliography{\([^}]*\)}.*'; cat $(BASENAME).tex | grep "$$expr" | sed "s/$$expr/\1.bib/" )
#$(warning bibliography dependencies: $(bibliography_deps))

# filter out dependencies that don't live in the current directory
basename_included_files := $(filter $(wildcard *),$(basename_included_files))
bibliography_deps := $(filter $(wildcard *),$(bibliography_deps))

ifneq ($(LATEX),pdflatex)
	EXT := dvi
.PHONY: view
view: $(BASENAME).dvi
	xdvi -geometry 654x802 -s 9 $(BASENAME).dvi 
else
	EXT := pdf
# disable built-in tex->dvi rule
%.dvi: %.tex
	$(warning Creating DVI when LATEX=pdflatex! Plain TeX probably isn't what you want.)
	false
.PHONY: view
view: $(BASENAME).pdf
	mimeopen $(BASENAME).pdf 
endif

$(BASENAME)-sources.zip: $(BASENAME).tex $(bibliography_deps) $(basename_included_files)
	zip -u "$@" $+

$(BASENAME).$(EXT): $(BASENAME).tex $(bibliography_deps) $(basename_included_files)
	$(LATEX) "$<"
	if [ -z "$(QUICK)" ] && [ -n "$(bibliography_deps)" ]; then \
		bibtex $(BASENAME); \
		$(LATEX) "$<"; \
	fi
ifeq ($(QUICK),) # for full effect, 
	tty=`tty`; $(LATEX) "$<" | tee $${tty} | (grep 'ndefined' > "$(BASENAME).undefined" || true )
endif
$(BASENAME)-author.$(EXT): $(BASENAME).tex $(bibliography_deps) $(basename_included_files)
	$(LATEX) -jobname "$(BASENAME)-author" '\def\acmauthorversion{}\input{$<}'; \
	bibtex $(BASENAME)-author; \
	$(LATEX) -jobname "$(BASENAME)-author" '\def\acmauthorversion{}\input{$<}'; \
	$(LATEX) -jobname "$(BASENAME)-author" '\def\acmauthorversion{}\input{$<}'

%.pdf: %.dvi
	dvipdfm "$<"
%.ps: %.dvi
	#dvips -P cmz -G0 -t $(PAPER) -o $@ $<
	dvips -Pwww -G0 -t $(PAPER) -o "$@" "$<"
	#dvips -Ppdf -G0 -t $(PAPER) -o "$@" "$<"

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
		
.PHONY: chapters
chapters: $(BASENAME).ps
	rm -f $(BASENAME)-p[0-9]*.p* # HACK
	page_num_file=$$(mktemp); \
	cat $(BASENAME).toc | grep '{chapter}' | tr -s '{}' '\t' | cut -f6 > "$$page_num_file"; \
	while read page_num; do \
		begin_page_num=$$(( $${end_page_num} + 1 )); \
		end_page_num=$$(( $${page_num} - 1 )); \
		/bin/echo -e "$${begin_page_num}\t$${end_page_num}"; \
	done < $${page_num_file} | \
	sed '$$ s#\([0-9]\+\)\t\([0-9]\+\)#/bin/echo -e "&\n"$$(( \2 + 1 ))#e' | while read begin end; do \
		psselect -p"$${begin}-$${end}" $(BASENAME).ps $(BASENAME)-p$${begin}.ps; \
	done; rm -f "$$page_num_file"
	for chap in $(BASENAME)-p*.ps; do ps2pdf "$$chap" $$( echo "$$chap" | sed 's/ps$$/pdf/' ); gzip "$$chap"; done

# how to find non-ASCII characters
# hexdump -b thesis.tex | egrep ' [23]'
# how to map them back to source positions:
# hexdump -C thesis.tex | grep '003a2.. '

PDFCROP_OPTS := $(shell which gsfake-convertbb && echo --gscmd=gsfake-convertbb)

%-2x1.pdf: %.pdf
	pdfnup --outfile "$@" --nup 2x1 "$<"

%-crop.pdf: %.pdf
	pdfcrop $(PDFCROP_OPTS) "$<"

# disabled to avoid circular dependency-induced screwiness
#%.pdf: %.ps
#	ps2pdf "$<" "$@"

%-crop15.pdf: %.pdf
	pdfcrop $(PDFCROP_OPTS) --margins 15 "$<" "$@"

ifeq ($(CROP_FOR_PRINTABLE),yes)
%-printable.pdf: %-crop15-2x1.pdf
	cp "$<" "$@"
else
%-printable.pdf: %.pdf
	cp "$<" "$@"
endif

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

# Zotero exports crap, including too much @misc. Some approximate rules:
# If   it's "@misc" but has an abstract *or* an address, *and* a publisher, it's a tech report
# elif it's "@misc" but has a publisher, it's probably a "magazine"-type web page; make it @article
# TODO: elif it's "@misc" and has a URL but no 'type' or 'address', treat it as a manuscript
%.bib: exported.bib
	cp "$@" "$@.bak" || true
	cat exported.bib | tr '\n' '\f' | sed 's/@/\n@/g' | \
sed 's/\(@inproceedings.*\)journal\( *=.*\)/\1booktitle\2/' | \
sed 's/@inbook\(.*\)journal\( *=.*\)/@incollection\1booktitle\2/' | \
sed 's/@misc\(.*abstract *=.*\)\(.*publisher *=.*\)/@techreport\1\2/' | \
sed 's/@misc\(.*publisher *=.*\)\(.*abstract *=.*\)/@techreport\1\2/' | \
sed 's/@misc\(.*address *=.*\)\(.*publisher *=.*\)/@techreport\1\2/' | \
sed 's/@misc\(.*publisher *=.*\)\(.*address *=.*\)/@techreport\1/' | \
sed 's/\(@techreport.*\)publisher\( *=.*\)/\1institution\2/' | \
sed 's/@misc\(.*\)publisher\( *=.*\)/@article\1journal\2/' | \
tr '\f' '\n' > $@

%.citations: %.tex
	regexp='\\citep\?\*\?\(\[[^\]]*\]\)\?{\([^\}]*\)\}'; \
	cat "$<" | \
	sed "s/$${regexp}/&\n/g" | \
	grep "$$regexp" | \
	sed 's/\([^\\]\|^\)%.*//' | \
	sed "s/.*$${regexp}/\2/" | \
	sed '/^[[:blank:]]*$$/ d' | sort | uniq > "$@"

.PHONY: print-multiply-defined
print-multiply-defined: $(BASENAME).tex
	grep '\\label' *.tex | \
	grep -v '\(^\|[^\\]\)%.*\\label' | \
	sed 's/:.*\\label/\t\\label/' | \
	sed 's/}.*/}/' | sort -k2 | uniq -f1 -d 
	

