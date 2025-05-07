# WARNING: Targets ending with `!` will modify the source code
#   Targets ending with `!!` will forcibly modify the source code without checking
#   Targets starting with `_` should not be called directly

PACKAGE := hustvisual
EXT := sty
DEF := def
SOURCE := $(PACKAGE).dtx
export TEXINPUTS := ./visuals:$(TEXINPUTS)

TAG ?= $(shell git describe --tags --abbrev=0)

TEX := xetex -interaction=nonstopmode -shell-escape
LATEX := xelatex -interaction=nonstopmode -shell-escape
LATEXMK := latexmk -xelatex -quiet -outdir=. -auxdir=.
L3BUILD := l3build
ZIP := zip
GIT := git

ifeq ($(OS), Windows_NT)
	RM := cmd //C del //Q //F
	RRM := cmd //C rmdir //Q //S
else
	RM := rm -f
	RRM := rm -r -f
endif

%.$(EXT) %.$(DEF): %.ins
	$(TEX) $<

%.pdf: %.dtx %.$(EXT) %.$(DEF)
	$(LATEXMK) $<


.DEFAULT_GOAL = build

.PHONY: all build install full-install uninstall doc tag! ctan! release! clean cleanall

all: build doc full-install

build: $(PACKAGE).$(EXT)

install:
	$(L3BUILD) install

full-install:
	$(L3BUILD) install --full

uninstall:
	$(L3BUILD) uninstall

doc: $(PACKAGE).pdf


tag!: # `make tag! TAG=1.0.0` [WARN: WILL MODIFY SOURCE CODE]
	@if ! $(GIT) diff --quiet $(SOURCE); then \
		echo "Error: Unstaged changes in $(SOURCE)"; \
		exit 1; \
	fi

	@if ! $(GIT) diff --staged --quiet $(SOURCE); then \
		echo "Error: Uncommitted changes in $(SOURCE)"; \
		exit 1; \
	fi

	$(L3BUILD) tag $(TAG)

tag!!: # FORCE TAGGING [WARN: WILL MODIFY SOURCE CODE]
	$(L3BUILD) tag $(TAG)

_ctan: # CTAN currently requires that the .tds.zip file be excluded
	$(L3BUILD) ctan
	$(ZIP) -d $(PACKAGE)-ctan.zip $(PACKAGE).tds.zip
ctan!: tag! build _ctan
	$(GIT) restore $(SOURCE)
ctan!!: tag!! build _ctan # FORCE TAGGING, WON'T restore source

release!: tag! build ctan! # generate GitHub release
release!!: tag!! build ctan!! # FORCE TAGGING


clean:
	$(LATEXMK) -c $(PACKAGE).dtx
	$(RM) *.aux *.bbx *.bcf *.fdb_latexmk *.fls *.glo \
		*.synctex.gz *.hd *.idx *.ind *.log *.out \
		 *.toc *.xdv *.run.xml
	$(RM) *.sty *.def *.zip
	$(RM) $(PACKAGE).pdf

cleanall: clean uninstall
	$(RRM) build/
