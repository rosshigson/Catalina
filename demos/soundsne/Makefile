#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P2
B=.bin

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
	CFLAGS += -p2 -lci -lsoundsne 
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
# Test for P2 
# ===========

ifneq ("$B", ".bin")
$(warning WARNING: These programs require a Propeller 2)
endif


#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile


# =============

.PHONY : sne_test
sne_test : sne_test$B

# add this to the 'all' target
all :: sne_test

sne_test$B : sne_test.c
	catalina $(CFLAGS) $^ -o $@

.PHONY : vgm_test
vgm_test : vgm_test$B

# add this to the 'all' target
all :: vgm_test

vgm_test$B : vgm_test.c
	catalina $(CFLAGS) $^ -o $@

.PHONY : md_play
md_play : md_play$B

# add this to the 'all' target
all :: md_play

md_play$B : md_play.c
	catalina $(CFLAGS) -C SNE_FREQUENCY=4000000 $^ -o $@

.PHONY : md_noise
md_noise : md_noise$B

# add this to the 'all' target
all :: md_noise

md_noise$B : md_noise.c
	catalina $(CFLAGS) -C SNE_FREQUENCY=4000000 $^ -o $@

.PHONY : md_adsr
md_adsr : md_adsr$B

# add this to the 'all' target
all :: md_adsr

md_adsr$B : md_adsr.c
	catalina $(CFLAGS) -C SNE_FREQUENCY=4000000 $^ -o $@

.PHONY : sfx_test
sfx_test : sfx_test$B

# add this to the 'all' target
all :: sfx_test

sfx_test$B : sfx_test.c
	catalina $(CFLAGS) $^ -o $@

.PHONY : spacewar
spacewar : spacewar$B

spacewar$B : spacewar.c
	catalina $(CFLAGS) -C HD_VGA -C MHZ_297 -lgraphic2 $^ -o $@

# add this to the 'all' target
all :: spacewar

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

