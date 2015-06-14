.PHONY: asset

OUTPUT_NAME = cn-cards
MAIN_NAME = main
RULES_DFS = rules

all: rules cards

cards: $(RULES_DFS).eps $(OUTPUT_NAME).pdf
rules: $(RULES_DFS).eps $(RULES_DFS).pdf

$(OUTPUT_NAME).pdf: individuals main.tex
	latexmk -pdf -pdflatex="pdflatex -shell-escape -halt-on-error -enable-pipes -enable-write18" -use-make $(MAIN_NAME).tex
	cp $(MAIN_NAME).pdf $(OUTPUT_NAME).pdf

$(RULES_DFS).eps: $(RULES_DFS).dot
	dot -Teps $< -o $@

$(RULES_DFS).pdf: $(RULES_DFS).eps
	epstopdf $<

love:
	@echo not war

clean:
	rm -f *.pdf *.eps

individuals: *.tex
