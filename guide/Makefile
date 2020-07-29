pdf: 	gnucobpg-a4.pdf gnucobpg-letter.pdf \
	gnucobqr-a4.pdf gnucobqr-letter.pdf \
	gnucobsp-a4.pdf gnucobsp-letter.pdf
	@mkdir -p PDFs
	./build-manuals.sh

CSS=css/gnucobpg.css

html: HTML/gnucobpg.html
HTML/gnucobpg.html: gnucobpg.texi
	@mkdir -p $(dir $@)
	makeinfo -v -o $(dir $@) --no-warn --html --no-split --css-ref=$(CSS) $^

publish: HTML/gnucobpg.html css/gnucobpg.css 
	test "$(WWW)"
	scp HTML/gnucobpg.html $(WWW)
	scp css/gnucobpg.css   $(WWW)/css/

