#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

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
	RM=-del_del
else
	E=
	RM=-rm -f
endif

# if a platform is not explicity specified, extract the first 
# parameter in CATALINA_DEFINE as our platform
TMP_PLATFORM=$(PLATFORM)
ifeq ("$(TMP_PLATFORM)", "")
ifneq ("$(CATALINA_DEFINE)", "")
TMP_PLATFORM=$(firstword $(CATALINA_DEFINE))
else
TMP_PLATFORM=CUSTOM
endif
endif

# The HYDRA and HYBRID cannot use the serial port and XMM 
# at the same time, so default the HMI to the TV instead
ifeq ("$(TMP_PLATFORM)", "HYDRA")
HMI=TV
else
ifeq ("$(TMP_PLATFORM)", "HYBRID")
HMI=TV
else
HMI=TTY
endif
endif

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")
	CFLAGS += -lci -C $(HMI)
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

.PHONY : reversi
reversi : reversi$B

reversi.binary : reversi.c
	catalina $(CFLAGS) reversi.c -o $@

reversi.bin : reversi.c
	catalina $(CFLAGS) reversi.c -o $@

# add this to the 'all' target
all :: reversi

# ==================

ifneq ("$(B)",".bin")
.PHONY : reversi.eeprom
reversi.eeprom : reversi.c
	catalina $(CFLAGS) -e reversi.c

# add this to the 'all' target
all :: reversi.eeprom
endif

# ==================

.PHONY : reversi_eeprom
reversi_eeprom : reversi.c
	catalina $(CFLAGS) reversi.c -C EEPROM -o $@

# add this to the 'all' target
ifneq ("$(B)",".bin")
all :: reversi_eeprom
endif

# ==================

.PHONY : reversi_sdcard
reversi_sdcard : reversi.c
	catalina $(CFLAGS) reversi.c -C SDCARD -o $@

# add this to the 'all' target
ifneq ("$(B)",".bin")
all :: reversi_sdcard
endif

# ==================

.PHONY : reversi_flash_small
reversi_flash_small : reversi.c
	catalina $(CFLAGS) reversi.c -C FLASH -C SMALL -C CACHED_1K -o $@

# add this to the 'all' target
ifneq ("$(B)",".bin")
all :: reversi_flash_small
endif

# ==================

.PHONY : reversi_flash_large
reversi_flash_large : reversi.c
	catalina $(CFLAGS) reversi.c -C FLASH -C LARGE -C CACHED_1K -o $@

# add this to the 'all' target
ifneq ("$(B)",".bin")
all :: reversi_flash_large
endif

# ==================

.PHONY : reversi_sram_small
reversi_sram_small : reversi.c
	catalina $(CFLAGS) reversi.c -C SMALL -C CACHED_1K -o $@

# add this to the 'all' target
all :: reversi_sram_small

# ==================

.PHONY : reversi_sram_large
reversi_sram_large : reversi.c
	catalina $(CFLAGS) reversi.c -C LARGE -C CACHED_1K -o $@

# add this to the 'all' target
all :: reversi_sram_large

# ==================

.PHONY : reversi_xeprom
reversi_xeprom : reversi.c
	catalina $(CFLAGS) reversi.c -C XEPROM -C SMALL -C CACHED_1K -o $@

# add this to the 'all' target
ifneq ("$(B)",".bin")
all :: reversi_xeprom
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

