#!/bin/bash
texi2pdf -q -c gnucobpg-a4.texi
texi2pdf -q -c gnucobpg-letter.texi
texi2pdf -q -c gnucobqr-a4.texi
texi2pdf -q -c gnucobqr-letter.texi
texi2pdf -q -c gnucobsp-a4.texi
texi2pdf -q -c gnucobsp-letter.texi
echo "GC manual build complete"
exit 0
