FILE    = `basename *.Rmd .Rmd`
FILE    = $(wildcard *.Rmd)

RMDFILE = $(FILE)
MDFILE  = $(FILE).md
PDFFILE = $(FILE).pdf
HTMLFILE = $(FILE).html
TEXFILE = $(FILE).tex
CACHEDIR = $(FILE)_cache
FILESDIR = $(FILE)_files


all : default

default : 
	Rscript \
	   -e ".libPaths('/home/toto/R_library')"  \
	   -e "library(rmarkdown)"  \
	   -e "library(rmdformats)"  \
	   -e "library(knitr)"  \
	   -e "library(captioner)"  \
	   -e "library(rlang)"  \
	   -e "library(vctrs)"  \
	   -e "library(plotly)"  \
	   -e "library(htmltools)"  \
	   -e "library(devtools)"  \
	   -e "render('$(RMDFILE)')"

html : 
	Rscript \
	   -e ".libPaths('/home/toto/R_library')"  \
	   -e "library(rmarkdown)"  \
	   -e "library(rmdformats)"  \
	   -e "library(captioner)"  \
	   -e "library(xtable)"  \
	   -e "render('$(RMDFILE)', 'readthedown')"

pdf : 
	Rscript \
	   -e ".libPaths('/home/toto/R_library')"  \
	   -e "library(rmarkdown)" \
	   -e "library(captioner)" \
           -e "render('$(RMDFILE)', 'pdf_document')"

clean :
	if [ -d $(CACHEDIR) ]; then  rm -rf $(CACHEDIR); fi
	if [ -d $(FILESDIR) ]; then  rm -rf $(FILESDIR); fi
	if [ -e $(MDFILE) ]; then rm $(MDFILE); fi
	if [ -e $(PDFFILE) ]; then rm $(PDFFILE); fi
	if [ -e $(HTMLFILE) ]; then rm $(HTMLFILE); fi
	if [ -e $(TEXFILE) ]; then rm $(TEXFILE); fi		


