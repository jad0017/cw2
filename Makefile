.SECONDARYEXPANSION:

all: main

.PHONY: main
main: texfile = main.tex
main: pdf/main.pdf

.PHONY: force
force:
	@true

pdf/%.pdf: pdffile = $(texfile:.tex=.pdf)
pdf/%.pdf: force
	@mkdir -p $(dir $@)
	@pdflatex $(texfile)
	@pdflatex $(texfile)
	@mv $(pdffile) $@
	@rm -f *.aux *.log *.toc

.PHONY: clean
clean:
	@rm -f *.aux *.log *.toc

.PHONY: realclean
realclean: clean
	@rm -rf pdf/

# vim:ts=4:sw=4:autoindent
