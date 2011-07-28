#
#   Makefile
#

# Archivos principales, se puede hacer:
#        make foo.dvi
#        make foo.ps
#        make foo.pdf
#        make foo       (que genera dvi, ps, pdf)
FILES = main

# Dependencias
DEP   = tex/*.tex bibliografia.bib

# Comandos
CP     = cp
RM     = rm -vfr
MV     = mv -vu
LATEX  = latex
BIBTEX = bibtex

# Para que funcione la variante "make pdf"
CURRENT = main


# Extensiones conocidas generedas (para el "make clean")
EXT = *.ptb *.log *.aux *.lof *.lot *.bit *.idx *.glo *.bbl *.ilg *.toc *.out *.ind *.*~ *.ml* *.mt* *.th* *.bmt *.backup *.blg

all: $(FILES)


# Pattern Rules
# =============

# DEP -> DVI
%.dvi: %.tex $(DEP)
	@echo "=============================="
	@echo "    make $@"
	@make dvi CURRENT=$*
	@echo "=============================="

# DVI -> PS
%.ps: %.dvi
	@echo "=============================="
	@echo "    make $@"
	@make ps CURRENT=$*
	@echo "=============================="

# DEP -> PDF
%.pdf: %.tex $(DEP)
	@echo "=============================="
	@echo "    make $@"
	@make pdf CURRENT=$*
	@echo "=============================="

# DEP -> DVI PS PDF
%: %.tex
	@echo "=============================="
	@echo "    make $@"
	@make $@.dvi
	@make $@.ps
	@make $@.pdf
	@echo "=============================="

# END Pattern Rules =============



clean:
	@echo "=============================="
	@echo "    make clean"
	@$(RM) $(EXT)
	@cd tex/ && $(RM) $(EXT)
	@echo "=============================="

clean-all: clean
	@echo "=============================="
	@echo "    make clean-all"
	$(RM) *.dvi
	$(RM) *.ps
	$(RM) *.pdf
	@echo "=============================="

distclean: clean-all

# Crea un ".tar.bz2" que contiene la carpeta actual. Obs. que no se copia a si mismo.
tar:
	@echo "=============================="
	@echo "    make tar"
	@alias NOMBRE="basename `pwd`";                                         \
      tar --exclude="*.bz2" --exclude="*.svn*" -cvjf `NOMBRE`.tar.bz2 ../`NOMBRE` 2>/dev/null; \
      ls -lh `NOMBRE`.tar.*
	@echo "=============================="



# =============
# No usar directamente!! (se pueden usar si se setea CURRENT)
# =============
dvi:
	$(LATEX)  $(CURRENT).tex
	$(BIBTEX) $(CURRENT).aux
	$(LATEX)  $(CURRENT).tex
	@latex_count=5 ; \
	while egrep -s 'Rerun (LaTeX|to get cross-references right)' $(CURRENT).log && [ $$latex_count -gt 0 ] ;\
		do \
		echo "Rerunning latex...." ;\
		$(LATEX) $(CURRENT).tex ;\
		latex_count=`expr $$latex_count - 1` ;\
		done


ps: dvi
	dvips -f $(CURRENT).dvi > $(CURRENT).ps

pdf:
	@make dvi LATEX=pdflatex

# OTRA FORMA para crear .pdf (sin usar pdflatex).
# Pero tengo que cambiar las Pattern Rules
pdf-otra: ps
	ps2pdf $(CURRENT).ps


doble_cara:
	psselect _ -p1- $(CURRENT).ps | psnup -2 -m30 -b-60 >$(CURRENT)_doble_cara.ps
	ps2pdf $(CURRENT)_doble_cara.ps
