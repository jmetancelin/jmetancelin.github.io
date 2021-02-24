outdir:=ftpperso
currentdir:=.

src=$(wildcard *.md)
src_fr=$(wildcard *_fr.md)
src_en=$(filter-out $(src_fr),$(src))
pages=$(patsubst %.md,$(outdir)/%.html,$(src))
pages_fr=$(patsubst %.md,$(outdir)/%.html,$(src_fr))
pages_en=$(patsubst %.md,$(outdir)/%.html,$(src_en))
deps=menu.html menu_fr.html

all: $(outdir) $(pages) JMEtancelin_CV.pdf JMEtancelin_Resume.pdf $(outdir)/JMEtancelin_CV.pdf $(outdir)/JMEtancelin_Resume.pdf $(outdir)/styles.css
#$(outdir)/images  $(outdir)/photo_jm_s.JPG
all_fr: $(outdir) $(pages_fr)
all_en: $(outdir) $(pages_en)

$(outdir):
	mkdir -p $@

%_fr_left.html: menu_fr.html
	@sed 's/FILEFR/$(subst _fr_left,_fr,$@)/;s/FILEEN/$(subst _fr_left,,$@)/'  $< > $@
%_left.html: menu.html
	@sed 's/FILEFR/$(subst _left,_fr,$@)/;s/FILEEN/$(subst _left,,$@)/'  $< > $@

$(outdir)/%.html: %.md %_left.html $(deps)
	sed 's/\[@[a-zA-Z0-9]*\]//g' $< | pandoc -s -o $@ --css='styles.css' --metadata title="JM Etancelin" -B $(word 2,$^) -A end.html
	@sed -i.orig 's/a href="http/a target="_blank" href="http/g' $@
	@rm -f $@.orig *_left.html



clean:
	rm -f $(pages) JMEtancelin_CV.pdf JMEtancelin_Resume.pdf JMEtancelin_CV.tex JMEtancelin_Resume.tex *.bbl *blx.bib index.html index_fr.html

JMEtancelin_CV.tex: cv_fr.md cv_biblatex_end.tex cv_header_fr.tex cv_begin.tex
	pandoc -H cv_header_fr.tex -B cv_begin.tex -A cv_biblatex_end.tex --biblatex -s $< -V classoption:fr -V classoption:13pt -V documentclass:cv -V indent:ok -V linkcolor:black -V urlcolor:black -o $@
	@sed -i.orig 's/\\usepackage{biblatex}//' $@
	@sed -i.orig 's/\\printbibliography$$//' $@
	@sed -i.orig 's/\([a-zA-Z0-9]\) :/\1:/g' $@
	@sed -i.orig 's/\\date{}//' $@
	@sed -i.orig 's/[}][\]autocite[{]/,/g' $@
	rm $@.orig

JMEtancelin_Resume.tex: cv.md cv_biblatex_end.tex cv_header.tex cv_begin.tex
	pandoc -H cv_header.tex -B cv_begin.tex -A cv_biblatex_end.tex --biblatex -s $< -V classoption:13pt -V documentclass:cv -V indent:ok -V linkcolor:black -V urlcolor:black  -V classoption:leftalignopt=2cm  -o $@
	@sed -i.orig 's/\\usepackage{biblatex}//' $@
	@sed -i.orig 's/\\printbibliography$$//' $@
	@sed -i.orig 's/\([a-zA-Z0-9]\) :/\1:/g' $@
	@sed -i.orig 's/\\date{}//' $@
	@sed -i.orig 's/[}][\]autocite[{]/,/g' $@
	rm $@.orig

JMEtancelin_CV.pdf: JMEtancelin_CV.tex cv.cls MyBib.bib
	latexmk -silent -pdf $<
	latexmk -c -e '$$clean_ext = "tdo brf synctex.gz run.xml orig"' $<
	rm -f $(outdir)/*blx.bib

JMEtancelin_Resume.pdf: JMEtancelin_Resume.tex cv.cls MyBib.bib
	latexmk -silent -pdf $<
	latexmk -c -e '$$clean_ext = "tdo brf synctex.gz run.xml orig"' $<
	rm -f $(outdir)/*blx.bib


ifneq ($(outdir), $(currentdir))
$(outdir)/%.pdf:  %.pdf $(outdir)
	cp $< $@

# $(outdir)/images: $(outdir)
# 	cp -r ./images $(outdir)/.

$(outdir)/styles.css: $(outdir)
	cp ./styles.css $(outdir)/.
endif
