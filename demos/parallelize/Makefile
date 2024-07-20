#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P1
B=.binary
CFLAGS = -D PROPELLER

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	B=.bin
	CFLAGS = -D __P2__
	CFLAGS += -p2
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	B=.bin
	CFLAGS = -D __P2__
	CFLAGS += -p2 
endif

# P2 if there is a -p2 in CATALINA_OPTIONS
ifeq (-p2, $(findstring -p2, $(CATALINA_OPTIONS)))
	B=.bin
	CFLAGS = -D __P2__
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
	CFLAGS += -lci -ltiny -Dprintf=t_printf -O5 -C NO_ARGS -C NO_FLOAT
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

.PHONY : test_1_s
test_1_s : test_1_s$B

test_1_s$B : test_1.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_1_s

# =============

.PHONY : test_1_p
test_1_p : test_1_p$B

test_1_p$B : test_1.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_1_p

# =============

.PHONY : test_2_s
test_2_s : test_2_s$B

test_2_s$B : test_2.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_2_s

# =============

.PHONY : test_2_p
test_2_p : test_2_p$B

test_2_p$B : test_2.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_2_p

# =============

.PHONY : test_3_s
test_3_s : test_3_s$B

test_3_s$B : test_3.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_3_s

# =============

.PHONY : test_3_p
test_3_p : test_3_p$B

test_3_p$B : test_3.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_3_p

# =============

.PHONY : test_4_s
test_4_s : test_4_s$B

test_4_s$B : test_4.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_4_s

# =============

.PHONY : test_4_p
test_4_p : test_4_p$B

test_4_p$B : test_4.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_4_p

# =============

.PHONY : test_5_s
test_5_s : test_5_s$B

test_5_s$B : test_5.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_5_s

# =============

.PHONY : test_5_p
test_5_p : test_5_p$B

test_5_p$B : test_5.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_5_p

# =============

.PHONY : test_6_s
test_6_s : test_6_s$B

test_6_s$B : test_6a.c test_6b.c test_6c.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_6_s

# =============

.PHONY : test_6_p
test_6_p : test_6_p$B

test_6_p$B : test_6a.c test_6b.c test_6c.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_6_p

# =============

.PHONY : test_7_s
test_7_s : test_7_s$B

test_7_s$B : test_7.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_7_s

# =============

.PHONY : test_7_p
test_7_p : test_7_p$B

test_7_p$B : test_7.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_7_p

# =============

.PHONY : test_8_s
test_8_s : test_8_s$B

test_8_s$B : test_8.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_8_s

# =============

.PHONY : test_8_p
test_8_p : test_8_p$B

test_8_p$B : test_8.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_8_p

# =============

.PHONY : test_9_s
test_9_s : test_9_s$B

test_9_s$B : test_9.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_9_s

# =============

.PHONY : test_9_p
test_9_p : test_9_p$B

test_9_p$B : test_9.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_9_p

# =============

.PHONY : test_10_s
test_10_s : test_10_s$B

test_10_s$B : test_10.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: test_10_s

# =============

.PHONY : test_10_p
test_10_p : test_10_p$B

test_10_p$B : test_10.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: test_10_p

# =============

.PHONY : sieve_s
sieve_s : sieve_s$B

sieve_s$B : sieve.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: sieve_s

# =============

.PHONY : sieve_p
sieve_p : sieve_p$B

sieve_p$B : sieve.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: sieve_p

# =============

.PHONY : fftbench_s
fftbench_s : fftbench_s$B

fftbench_s$B : fftbench.c
	catalina $(CFLAGS) $^ -o $@

# add this to the 'all' target
all :: fftbench_s

# =============

.PHONY : fftbench_p
fftbench_p : fftbench_p$B

fftbench_p$B : fftbench.c
	catalina $(CFLAGS) -lthreads -Z $^ -o $@

# add this to the 'all' target
all :: fftbench_p


#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

