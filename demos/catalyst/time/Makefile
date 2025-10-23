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

ifeq ("$(MYCFLAGS)", "")
ifeq ("$(P2FLAG)", "")
	MYCFLAGS = -C LARGE
else
	MYCFLAGS += $(P2FLAG)
	endif
endif

# set up options specific to Windows or Linux
ifeq ($(OS), Windows_NT)
	E=.exe
	RM=-del_del.bat
else
	E=
	RM=-rm -f
endif

#
# Default Rules and Options
# =========================

#set up default options if none specified
ifeq ("$(CATALINA_OPTIONS)", "")
ifeq ("$(P2FLAG)", "")
	MYCFLAGS += -lc -lm
else
	MYCFLAGS += -lc -lm
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

ifeq ("$(B)", ".bin")
.PHONY : time
time : time$B

time$B: time.c rtc_driver.c i2c_driver.c 
	$(CC) $(MYCFLAGS) $^ -o $@

# add this to the 'all' target
all :: time
endif

ifeq ("$(B)", ".bin")
.PHONY : ex_time1
ex_time1 : ex_time1$B

ex_time1$B: ex_time.c rtc_driver.c i2c_driver.c
	$(CC) $(MYCFLAGS) -C CLOCK $^ -o $@

# add this to the 'all' target
all :: ex_time1
endif

ifeq ("$(B)", ".bin")
.PHONY : ex_time2
ex_time2 : ex_time2$B

ex_time2$B: ex_time.c 
	$(CC) $(MYCFLAGS) -C RTC $^ -o $@

# add this to the 'all' target
all :: ex_time2
endif

ifeq ("$(B)", ".bin")
.PHONY : rtc_ex
rtc_ex : rtc_ex$B

rtc_ex$B: rtc_example.c rtc_driver.c i2c_driver.c
	$(CC) $(MYCFLAGS) $^ -o $@


# add this to the 'all' target
all :: rtc_ex
endif

ifneq ("$(B)", ".bin")

nothing :
	@echo Real-Time Clock not supported on the Propelller 1!

# add this to the 'all' target
all :: nothing

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

