#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

CLOCK=
SPINPP=spp
BINDUMP=bindump
PASM_ASSEMBLER=p2asm -v33

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

# assume P1
B=.binary

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
# (the platform is required to build the cogstart_XMM functions)
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


ifeq ($(HYPER), YES)
	CFLAGS += -lhyper
endif

ifeq ($(PSRAM), YES)
	CFLAGS += -lpsram
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
	CFLAGS +=
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
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

# =============

.PHONY : loader
loader : loader$B

loader.bin : loader.c
	-@catalina_env
	$(CC) $(CFLAGS) -p2 -lcx -o $@ $<

# add this to the 'all' target
all :: loader

# =============

.PHONY : dump
dump : dump$B

dump.bin : dump.c
	-@catalina_env
	$(CC) $(CFLAGS) -p2 -lcx -o $@ $<

# add this to the 'all' target
all :: dump

# =============

.PHONY : start
dump : start$B

start.bin : start.c csxmml.c csxmms.c csxmmlc.c csxmmsc.c
	-@catalina_env
	$(SPINPP) -D CACHED -D LARGE -D P2 -D $(PLATFORM) -I "$(LCCDIR)"/target/p2 "$(LCCDIR)"/target/p2/xmmd.t > xmmld.s
	$(PASM_ASSEMBLER) xmmld.s
	$(BINDUMP) xmmld.bin -p "   0x" -c > xmmld.inc
	$(RM) xmmld.bin
	$(SPINPP) -D CACHED -D SMALL -D P2 -D $(PLATFORM) -I "$(LCCDIR)"/target/p2 "$(LCCDIR)"/target/p2/xmmd.t > xmmsd.s
	$(PASM_ASSEMBLER) xmmsd.s
	$(BINDUMP) xmmsd.bin -p "   0x" -c > xmmsd.inc
	$(RM) xmmsd.bin
	$(SPINPP) -D CACHED -D P2 -D $(PLATFORM) -I "$(LCCDIR)"/target/p2 "$(LCCDIR)"/target/p2/xmmlib.t > xmml.s
	$(PASM_ASSEMBLER) xmml.s
	spinc -p2 -B2 -n XMM_LUT_LIBRARY xmml.bin >xmml.inc
	$(RM) xmml.bin

	$(CC) $(CFLAGS) -p2 -S csxmml.c csxmms.c csxmmlc.c csxmmsc.c
	$(CC) $(CFLAGS) -p2 -lcx -lmc -C $(CLOCK) -C CACHED -C NO_ENV csxmmlc.s -o $@ $<

# add this to the 'all' target
all :: start

# =============

.PHONY : args
dump : args$B

args.bin : args.c
	-@catalina_env
	$(CC) $(CFLAGS) -p2 -lc -C LARGE -o $@ $<

# add this to the 'all' target
all :: args

# =============

ifeq ($(HYPER), YES)
.PHONY : test
dump : test$B

test.bin : test.c
	-@catalina_env
	$(CC) $(CFLAGS) -p2 -lcx -o $@ $<

# add this to the 'all' target
all :: test
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
	$(RM) *.dbg
	$(RM) *.debug
	$(RM) *.inc
	$(RM) *.s
	$(RM) *.spin2

