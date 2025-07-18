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
	CFLAGS += -lci -lthreads -C NO_MOUSE -C NO_FLOAT
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

.PHONY : dining_philosophers
dining_philosophers : dining_philosophers$B

# add this to the 'all' target
all :: dining_philosophers

# =============

.PHONY : resource_thread_lock
resource_thread_lock : resource_thread_lock$B

# add this to the 'all' target
all :: resource_thread_lock

# =============

.PHONY : test_dynamic_kernel
test_dynamic_kernel : test_dynamic_kernel$B

# add this to the 'all' target
all :: test_dynamic_kernel

# =============

.PHONY : test_multiple_threads
test_multiple_threads : test_multiple_threads$B

# add this to the 'all' target
all :: test_multiple_threads

# =============

.PHONY : test_maximum_threads
test_maximum_threads : test_maximum_threads$B

# add this to the 'all' target
all :: test_maximum_threads

# =============

.PHONY : test_thread_arguments
test_thread_arguments : test_thread_arguments$B

# add this to the 'all' target
all :: test_thread_arguments

# =============

.PHONY : test_thread_affinity
test_thread_affinity : test_thread_affinity$B

# add this to the 'all' target
all :: test_thread_affinity

# =============

.PHONY : test_thread_operations
test_thread_operations : test_thread_operations$B

# add this to the 'all' target
all :: test_thread_operations

# =============

.PHONY : test_thread_malloc
test_thread_malloc : test_thread_malloc$B

# add this to the 'all' target
all :: test_thread_malloc

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

