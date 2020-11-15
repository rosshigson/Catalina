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

LUADIR=lua-5.1.4

AWKADIR=awka-0.7.5

what:
	-@echo make all catbind catalina payload spinc bindump blackbox catdbgfilegen parallelize parallelize_awka install

all::	catbind$E catalina$E payload$E spinc$E bindump$E blackbox$E catdbgfilegen$E parallelize$E parallelize_awka$E

catbind$E:	catbind.c
	$(CC) $(CFLAGS) -o $@ catbind.c

catalina$E:	catalina.c
	$(CC) $(CFLAGS) -o $@ catalina.c

payload$E:	payload.c rs232.h rs232.c base64.c
	make -C $(LUADIR) linux
	$(CC) $(CFLAGS) -o $@ payload.c rs232.c base64.c -lpthread -lcurses -L $(LUADIR)/src -llua -lm -ldl

spinc$E:	spinc.c spinc.h 
	$(CC) $(CFLAGS) -o $@ spinc.c 

bindump$E:	bindump.c 
	$(CC) $(CFLAGS) -o $@ bindump.c 

y.tab.c y.tab.h: blackbox_y.y
	bison -y -d blackbox_y.y

blackbox_l.c: blackbox_l.l
	flex -oblackbox_l.c <blackbox_l.l

blackbox$E:	y.tab.c y.tab.h blackbox_l.c blackbox_comms.c rs232.c printf.c
	$(CC) $(CFLAGS) -o $@ y.tab.c blackbox_l.c blackbox_comms.c rs232.c printf.c -L $(LUADIR)/src -llua -lm -ldl

catdbgfilegen$E:	catdbgfilegen.h catdbgutilities.h catdbgfilegen.cpp catdbgutilities.cpp stringconverter.h
	$(CPP) $(CPPFLAGS) catdbgfilegen.cpp catdbgutilities.cpp -std=c++0x -o catdbgfilegen

parallelize$E:	parallelize.c
	$(CC) $(CFLAGS) -o $@ parallelize.c

parallelize_awka$E:	parallelize_awka.awk parallelize_functions.c parallelize_functions.h
	make -C $(AWKADIR) all
	cp $(AWKADIR)/awka/awka .
	cp $(AWKADIR)/lib/libawka.a .
	cp $(AWKADIR)/lib/libawka.h .
	./CompileParallelize parallelize_awka
	$(CC) $(CFLAGS) -m32 -o $@ -I. parallelize_awka.c parallelize_functions.c libawka.a

clean::
	make -C $(LUADIR) clean
	make -C $(AWKADIR) clean
	$(RM) catbind$E catalina$E payload$E spinc$E bindump$E blackbox$E catdbgfilegen$E parallelize$E parallelize_awka$E
	$(RM) y.tab.c y.tab.h blackbox_l.c
	$(RM) parallelize_awka.c parallelize_functions.o

install:
	cp catbind$E $(BINDIR)/catbind$E
	cp catalina$E $(BINDIR)/catalina$E
	cp payload$E $(BINDIR)/payload$E
	cp spinc$E $(BINDIR)/spinc$E
	cp bindump$E $(BINDIR)/bindump$E
	cp blackbox$E $(BINDIR)/blackbox$E
	cp catdbgfilegen$E $(BINDIR)/catdbgfilegen$E
	cp parallelize$E $(BINDIR)/parallelize$E
	cp parallelize_awka$E $(BINDIR)/parallelize_awka$E

