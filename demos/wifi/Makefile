#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P1
B=.binary

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	P2=TRUE
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	P2=TRUE
	B=.bin
	CFLAGS += -p2
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	P2=TRUE
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

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")

ifeq ("$B", ".binary")
	CFLAGS += -C ENABLE_WIFI
else
	CFLAGS += -C ENABLE_WIFI
endif

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

# Check if there is a COMPACT in CATALINA_DEFINES
ifeq (COMPACT, $(findstring COMPACT, $(CATALINA_DEFINE)))
	MODEL = COMPACT
endif

# Check if there is a COMPACT in CATALINA_OPTIONS
ifeq (COMPACT, $(findstring COMPACT, $(CATALINA_OPTIONS)))
	MODEL = COMPACT
endif

# Check if there is a NATIVE in CATALINA_DEFINES
ifeq (NATIVE, $(findstring NATIVE, $(CATALINA_DEFINE)))
	MODEL = NATIVE
endif

# Check if there is a NATIVE in CATALINA_OPTIONS
ifeq (NATIVE, $(findstring NATIVE, $(CATALINA_OPTIONS)))
	MODEL = NATIVE
endif

# Check if there is a TINY in CATALINA_DEFINES
ifeq (TINY, $(findstring TINY, $(CATALINA_DEFINE)))
	MODEL = TINY
endif

# Check if there is a TINY in CATALINA_OPTIONS
ifeq (TINY, $(findstring TINY, $(CATALINA_OPTIONS)))
	MODEL = TINY
endif

# Check if there is a LARGE in CATALINA_DEFINES
ifeq (LARGE, $(findstring LARGE, $(CATALINA_DEFINE)))
	MODEL = LARGE
endif

# Check if there is a LARGE in CATALINA_OPTIONS
ifeq (LARGE, $(findstring LARGE, $(CATALINA_OPTIONS)))
	MODEL = LARGE
endif

# Check if there is a SMALL in CATALINA_DEFINES
ifeq (SMALL, $(findstring SMALL, $(CATALINA_DEFINE)))
	MODEL = SMALL
endif

# Check if there is a SMALL in CATALINA_OPTIONS
ifeq (SMALL, $(findstring SMALL, $(CATALINA_OPTIONS)))
	MODEL = SMALL
endif

# If no model is specified
# then on a Propeller 1 use LARGE
# and on a Propeller 2 use COMPACT
ifeq ("$(MODEL)", "")
ifeq ($(P2), TRUE)
	MODEL = COMPACT
else
	MODEL = LARGE
endif
endif

ifeq ($(P2), TRUE)
# Check if there is an RTC in CATALINA_DEFINES
ifeq (RTC, $(findstring RTC, $(CATALINA_DEFINE)))
	CLOCK = RTC
endif

# Check if there is an RTC in CATALINA_OPTIONS
ifeq (RTC, $(findstring RTC, $(CATALINA_OPTIONS)))
	CLOCK = RTC
endif
endif

#if RTC not specified, use CLOCK
ifneq ($(CLOCK), RTC)
  CLOCK = CLOCK
endif

CFLAGS += -C $(MODEL) -C $(CLOCK) -C NO_MOUSE -W-w

ifeq ($(P2), TRUE)
	# could use -lserial8 here ...
  LIBS  = -lwifi -lmc -lcx -llua -lserial2
  LIBSX = -lwifi -lmc -lcx -lluax -lserial2
  LIBSW = -lwifi -lci -lserial2
else
  LIBS  = -lwifi -lm -lcx -llua -lserial4
  LIBSX = -lwifi -lm -lcx -lluax -lserial4
  LIBSW = -lwifi -lci -lserial4
endif

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

.PHONY : testwifi
testwifi : testwifi$B

testwifi$B  : testwifi.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: testwifi

# =============

.PHONY : testhttp
testhttp : testhttp$B

testhttp$B  : testhttp.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: testhttp

# =============

.PHONY : ws_client
ws_client : ws_client$B

ws_client$B  : ws_client.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: ws_client

# =============

.PHONY : ws_server
ws_server : ws_server$B

ws_server$B  : ws_server.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: ws_server

# =============

.PHONY : ws_ap_client
ws_ap_client : ws_ap_client$B

ws_ap_client$B  : ws_ap_client.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: ws_ap_client

# =============

.PHONY : ws_ap_server
ws_ap_server : ws_ap_server$B

ws_ap_server$B  : ws_ap_server.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: ws_ap_server

# =============

.PHONY : http_client
http_client : http_client$B

http_client$B  : http_client.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: http_client

# =============

.PHONY : http_server
http_server : http_server$B

http_server$B  : http_server.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: http_server

# =============

.PHONY : http_ap_client
http_ap_client : http_ap_client$B

http_ap_client$B  : http_ap_client.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: http_ap_client

# =============

.PHONY : http_ap_server
http_ap_server : http_ap_server$B

http_ap_server$B  : http_ap_server.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: http_ap_server

# =============

.PHONY : tcp_client
tcp_client : tcp_client$B

tcp_client$B  : tcp_client.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: tcp_client

# =============

.PHONY : tcp_server
tcp_server : tcp_server$B

tcp_server$B  : tcp_server.c
	catalina $(CFLAGS) $^ -o $@ $(LIBSW) -C NO_HMI

# add this to the 'all' target
all :: tcp_server

# =============

.PHONY : wlua
wlua : wlua$B

wlua$B: lua.c linit.c lwifi.c lserial.c
	$(CC) -o $@ $(CFLAGS) $(LIBS) $^ -M1M 

# add this to the 'all' target
all :: wlua 

# =============

.PHONY : wluax
wluax : wluax$B

wluax$B: luax.c linit.c lwifi.c lserial.c
	$(CC) -o $@ $(CFLAGS) $(LIBSX) $^ -M1M

# add this to the 'all' target
all :: wluax

# =============

.PHONY : pc_tcp_client
pc_tcp_client : pc_tcp_client$B

pc_tcp_client$B  : pc_tcp_client.c
	-gcc $^ -o $@

# add this to the 'all' target
all :: pc_tcp_client

# =============

.PHONY : pc_tcp_server
pc_tcp_server : pc_tcp_server$B

pc_tcp_server$B  : pc_tcp_server.c
	-gcc $^ -o $@

# add this to the 'all' target
all :: pc_tcp_server

# =============

.PHONY : pc_ws_client
pc_ws_client : pc_ws_client$B

pc_ws_client$B  : pc_ws_client.c
	-gcc $^ -o $@

# add this to the 'all' target
all :: pc_ws_client

# =============

# There is no pc_ws_server.c yet!

#.PHONY : pc_ws_server
#pc_ws_server : pc_ws_server$B

#pc_ws_server$B  : pc_ws_server.c
#	-gcc $^ -o $@

# add this to the 'all' target
#all :: pc_ws_server

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


