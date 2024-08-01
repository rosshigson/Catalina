ifeq ($(OS),Windows_NT)
    CPPFLAGS=
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        CPPFLAGS=
    endif
    ifeq ($(UNAME_S),Darwin)
        CPPFLAGS=-stdlib=libc++
    endif
endif

A=.a
O=.o
E=
CC=gcc
CPP=c++
CFLAGS=
LDFLAGS=
LD=$(CC)
AR=ar ruv
RANLIB=ranlib
DIFF=diff
RM=rm -f

ifeq ("$(LCCDIR)", "")
   BINDIR=/opt/catalina/bin
else
   BINDIR=$(LCCDIR)/bin
endif

what:
	-@echo make all p2asm

all::	p2asm$E

p2asm$E:	p2asm.c symsubs.c strsubs.c p2asmsym.h strsubs.h symsubs.h
	$(CC) $(CFLAGS) -o $@ p2asm.c symsubs.c strsubs.c -lm

clean::
	$(RM) p2asm$E

install:
	cp p2asm$E $(BINDIR)/p2asm$E

