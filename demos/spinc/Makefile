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
	MV=cmd //c move //y
	RM=-cmd //c del //q //s
	CP=cmd //c copy //y
else
	E=
	MV=mv
	RM=-rm -f
	CP=cp -f
endif

# if platform is not explicity specified, extract the first parameter 
# in CATALINA_DEFINE as platform, otherwise default to CUSTOM
TMP_PLATFORM=
ifeq ("$(TMP_PLATFORM)", "")
ifneq ("$(CATALINA_DEFINE)", "")
TMP_PLATFORM=$(firstword $(CATALINA_DEFINE))
else
TMP_PLATFORM=CUSTOM
endif
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
# Test for P1 
# ===========

ifneq ("$B", ".binary")
$(warning WARNING: THESE PROGRAMS REQUIRE A PROPELLER 1)
endif

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : run_flash
run_flash : run_flash$B

run_flash$B : run_flash.c utilities.c
	spinnaker -p -a flash.spin -b
	spinc flash.binary -a -n FLASH > flash.h
	catalina -lci run_flash.c utilities.c -C LORES_TV -C NO_MOUSE -C NO_ARGS -o $@

# add this to the 'all' target
ifeq ("$(B)",".binary")
all :: run_flash
endif

# =============

.PHONY : run_hello
run_hello : run_hello$B

ifeq ("$(B)",".binary")
# add this to the 'all' target
all :: run_hello
endif

run_hello$B : run_hello.c utilities.c
	spinnaker -p -a hello.spin -I "$(TARGET)" -b 
	spinc hello.binary -a -n HELLO > hello.h
	catalina -lci run_hello.c utilities.c -C NO_MOUSE -C NO_ARGS -o $@

# =============

.PHONY : run_demo
run_demo : run_demo$B

# add this to the 'all' target
ifeq ("$(B)",".binary")
all :: run_demo
endif

run_demo$B : run_demo.c utilities.c
	spinnaker -p -a TV_Text_Half_Height_Demo.spin -b
	spinc TV_Text_Half_Height_Demo.binary -c -s 200 -n DEMO > demo.c
	catalina -lci run_demo.c utilities.c  -C PC -o $@

# =============

.PHONY : run_kb_tv
run_kb_tv : run_kb_tv$B

# add this to the 'all' target
ifeq ("$(B)",".binary")
all :: run_kb_tv
endif

run_kb_tv$B : run_kb_tv.c utilities.c
	spinnaker -p -a KB_TV.spin -b
	spinc KB_TV.binary -c -n KB_TV -s 200 > kb_tv.c
	catalina -lc run_kb_tv.c utilities.c -C NO_HMI -o $@

# =============

.PHONY : run_tiny_hmi
run_tiny_hmi : run_tiny_hmi$B

# add this to the 'all' target
ifeq ("$(B)",".binary")
all :: run_tiny_hmi
endif

run_tiny_hmi$B : run_tiny_hmi.c utilities.c
	spinnaker -p -a TINY_HMI.spin -I "$(TARGET)" -b -D FULL_LAYER2
	spinc TINY_HMI.binary -t -n TINY_HMI -s 200 > tiny_hmi.c
	catalina -lc run_tiny_hmi.c utilities.c -C NO_HMI -o $@

# =============

.PHONY : run_PNut
run_PNut : run_PNut$B

# add this to the 'all' target
ifeq ("$(B)",".binary")
all :: run_PNut
endif

run_PNut$B : run_PNut.c coginit_PNut.c utilities.c
	spinnaker -p -a PNut_interpreter.spin -b
	spinc PNut_interpreter.binary > PNut_interpreter.h
	spinnaker -p -a flash.spin -b
	spinc flash.binary -a -n FLASH > flash.h
	catalina -lci run_PNut.c coginit_PNut.c utilities.c -C LORES_TV -C NO_MOUSE -C NO_ARGS -o $@

# =============

.PHONY : test_spinc
test_spinc : test_spinc$B

# add this to the 'all' target
ifeq ("$(B)",".binary")
all :: test_spinc
endif

test_spinc$B : test_spinc.c flash_led.spin
	spinnaker -p -a flash_led.spin -b -D $(TMP_PLATFORM) 
	spinc flash_led.binary > flash_led_array.h
	-dos2unix flash_led_array.h
	catalina -lc -I. -C NO_HMI test_spinc.c -o $@

# =============

.PHONY : test_pasm
test_pasm : test_pasm$B

# add this to the 'all' target
ifeq ("$(B)",".binary")
all :: test_pasm
endif

test_pasm$B : test_pasm.c flash_led.spin
	$(CP) flash_led.pasm flash_led.obj
	catalina -lc -y -C NO_HMI test_pasm.c flash_led.obj -o $@

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

