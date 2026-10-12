#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P2
B=.bin
P=

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
	CFLAGS += -p2 -lc -lmc -lint64 -C SD -W-Wp-wd82 -W-Wp-wd44 -C99 -O5
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

.PHONY : testpar0
testpar0 : testpar0$B

testpar0$B: testpar0.c ff.c ffsystem.c ffunicode.c  diskio.c sd_init.c sd_read.c sd_stat.c sd_write.c sd_ioctl.c sd_size.c crc7.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: testpar0

.PHONY : testpar1
testpar1 : testpar1$B

testpar1$B: testpar1.c ff.c ffsystem.c ffunicode.c  diskio.c sd_init.c sd_read.c sd_stat.c sd_write.c sd_ioctl.c sd_size.c crc7.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: testpar1

.PHONY : testmkfs
testmkfs : testmkfs$B

testmkfs$B: testmkfs.c ff.c ffsystem.c ffunicode.c  diskio.c sd_init.c sd_read.c sd_stat.c sd_write.c sd_ioctl.c sd_size.c crc7.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: testmkfs

.PHONY : testdisk
testdisk : testdisk$B

testdisk$B: testdisk.c ff.c ffsystem.c ffunicode.c  diskio.c sd_init.c sd_read.c sd_stat.c sd_write.c sd_ioctl.c sd_size.c crc7.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: testdisk

.PHONY : volcopy
volcopy : volcopy$B

volcopy$B: volcopy.c ff.c ffsystem.c ffunicode.c  diskio.c sd_init.c sd_read.c sd_stat.c sd_write.c sd_ioctl.c sd_size.c crc7.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: volcopy

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

