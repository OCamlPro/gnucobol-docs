
HTML:
	mkdir HTML
PDFs:
	mkdir PDFs
INFO:
	mkdir INFO

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

force-update:
	touch gnucobpg.texi gnucobqr.texi gnucobsp.texi


pdf: pdf-a4 pdf-letter

pdf-a4: PDFs/gnucobqr-a4.pdf PDFs/gnucobsp-a4.pdf PDFs/gnucobpg-a4.pdf

pdf-letter:	PDFs/gnucobpg-letter.pdf PDFs/gnucobqr-letter.pdf PDFs/gnucobsp-letter.pdf

PDFs/gnucobpg-a4.pdf: PDFs gnucobpg-a4.texi $(SOURCES)
	cd PDFs && \
	texi2pdf -q -c ../gnucobpg-a4.texi

PDFs/gnucobqr-a4.pdf: PDFs gnucobqr-a4.texi $(SOURCES_QR)
	cd PDFs && \
	texi2pdf -q -c ../gnucobqr-a4.texi

PDFs/gnucobsp-a4.pdf: PDFs gnucobsp-a4.texi $(SOURCES_SP)
	cd PDFs && \
	texi2pdf -q -c ../gnucobsp-a4.texi

PDFs/gnucobpg-letter.pdf: PDFs gnucobpg-letter.texi $(SOURCES)
	cd PDFs && \
	texi2pdf -q -c ../gnucobpg-letter.texi

PDFs/gnucobqr-letter.pdf: PDFs gnucobqr-letter.texi $(SOURCES_QR)
	cd PDFs && \
	texi2pdf -q -c ../gnucobqr-letter.texi

PDFs/gnucobsp-letter.pdf: PDFs gnucobsp-letter.texi $(SOURCES_SP)
	cd PDFs && \
	texi2pdf -q -c ../gnucobsp-letter.texi

CSS = css/gnucobpg.css

WARNING = --no-warn


html: HTML/gnucobqr.html HTML/gnucobsp.html HTML/gnucobpg HTML/gnucobpg.html

HTML/gnucobpg: HTML $(SOURCES)
	makeinfo -v -o HTML/gnucobpg $(WARNING) --html --css-ref=$(CSS) gnucobpg.texi

HTML/gnucobpg.html: HTML $(SOURCES)
	makeinfo -v -o HTML $(WARNING) --html --no-split --css-ref=$(CSS) gnucobpg.texi

HTML/gnucobsp.html: HTML $(SOURCES_SP)
	makeinfo -v -o HTML $(WARNING) --html --no-split --css-ref=$(CSS) gnucobsp.texi

HTML/gnucobqr.html: HTML $(SOURCES_QR)
	makeinfo -v -o HTML $(WARNING) --html --no-split --css-ref=$(CSS) gnucobqr.texi

publish: HTML/gnucobpg.html $(CSS)
	test "$(WWW)"
	scp HTML/gnucobpg.html $(WWW)
	scp css/gnucobpg.css   $(WWW)/css/
