# Catalina C makefile for the ZIP Infocom interpreter

.SUFFIXES: .c .o .h .exe
CC = gcc
CFLAGS = -DLOUSY_RANDOM
LD = gcc
LDFLAGS = 
LIBS =
RM = rm -f

INC = ztypes.h
OBJS = catalina_jzip.o control.o extern.o fileio.o input.o interpre.o \
	math.o memory.o object.o operand.o osdepend.o license.o\
	property.o quetzal.o screen.o text.o variable.o getopt.o \
	dumbio.o

jzip.exe: $(OBJS)
	$(LD) $(LDFLAGS) -o $* $(OBJS) $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $<

clean:
	$(RM) *.o
	$(RM) jzip.exe
