all:
	$(MAKE) -f Makefile.generic MANUAL=gnucobpg
	$(MAKE) -f Makefile.generic MANUAL=gnucobqr
	$(MAKE) -f Makefile.generic MANUAL=gnucobsp

html:
	$(MAKE) -f Makefile.generic MANUAL=gnucobpg html
	$(MAKE) -f Makefile.generic MANUAL=gnucobqr html
	$(MAKE) -f Makefile.generic MANUAL=gnucobsp html

rst:
	$(MAKE) -f Makefile.generic MANUAL=gnucobpg rst
	$(MAKE) -f Makefile.generic MANUAL=gnucobqr rst
	$(MAKE) -f Makefile.generic MANUAL=gnucobsp rst

view:
	xdg-open _html/gnucobpg/index.html
