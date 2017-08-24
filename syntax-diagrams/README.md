# The GnuCOBOL Grammar for version 2.2

## Summary

This document describes the syntax of COBOL as supported by GnuCOBOL. It is
hoped it will complement Gary Cutler and Vincent Coen’s GnuCOBOL Programmer’s
Guide which (currently) does not document recent features added to GnuCOBOL.

It is also formatted in LaTeX, so that everything looks a bit prettier.

The syntax diagrams were transcribed from GnuCOBOL’s parsers. It thus replicates
some unusual syntax rules and misses some syntax rules implemented outside the
parser. For example, the obsolete identification division comment paragraphs are
allowed in any order and the syntax of a file-control entry does not distinguish
between SEQUENTIAL, INDEXED and RELATIVE organisations.

This is a draft and so has many flaws. If people find this document useful, I
will try to fix these shortcomings.

Edward Hart
[`edward.dan.hart@gmail.com`](mailto:edward.dan.hart@gmail.com)

## Compiling

The document is known to compile with pdfLaTeX as part of TeX Live 2015/Debian,
but might not work with plain LaTeX or with MiKTeX. If you have any problems,
create a ticket on the GnuCOBOL bug tracker and I'll look it into it.

Compilation is simple:

~~~~
    pdflatex ./grammar.tex
~~~~

All packages used are available on CTAN, so, with a TeX package manager,
"missing package" errors should be easy to resolve. For example, with TeX Live,
the following command covers (most of) the packages required:

~~~~
    tlmgr install erewhon newtx roboto booktabs multirow microtype appendix koma-script symbol zapfding cyrillic ly1 etoolbox xkeyval fontaxes fontaxes mweights xcolor tcolorbox pgf l3packages l3kernel trimspaces listings boondox ec txfonts
~~~~

## Licence

Permission is granted to copy, distribute and/or modify this document under the
terms of the GNU Free Documentation License, Version 1.3 or any later version
published by the Free Software Foundation; with no Invariant Sections, no
Front-Cover Texts, and no Back-Cover Texts. Your attention is drawn to the copy
of the license in gfdl.tex (Appendix A).
