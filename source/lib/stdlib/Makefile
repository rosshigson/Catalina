include ../Makefile.inc


all:	abort.s abs.s atof.s atoi.s atol.s bsearch.s div.s \
	atexit.s exit.s getenv.s setenv.s labs.s ldiv.s mblen.s \
	mbstowcs.s mbtowc.s qsort.s rand.s strtod.s strtol.s \
	modf.s system.s wcstombs.s wctomb.s strfmt.s strto.s \
	strtoi.s strtou.s mal_mal.s

clean:
	-rm -f *.s
	-(cd malloc; make clean)

mal_mal.s:
	-(cd malloc; make)
	cp malloc/*.s .




