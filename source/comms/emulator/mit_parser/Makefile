#-----------------------------------------------------------------------------
#                               MIT_Parser  Makefile
#-----------------------------------------------------------------------------

# the C compiler
CC = gcc

# C compiler flags
CF = -Dpascal=""
#CF = -Dpascal="" -ggdb

# Extension for ".o" files
o = .o

# Extension for executable files
e = .exe

LIST_TARGETS = \
  vtparser$o \
  vtdcs$o \
  vtescseq$o \
  vttable$o \
  vtprnctl$o \
  libMIT.a \
  shell$e

#-----------------------------------------------------------------------------
# Main rule

all : clean $(LIST_TARGETS) 

clean : force
	-del *~
	-del *$o
	-del *.tbl
	-del libMIT.a
	-del shell$e

force :

vtcsi.tbl: vtcsi.t vtconst.h
	__foo__.bat vtcsi.t
	@echo vtcsi.tbl has been created
  
vtdcs.tbl: vtdcs.t vtconst.h
	__foo__.bat vtdcs.t
	@echo vtdcs.tbl has been created
  
vte152.tbl: vte152.t vtconst.h
	__foo__.bat vte152.t
	@echo vte152.tbl has been created
  
vte1ansi.tbl: vte1ansi.t vtconst.h
	__foo__.bat vte1ansi.t
	@echo vte1ansi.tbl has been created
  
vte2.tbl: vte2.t vtconst.h
	__foo__.bat vte2.t
	@echo vte2.tbl has been created
  
vtdebug.tbl: vtcmnd.h
	makename.bat
  
vtparser$o: vtparser.c vtparser.h vtconst.h vtcmnd.h vt420.h vtpsdef.h \
	vtprnctl.h vtdcs.h
	$(CC) $(CF) -c vtparser.c

vtdcs$o: vtdcs.c vtparser.h vtconst.h vtcmnd.h vt420.h vtpsdef.h vtdcs.h
	$(CC) $(CF) -c vtdcs.c 

vtescseq$o: vtescseq.c vtparser.h vtconst.h vtcmnd.h vt420.h vtpsdef.h \
	vtdcs.h vtcsi.tbl vtdcs.tbl vte152.tbl vte1ansi.tbl vte2.tbl
	$(CC) $(CF) -c vtescseq.c

vttable$o: vttable.c vtparser.h vtconst.h vtcmnd.h vt420.h vtpsdef.h vtdcs.h
	$(CC) $(CF) -c vttable.c

vtprnctl$o:	vtprnctl.c 
	$(CC) $(CF) -c vtprnctl.c

libMIT.a: vtparser$o vtdcs$o vtescseq$o vttable$o vtprnctl$o vtcsi.tbl vte2.tbl \
	vtdcs.tbl vte152.tbl vte1ansi.tbl vte2.tbl vtdebug.tbl
	ar r libMIT.a vtparser$o vtdcs$o vtescseq$o vttable$o vtprnctl$o 
	ranlib libMIT.a
	copy libMIT.a ..
	
shell$e: libMIT.a vt420.h vtpsdef.h vtdebug.tbl
	$(CC) $(CF) -oshell$e shell.c libMIT.a

.PHONY: clean force


