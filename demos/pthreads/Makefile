#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

CLOCK=

# assume P1
B=.binary

# Check if there is an RTC in CATALINA_DEFINES
ifeq (RTC, $(findstring RTC, $(CATALINA_DEFINE)))
	CLOCK   = RTC
endif

# Check if there is an RTC in CATALINA_OPTIONS
ifeq (RTC, $(findstring RTC, $(CATALINA_OPTIONS)))
	CLOCK   = RTC
endif

#if RTC not specified, use CLOCK
ifneq ("$(CLOCK)", "RTC")
  CLOCK   = CLOCK
endif

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
	CC=catalina.exe 
	CB=catbind.exe
else
	CC=catalina
	CB=catbind
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
	CFLAGS += -C NO_REBOOT -C $(CLOCK) 
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
	$(CC) $(CFLAGS) -lci -lthreads -D"printf=pthread_printf" -o $@ $<

%.eeprom : %.c
	-@catalina_env
	$(CC) -e $(CFLAGS) -lci -lthreads -D"printf=pthread_printf" -o $@ $<

%.bin : %.c
	-@catalina_env
	$(CC) $(CFLAGS) -p2 -lci -lthreads -D"printf=pthread_printf" -o $@ $<

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : create_example_1
create_example_1 : create_example_1$B

# add this to the 'all' target
all :: create_example_1

# =============

.PHONY : create_example_2
create_example_2 : create_example_2$B

# add this to the 'all' target
all :: create_example_2

# =============


.PHONY : cond_example_1
cond_example_1 : cond_example_1$B

# add this to the 'all' target
all :: cond_example_1

# =============

.PHONY : cond_example_2
cond_example_2 : cond_example_2$B

# add this to the 'all' target
all :: cond_example_2

# =============


.PHONY : cond_example_3
cond_example_3 : cond_example_3$B

# add this to the 'all' target
all :: cond_example_3

# =============

.PHONY : cond_example_4
cond_example_4 : cond_example_4$B

# add this to the 'all' target
all :: cond_example_4

# =============

.PHONY : barrier_example_1
barrier_example_1 : barrier_example_1$B

# add this to the 'all' target
all :: barrier_example_1

# =============

.PHONY : barrier_example_2
barrier_example_2 : barrier_example_2$B

# add this to the 'all' target
all :: barrier_example_2

# =============


.PHONY : barrier_example_3
barrier_example_3 : barrier_example_3$B

# add this to the 'all' target
all :: barrier_example_3

# =============

.PHONY : join_example_1
join_example_1 : join_example_1$B

# add this to the 'all' target
all :: join_example_1

# =============

.PHONY : join_example_2
join_example_2 : join_example_2$B

# add this to the 'all' target
all :: join_example_2

# =============

.PHONY : mutex_example_1
mutex_example_1 : mutex_example_1$B

# add this to the 'all' target
all :: mutex_example_1

# =============

.PHONY : mutex_example_2
mutex_example_2 : mutex_example_2$B

# add this to the 'all' target
all :: mutex_example_2

# =============

.PHONY : timed_mutex_example_1
timed_mutex_example_1 : timed_mutex_example_1$B

# add this to the 'all' target
all :: timed_mutex_example_1

# =============

.PHONY : recursive_mutex_example_1
recursive_mutex_example_1 : recursive_mutex_example_1$B

# add this to the 'all' target
all :: recursive_mutex_example_1

# =============

.PHONY : spinlock_example_1
spinlock_example_1 : spinlock_example_1$B

# add this to the 'all' target
all :: spinlock_example_1

# =============

.PHONY : rwlock_example_1
rwlock_example_1 : rwlock_example_1$B

# add this to the 'all' target
all :: rwlock_example_1

# =============

.PHONY : rwlock_example_2
rwlock_example_2 : rwlock_example_2$B

# add this to the 'all' target
all :: rwlock_example_2

# =============

.PHONY : rwlock_example_3
rwlock_example_3 : rwlock_example_3$B

# add this to the 'all' target
all :: rwlock_example_3

# =============

.PHONY : test_max_pthreads
test_max_pthreads : test_max_pthreads$B

# add this to the 'all' target
all :: test_max_pthreads

# =============
.PHONY : dotprod_mutex
dotprod_mutex : dotprod_mutex$B
dotprod_mutex.bin : dotprod_mutex.c
	$(CC) -lc -lm -lthreads -C NO_REBOOT -C $(CLOCK) -D"printf=pthread_printf" -C NO_REBOOT -p2 -o $@ $<

dotprod_mutex.binary : dotprod_mutex.c
	$(CC) -lc -lm -lthreads -C NO_REBOOT -C $(CLOCK) -D"printf=pthread_printf" -C NO_REBOOT -o $@ $<

# add this to the 'all' target
all :: dotprod_mutex

# =============

.PHONY : dotprod_serial
dotprod_serial : dotprod_serial$B
dotprod_serial.bin : dotprod_serial.c
	-@catalina_env
	$(CC) -lc -lm -C NO_REBOOT -p2 -o $@ $<

dotprod_serial.binary : dotprod_serial.c
	-@catalina_env
	$(CC) -lc -lm -C NO_REBOOT -o $@ $<

# add this to the 'all' target
all :: dotprod_serial

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
