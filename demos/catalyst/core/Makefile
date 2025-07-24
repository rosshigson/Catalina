#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P1
B=.binary

CFLAGS = -W-w

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	B=.bin
endif

ifeq ("$(B)", ".binary")
# we are building for a P1 so check for special P1 build options, which are:
#   EEPROM_CATALYST - build Catayst with -C EEPROM
#   LARGE_UTILITIES - build utilities with -C LARGE

# see if EEPROM_CATALYST is in CATALINA_DEFINE
ifeq (EEPROM_CATALYST, $(findstring EEPROM_CATALYST, $(CATALINA_DEFINE)))
	EEPROM_CATALYST = YES
endif

# see if EEPROM_CATALYST is in CATALINA_OPTIONS
ifeq (EEPROM_CATALYST, $(findstring EEPROM_CATALYST, $(CATALINA_OPTIONS)))
	EEPROM_CATALYST = YES
endif

# see if LARGE_UTILITIES is in CATALINA_DEFINE
ifeq (LARGE_UTILITIES, $(findstring LARGE_UTILITIES, $(CATALINA_DEFINE)))
	LARGE_UTILITIES = YES
endif

# see if LARGE_UTILITIES is in CATALINA_OPTIONS
ifeq (LARGE_UTILITIES, $(findstring LARGE_UTILITIES, $(CATALINA_OPTIONS)))
	LARGE_UTILITIES = YES
endif

# the Propeller 1 does not support the linenoise library:
NO_LINENOISE = YES

endif

# see if P2_EDGE is in CATALINA_DEFINE
ifeq (P2_EDGE, $(findstring P2_EDGE, $(CATALINA_DEFINE)))
	P2_EDGE = YES
endif

# see if P2_EDGE is in CATALINA_OPTIONS
ifeq (P2_EDGE, $(findstring P2_EDGE, $(CATALINA_OPTIONS)))
	P2_EDGE = YES
endif


# see if P2_EVAL is in CATALINA_DEFINE
ifeq (P2_EVAL, $(findstring P2_EVAL, $(CATALINA_DEFINE)))
	P2_EVAL = YES
endif

# see if P2_EVAL is in CATALINA_OPTIONS
ifeq (P2_EVAL, $(findstring P2_EVAL, $(CATALINA_OPTIONS)))
	P2_EVAL = YES
endif


# see if P2_CUSTOM is in CATALINA_DEFINE
ifeq (P2_CUSTOM, $(findstring P2_CUSTOM, $(CATALINA_DEFINE)))
	P2_CUSTOM = YES
endif

# see if P2_CUSTOM is in CATALINA_OPTIONS
ifeq (P2_CUSTOM, $(findstring P2_CUSTOM, $(CATALINA_OPTIONS)))
	P2_CUSTOM = YES
endif


# see if HYPER is in CATALINA_DEFINE
ifeq (HYPER, $(findstring HYPER, $(CATALINA_DEFINE)))
	HYPER = YES
endif

# see if HYPER is in CATALINA_OPTIONS
ifeq (HYPER, $(findstring HYPER, $(CATALINA_OPTIONS)))
	HYPER = YES
endif

# see if PSRAM is in CATALINA_DEFINE
ifeq (PSRAM, $(findstring PSRAM, $(CATALINA_DEFINE)))
	PSRAM = YES
endif

# see if PSRAM is in CATALINA_OPTIONS
ifeq (PSRAM, $(findstring PSRAM, $(CATALINA_OPTIONS)))
	PSRAM = YES
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
	CFLAGS_LINENOISE += -llinenoise
endif


ifeq ($(EEPROM_CATALYST), YES)
	CFLAGS_CATALYST += -C EEPROM -C COMPACT
else
	CFLAGS_CATALYST += -C COMPACT
endif

ifeq ($(LARGE_UTILITIES), YES)
	CFLAGS_UTILITIES += -C LARGE
else
	CFLAGS_UTILITIES += -C COMPACT
endif

ifeq ($(P2_EVAL), YES)
ifneq ($(HYPER), YES)
ifneq ($(PSRAM), YES)
  HYPER = YES
endif
endif
endif

ifeq ($(P2_EDGE), YES)
ifneq ($(HYPER), YES)
ifneq ($(PSRAM), YES)
  PSRAM = YES
endif
endif
endif

ifeq ($(HYPER), YES)
	CFLAGS_CATALYST += -lhyper
endif

ifeq ($(PSRAM), YES)
	CFLAGS_CATALYST += -lpsram
endif

# set up options specific to Windows or Linux
ifeq ($(OS), Windows_NT)
	E=.exe
	RM=-del_del
else
	E=
	RM=-rm -f
endif

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")
ifeq ($(B), .bin)
	CFLAGS += -lcix -C NO_MOUSE -C NO_FLOAT
else
	CFLAGS += -lcix -ltiny -C NO_MOUSE -C NO_FLOAT
endif
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

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : catalyst
catalyst : catalyst$B


catalyst.bin : catalyst.c cogstore.c loader.c sio.c cache.c 
	catalina $(CFLAGS) $(CFLAGS_CATALYST) $(CFLAGS_LINENOISE)	$^ -o $@ -C CATALYST -C NO_ARGS  

catalyst.binary : catalyst.c cogstore.c loader.c sio.c cache.c
	catalina $(CFLAGS) $(CFLAGS_CATALYST) $^ -o $@ -C CATALYST -C NO_ARGS

# add this to the 'all' target
all :: catalyst

# =============

.PHONY : help
help : help$B

# add this to the 'all' target
all :: help

help$B : help.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 

# =============

.PHONY : rmdir
rmdir : rmdir$B

# add this to the 'all' target
all :: rmdir

rmdir$B : rmdir.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 

# =============

.PHONY : mkdir
mkdir : mkdir$B

# add this to the 'all' target
all :: mkdir

mkdir$B : mkdir.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 

# =============

.PHONY : rm
rm : rm$B

# add this to the 'all' target
all :: rm

rm$B : rm.c glob.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 

# =============

.PHONY : ls
ls : ls$B

# add this to the 'all' target
all :: ls

ls$B : ls.c glob.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 

# =============

.PHONY : cp
cp : cp$B

# add this to the 'all' target
all :: cp

cp$B : cp.c glob.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 

# =============

.PHONY : mv
mv : mv$B

# add this to the 'all' target
all :: mv

mv$B : mv.c glob.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 

# =============

.PHONY : cat
cat : cat$B

# add this to the 'all' target
all :: cat

cat$B : cat.c glob.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 

# =============

ifeq ("$(B)", ".bin")
.PHONY : set
set : set$B

# add this to the 'all' target
all :: set

set$B : set.c
	catalina $(CFLAGS) $(CFLAGS_UTILITIES) $^ -o $@ 
endif

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

