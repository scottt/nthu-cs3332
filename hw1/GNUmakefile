PROGRAMS := $(basename $(wildcard *.m))
PROGRAMS := $(filter-out textbook_quantile,$(PROGRAMS))

PROGRAM_RESULTS := $(addsuffix .txt, $(PROGRAMS))
# FIGURES: not all Matlab / Octave code produce plots
FIGURES := 9 12 13 14
PDF_FILES := $(addsuffix .pdf, $(FIGURES))
DERIVED_FILES := $(PROGRAM_RESULTS) $(addsuffix .png, $(PROGRAMS)) $(addsuffix .svg, $(PROGRAMS)) $(PDF_FILES)

.PHONY: all clean
all: $(PROGRAM_RESULTS) $(PDF_FILES) hw1.pdf

# Running octave has the side effect of creating .svg and .png files
%.txt: %.m
	octave -q $< > $@
	unix2dos $@

14.txt: 14.m
	# special post processing for typesetting
	octave -q $< | sed '/^$$/d' > $@
	unix2dos $@

12.txt: 12.m
	# special post processing for typesetting
	octave -q $< | sed '/^$$/d' > $@
	unix2dos $@

%.pdf: %.svg
	inkscape --export-pdf=$@ $(<)

hw1.pdf: hw1.tex $(addsuffix .m, $(PROGRAMS)) $(addsuffix .txt, $(PROGRAMS)) $(PDF_FILES)
	xelatex $< -o $@

clean:
	rm -f $(DERIVED_FILES) *.aux
