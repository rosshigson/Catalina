
SHELL=/bin/sh

####################################

CC = gcc
AR = ar
RANLIB = ranlib

CFLAGS =   -g -O2 -fPIC

MATHLIB = -lm

YACC = bison -y 
AWK = gawk

# where to put awka
prefix = 
exec_prefix = ${prefix}

BINDIR = ${exec_prefix}/bin
LIBDIR = ${exec_prefix}/lib
INCDIR = ${prefix}/include
# where to put the man pages
MANDIR = ${datarootdir}/man
MANEXT = 1
#SHAREDLIB = libawka.so
VERSION = @VERSION@
BUILDLIB = libawka.a $(SHAREDLIB)

datarootdir = ${prefix}/share

#######################################

MAKEFILEIN = Makefile.in

LOBJS = var.o builtin.o error.o init.o array.o io.o garbage.o rexp.o

REOBJS = ../regexp/regex.o ../regexp/dfa.o
RE_C   = ../regexp/regex.c ../regexp/dfa.c

LINCS  = array.h init.h io.h var.h mem.h ../config.h ../regexp/dfa.h \
         builtin.h error.h ../regexp/regex.h garbage.h ../patchlev.h

all :  $(BUILDLIB)

Makefile:	$(MAKEFILEIN) ../config.status
	cd ..;/bin/sh config.status

libawka.a : $(LOBJS) $(REOBJS)
	$(AR) -uvr libawka.a $(LOBJS) $(REOBJS)
	$(RANLIB) libawka.a

libawka.so : $(LOBJS) $(REOBJS)
	$(CC) -shared $(CFLAGS) $(LOBJS) $(REOBJS) -o libawka.so

libawka.h : libawka.h.in libawka.h.warn $(LINCS)
	$(AWK) -f ../examples/fixhdr.awk libawka.h.in >libawka.h

install :  libawka.a $(SHAREDLIB)
	cp libawka.a $(LIBDIR)
	if [ -f libawka.so ]; then cp libawka.so $(LIBDIR); fi
	cp libawka.h $(INCDIR)
	chmod a+r $(LIBDIR)/libawka.*
	chmod a+r $(INCDIR)/libawka.h

clean :
	rm -f *.o ../regexp/*.o ../regexp/.done core libawka.a libawka.so libawka.h

distclean :  clean
	rm -f Makefile

../regexp/regex.o : ../regexp/regex.c ../regexp/regex.h mem.h error.h
	$(CC) $(CFLAGS) -I. -I../regexp -c ../regexp/regex.c -o ../regexp/regex.o

../regexp/dfa.o : ../regexp/dfa.c ../regexp/dfa.h 
	$(CC) $(CFLAGS) -I. -I../regexp -c ../regexp/dfa.c -o ../regexp/dfa.o

# output from  mawk -f examples/deps.awk *.c >>Makefile.in
array.o : var.h array_priv.h garbage.h libawka.h mem.h number.h garbage.h
builtin.o : garbage.h libawka.h builtin_priv.h varg.h mem.h number.h
error.o : libawka.h varg.h mem.h
init.o : libawka.h mem.h
io.o : libawka.h mem.h
var.o : libawka.h mem.h garbage.h number.h
garbage.o : libawka.h mem.h garbage.h
rexp.o : libawka.h

