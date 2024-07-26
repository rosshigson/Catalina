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
	MV=move /y
	RM=-del /q /s
	CP=copy /y
else
	E=
	MV=mv
	RM=-rm -f
	CP=cp -f
endif

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")
	CFLAGS += -lci -C NO_MOUSE -C NO_FLOAT
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

.PHONY : dynamic_kernel
dynamic_kernel : dynamic_kernel$B

dynamic_kernel$B : dynamic_kernel.c cogutil.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: dynamic_kernel

# =============

.PHONY : resource_lock
resource_lock : resource_lock$B

resource_lock$B : resource_lock.c cogutil.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: resource_lock

# =============

.PHONY : multiple_cogs
multiple_cogs : multiple_cogs$B

multiple_cogs$B : multiple_cogs.c cogutil.c
	catalina $(CFLAGS) $^ -C NO_KEYBOARD -o $@

# add this to the 'all' target
all :: multiple_cogs

# =============

.PHONY : dining_philosophers
dining_philosophers : dining_philosophers$B

dining_philosophers$B : dining_philosophers.c cogutil.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: dining_philosophers

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

