# Catalina C makefile for the ZIP Infocom interpreter

.SUFFIXES: .c .obj .h .binary

CFLAGS=
LDFLAGS=

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	CFLAGS = -p2 
  LDFLAGS= -p2 
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	CFLAGS = -p2 
  LDFLAGS= -p2 
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	CFLAGS = -p2 
  LDFLAGS= -p2 
endif

# otherwise its a P1
ifeq ("$(CFLAGS)", "")
	CFLAGS= -C LARGE -C NO_MOUSE -C CLOCK -C NO_FLOAT
endif
ifeq ("$(LDFLAGS)", "")
	LDFLAGS= -C LARGE -C NO_MOUSE -C CLOCK -C NO_FLOAT
endif

CFLAGS  += -D LOUSY_RANDOM

ifeq ($(OS), Windows_NT)
CC=catalina.exe
LD=catalina.exe
else
CC=catalina
LD=catalina
endif

ifeq ($(OS), Windows_NT)
	MV=move /y
	RM=-del /q /s
	CP=copy /y
else
	MV=mv
	RM=-rm -f
	CP=cp -f
endif

LIBS = -lcx

INC = ztypes.h
OBJS = control.obj extern.obj fileio.obj input.obj interpre.obj \
	math.obj memory.obj object.obj operand.obj osdepend.obj license.obj\
	property.obj quetzal.obj screen.obj text.obj variable.obj getopt.obj \
	dumbio.obj catalina_jzip.obj

jzip.binary: $(OBJS)
	$(LD) $(LDFLAGS) -o $* $(OBJS) $(LIBS)

.c.obj:
	$(CC) $(CFLAGS) -c $< -o $(*F).obj

clean:
	$(RM) *.obj
	$(RM) *.lst
	$(RM) *.bin
	$(RM) *.binary
