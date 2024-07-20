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
	CFLAGS += -lci -lserial4 
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

ifeq ("$B", ".bin")
$(warning WARNING: These programs require a Propeller 1)
endif


#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : test_serial4_1
test_serial4_1 : test_serial4_1$B

test_serial4_1$B : test_serial4.c
	catalina $(CFLAGS) $^ -o $@ -C NO_HMI

# add this to the 'all' target
all :: test_serial4_1

# =============

.PHONY : test_serial4_2
test_serial4_2 : test_serial4_2$B

test_serial4_2$B : test_serial4.c
	catalina $(CFLAGS) -lthreads $^ -o $@  -C TV

# add this to the 'all' target
all :: test_serial4_2

# =============

.PHONY : test_serial4_3
test_serial4_3 : test_serial4_3$B

test_serial4_3$B  : test_serial4.spin
	spinnaker -p -a -I "$(LCCDIR)\target\p1" $^ -b -o test_serial4_3 -D S4_SPIN 
# add this to the 'all' target
all :: test_serial4_3

# =============

.PHONY : test_serial4_count
test_serial4_count : test_serial4_count$B

test_serial4_count$B  : test_serial4_count.c
	catalina $(CFLAGS) $^ -o $@ -C NO_HMI

# add this to the 'all' target
all :: test_serial4_count

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L


