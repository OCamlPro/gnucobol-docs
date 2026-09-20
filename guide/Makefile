.PHONY: force-update \
	publish publish-qr publish-css
	clean pdf-clean html-clean info-clean maintainer-clean

SOURCES_COMMON = Macros.texi fdl.texi $(wildcard [LNS]*-*.texi)

SOURCES = gnucobpg.texi \
	1.texi 2.texi 2-1A.texi 3.texi 4.texi \
	5.texi 6.texi 7.texi 8.texi 9.texi 10.texi \
	11.texi 12.texi 13.texi \
	A.texi B.texi C.texi \
	cbintr.tex cbmnem.tex cbrese.tex cbsyst.tex updates.texi \
	$(SOURCES_COMMON)

SOURCES_PR = gnucobpr.texi \
	1.texi 2.texi 3.texi 4.texi 5.texi 6.texi \
	7.texi 8.texi 9.texi 10.texi 11.texi 12.texi \
	13.texi A.texi B.texi C.texi \
	cbintr.tex cbmnem.tex cbrese.tex cbsyst.tex updates.texi \
	$(SOURCES_COMMON)

SOURCES_SP = gnucobsp.texi \
	LISTING-COBDUMP.texi LISTING-colors.texi LISTING-DAY-FROM-DATE.texi \
	LISTING-GCic.texi LISTING-STREAMIOcb.texi LISTING-STREAMIO.texi \
	$(SOURCES_COMMON)

SOURCES_QR = gnucobqr.texi \
	$(SOURCES_COMMON)

all: pdf-letter html

force-update:
	touch gnucobpg.texi gnucobpr.texi gnucobqr.texi gnucobsp.texi


pdf: pdf-a4 pdf-letter

pdf-a4: PDFs/gnucobsp-a4.pdf PDFs/gnucobqr-a4.pdf PDFs/gnucobpg-a4.pdf PDFs/gnucobpr-a4.pdf

pdf-letter: PDFs/gnucobsp-letter.pdf PDFs/gnucobqr-letter.pdf PDFs/gnucobpg-letter.pdf PDFs/gnucobpr-letter.pdf

PDFs/gnucobpg-a4.pdf: $(SOURCES)
PDFs/gnucobpr-a4.pdf: $(SOURCES_PR)
PDFs/gnucobqr-a4.pdf: $(SOURCES_QR)
PDFs/gnucobsp-a4.pdf: $(SOURCES_SP)
PDFs/gnucobpg-letter.pdf: $(SOURCES)
PDFs/gnucobpr-letter.pdf: $(SOURCES_PR)
PDFs/gnucobqr-letter.pdf: $(SOURCES_QR)
PDFs/gnucobsp-letter.pdf: $(SOURCES_SP)
HTML/gnucobpg.html: $(SOURCES)
HTML/gnucobpr.html: $(SOURCES_PR)
HTML/gnucobqr.html: $(SOURCES_QR)
HTML/gnucobsp.html: $(SOURCES_SP)
info/gnucobpg.info: $(SOURCES)
info/gnucobpr.info: $(SOURCES_PR)
info/gnucobqr.info: $(SOURCES_QR)
info/gnucobsp.info: $(SOURCES_SP)

PDFOPTIONS = -q -c

CSS = css/gnucobpg.css

WARNING = --no-warn

EXTRA_HEAD=<script type="text/javascript" src="js/tree.js"></script>

HTML_OPT = --css-ref=$(CSS) --no-headers \
	--set-customization-variable 'EXTRA_HEAD=$(EXTRA_HEAD)'
INFO_OPT =

html: HTML/gnucobpg.html HTML/gnucobqr.html HTML/gnucobsp.html \
	HTML/gnucobpr.html \
	HTML/gnucobpg/index.html \
#	HTML/gnucobqr/index.html \
#	HTML/gnucobsp/index.html \
	HTML/gnucobpr/index.html

HTML/gnucobpg/index.html: $(SOURCES)
	@mkdir -p $(dir $@)
	makeinfo -v -o $(dir $@) $(WARNING) \
		--html            $(HTML_OPT) gnucobpg.texi

HTML/gnucobpr/index.html: $(SOURCES_PR)
	@mkdir -p $(dir $@)
	makeinfo -v -o $(dir $@) $(WARNING) \
		--html            $(HTML_OPT) gnucobpr.texi

# note setup for split files
#HTML/gnucobqr/index.html: $(SOURCES_QR)
#	@mkdir -p $(dir $@)
#	makeinfo -v -o $(dir $@) $(WARNING) \
#		--html            $(HTML_OPT) gnucobqr.texi
#
#HTML/gnucobsp/index.html: $(SOURCES_SP)
#	@mkdir -p $(dir $@)
#	makeinfo -v -o $(dir $@) $(WARNING) \
#		--html            $(HTML_OPT) gnucobsp.texi

info: info/gnucobsp.info info/gnucobqr.info info/gnucobpg.info /
	info/gnucobpr.info

#
# Rules
#

PDFs/%-letter.pdf : %.texi
	@mkdir -p $(dir $@)
	texi2pdf $(PDFOPTIONS) -o $@ $<

PDFs/%-a4.pdf : %.texi
	@mkdir -p $(dir  $@)
	texi2pdf $(PDFOPTIONS) --command=@afourpaper -o $@ $<

HTML/%.html : %.texi
	@mkdir -p $(dir $@)
	makeinfo -v -o $@ $(WARNING) \
		--html --no-split $(HTML_OPT) $<

info/%.info : %.texi
	@mkdir -p $(dir $@)
	makeinfo -v -o $@ $(WARNING) $(INFO_OPT) $<


maintainer-clean: clean pdf-clean html-clean info-clean

clean:
	@rm -rvf *.aux  *.cp *.fn *.ky *.log *.pg *.toc *.tp *.vr *.vrs *.t2d *.t2p

pdf-clean:
	@rm -rvf  PDFs/gnucob*.pdf

html-clean:
	@rm -rvf HTML/gnucob*.html

info-clean:
	@rm -rvf info/gnucob*.info


publish: HTML/gnucobpg.html
	test "$(WWW)"
	scp HTML/gnucobpg.html $(WWW)

publish-qr: HTML/gnucobpr.html
	test "$(WWW)"
	scp HTML/gnucobpr.html $(WWW)

publish-css: $(CSS)
	test "$(WWW)"
	scp css/gnucobpg.css    $(WWW)/css/
	scp css/gnucobpr.css    $(WWW)/css/
	scp js/tree.js          $(WWW)/js/

tags: TAGS
TAGS:
	etags *.texi
