UNAME := $(shell uname -s)

ifeq ($(UNAME), Linux)

CC=catalina
GCC=gcc
LD=catalina
SPINC=spinc
SPINPP=spinpp
BINDUMP=bindump
ifeq ($(PROPELLER_2),TRUE)
PASM_ASSEMBLER=p2asm -v33
else
PASM_ASSEMBLER=spinnaker -p -a -I
endif
# use the shell script (invokes mono)
#PASM_ASSEMBLER=homespun -L

else

ifeq ($(UNAME), Darwin)

CC=catalina
GCC=gcc
LD=catalina
SPINC=spinc
SPINPP=spinpp
BINDUMP=bindump
ifeq ($(PROPELLER_2),TRUE)
PASM_ASSEMBLER=p2asm -v33
else
PASM_ASSEMBLER=spinnaker -p -a -I
# use the shell script (invokes mono)
#PASM_ASSEMBLER=homespun -L
endif

else
CC=catalina.exe
GCC=gcc.exe
LD=catalina.exe
SPINC=spinc.exe
SPINPP=spinpp.exe
BINDUMP=bindump.exe
ifeq ($(PROPELLER_2),TRUE)
PASM_ASSEMBLER=p2asm.exe -v33
else
PASM_ASSEMBLER=spinnaker -p -a -I
# use the executable, not the script!
#PASM_ASSEMBLER=homespun.exe -L
endif

endif

endif

ifeq ($(LARGE),TRUE)

CCFLAGS = -S -C LARGE
SPINPPFLAGS = -D LARGE

else

ifeq ($(COMPACT),TRUE)

ifeq ($(PROPELLER_2),TRUE)

CCFLAGS = -S -p2 -C COMPACT
SPINPPFLAGS = -D P2 -D COMPACT

else

CCFLAGS = -S -C COMPACT
SPINPPFLAGS = -D COMPACT

endif

else

ifeq ($(NATIVE),TRUE)

ifeq ($(PROPELLER_2),TRUE)

CCFLAGS = -S -p2 -C NATIVE
SPINPPFLAGS = -D P2 -D NATIVE

else

CCFLAGS = -S -C NATIVE
SPINPPFLAGS = -D NATIVE

endif

else

ifeq ($(PROPELLER_2),TRUE)

CCFLAGS = -S -p2 -C TINY
SPINPPFLAGS = -D P2 -D TINY

else

CCFLAGS = -S

endif

endif

endif

endif

INCLUDES = -I../include -I../include/sys -I../../include -I../../include/sys

.c.s: 
	$(CC) $(CCFLAGS) $(INCLUDES) $<
