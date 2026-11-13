#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P2
B=.bin
P=

# See if SD is in CATALINA_DEFINES
ifeq (SD, $(findstring SD, $(CATALINA_DEFINE)))
	SD_PLUGIN = SD
endif

# See if SD is in CATALINA_OPTIONS
ifeq (SD2, $(findstring SD, $(CATALINA_OPTIONS)))
	SD_PLUGIN = SD
endif

# See if SD2 is in CATALINA_DEFINES
ifeq (SD2, $(findstring SD2, $(CATALINA_DEFINE)))
	SD_PLUGIN = SD2
endif

# See if SD2 is in CATALINA_OPTIONS
ifeq (SD2, $(findstring SD2, $(CATALINA_OPTIONS)))
	SD_PLUGIN = SD2
endif

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

# make sure neither SD nor SD2 are specified
ifeq ($(SD_PLUGIN), SD)
$(error Do not specify SD on the command line)
endif

ifeq ($(SD_PLUGIN), SD2)
$(error Do not specify SD2 on the command line)
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
	CFLAGS += -W-Wp-wd82 -W-Wp-wd44 -C99 -O5
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

.PHONY : test_sd
test_sd : test_sd$B

test_sd$B: speedtest.c ff.c ffsystem.c ffunicode.c  diskio.c sd2_cat.c vol2par.c 
	catalina $(CFLAGS)  $^ -lc -lint64 -C SD -o $@

# add this to the 'all' target
all :: test_sd

.PHONY : test_sd2
test_sd2 : test_sd2$B

test_sd2$B: speedtest.c ff.c ffsystem.c ffunicode.c  diskio.c sd2_cat.c vol2par.c 
	catalina $(CFLAGS) $^ -lc -lint64 -C SD2 -o $@

# add this to the 'all' target
all :: test_sd2

.PHONY : test_c
test_c : test_c$B

test_c$B: speedtest.c ff.c ffsystem.c ffunicode.c  diskio.c sdmm_cat.c vol2par.c
	catalina $(CFLAGS) $^ -lc -lint64 -o $@

# add this to the 'all' target
all :: test_c

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

