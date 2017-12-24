!/bin/bash
echo
echo "GC manual build (PDF)"
#
# Force regen for toc's
#
touch gnucobpg*.texi gnucobqr*.texi gnucobsp*.texi
#
#mkdir -p PDFs
cd PDFs
echo   "Building Programmer's Guide"...
texi2pdf -q -c ../gnucobpg-a4.texi
texi2pdf -q -c ../gnucobpg-letter.texi
echo   "Building Quick Reference"...
texi2pdf -q -c ../gnucobqr-a4.texi
texi2pdf -q -c ../gnucobqr-letter.texi
echo   "Building Sample Programs"...
texi2pdf -q -c ../gnucobsp-a4.texi
texi2pdf -q -c ../gnucobsp-letter.texi
cd ..
#echo
#
#echo "GC manual build (GNU Info)"
#mkdir -p info
#cd info
#makeinfo --no-split ../gnucobpg.texi
#makeinfo --no-split ../gnucobqr.texi
#makeinfo --no-split ../gnucobsp.texi
#cd ..
#echo
#
#echo "GC manual build (HTML splitted)"
#mkdir -p HTML
#cd HTML
#makeinfo --html --output=pg ../gnucobpg.texi
#makeinfo --html --output=qr ../gnucobqr.texi
#makeinfo --html --output=sp ../gnucobsp.texi
#cd ..
#echo

#echo "GC manual build (HTML monolitic)"
#mkdir -p HTML
#cd HTML
#makeinfo --html --no-headers --no-split ../gnucobpg.texi
#makeinfo --html --no-headers --no-split ../gnucobqr.texi
#makeinfo --html --no-headers --no-split ../gnucobsp.texi
#cd ..
echo

echo "GC manual build complete"
exit 0
