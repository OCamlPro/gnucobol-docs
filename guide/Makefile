.PHONY: force-update \
	pdf pdf-a4 pdf-letter \
	html \
	clean pdf-clean html-clean info-clean maintainer-clean

SOURCES_COMMON = Macros.texi fdl.texi

# FIXME: include all sources, the macro-generated includes are currently missing

SOURCES = gnucobpg.texi \
	1.texi 2.texi 3.texi 4.texi 5.texi 6.texi \
	7.texi 8.texi 9.texi 10.texi 11.texi 12.texi \
	A.texi B.texi C.texi D.texi E.texi F.texi \
	cbintr.tex cbmnem.tex cbrese.tex cbsyst.tex \
	$(SOURCES_COMMON)

SOURCES_SP = gnucobsp.texi \
	LISTING-COBDUMP.texi LISTING-colors.texi LISTING-DAY-FROM-DATE.texi \
	LISTING-GCic.texi LISTING-STREAMIOcb.texi LISTING-STREAMIO.texi \
	$(SOURCES_COMMON)

SOURCES_QR = gnucobqr.texi \
	$(SOURCES_COMMON)

CLEANFILES = *.aux  *.cp *.fn *.ky *.log *.pg *.toc *.tp *.vr *.vrs *.t2d *.t2p

all: pdf-letter html

force-update:
	touch gnucobpg.texi gnucobqr.texi gnucobsp.texi


pdf: pdf-a4 pdf-letter

pdf-a4: PDFs/gnucobsp-a4.pdf PDFs/gnucobqr-a4.pdf PDFs/gnucobpg-a4.pdf

pdf-letter: PDFs/gnucobsp-letter.pdf PDFs/gnucobqr-letter.pdf PDFs/gnucobpg-letter.pdf

PDFs/gnucobpg-a4.pdf: $(SOURCES)
PDFs/gnucobqr-a4.pdf: $(SOURCES_QR)
PDFs/gnucobsp-a4.pdf: $(SOURCES_SP)
PDFs/gnucobpg-letter.pdf: $(SOURCES)
PDFs/gnucobqr-letter.pdf: $(SOURCES_QR)
PDFs/gnucobsp-letter.pdf: $(SOURCES_SP)
info/gnucobpg.info: $(SOURCES)
info/gnucobqr.info: $(SOURCES_QR)
info/gnucobsp.info: $(SOURCES_SP)

PDFOPTIONS = -q

PDFs/%-letter.pdf : %.texi
	@mkdir -p $(dir $@)
	texi2pdf $(PDFOPTIONS) -o $@ -c $<

PDFs/%-a4.pdf : %.texi
	@mkdir -p $(dir $@)
	texi2pdf $(PDFOPTIONS) --command=@afourpaper -o $@ -c $<

info/%.info : %.texi
	@mkdir -p $(dir $@)
	makeinfo -v -o $@ $(WARNING) --no-split $(INFO_OPT) $<

CSS = css/gnucobpg.css

WARNING = --no-warn

EXTRA_HEAD=<script type="text/javascript" src="js/tree.js"></script>

HTML_OPT = --css-ref=$(CSS) --no-headers \
	--set-customization-variable 'EXTRA_HEAD=$(EXTRA_HEAD)'
INFO_OPT = 

html: HTML/gnucobsp.html HTML/gnucobqr.html HTML/gnucobpg.html \
		HTML/gnucobpg/index.html 

info: info/gnucobsp.info info/gnucobqr.info info/gnucobpg.info

# FIXME index.html overlaps with INDEX.html created by the INDEX note
HTML/gnucobpg/index.html: $(SOURCES)
	@mkdir -p $(dir $@)
	makeinfo -v -o $(dir $@) $(WARNING) \
		--html            $(HTML_OPT) gnucobpg.texi

HTML/gnucobpg.html: $(SOURCES)
	@mkdir -p $(dir $@)
	makeinfo -v -o $@ $(WARNING) \
		--html --no-split $(HTML_OPT) gnucobpg.texi

HTML/gnucobsp.html: $(SOURCES_SP)
	@mkdir -p $(dir $@)
	makeinfo -v -o $@ $(WARNING) \
		--html --no-split $(HTML_OPT) gnucobsp.texi

HTML/gnucobqr.html: $(SOURCES_QR)
	@mkdir -p $(dir $@)
	makeinfo -v -o $@ $(WARNING) \
		--html --no-split $(HTML_OPT) gnucobqr.texi

info/gnucobpg.info: gnucobpg.texi $(SOURCES)
info/gnucobqr.info: gnucobqr.texi $(SOURCES_QR)
info/gnucobsp.info: gnucobsp.texi $(SOURCES_SP)

INFO = $(addsuffix .info,$(addprefix info/gnucob,pg sp qr))
info: $(INFO)
$(INFO):
	@mkdir -p INFO
	makeinfo -o $@ $(notdir $(basename $@)).texi

maintainer-clean: clean pdf-clean html-clean info-clean

clean:
	@test -z "$(CLEANFILES)" || rm -rvf $(CLEANFILES)

pdf-clean:
	@rm -rvf  PDFs/gnucobqr-a4.pdf PDFs/gnucobsp-a4.pdf PDFs/gnucobpg-a4.pdf \
		PDFs/gnucobpg-letter.pdf PDFs/gnucobqr-letter.pdf PDFs/gnucobsp-letter.pdf

html-clean:
	@rm -rvf HTML/gnucobqr.html HTML/gnucobsp.html HTML/gnucobpg.html HTML/gnucobpg

info-clean:
	@rm -rvf info/gnucobqr.info info/gnucobsp.info info/gnucobpg.info


publish: HTML/gnucobpg.html $(CSS)
	test "$(WWW)"
	scp HTML/gnucobpg.html $(WWW)
	scp css/gnucobpg.css   $(WWW)/css/
	scp js/tree.js         $(WWW)/js/

publish-css: HTML/gnucobpg.html $(CSS)
	test "$(WWW)"
	scp css/gnucobpg.css    $(WWW)/css/
	scp js/tree.js          $(WWW)/js/

tags: TAGS
TAGS:
	etags *.texi
