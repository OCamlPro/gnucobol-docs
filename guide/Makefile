.PHONY: force-update \
	pdf	pdf-a4 pdf-letter \
	html

SOURCES_COMMON = Macros.texi fdl.texi

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

all: pdf-letter html

force-update:
	touch gnucobpg.texi gnucobqr.texi gnucobsp.texi


pdf: pdf-a4 pdf-letter

pdf-a4: PDFs/gnucobqr-a4.pdf PDFs/gnucobsp-a4.pdf PDFs/gnucobpg-a4.pdf

pdf-letter:	PDFs/gnucobpg-letter.pdf PDFs/gnucobqr-letter.pdf PDFs/gnucobsp-letter.pdf

##  PDFs/gnucobpg-a4.pdf: gnucobpg-a4.texi $(SOURCES)
##  	@mkdir -p $(dir $@)
##  	cd $(dir $@) && \
##  	texi2pdf -q -c ../gnucobpg-a4.texi
##  
##  PDFs/gnucobqr-a4.pdf: gnucobqr-a4.texi $(SOURCES_QR)
##  	@mkdir -p $(dir $@)
##  	cd $(dir $@) && \
##  	texi2pdf -q -c ../gnucobqr-a4.texi
##  
##  PDFs/gnucobsp-a4.pdf: gnucobsp-a4.texi $(SOURCES_SP)
##  	@mkdir -p $(dir $@)
##  	cd $(dir $@) && \

PDFs/gnucobpg-a4.pdf: gnucobpg-a4.texi $(SOURCES)
PDFs/gnucobqr-a4.pdf: gnucobqr-a4.texi $(SOURCES_QR)
PDFs/gnucobsp-a4.pdf: gnucobsp-a4.texi $(SOURCES_SP)
PDFs/gnucobpg-letter.pdf: gnucobpg-letter.texi $(SOURCES)
PDFs/gnucobqr-letter.pdf: gnucobqr-letter.texi $(SOURCES_QR)
PDFs/gnucobsp-letter.pdf: gnucobsp-letter.texi $(SOURCES_SP)

PDFOPTIONS = -q

PDFs/%.pdf : %.texi
	@mkdir -p $(dir $@)
	texi2pdf $(PDFOPTIONS) -o $@ -c $<

CSS = css/gnucobpg.css

WARNING = --no-warn

html: HTML/gnucobqr.html HTML/gnucobsp.html HTML/gnucobpg HTML/gnucobpg.html

HTML/gnucobpg: $(SOURCES)
	@mkdir -p $(dir $@)
	makeinfo -v -o HTML/gnucobpg $(WARNING) \
		--html            --css-ref=$(CSS) gnucobpg.texi

HTML/gnucobpg.html: $(SOURCES)
	@mkdir -p $(dir $@)
	makeinfo -v -o HTML $(WARNING) \
		--html --no-split --css-ref=$(CSS) gnucobpg.texi

HTML/gnucobsp.html: $(SOURCES_SP)
	@mkdir -p $(dir $@)
	makeinfo -v -o HTML $(WARNING) \
		--html --no-split --css-ref=$(CSS) gnucobsp.texi

HTML/gnucobqr.html: $(SOURCES_QR)
	@mkdir -p $(dir $@)
	makeinfo -v -o HTML $(WARNING) \
		--html --no-split --css-ref=$(CSS) gnucobqr.texi

publish: HTML/gnucobpg.html $(CSS)
	test "$(WWW)"
	scp HTML/gnucobpg.html $(WWW)
	scp css/gnucobpg.css   $(WWW)/css/

tags: TAGS
TAGS:
	etags *.texi
