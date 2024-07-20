include ../../Makefile.inc

all:
	cp ../../assert/*.s .
	cp ../../ctype/*.s .
	cp ../../errno/*.s .
	cp ../../locale/*.s .
	cp ../../setjmp/*.s .
	cp ../../signal/*.s .
	cp ../../stdio/*.s .
	cp ../../stdlib/*.s .
	cp ../../string/*.s .
	cp ../../time/*.s .
	cp ../../catalina/*.s .
	cp ../../io/*.s .
ifeq ($(PROPELLER_2),TRUE)
	cp ../../p2/*.s .
endif
	build_index

clean:
	-rm -f *.s catalina.idx

