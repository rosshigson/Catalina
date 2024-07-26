#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

# assume P1
B=.binary

# P2 if there is a P2 in CATALINA_DEFINES
ifeq (P2, $(findstring P2, $(CATALINA_DEFINE)))
	B=.bin
	CFLAGS += -p2 -y
endif

# P2 if there is a P2 in CATALINA_OPTIONS
ifeq (P2, $(findstring P2, $(CATALINA_OPTIONS)))
	B=.bin
	CFLAGS += -p2 -y
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
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : hello_lmm
hello_lmm : hello_lmm$B

hello_lmm.binary : hello_world.c run_hello_world.c
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x4000
	spinc -B2 -n LMM -c -l hello_world.binary >hello_world_lmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x4000 -C COMPACT
	spinc -B2 -n CMM -c -l hello_world.binary >hello_world_cmm.inc
	catalina $(CFLAGS) -lci run_hello_world.c -o $@

hello_lmm.bin : hello_world.c run_hello_world.c
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 120 -c -l hello_world.bin >hello_world_lmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 120 -c -l hello_world.bin >hello_world_cmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 120 -c -l hello_world.bin >hello_world_nmm.inc
	catalina $(CFLAGS) -lci run_hello_world.c -C TINY -o $@ 

# add this to the 'all' target
all :: hello_lmm

# ==================

.PHONY : hello_cmm
hello_cmm : hello_cmm$B

hello_cmm.binary : hello_world.c run_hello_world.c
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x4000
	spinc -B2 -n LMM -c -l hello_world.binary >hello_world_lmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS  hello_world.c -R 0x4000 -C COMPACT
	spinc -B2 -n CMM -c -l hello_world.binary >hello_world_cmm.inc
	catalina $(CFLAGS) -lci run_hello_world.c -C COMPACT -o $@

hello_cmm.bin : hello_world.c run_hello_world.c
	catalina $(CFLAGS) -lci -C NO_ARGS  hello_world.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 120 -c -l hello_world.bin >hello_world_lmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 120 -c -l hello_world.bin >hello_world_cmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 120 -c -l hello_world.bin >hello_world_nmm.inc
	catalina $(CFLAGS) -lci run_hello_world.c -C COMPACT -o $@

# add this to the 'all' target
all :: hello_cmm

# ==================

.PHONY : hello_nmm
hello_nmm : hello_nmm$B

# this target must exist even though it is empty :
hello_nmm.binary :

hello_nmm.bin : hello_world.c run_hello_world.c
	catalina $(CFLAGS) -lci -C NO_ARGS  hello_world.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 120 -c -l hello_world.bin >hello_world_lmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 120 -c -l hello_world.bin >hello_world_cmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 120 -c -l hello_world.bin >hello_world_nmm.inc
	catalina $(CFLAGS) -lci run_hello_world.c -C NATIVE -o $@

# add this to the 'all' target
all :: hello_nmm

# ==================

.PHONY : hello_small
hello_small : hello_small$B

hello_small.binary : hello_world.c run_hello_world.c
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x4000
	spinc -B2 -n LMM -c -l hello_world.binary >hello_world_lmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x4000 -C COMPACT
	spinc -B2 -n CMM -c -l hello_world.binary >hello_world_cmm.inc
	catalina $(CFLAGS) -lci run_hello_world.c -C SMALL -C CACHED_1K -o $@

# this target must exist even though it is empty :
hello_small.bin :

# add this to the 'all' target
all :: hello_small

# ==================

.PHONY : hello_large
hello_large : hello_large$B

hello_large.binary : hello_world.c run_hello_world.c
	catalina $(CFLAGS) -lci -C NO_ARGS  hello_world.c -R 0x4000
	spinc -B2 -n LMM -c -l hello_world.binary >hello_world_lmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS  hello_world.c -R 0x4000 -C COMPACT
	spinc -B2 -n CMM -c -l hello_world.binary >hello_world_cmm.inc
	catalina $(CFLAGS) -lci run_hello_world.c -C LARGE -C CACHED_1K -o $@

# this target must exist even though it is empty :
hello_large.bin :

# add this to the 'all' target
all :: hello_large

# ==================

.PHONY : hello_reserved
hello_reserved : hello_reserved$B

hello_reserved.binary : hello_world.c run_reserved.c
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x7334 -M64k -C TINY
	spinc -B2 -n LMM -c -l hello_world.binary >hello_world_lmm.inc
	catalina $(CFLAGS) -lci -C NO_ARGS hello_world.c -R 0x7334 -M64k -C COMPACT
	spinc -B2 -n CMM -c -l hello_world.binary >hello_world_cmm.inc
	catalina $(CFLAGS) -lci run_reserved.c -o $@ 

hello_reserved.bin : hello_world.c run_reserved.c
	catalina $(CFLAGS) -lci  -C NO_ARGS hello_world.c -R 0x7AE70 -C TINY
	spinc -p2 -B2 -n LMM -s 120 -c -l hello_world.bin >hello_world_lmm.inc
	catalina $(CFLAGS) -lci  -C NO_ARGS hello_world.c -R 0x7AE70 -C COMPACT
	spinc -p2 -B2 -n CMM -s 120 -c -l hello_world.bin >hello_world_cmm.inc
	catalina $(CFLAGS) -lci run_reserved.c -C NATIVE -o $@ 

# add this to the 'all' target
all :: hello_reserved

# ==================

.PHONY : primary_lmm
primary_lmm : primary_lmm$B

primary_lmm.binary : primary.c subsidiary_1.c subsidiary_2.c
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_1.c -O5 -R 0x6B24 -M64k -C COMPACT
	spinc -B2 -n SUB1 -s 200 -c -l subsidiary_1.binary >subsidiary_1.inc
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_2.c -O5 -R 0x5A24 -M64k 
	spinc -B2 -n SUB2 -s 200 -c -l subsidiary_2.binary >subsidiary_2.inc
	catalina $(CFLAGS)  -lc -lmb primary.c -O5 -o $@

primary_lmm.bin : primary.c subsidiary_1.c subsidiary_2.c
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_1.c -R 0x77460 -C COMPACT
	spinc -p2 -B2 -n SUB1 -s 200 -c -l subsidiary_1.bin >subsidiary_1.inc
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_2.c -R 0x72D60 -C TINY
	spinc -p2 -B2 -n SUB2 -s 200 -c -l subsidiary_2.bin >subsidiary_2.inc
	catalina $(CFLAGS) -lc -lmb primary.c -C TINY -o $@

# add this to the 'all' target
all :: primary_lmm

# ==================

.PHONY : primary_cmm
primary_cmm : primary_cmm$B

primary_cmm.binary : primary.c subsidiary_1.c subsidiary_2.c
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_1.c -R 0x68A4 -M64k -C COMPACT
	spinc -B2 -n SUB1 -s 200 -c -l subsidiary_1.binary >subsidiary_1.inc
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_2.c -R 0x5224 -M64k 
	spinc -B2 -n SUB2 -s 200 -c -l subsidiary_2.binary >subsidiary_2.inc
	catalina $(CFLAGS) -lc -lmb primary.c -C COMPACT -o $@

primary_cmm.bin : primary.c subsidiary_1.c subsidiary_2.c
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_1.c -R 0x77458 -C COMPACT
	spinc -p2 -B2 -n SUB1 -s 200 -c -l subsidiary_1.bin >subsidiary_1.inc
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_2.c -R 0x72D58 -C TINY
	spinc -p2 -B2 -n SUB2 -s 200 -c -l subsidiary_2.bin >subsidiary_2.inc
	catalina $(CFLAGS) -lc -lmb primary.c -C COMPACT -o $@ 

# add this to the 'all' target
all :: primary_cmm

# ==================

.PHONY : primary_nmm
primary_nmm : primary_nmm$B

# this target must exist even though it is empty :
primary_nmm.binary :

primary_nmm.bin : primary.c subsidiary_1.c subsidiary_2.c
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_1.c -R 0x77460  -C COMPACT
	spinc -p2 -B2 -n SUB1 -s 200 -c -l subsidiary_1.bin >subsidiary_1.inc
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_2.c -R 0x72D60 -C TINY
	spinc -p2 -B2 -n SUB2 -s 200 -c -l subsidiary_2.bin >subsidiary_2.inc
	catalina $(CFLAGS) -lc -lmb primary.c -C NATIVE -o $@

# add this to the 'all' target
all :: primary_nmm

# ==================

.PHONY : primary_small
primary_small : primary_small$B

primary_small.binary : primary.c subsidiary_1.c subsidiary_2.c
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_1.c -R 0x67A4 -M64k -C COMPACT
	spinc -B2 -n SUB1 -s 200 -c -l subsidiary_1.binary >subsidiary_1.inc
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_2.c -R 0x5124 -M64k 
	spinc -B2 -n SUB2 -s 200 -c -l subsidiary_2.binary >subsidiary_2.inc
	catalina $(CFLAGS) -lc -lmb primary.c -C SMALL -C CACHED_1K -o primary_small

# this target must exist even though it is empty :
primary_small.bin :

# add this to the 'all' target
all :: primary_small

# ==================

.PHONY : primary_large
primary_large : primary_large$B

primary_large.binary : primary.c subsidiary_1.c subsidiary_2.c
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_1.c -R 0x67A4 -M64k -C COMPACT
	spinc -B2 -n SUB1 -s 200 -c -l subsidiary_1.binary >subsidiary_1.inc
	catalina $(CFLAGS) -lc -lmb -C NO_ARGS subsidiary_2.c -R 0x5124 -M64k 
	spinc -B2 -n SUB2 -s 200 -c -l subsidiary_2.binary >subsidiary_2.inc
	catalina $(CFLAGS) -lc -lmb primary.c -C LARGE -C CACHED_1K -o $@

# this target must exist even though it is empty :
primary_large.bin :

# add this to the 'all' target
all :: primary_large

# ==================

.PHONY : run_xmm
run_xmm : run_xmm$B

run_xmm.binary : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x3000
	spinc -B2 -n LMM -s 8000 -c -l dining_philosophers.binary -o diners.lmm >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x3000 -C COMPACT
	spinc -B2 -n CMM -s 8000 -c -l dining_philosophers.binary -o diners.cmm >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lcix run_dining_philosophers.c -C LARGE -C CACHED_1K -o $@

run_xmm.bin : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -c -l dining_philosophers.bin -o diners.lmm >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin -o diners.nmm >dining_philosophers_nmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin -o diners.cmm >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lcix run_dining_philosophers.c -C LARGE -C CACHED_1K -o $@

# add this to the 'all' target
all :: run_xmm

# ==================

.PHONY : run_cmm
run_cmm : run_cmm$B

# this target must exist even though it is empty :
run_cmm.binary :

run_cmm.bin : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -c -l dining_philosophers.bin -o diners.lmm >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin -o diners.cmm >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin -o diners.nmm >dining_philosophers_nmm.inc
	catalina $(CFLAGS) -lcix run_dining_philosophers.c -C COMPACT -o $@

# add this to the 'all' target
all :: run_cmm

# ==================

.PHONY : run_lmm
run_lmm : run_lmm$B

# this target must exist even though it is empty :
run_lmm.binary :

run_lmm.bin : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -c -l dining_philosophers.bin -o diners.lmm >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin -o diners.cmm >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin -o diners.nmm >dining_philosophers_nmm.inc
	catalina $(CFLAGS) -lcix run_dining_philosophers.c -C TINY -o $@ 

# add this to the 'all' target
all :: run_lmm

# ==================

.PHONY : run_nmm
run_nmm : run_nmm$B

# this target must exist even though it is empty :
run_nmm.binary :

run_nmm.bin : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -c -l dining_philosophers.bin -o diners.lmm >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin -o diners.cmm >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin -o diners.nmm >dining_philosophers_nmm.inc
	catalina $(CFLAGS) -lcix run_dining_philosophers.c -C NATIVE -o $@ 


# add this to the 'all' target
all :: run_nmm

# ==================

.PHONY : run_diners_xmm
run_diners_xmm : run_diners_xmm$B

run_diners_xmm.binary : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads  -C NO_ARGS dining_philosophers.c -R 0x3000
	spinc -B2 -n LMM -s 8000 -c -f _threaded_cogstart_LMM_cog -l dining_philosophers.binary >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x3000 -C COMPACT
	spinc -B2 -n CMM -s 8000 -c -l dining_philosophers.binary >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lci run_dining_philosophers.c -C LARGE -C CACHED_1K -o $@

run_diners_xmm.bin : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads  -C NO_ARGS dining_philosophers.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -c -f _threaded_cogstart_LMM_cog -l dining_philosophers.bin >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_nmm.inc
	catalina $(CFLAGS) -lci run_dining_philosophers.c -C SMALL -C CACHED_1K -C NO_FLOAT -C NO_MOUSE -o $@

# add this to the 'all' target
all :: run_diners_xmm

# ==================

.PHONY : run_diners_cmm
run_diners_cmm : run_diners_cmm$B

# this target must exist even though it is empty :
run_diners_cmm.binary :

run_diners_cmm.bin : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -f _threaded_cogstart_LMM_cog -c -l dining_philosophers.bin >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_nmm.inc
	catalina $(CFLAGS) -lci run_dining_philosophers.c -C COMPACT -o $@

# add this to the 'all' target
all :: run_diners_cmm

# ==================

.PHONY : run_diners_lmm
run_diners_lmm : run_diners_lmm$B

# this target must exist even though it is empty :
run_diners_lmm.binary :

run_diners_lmm.bin : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -f _threaded_cogstart_LMM_cog -c -l dining_philosophers.bin >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_nmm.inc
	catalina $(CFLAGS) -lci run_dining_philosophers.c -C TINY -o $@ 

# add this to the 'all' target
all :: run_diners_lmm

# ==================

.PHONY : run_diners_nmm
run_diners_nmm : run_diners_nmm$B

# this target must exist even though it is empty :
run_diners_nmm.binary :

run_diners_nmm.bin : dining_philosophers.c run_dining_philosophers.c
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -f _threaded_cogstart_LMM_cog -c -l dining_philosophers.bin >dining_philosophers_lmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_cmm.inc
	catalina $(CFLAGS) -lci -lthreads -C NO_ARGS dining_philosophers.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l dining_philosophers.bin >dining_philosophers_nmm.inc
	catalina $(CFLAGS) -lci run_dining_philosophers.c -C NATIVE -o $@

# add this to the 'all' target
all :: run_diners_nmm

.PHONY : run_int_xmm
run_int_xmm : run_int_xmm$B

# this target must exist even though it is empty :
run_int_xmm.binary :

run_int_xmm.bin : test_interrupts_1.c run_test_interrupts_1.c
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -f _cogstart_LMM_cog -c -l test_interrupts_1.bin >test_interrupts_1_lmm.inc
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_cmm.inc
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_nmm.inc
	catalina $(CFLAGS) -lci run_test_interrupts_1.c -C LARGE -C CACHED_1K -C NO_MOUSE -C NO_FLOAT -o $@

# add this to the 'all' target
all :: run_int_xmm

# ==================

.PHONY : run_int_cmm
run_int_cmm : run_int_cmm$B

# this target must exist even though it is empty :
run_int_cmm.binary :

run_int_cmm.bin : test_interrupts_1.c run_test_interrupts_1.c
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -f _cogstart_LMM_cog -c -l test_interrupts_1.bin >test_interrupts_1_lmm.inc
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_cmm.inc
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_nmm.inc
	catalina $(CFLAGS) -lci run_test_interrupts_1.c -C COMPACT -o $@

# add this to the 'all' target
all :: run_int_cmm

# ==================

.PHONY : run_int_lmm
run_int_lmm : run_int_lmm$B

# this target must exist even though it is empty :
run_int_lmm.binary :

run_int_lmm.bin : test_interrupts_1.c run_test_interrupts_1.c
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -f _cogstart_LMM_cog -c -l test_interrupts_1.bin >test_interrupts_1_lmm.inc
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_cmm.inc
	catalina $(CFLAGS) -lci -lint -C NO_ARGS test_interrupts_1.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_nmm.inc
	catalina $(CFLAGS) -lci run_test_interrupts_1.c -C TINY -o $@ 

# add this to the 'all' target
all :: run_int_lmm

# ==================

.PHONY : run_int_nmm
run_int_nmm : run_int_nmm$B

# this target must exist even though it is empty :
run_int_nmm.binary :

run_int_nmm.bin : test_interrupts_1.c run_test_interrupts_1.c
	catalina $(CFLAGS) -lint -lci -C NO_ARGS test_interrupts_1.c -R 0x40000 -C TINY
	spinc -p2 -B2 -n LMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_lmm.inc
	catalina $(CFLAGS) -lint -lci -C NO_ARGS test_interrupts_1.c -R 0x40000 -C COMPACT
	spinc -p2 -B2 -n CMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_cmm.inc
	catalina $(CFLAGS) -lint -lci -C NO_ARGS test_interrupts_1.c -R 0x40000 -C NATIVE
	spinc -p2 -B2 -n NMM -s 8000 -c -l test_interrupts_1.bin >test_interrupts_1_nmm.inc
	catalina $(CFLAGS) -lci run_test_interrupts_1.c -C NATIVE -o $@

# add this to the 'all' target
all :: run_int_nmm


#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L
	$(RM) *.inc
	$(RM) diners.cmm diners.lmm diners.nmm

