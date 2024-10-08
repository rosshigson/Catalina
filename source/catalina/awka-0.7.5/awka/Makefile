
SHELL=/bin/sh

####################################

CC = gcc
AR = ar
RANLIB = ranlib
EXE = 

CFLAGS  = -g -O2 -Dawka_LIBDIR=\"${exec_prefix}/lib\" -Dawka_INCDIR=\"${prefix}/include\"

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

datarootdir = ${prefix}/share

#######################################

MAKEFILEIN = Makefile.in

OBJS = translate.o awka.o parse.o scan.o memory.o hash.o code.o bi_funct.o\
       da.o error.o init.o bi_vars.o cast.o print.o  \
       kw.o jmp.o field.o re_cmpl.o preprocess.o zmalloc.o\
       msg.o scancode.o fcall.o version.o

all :  awka

Makefile:	$(MAKEFILEIN) ../config.status
	cd ..; /bin/sh ./config.status

awka : $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o awka

parse.c  : parse.y
	@echo  expect 8 shift/reduce conflicts
	$(YACC) -d parse.y
	mv y.tab.c parse.c
	-if cmp -s y.tab.h parse.h ;\
	then rm y.tab.h ;\
	else mv y.tab.h parse.h ; fi

install :  awka
	cp awka$(EXE) $(BINDIR)
	chmod a+rx $(BINDIR)/awka$(EXE)

clean :
	-rm -f *.o core awka awka$(EXE)

# output from  mawk -f examples/deps.awk *.c >>Makefile.in
awka.o : ../config.h awka_exe.h mem.h symtype.h memory.h types.h awka.h array.h sizes.h scan.h field.h parse.h ../config.h nstd.h repl.h zmalloc.h
bi_funct.o : files.h symtype.h memory.h bi_vars.h types.h awka.h array.h sizes.h field.h init.h ../config.h bi_funct.h fin.h nstd.h repl.h zmalloc.h
bi_vars.o : symtype.h memory.h bi_vars.h types.h awka.h array.h sizes.h field.h init.h ../config.h nstd.h zmalloc.h
cast.o : symtype.h memory.h types.h awka.h array.h sizes.h scan.h field.h parse.h ../config.h nstd.h repl.h zmalloc.h
code.o : symtype.h memory.h code.h types.h awka.h array.h sizes.h field.h init.h ../config.h nstd.h jmp.h zmalloc.h
da.o : symtype.h memory.h code.h types.h awka.h awka_exe.h array.h sizes.h field.h awka_exe.h ../config.h bi_funct.h nstd.h ../lib/builtin_priv.h repl.h zmalloc.h
error.o : vargs.h symtype.h bi_vars.h types.h awka.h array.h sizes.h scan.h parse.h ../config.h nstd.h
fcall.o : symtype.h memory.h code.h types.h awka.h array.h sizes.h ../config.h nstd.h zmalloc.h
field.o : symtype.h memory.h bi_vars.h types.h awka.h array.h sizes.h scan.h field.h parse.h init.h ../config.h nstd.h repl.h zmalloc.h
hash.o : symtype.h memory.h types.h awka.h array.h sizes.h ../config.h nstd.h zmalloc.h
init.o : msg.h symtype.h memory.h code.h bi_vars.h types.h awka.h array.h sizes.h field.h init.h ../config.h nstd.h zmalloc.h
jmp.o : symtype.h memory.h code.h types.h awka.h array.h sizes.h init.h ../config.h nstd.h jmp.h zmalloc.h
kw.o : symtype.h types.h awka.h array.h sizes.h init.h parse.h ../config.h nstd.h
memory.o : memory.h types.h awka.h sizes.h ../config.h nstd.h zmalloc.h
msg.o : awka.h awka_exe.h
parse.o : files.h symtype.h memory.h code.h bi_vars.h types.h awka.h array.h sizes.h field.h ../config.h bi_funct.h nstd.h jmp.h zmalloc.h
preprocess.o : files.h msg.h symtype.h memory.h bi_vars.h types.h awka.h awka_exe.h array.h sizes.h scan.h field.h parse.h mem.h ../config.h bi_funct.h nstd.h zmalloc.h
print.o : files.h symtype.h memory.h bi_vars.h types.h awka.h array.h sizes.h scan.h field.h parse.h ../config.h bi_funct.h nstd.h zmalloc.h
re_cmpl.o : symtype.h memory.h types.h awka.h array.h sizes.h scan.h parse.h ../config.h nstd.h repl.h zmalloc.h
scan.o : files.h msg.h symtype.h memory.h code.h types.h awka.h array.h sizes.h field.h scan.h init.h parse.h ../config.h fin.h nstd.h repl.h zmalloc.h
translate.o : ../patchlev.h msg.h memory.h code.h awka_exe.h ../config.h nstd.h ../lib/builtin_priv.h mem.h zmalloc.h
version.o : ../patchlev.h types.h awka.h sizes.h ../config.h nstd.h
zmalloc.o : types.h awka.h sizes.h ../config.h nstd.h zmalloc.h
