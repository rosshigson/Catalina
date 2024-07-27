#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

P2=
MODEL=

# assume P1
B=.binary

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	P2=TRUE
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	P2=TRUE
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	P2=TRUE
	B=.bin
endif

# Check if there is a COMPACT in CATALINA_DEFINES
ifeq (COMPACT, $(findstring COMPACT, $(CATALINA_DEFINE)))
	MODEL   = COMPACT
endif

# Check if there is a COMPACT in CATALINA_OPTIONS
ifeq (COMPACT, $(findstring COMPACT, $(CATALINA_OPTIONS)))
	MODEL   = COMPACT
endif

# Check if there is a TINY in CATALINA_DEFINES
ifeq (TINY, $(findstring TINY, $(CATALINA_DEFINE)))
	MODEL   = TINY
endif

# Check if there is a TINY in CATALINA_OPTIONS
ifeq (TINY, $(findstring TINY, $(CATALINA_OPTIONS)))
	MODEL   = TINY
endif

# Check if there is a SMALL in CATALINA_DEFINES
ifeq (SMALL, $(findstring SMALL, $(CATALINA_DEFINE)))
	MODEL   = SMALL
endif

# Check if there is a SMALL in CATALINA_OPTIONS
ifeq (SMALL, $(findstring SMALL, $(CATALINA_OPTIONS)))
	MODEL   = SMALL
endif

# Check if there is a LARGE in CATALINA_DEFINES
ifeq (LARGE, $(findstring LARGE, $(CATALINA_DEFINE)))
	MODEL   = LARGE
endif

# Check if there is a LARGE in CATALINA_OPTIONS
ifeq (LARGE, $(findstring LARGE, $(CATALINA_OPTIONS)))
	MODEL   = LARGE
endif

# set up options specific to Windows or Linux
ifeq ($(OS), Windows_NT)
	E=.exe
	MV=cmd //c move //y
	RM=-cmd //c del //q //s
	CP=cmd //c copy //y
else
	E=
	MV=mv
	RM=-rm -f
	CP=cp -f
endif

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")
	CFLAGS += -lc -y
else
	CFLAGS += $(CATALINA_OPTIONS)
endif

# set up common options
B1=.binary
B2=.bin
E1=.eeprom
O=.obj
L=.lst
CC=catalina

#set up pattern rules
%.binary : %.c
	-@catalina_env
	$(CC) $(CFLAGS) -o $@ $<

%.eeprom : %.c
	-@catalina_env
	$(CC) -e $(CFLAGS) -o $@ $<

%.bin : %.c
	-@catalina_env
	$(CC) $(CFLAGS) -p2 -o $@ $<

#
# Test for P2 
# ===========

ifneq ($(P2), TRUE)
$(warning WARNING: THESE PROGRAMS REQUIRE A PROPELLER 2)
endif

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

all:

ifeq ($(P2), TRUE)

.PHONY : lut_pasm
lut_pasm : lut_pasm$B

lut_pasm.bin : lut_pasm.c
	$(CC) $(CFLAGS) -p2 -y -o $@ $<

# add this to the 'all' target
all : lut_pasm

# check if we have a model specified (i.e. other than NATIVE)
ifeq ("$(MODEL)", "")

.PHONY : lut_c
lut_c : lut_c$B

lut_c.bin : lut_c.c
	$(CC) $(CFLAGS) -p2 -y -o $@ $<

# add this to the 'all' target
all : lut_c

endif

endif

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean :
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

