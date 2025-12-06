
SHELL=/bin/sh

####################################

CC = gcc
AR = ar
RANLIB = ranlib
EXE = 

SHAREDFLAG = -fPIC
CFLAGS =   -g -O2 -std=c99

MATHLIB = -lm
SOCKET_LIBS = 

YACC = bison -y 
AWK = gawk
CMP = cmp

# where to put awka
prefix = 
exec_prefix = ${prefix}

BINDIR = ${exec_prefix}/bin
LIBDIR = ${exec_prefix}/lib
INCDIR = ${prefix}/include
# where to put the man pages
MANEXT = 1
MANSRCDIR = ${datarootdir}/man
MANDIR = $(MANSRCDIR)/man$(MANEXT)
SHARED_LIB = libawka.so
BUILDLIB = libawka.a $(SHARED_LIB)

datarootdir = ${prefix}/share

#######################################

MAKEFILEIN = Makefile.in lib/Makefile.in awka/Makefile.in test/Makefile.in

all: awka_exe libawka

Makefile:	$(MAKEFILEIN) config.status
	/bin/sh ./config.status

libawka: 
	cd lib; $(MAKE)

awka_exe: 
	cd awka; $(MAKE)

AWKAMAN = $(MANDIR)/awka.$(MANEXT)
install:  awka_exe libawka
	if [ ! -d $(LIBDIR) ]; then mkdir -p $(LIBDIR); fi
	if [ ! -d $(INCDIR) ]; then mkdir -p $(INCDIR); fi
	if [ ! -d $(BINDIR) ]; then mkdir -p $(BINDIR); fi
	if [ ! -d $(MANDIR) ]; then mkdir -p $(MANDIR); fi
	if [ ! -d $(MANSRCDIR)/man5 ]; then mkdir -p $(MANSRCDIR)/man5; fi
	cd awka; $(MAKE) install
	cd lib; $(MAKE) install
	cp  doc/awka.1  $(AWKAMAN)
	cp  doc/awka-elm.5  $(MANSRCDIR)/man5
	cp  doc/awka-elmref.5  $(MANSRCDIR)/man5
	chmod  0644  $(AWKAMAN)

clean:
	cd awka; $(MAKE) clean
	cd lib; $(MAKE) clean
	cd test; $(MAKE) clean

distclean:  clean
	rm -f config.h Makefile lib/Makefile awka/Makefile test/Makefile \
	    config.status config.log config.cache
	rm -f defines.out maxint.out
	rm -f benchmark/*.c benchmark/core benchmark/*.o benchmark/x*

configure:  configure.in awka.ac.m4
	autoconf

check:	awka_exe libawka
	cd test; $(MAKE) -k

test:	check

