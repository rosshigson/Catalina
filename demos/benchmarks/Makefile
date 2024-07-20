#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

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

# set up options specific to Windows or Linux
ifeq ($(OS), Windows_NT)
	E=.exe
else
	E=
endif

#set up some common utilities
RM=-rm -f
CP=cp -f

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")
	CFLAGS += -lci -ltiny -C $(CLOCK) -C NO_REBOOT -O5
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

.PHONY : fibo
fibo : fibo$B

# add this to the 'all' target
all :: fibo

# =============

.PHONY : ackerman_1
ackerman_1 : ackerman_1$B

# add this to the 'all' target
all :: ackerman_1

# =============

.PHONY : ackerman_2
ackerman_2 : ackerman_2$B

# add this to the 'all' target
all :: ackerman_2

# =============

.PHONY : dhry
dhry : dhry$B

dhry.binary : dhry.h dhry_1.c dhry_2.c 
	$(CC) -lc -lmb -Dprintf=t_printf -C $(CLOCK) -C NO_REBOOT -O5 dhry_1.c dhry_2.c -D MSC_CLOCK -DCLK_TCK=1000 -o $@

dhry.bin : dhry.h dhry_1.c dhry_2.c 
	$(CC) -lc -lmc -C $(CLOCK) -C NO_REBOOT -O5 -p2 dhry_1.c dhry_2.c -D MSC_CLOCK -DCLK_TCK=1000 -o $@


# add this to the 'all' target
all :: dhry

# =============

.PHONY : whet
whet : whet$B

whet.binary : whetstone.c
	$(CC) -lc -lmb -C $(CLOCK) -C NO_REBOOT -O5 whetstone.c -DPRINTSTART -o $@

whet.bin : whetstone.c 
	$(CC) -lc -lmc -C $(CLOCK) -C NO_REBOOT -O5 -p2 whetstone.c -DPRINTSTART -o $@


# add this to the 'all' target
all :: whet

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

