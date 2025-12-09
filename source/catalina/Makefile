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
CFLAGS= -Wno-format-security
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

LUADIR=lua-5.4.4

AWKADIR=awka-0.7.5

what:
	-@echo make all bcc binbuild binstats catbind catalina payload spinc bindump blackbox catdbgfilegen parallelize parallelize_awka catapult catapult_awka pstrip install

all::	bcc$E binbuild$E binstats$E catbind$E catalina$E payload$E spinc$E bindump$E blackbox$E catdbgfilegen$E parallelize$E parallelize_awka$E catapult$E catapult_awka$E pstrip$E

bcc$E:	bcc.c
	$(CC) $(CFLAGS) -o $@ bcc.c

binbuild$E:	binbuild.c
	$(CC) $(CFLAGS) -o $@ binbuild.c

binstats$E:	binstats.c
	$(CC) $(CFLAGS) -o $@ binstats.c

catbind$E:	catbind.c
	$(CC) $(CFLAGS) -o $@ catbind.c

catalina$E:	catalina.c
	$(CC) $(CFLAGS) -o $@ catalina.c -lm

payload$E:	payload.c rs232.h rs232.c base64.c fymodem.h fymodem.c kb.h kb.c
	make -C $(LUADIR) linux
	$(CC) $(CFLAGS) -o $@ payload.c rs232.c base64.c fymodem.c kb.c -lpthread -lcurses -L $(LUADIR)/src -llua -lm -ldl

spinc$E:	spinc.c spinc.h 
	$(CC) $(CFLAGS) -o $@ spinc.c 

bindump$E:	bindump.c 
	$(CC) $(CFLAGS) -o $@ bindump.c 

y.tab.c y.tab.h: blackbox_y.y
	bison -y -Wno-conflicts-sr -d blackbox_y.y

blackbox_l.c: blackbox_l.l
	flex -oblackbox_l.c <blackbox_l.l

blackbox$E:	y.tab.c y.tab.h blackbox_l.c blackbox_comms.c rs232.c printf.c
	$(CC) $(CFLAGS) -o $@ y.tab.c blackbox_l.c blackbox_comms.c rs232.c printf.c -L $(LUADIR)/src -llua -lm -ldl

catdbgfilegen$E:	catdbgfilegen.h catdbgutilities.h catdbgfilegen.cpp catdbgutilities.cpp stringconverter.h
	$(CPP) $(CPPFLAGS) catdbgfilegen.cpp catdbgutilities.cpp -std=c++0x -o catdbgfilegen

parallelize$E:	parallelize.c
	$(CC) $(CFLAGS) -o $@ parallelize.c

parallelize_awka$E:	parallelize_awka.awk parallelize_functions.c parallelize_functions.h
	cd $(AWKADIR);./configure CFLAGS="-Wno-unused-result -Wno-format-security -Wno-format-overflow" ;cd ..	
	make -C $(AWKADIR) all
	cp $(AWKADIR)/awka/awka$E .
	cp $(AWKADIR)/lib/libawka.a .
	cp $(AWKADIR)/lib/libawka.h .
	./CompileParallelize parallelize_awka
#	$(CC) $(CFLAGS) -o $@ -I. parallelize_awka.c parallelize_functions.c libawka.a

catapult$E:	catapult.c
	$(CC) $(CFLAGS) -o $@ catapult.c

catapult_awka$E:	catapult_awka.awk catapult_functions.c catapult_functions.h
	make -C $(AWKADIR) all
	cp $(AWKADIR)/awka/awka$E .
	cp $(AWKADIR)/lib/libawka.a .
	cp $(AWKADIR)/lib/libawka.h .
	./CompileCatapult catapult_awka
#	$(CC) $(CFLAGS) -o $@ -I. catapult_awka.c catapult_functions.c libawka.a

pstrip$E:	pstrip.c
	gcc -I. -O2 -s -o $@ pstrip.c

clean::
	make -C $(LUADIR) clean
	make -C $(AWKADIR) clean
	$(RM) bcc$E binbuild$E binstats$E catbind$E catalina$E payload$E spinc$E bindump$E blackbox$E catdbgfilegen$E pstrip$E
	$(RM) y.tab.c y.tab.h blackbox_l.c
	$(RM) parallelize$E parallelize_awka$E parallelize_awka.c parallelize_functions.o
	$(RM) catapult$E catapult_awka$E catapult_awka.c catapult_functions.o
	$(RM) pasm_strip.c

install:
	cp bcc$E $(BINDIR)/bcc$E
	cp binbuild$E $(BINDIR)/binbuild$E
	cp binstats$E $(BINDIR)/binstats$E
	cp catbind$E $(BINDIR)/catbind$E
	cp catalina$E $(BINDIR)/catalina$E
	cp payload$E $(BINDIR)/payload$E
	cp spinc$E $(BINDIR)/spinc$E
	cp bindump$E $(BINDIR)/bindump$E
	cp blackbox$E $(BINDIR)/blackbox$E
	cp catdbgfilegen$E $(BINDIR)/catdbgfilegen$E
	cp parallelize$E $(BINDIR)/parallelize$E
	cp parallelize_awka$E $(BINDIR)/parallelize_awka$E
	cp catapult$E $(BINDIR)/catapult$E
	cp catapult_awka$E $(BINDIR)/catapult_awka$E
	cp pstrip$E $(BINDIR)/pstrip$E

