.PHONY: asset

OUTPUT_NAME = cn-cards
MAIN_NAME = main

LATEX = ./makepdf.sh

all: cards

assets: 
	echo placeholder

cards: $(OUTPUT_NAME).pdf

$(OUTPUT_NAME).pdf:
	$(LATEX) $(MAIN_NAME).tex
	cp $(MAIN_NAME).pdf $(OUTPUT_NAME).pdf


