#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

CFLAGS=
CLOCK=

# Check if there is an RTC in CATALINA_DEFINES
ifeq (RTC, $(findstring RTC, $(CATALINA_DEFINE)))
	CLOCK   = RTC
endif

# Check if there is an RTC in CATALINA_OPTIONS
ifeq (RTC, $(findstring RTC, $(CATALINA_OPTIONS)))
	CLOCK   = RTC
endif

#if RTC not specified, use CLOCK
ifneq ("$(CLOCK)", "RTC")
  CLOCK   = CLOCK
endif

#assume P1
B=.binary

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	CFLAGS = -p2 -lmc -C NO_MOUSE -C $(CLOCK)
	B=.bin
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	CFLAGS = -p2 -lmc -C NO_MOUSE -C $(CLOCK)
	B=.bin
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	CFLAGS = -p2 -lmc -C NO_MOUSE -C $(CLOCK)
	B=.bin
endif

# otherwise its a P1
ifeq ("$(CFLAGS)", "")
	CFLAGS= -C LARGE -lma -C NO_MOUSE -C $(CLOCK)
endif

# set up common options
B1=.binary
B2=.bin
E1=.eeprom
O=.obj
L=.lst

ifeq ($(OS), Windows_NT)
CC=catalina.exe
LD=catalina.exe
else
CC=catalina
LD=catalina
endif

CFLAGS += -lcx -I../ptoc

# set up options specific to Windows or Linux
ifeq ($(OS), Windows_NT)
	E=.exe
	MV=cmd //c move //y
	RM=-cmd //c del //q //s
	CP=cmd //c copy //y
else
	MV=mv
	RM=-rm -f
	CP=cp -f
endif

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
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : pcom
pcom : pcom$B

pcom$B: catalina_pcom.c ../ptoc/paslib.c ../ptoc/set.c ../ptoc/io.c
	$(CC) $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: pcom

# =============
.PHONY : pint
pint : pint$B

pint$B: catalina_pint.c ../ptoc/paslib.c ../ptoc/set.c ../ptoc/io.c
	$(CC) $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: pint

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L
	$(RM) *$O
