#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

P2FLAG=
MYLIBS=
MYCFLAGS=

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	P2FLAG   = -p2
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	P2FLAG   = -p2
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	P2FLAG   = -p2
endif

ifeq ("$(P2FLAG)", "")
	B=.binary
else
	B=.bin
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

# see if we have a supported platform, otherwise use P2_CUSTOM
PLATFORM = P2_CUSTOM
# see if P2_EDGE is in CATALINA_OPTIONS
ifeq (P2_EDGE, $(findstring P2_EDGE, $(CATALINA_OPTIONS)))
	PLATFORM = P2_EDGE
endif
# see if P2_EDGE is in CATALINA_DEFINE
ifeq (P2_EDGE, $(findstring P2_EDGE, $(CATALINA_DEFINE)))
	PLATFORM = P2_EDGE
endif
# see if P2_EVAL is in CATALINA_OPTIONS
ifeq (P2_EVAL, $(findstring P2_EVAL, $(CATALINA_OPTIONS)))
	PLATFORM = P2_EVAL
endif
# see if P2_EVAL is in CATALINA_DEFINE
ifeq (P2_EVAL, $(findstring P2_EVAL, $(CATALINA_DEFINE)))
	PLATFORM = P2_EVAL
endif

# for P2_EVAL, assume HYPER if neither HYPER nor PSRAM is specified
ifeq ($(PLATFORM), P2_EVAL)
ifneq ($(HYPER), YES)
ifneq ($(PSRAM), YES)
  HYPER = YES
endif
endif
endif

# for P2_EDGE, assume PSRAM if neither HYPER nor PSRAM is specified
ifeq ($(PLATFORM), P2_EDGE)
ifneq ($(HYPER), YES)
ifneq ($(PSRAM), YES)
  PSRAM = YES
endif
endif
endif

ifeq ("$(MYCFLAGS)", "")
ifeq ("$(P2FLAG)", "")
	MYCFLAGS = -C LARGE
else
	MYCFLAGS += $(P2FLAG)
	endif
endif

ifeq ($(HYPER), YES)
	MYCFLAGS += -lhyper
endif

ifeq ($(PSRAM), YES)
	MYCFLAGS += -lpsram
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
ifeq ("$(P2FLAG)", "")
	MYCFLAGS += -lcx
else
	MYCFLAGS += -lcx
endif
else
	MYCFLAGS += $(CATALINA_OPTIONS)
endif

# set up common options
B1=.binary
B2=.bin
E1=.eeprom
O=.obj
L=.lst
CC=catalina
GCC=gcc

#set up pattern rules
%.binary : %.c
	-@catalina_env
	$(CC) $(MYCFLAGS) -o $@ $<

%.eeprom : %.c
	-@catalina_env
	$(CC) -e $(MYCFLAGS) -o $@ $<

%.bin : %.c
	-@catalina_env
	$(CC) $(MYCFLAGS) -p2 -o $@ $<

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

ifeq ("$(B)", ".bin")
.PHONY : sd_test1
sd_test1 : sd_test1$B

sd_test1$B: sd_test.c 
	$(CC) $(MYCFLAGS) -Llocal -C WRITE_BACK $^ -o $@

# add this to the 'all' target
all :: sd_test1

.PHONY : sd_test2
sd_test2 : sd_test2$B

sd_test2$B: sd_test.c 
	$(CC) $(MYCFLAGS) -Llocal $^ -o $@

# add this to the 'all' target
all :: sd_test2

.PHONY : sd_test3
sd_test3 : sd_test3$B

sd_test3$B: sd_test.c 
	$(CC) $(MYCFLAGS) $^ -o $@

# add this to the 'all' target
all :: sd_test3
endif

ifneq ("$(B)", ".bin")

nothing :
	@echo SD Cache not supported on the Propeller 1!

# add this to the 'all' target
all :: nothing

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

