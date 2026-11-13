#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P2
B=.bin
P=

# Use SD2 plugin if SD2 is in CATALINA_DEFINES
ifeq (SD2, $(findstring SD2, $(CATALINA_DEFINE)))
	SD_PLUGIN = SD2
endif

# Use SD2 plugin if SD2 is in CATALINA_OPTIONS
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

# set up the SD plugin to use
ifeq ("$(SD_PLUGIN)", "")
  SD_PLUGIN = SD
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
	CFLAGS += -lm -W-Wp-wd82 -W-Wp-wd44 -C99
else
	CFLAGS += $(CATALINA_OPTIONS)
endif

# set up common options
B1=.binary
B2=.bin
E1=.eeprom
O=.ob
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

.PHONY : testpar0
testpar0 : testpar0$B

testpar0$B: testpar0.c
	catalina $(CFLAGS)  -C $(SD_PLUGIN) $^ -lcx2 -o $@

# add this to the 'all' target
all :: testpar0

.PHONY : testpar1
testpar1 : testpar1$B

testpar1$B: testpar1.c
	catalina $(CFLAGS)  -C $(SD_PLUGIN) $^ -lcx2 -o $@

# add this to the 'all' target
all :: testpar1

.PHONY : testmkfs
testmkfs : testmkfs$B

testmkfs$B: testmkfs.c
	catalina $(CFLAGS)  -C $(SD_PLUGIN) $^ -lcx2 -o $@

# add this to the 'all' target
all :: testmkfs

.PHONY : testdisk
testdisk : testdisk$B

testdisk$B: testdisk.c 
	catalina $(CFLAGS)  -C $(SD_PLUGIN) $^ -lcx2 -o $@

# add this to the 'all' target
all :: testdisk

.PHONY : volcopy
volcopy : volcopy$B

volcopy$B: volcopy.c 
	catalina $(CFLAGS)  -C $(SD_PLUGIN) $^ -lcx2 -o $@

# add this to the 'all' target
all :: volcopy


.PHONY : standalone_testpar0
standalone_testpar0 : standalone_testpar0$B

standalone_testpar0$B: testpar0.c ff.c ffsystem.c fftime.c ffunicode.c diskio.c sd2_cat.c vol2par.c
	catalina $(CFLAGS)  -C $(SD_PLUGIN) $^ -lc -lint64 -o $@

# add this to the 'all' target
all :: standalone_testpar0

.PHONY : fftime
fftime : fftime$B

fftime$B: fftime.c rtc_driver.c i2c_driver.c
	catalina $(CFLAGS)  -C $(SD_PLUGIN) $^ -lc -C CLOCK -D TEST_GETTIME -o $@

# add this to the 'all' target
all :: fftime


#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

