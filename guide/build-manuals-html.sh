#!/bin/bash
# 15/10/22 vbc 0.1 Added gnucobpr to all areas
#                  and Makefile
# 21/12/22 vbc 0.2 Added gnucobpr to the commented out areas.
#
echo
echo "GC manual build (PDF)"
#
# Force regen for toc's
#
make force-update
echo
#
echo   "Building Programmer's Guide"...
make PDFs/gnucobpg-a4.pdf
make PDFs/gnucobpg-letter.pdf
echo   "Building Programmer's Reference"...
make PDFs/gnucobpr-a4.pdf
make PDFs/gnucobpr-letter.pdf
echo   "Building Quick Reference"...
make PDFs/gnucobqr-a4.pdf
make PDFs/gnucobqr-letter.pdf
echo   "Building Sample Programs"...
make PDFs/gnucobsp-a4.pdf
make PDFs/gnucobsp-letter.pdf
echo
#
echo "GC manual build (GNU Info)"
#make info/gnucobpg.info
#make info/gnucobpr.info
make info/gnucobqr.info
make info/gnucobsp.info
echo
#
#echo "GC manual build (HTML splitted)"
#make HTML/gnucobpg.html
#make HTML/gnucobpr.html
#make HTML/gnucobqr.html
#make HTML/gnucobsp.html
#echo

#echo "GC manual build (HTML monolitic)"
#make HTML/gnucobpg/index.html
#make HTML/gnucobpr/index.html
#make HTML/gnucobqr/index.html
#make HTML/gnucobsp/index.html
#echo

echo "GC manual build complete"
exit 0
