# initialize variables and set common options
CC = catalina

P2 =
CLOCK =
MODEL =
CFLAGS =

# set up options specific to Windows or Linux
ifeq ($(OS), Windows_NT)
	E=.exe
	RM=-del_del.bat
else
	E=
	RM=-rm -f
endif

# assume P1
B=.binary

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	B=.bin
	CFLAGS += -p2
	P2 = TRUE
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	B=.bin
	CFLAGS += -p2
	P2 = TRUE
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	B=.bin
	P2 = TRUE
endif

# Check if there is a COMPACT in CATALINA_DEFINES
ifeq (COMPACT, $(findstring COMPACT, $(CATALINA_DEFINE)))
	MODEL = COMPACT
endif

# Check if there is a COMPACT in CATALINA_OPTIONS
ifeq (COMPACT, $(findstring COMPACT, $(CATALINA_OPTIONS)))
	MODEL = COMPACT
endif

# Check if there is a NATIVE in CATALINA_DEFINES
ifeq (NATIVE, $(findstring NATIVE, $(CATALINA_DEFINE)))
	MODEL = NATIVE
endif

# Check if there is a NATIVE in CATALINA_OPTIONS
ifeq (NATIVE, $(findstring NATIVE, $(CATALINA_OPTIONS)))
	MODEL = NATIVE
endif

# Check if there is a TINY in CATALINA_DEFINES
ifeq (TINY, $(findstring TINY, $(CATALINA_DEFINE)))
	MODEL = TINY
endif

# Check if there is a TINY in CATALINA_OPTIONS
ifeq (TINY, $(findstring TINY, $(CATALINA_OPTIONS)))
	MODEL = TINY
endif

# Check if there is a LARGE in CATALINA_DEFINES
ifeq (LARGE, $(findstring LARGE, $(CATALINA_DEFINE)))
	MODEL = LARGE
endif

# Check if there is a LARGE in CATALINA_OPTIONS
ifeq (LARGE, $(findstring LARGE, $(CATALINA_OPTIONS)))
	MODEL = LARGE
endif

# Check if there is a SMALL in CATALINA_DEFINES
ifeq (SMALL, $(findstring SMALL, $(CATALINA_DEFINE)))
	MODEL = SMALL
endif

# Check if there is a SMALL in CATALINA_OPTIONS
ifeq (SMALL, $(findstring SMALL, $(CATALINA_OPTIONS)))
	MODEL = SMALL
endif

# If no model is specified
# then on a Propeller 1 use LARGE
# and on a Propeller 2 use COMPACT
ifeq ("$(MODEL)", "")
ifeq ($(P2), TRUE)
	MODEL = COMPACT
else
	MODEL = LARGE
endif
endif

ifeq ($(P2), TRUE)
# Check if there is an RTC in CATALINA_DEFINES
ifeq (RTC, $(findstring RTC, $(CATALINA_DEFINE)))
	CLOCK = RTC
endif

# Check if there is an RTC in CATALINA_OPTIONS
ifeq (RTC, $(findstring RTC, $(CATALINA_OPTIONS)))
	CLOCK = RTC
endif
endif

#if RTC not specified, use CLOCK
ifneq ($(CLOCK), RTC)
  CLOCK = CLOCK
endif

# see if NO_LINENOISE is in CATALINA_DEFINE
ifeq (NO_LINENOISE, $(findstring NO_LINENOISE, $(CATALINA_DEFINE)))
	NO_LINENOISE = YES
endif

# see if NO_LINENOISE is in CATALINA_OPTIONS
ifeq (NO_LINENOISE, $(findstring NO_LINENOISE, $(CATALINA_OPTIONS)))
	NO_LINENOISE = YES
endif

ifneq ($(NO_LINENOISE), YES)
	MYCFLAGS_LINENOISE = -C ENABLE_LINENOISE
endif

CFLAGS += -C $(MODEL) -C $(CLOCK) -C NO_MOUSE -W-w

ifeq ($(P2), TRUE)
  LIBS  = -lmc -lcx -llua -llinenoise
  LIBSX = -lmc -lcx -lluax
else
  LIBS  = -lm -lcx -llua -llinenoise
  LIBSX = -lm -lcx -lluax
endif

#set up pattern rules

%.binary : %.c 
#	-@catalina_env
	$(CC) -o $@ $(CFLAGS) $(LIBS) linit.c $<

%.eeprom : %.c linit.c
#	-@catalina_env
	$(CC) -e -o $@ $(CFLAGS) $(LIBS) linit.c $<

%.bin : %.c linit.c
#	-@catalina_env
	$(CC) -p2 -o $@ $(CFLAGS) $(LIBS) linit.c $<

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : lua
lua : lua$B

lua$B: lua.c linit.c linenoise.c
	$(CC) -o $@ $(CFLAGS) $(LIBS) $^ -M1M  $(MYCFLAGS_LINENOISE)

# add this to the 'all' target
all :: lua 

# =============

.PHONY : luac
luac : luac$B

luac$B: luac.c linit.c linenoise.c
	$(CC) -o $@ $(CFLAGS) $(LIBS) $^ -M1M  $(MYCFLAGS_LINENOISE)

# add this to the 'all' target
all :: luac

# =============

.PHONY : luax
luax : luax$B

luax$B: luax.c linit.c
	$(CC) -o $@ $(CFLAGS) $(LIBSX) $^ -M1M

# add this to the 'all' target
all :: luax

# =============

.PHONY : lhello
lhello : lhello$B

# add this to the 'all' target
all :: lhello

# =============

.PHONY : lscript
lscript : lscript$B

# add this to the 'all' target
all :: lscript

# =============

# build mlua only for P2 in COMPACT mode
ifeq ($(P2), TRUE)
ifeq ($(MODEL), COMPACT)
.PHONY : mlua
mlua : mlua$B

mlua$B: lua.c linit.c 
	$(CC) -o $@ $(CFLAGS) $(LIBS) -lthreads $^ -M1M

# add this to the 'all' target
all :: mlua 
endif
endif

# =============

# build mluax only for P2 in COMPACT mode
ifeq ($(P2), TRUE)
ifeq ($(MODEL), COMPACT)
.PHONY : mluax
mluax : mluax$B

mluax$B: lua.c linit.c 
	$(CC) -o $@ $(CFLAGS) $(LIBS) -lthreads $^ -M1M

# add this to the 'all' target
all :: mluax
endif
endif

# =============

clean:
	-$(RM) *.bin
	-$(RM) *.binary
	-$(RM) *.lst

