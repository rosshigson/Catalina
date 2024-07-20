#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P1
B=.binary

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	B=.bin
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	B=.bin
	CFLAGS += -p2
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
	CFLAGS += -lci -C TTY -y
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

.PHONY : test_inline_pasm_1
test_inline_pasm_1 : test_inline_pasm_1$B

test_inline_pasm_1.binary : test_inline_pasm_1.c
	$(CC) $(CFLAGS) -C TINY -o $@ $<

test_inline_pasm_1.bin : test_inline_pasm_1.c
	$(CC) $(CFLAGS) -C TINY -p2 -o $@ $<

# add this to the 'all' target
all :: test_inline_pasm_1

# ==================

.PHONY : test_inline_pasm_2
test_inline_pasm_2 : test_inline_pasm_2$B

test_inline_pasm_2.binary : test_inline_pasm_2.c
	$(CC) $(CFLAGS) -C COMPACT -o $@ $<

test_inline_pasm_2.bin : test_inline_pasm_2.c
	$(CC) $(CFLAGS) -C COMPACT -p2 -o $@ $<

# add this to the 'all' target
all :: test_inline_pasm_2

# ==================

.PHONY : test_inline_pasm_3
test_inline_pasm_3 : test_inline_pasm_3$B

# add this to the 'all' target
all :: test_inline_pasm_3

# ==================

.PHONY : test_inline_pasm_4
test_inline_pasm_4 : test_inline_pasm_4$B

test_inline_pasm_4.binary : test_inline_pasm_4.c
	$(CC) $(CFLAGS) -C COMPACT -o $@ $<

test_inline_pasm_4.bin : test_inline_pasm_4.c
	$(CC) $(CFLAGS) -C COMPACT -p2 -o $@ $<

# add this to the 'all' target
all :: test_inline_pasm_4

# ==================

.PHONY : test_inline_pasm_5
test_inline_pasm_5 : test_inline_pasm_5$B

test_inline_pasm_5.binary : test_inline_pasm_5.c
	$(CC) $(CFLAGS) -C COMPACT -o $@ $<

test_inline_pasm_5.bin : test_inline_pasm_5.c
	$(CC) $(CFLAGS) -C COMPACT -p2 -o $@ $<

# add this to the 'all' target
all :: test_inline_pasm_5

# ==================

.PHONY : test_inline_pasm_6
test_inline_pasm_6 : test_inline_pasm_6$B

# add this to the 'all' target
all :: test_inline_pasm_6

# ==================

.PHONY : test_inline_pasm_7
test_inline_pasm_7 : test_inline_pasm_7$B

# add this to the 'all' target
all :: test_inline_pasm_7

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

