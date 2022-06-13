%.pdf:
	latexmk -pdf $*.tex

%.docx:
	pandoc -o $*.docx $*.tex

PDFTARGETS=sample.pdf

WORDTARGETS=sample.docx

pdf: $(PDFTARGETS) junk

docx: $(WORDTARGETS)


clean:
	ls sample.* | grep -vE "^sample\.(bib|tex)$$" | xargs -r rm -rf

junk:
	rm -rf *.aux *.log

# if you wish to compile word targets as well, put "docx" into the "all" target below.

all: pdf junk


watch:
	latexmk -pdf -pvc
	
.PHONY: %.docx %.pdf pdf docx all clean junk watch
