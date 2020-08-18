# Notes on texinfo inputs #

Except for @plainidx, all `*idx` macros must appear at the beginning
of a line.  @plainidx must appear at the end of the line.  These rules
are imposed by the texinfo @cindex macro syntax, whose "argument" is
not {in braces}, but rather is any text to end-of-line.

Most uses of @item and @itemx should be on a line by itself.  The
exception is @table, which is a 2-column table.  (It often acts as a
dictionary list.)  In @table, the @item is followed on the same line
by the term being defined, and the definition (column 2) goes below. 

    @table @*style*
    @item *term*
    *definition*
    
    @item *term*
    *definition*
    @end table
	
References to single characters as literals should use @samp: 

  The @samp(=} sign is used for assignment.
  
Consistent use of @samp (and other macros) leads to consistent
appearance in the rendered document, and builds trust with the reader.

Metasyntactic terms -- names meant to be replaced by the user -- use
the @var command: 

  The @var{device-name-1} IS @var{mnemonic-name-2 clause} 

The Programmer's Guide relies heavily on **Macros.texi**. At one time,
some macros caused their arguments to be wrapped in quasi-syntactic
"quoting" characters, such as <angle brackets>. The macros were
modified in August 2020 to remove such extraneous brackets, in pursuit
of what is hopefully a cleaner, less "noisy" result.

Do not use the double-quote character except in code samples. The
double-quote character is never correct in texinfo prose. The left
double-quote is two grave characters; the right double-quote is two
single-quotes:

  Instead of "this", use ``that''. 

Do not use a pair of single-quote characters except in code
samples. The single-quote character pair is never correct in texinfo
prose. The left single-quote is a grave character; the right
single-quote is, well one single-quote:

  Instead of 'this', use `that'. 

In general, avoid quotes. texinfo provides macros that include quotes
where needed, depending on output format. Literal quotation -- such as
of Shakespeare, say -- are probably better rendered in
@i{italics}. For technical terms, see "7.1 Indicating Definitions,
Commands, etc." in the texinfo manual. 

Perhaps the one use of quotes that is helpful is the "opposite" of
italics: when the term in quotes is (hopefully) illustrative, but not
exactly right (as here).  We sometimes use italics to indicate a term
of art, and quotes to indicate an artless term.

When tempted to use @b{boldface} or @i{italics} or @strong{}, look
first for a semantic @-command, such as @code. Use those "underlining"
commands only for simple emphasis, never to highlight a technical term. 

When tempted to put advice in ALL CAPS, please don't. For whole
sentences, Consider @footnote instead, else italics is probably a what
you're looking for.

