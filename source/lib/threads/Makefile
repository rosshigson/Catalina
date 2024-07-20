include ../Makefile.inc

CCFLAGS += -C libthreads

all:	tkarray.h \
	cog.s \
	tsc.s \
	tsccog.s \
	integer.s \
	unsigned.s \
	string.s \
	char.s \
	hex.s \
	binary.s \
	printf.s \
	wait.s \
	util.s \
	pattr.s \
	pbarrier.s \
	pcancel.s \
	pclock.s \
	pcond.s \
	pcattr.s \
	pcinit.s \
	pctimed.s \
	pcore.s \
	pjoin.s \
	pmutex.s \
	pmattr.s \
	pminit.s \
	pmtimed.s \
	pmtry.s \
	prdlockt.s \
	prwlock.s \
	prwinit.s \
	prwtry.s \
	pslock.s \
	pwrlockt.s
ifeq ($(COMPACT),TRUE)
	cp misc.ce misc.s
	cp ticks.ce ticks.s
	cp getticks.ce getticks.s
	cp yield.ce yield.s
	cp start.ce start.s
	cp stop.ce stop.s
	cp join.ce join.s
	cp check.ce check.s
	cp halt.ce halt.s
	cp uprev.ce uprev.s
	cp ucheck.ce ucheck.s
	cp extended.ce extended.s
	cp setext.ce setext.s
	cp affinity.ce affinity.s
	cp astop.ce astop.s
	cp achange.ce achange.s
	cp initlp.ce initlp.s
	cp poolset.ce poolset.s
	cp locknew.ce locknew.s
	cp lockret.ce lockret.s
	cp lockset.ce lockset.s
	cp lockclr.ce lockclr.s 
else
	$(SPINPP) $(SPINPPFLAGS) misc.e misc.s
	$(SPINPP) $(SPINPPFLAGS) ticks.e ticks.s
	$(SPINPP) $(SPINPPFLAGS) getticks.e getticks.s
	$(SPINPP) $(SPINPPFLAGS) yield.e yield.s
	$(SPINPP) $(SPINPPFLAGS) start.e start.s
	$(SPINPP) $(SPINPPFLAGS) stop.e stop.s
	$(SPINPP) $(SPINPPFLAGS) join.e join.s
	$(SPINPP) $(SPINPPFLAGS) check.e check.s
	$(SPINPP) $(SPINPPFLAGS) halt.e halt.s
	$(SPINPP) $(SPINPPFLAGS) uprev.e uprev.s
	$(SPINPP) $(SPINPPFLAGS) ucheck.e ucheck.s
	$(SPINPP) $(SPINPPFLAGS) extended.e extended.s
	$(SPINPP) $(SPINPPFLAGS) setext.e setext.s
	$(SPINPP) $(SPINPPFLAGS) affinity.e affinity.s
	$(SPINPP) $(SPINPPFLAGS) astop.e astop.s
	$(SPINPP) $(SPINPPFLAGS) achange.e achange.s
	$(SPINPP) $(SPINPPFLAGS) initlp.e initlp.s
	$(SPINPP) $(SPINPPFLAGS) poolset.e poolset.s
	$(SPINPP) $(SPINPPFLAGS) locknew.e locknew.s
	$(SPINPP) $(SPINPPFLAGS) lockret.e lockret.s
	$(SPINPP) $(SPINPPFLAGS) lockset.e lockset.s
	$(SPINPP) $(SPINPPFLAGS) lockclr.e lockclr.s 
endif

clean: 
	-rm -f tkarray.h *.inc *.binary *.bin *.lst *.s

tkarray.h:
ifeq ($(PROPELLER_2),TRUE)
	cp tkarray.p2 tkarray.h
	$(SPINPP) -D P2 -D libthreads -I ../../../target/p2 ../../../target/p2/cmmtd.t > cmmtd.s
	$(PASM_ASSEMBLER) cmmtd.s
	$(BINDUMP) cmmtd.bin -p "   0x" -c > cmmtd.inc
	-rm cmmtd.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target/p2 ../../../target/p2/cmmlib.t > cmmtl.s
	$(PASM_ASSEMBLER) cmmtl.s
	spinc -p2 -B2 -n CMM_LUT_LIBRARY cmmtl.bin >cmmtl.inc
	-rm cmmtl.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target/p2 ../../../target/p2/lmmtd.t > lmmtd.s
	$(PASM_ASSEMBLER) lmmtd.s
	$(BINDUMP) lmmtd.bin -p "   0x" -c > lmmtd.inc
	-rm lmmtd.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target/p2 ../../../target/p2/lmmlib.t > lmmtl.s
	$(PASM_ASSEMBLER) lmmtl.s
	spinc -p2 -B2 -n LMM_LUT_LIBRARY lmmtl.bin >lmmtl.inc
	-rm lmmtl.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target/p2 ../../../target/p2/nmmtd.t > nmmtd.s
	$(PASM_ASSEMBLER) nmmtd.s
	$(BINDUMP) nmmtd.bin -p "   0x" -c > nmmtd.inc
	-rm nmmtd.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target/p2 ../../../target/p2/nmmlib.t > nmmtl.s
	$(PASM_ASSEMBLER) nmmtl.s
	spinc -p2 -B2 -n NMM_LUT_LIBRARY nmmtl.bin >nmmtl.inc
	-rm nmmtl.bin
else
	cp tkarray.p1 tkarray.h
	$(PASM_ASSEMBLER)  ../../../target/p1 -b ../../../target/p1/Catalina_LMM_threaded_dynamic.spin -o lmmtd
	$(SPINC) lmmtd.binary > lmmtd.inc
	- dos2unix lmmtd.inc
	-rm lmmtd.binary
	$(PASM_ASSEMBLER) ../../../target/p1 -b ../../../target/p1/Catalina_CMM_threaded_dynamic.spin -o cmmtd
	$(SPINC) cmmtd.binary > cmmtd.inc
	- dos2unix cmmtd.inc
	-rm cmmtd.binary
	# dummy - there is no NMM on the P1!!!
	$(PASM_ASSEMBLER)  ../../../target/p1 -b ../../../target/p1/Catalina_LMM_threaded_dynamic.spin -o nmmtd
	$(SPINC) nmmtd.binary > nmmtd.inc
	- dos2unix nmmtd.inc
	-rm nmmtd.binary
endif
