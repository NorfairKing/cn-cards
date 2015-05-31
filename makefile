.PHONY: asset

OUTPUT_NAME = cn-cards
MAIN_NAME = main
RULES_DFS = rules

LATEX = ./makepdf.sh

all: cards rules

cards: $(RULES_DFS).eps $(OUTPUT_NAME).pdf
rules: $(RULES_DFS).eps $(RULES_DFS).pdf

$(OUTPUT_NAME).pdf:
	$(LATEX) $(MAIN_NAME).tex
	cp $(MAIN_NAME).pdf $(OUTPUT_NAME).pdf

$(RULES_DFS).eps: $(RULES_DFS).dot
	dot -Teps $< -o $@

$(RULES_DFS).pdf: $(RULES_DFS).eps
	epstopdf $<

love:
	@echo not war

clean:
	rm -f *.pdf *.eps
