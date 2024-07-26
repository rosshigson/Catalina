#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

P2FLAG=
MYLIBS=
MYCFLAGS=

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	P2FLAG   = -p2
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	P2FLAG   = -p2
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	P2FLAG   = -p2
endif

ifeq ("$(P2FLAG)", "")
	B=.binary
else
	B=.bin
endif

# set up options specific to Windows or Linux
ifeq ($(OS), Windows_NT)
	E=.exe
else
	E=
endif

ifeq ("$(MYCFLAGS)", "")
ifeq ("$(P2FLAG)", "")
	MYCFLAGS = -C LARGE
else
	MYCFLAGS += $(P2FLAG)
	endif
endif

ifeq ($(OS), Windows_NT)
	MV=move /y
	RM=del /q /s
	CP=copy /y
else
	MV=mv
	RM=-rm -f
	CP=cp -f
endif

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")
ifeq ("$(P2FLAG)", "")
	MYCFLAGS += -ltty256 -lcx -C NO_HMI
else
	MYCFLAGS += -lserial2 -lcx -C NO_HMI
endif
else
	MYCFLAGS += $(CATALINA_OPTIONS)
endif

# set up common options
B1=.binary
B2=.bin
E1=.eeprom
O=.obj
L=.lst
CC=catalina
GCC=gcc

#set up pattern rules
%.binary : %.c
	-@catalina_env
	$(CC) $(MYCFLAGS) -o $@ $<

%.eeprom : %.c
	-@catalina_env
	$(CC) -e $(MYCFLAGS) -o $@ $<

%.bin : %.c
	-@catalina_env
	$(CC) $(MYCFLAGS) -p2 -o $@ $<

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : propeller_receive
propeller_receive : receive$B

receive$B: fymodem.c
	$(CC) $(MYCFLAGS) $^ -D YMODEM_RECEIVE -o $@

# add this to the 'all' target
all :: propeller_receive

# =============

.PHONY : propeller_send
propeller_send : send$B

send$B: fymodem.c 
	$(CC) $(MYCFLAGS) $^ -D YMODEM_SEND -o $@


# add this to the 'all' target
all :: propeller_send

# =============

.PHONY : host_receive
host_receive : receive$E

receive$E: fymodem.c rs232.c
	-$(GCC) $^ -D YMODEM_RECEIVE -o $@

# add this to the 'all' target
all :: host_receive

# =============

.PHONY : host_send
host_send : send$E

send$E: fymodem.c rs232.c
	-$(GCC) $^ -D YMODEM_SEND -o $@


# add this to the 'all' target
all :: host_send

# =============

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L
	$(RM) send.exe receive.exe send receive

