include ../Makefile.inc

all:	darray.h \
	tkarray.h \
	overlay.s \
	overlayu.s \
	servlock.s \
	csc.s \
	cscc.s \
	cscmm.s \
	cscmmc.s \
	cslmm.s \
	cslmmc.s \
	csnmm.s \
	csnmmc.s \
	dsptch_c.s \
	dsptch_l.s \
	tcscmmc.s \
	tcslmmc.s \
	tcsnmmc.s \
	kclear.s \
	knew.s \
	kready.s \
	kwait.s \
	kget.s \
	kpresent.s \
	kstate.s \
	mabs.s \
	mbutton.s \
	mbuttons.s \
	mdelta.s \
	mpresent.s \
	mreset.s \
	enhm.s \
	plugname.s \
	plgshort.s \
	plglong.s \
	plglong2.s \
	service.s \
	svcshort.s \
	svclong.s \
	svclong2.s \
	tbin.s \
	tfloat.s \
	thex.s \
	tscroll.s \
	tunsign.s \
	tchar.s \
	tgeometr.s \
	tinteger.s \
	tsetpos.s \
	tcolor.s \
	tcolorfg.s \
	tcolorbg.s \
	tgetpos.s \
	tmode.s \
	tstring.s \
	tprintf.s \
	setfreq.s \
	getclock.s \
	settime.s \
	gettime.s \
	rtcdebug.s \
	secread.s \
	secwrite.s \
	getticks.s \
	gamstart.s \
	gamstop.s \
	cic.s \
	cicc.s \
	cis.s \
	cisc.s \
	getrand.s \
	getrealrand.s \
	pins.s \
	waitums.s \
	hub_malloc.s \
	aligns.s \
	base64.s

ifeq ($(COMPACT),TRUE)
	cp waitvid.ce waitvid.s
	cp waitcnt.ce waitcnt.s
	cp waitpeq.ce waitpeq.s
	cp waitpne.ce waitpne.s
	cp lockclr.ce lockclr.s
	cp lockset.ce lockset.s
	cp locknew.ce locknew.s
	cp lockret.ce lockret.s
	cp memlock.ce memlock.s
	cp acquire.ce acquire.s
	cp rellock.ce rellock.s
	cp coginit.ce coginit.s
	cp cogstop.ce cogstop.s
	cp cogid.ce cogid.s
	cp cnt.ce cnt.s
	cp ina.ce ina.s
	cp inb.ce inb.s
	cp dira.ce dira.s
	cp dirb.ce dirb.s
	cp outa.ce outa.s
	cp outb.ce outb.s
	cp frqa.ce frqa.s
	cp frqb.ce frqb.s
	cp ctra.ce ctra.s
	cp ctrb.ce ctrb.s
	cp phsa.ce phsa.s
	cp phsb.ce phsb.s
	cp vcfg.ce vcfg.s
	cp vscl.ce vscl.s
	cp clkfreq.ce clkfreq.s
	cp clkmode.ce clkmode.s
	cp clkinit.ce clkinit.s
	cp registry.ce registry.s
	cp register.ce register.s
	cp unreg.ce unreg.s
	cp locate.ce locate.s
	cp reqstat.ce reqstat.s
else
	$(SPINPP) $(SPINPPFLAGS) waitvid.e > waitvid.s
	$(SPINPP) $(SPINPPFLAGS) waitcnt.e > waitcnt.s
	$(SPINPP) $(SPINPPFLAGS) waitpeq.e > waitpeq.s
	$(SPINPP) $(SPINPPFLAGS) waitpne.e > waitpne.s
	$(SPINPP) $(SPINPPFLAGS) lockclr.e > lockclr.s
	$(SPINPP) $(SPINPPFLAGS) lockset.e > lockset.s
	$(SPINPP) $(SPINPPFLAGS) locknew.e > locknew.s
	$(SPINPP) $(SPINPPFLAGS) lockret.e > lockret.s
	$(SPINPP) $(SPINPPFLAGS) memlock.e > memlock.s
	$(SPINPP) $(SPINPPFLAGS) acquire.e > acquire.s
	$(SPINPP) $(SPINPPFLAGS) rellock.e > rellock.s
	$(SPINPP) $(SPINPPFLAGS) coginit.e > coginit.s
	$(SPINPP) $(SPINPPFLAGS) cogstop.e > cogstop.s
	$(SPINPP) $(SPINPPFLAGS) cogid.e > cogid.s
	$(SPINPP) $(SPINPPFLAGS) cnt.e > cnt.s
	$(SPINPP) $(SPINPPFLAGS) ina.e > ina.s
	$(SPINPP) $(SPINPPFLAGS) inb.e > inb.s
	$(SPINPP) $(SPINPPFLAGS) dira.e > dira.s
	$(SPINPP) $(SPINPPFLAGS) dirb.e > dirb.s
	$(SPINPP) $(SPINPPFLAGS) outa.e > outa.s
	$(SPINPP) $(SPINPPFLAGS) outb.e > outb.s
	$(SPINPP) $(SPINPPFLAGS) frqa.e > frqa.s
	$(SPINPP) $(SPINPPFLAGS) frqb.e > frqb.s
	$(SPINPP) $(SPINPPFLAGS) ctra.e > ctra.s
	$(SPINPP) $(SPINPPFLAGS) ctrb.e > ctrb.s
	$(SPINPP) $(SPINPPFLAGS) phsa.e > phsa.s
	$(SPINPP) $(SPINPPFLAGS) phsb.e > phsb.s
	$(SPINPP) $(SPINPPFLAGS) vcfg.e > vcfg.s
	$(SPINPP) $(SPINPPFLAGS) vscl.e > vscl.s
	$(SPINPP) $(SPINPPFLAGS) clkfreq.e > clkfreq.s
	$(SPINPP) $(SPINPPFLAGS) clkmode.e > clkmode.s
	$(SPINPP) $(SPINPPFLAGS) clkinit.e > clkinit.s
	$(SPINPP) $(SPINPPFLAGS) registry.e > registry.s
	$(SPINPP) $(SPINPPFLAGS) register.e > registerx.s
	$(SPINPP) $(SPINPPFLAGS) unreg.e > unreg.s
	$(SPINPP) $(SPINPPFLAGS) locate.e > locate.s
	$(SPINPP) $(SPINPPFLAGS) reqstat.e > reqstat.s
endif

clean:
	-rm -f *.s *.bin *.binary *.lst *.inc

darray.h:
ifeq ($(PROPELLER_2),TRUE)
	cp darray.p2 darray.h
	$(SPINPP) -D P2 -I ../../../target/p2 ../../../target/p2/lmmd.t > lmmd.s
	$(PASM_ASSEMBLER) lmmd.s
	$(BINDUMP) lmmd.bin -p "   0x" -c > lmmd.inc
	-rm lmmd.bin
	$(SPINPP) -D P2  -I ../../../target/p2 ../../../target/p2/lmmlib.t > lmml.s
	$(PASM_ASSEMBLER) lmml.s
	spinc -p2 -B2 -n LMM_LUT_LIBRARY lmml.bin >lmml.inc
	-rm lmml.bin
	$(SPINPP) -D P2 -I ../../../target/p2 ../../../target/p2/cmmd.t > cmmd.s
	$(PASM_ASSEMBLER) cmmd.s
	$(BINDUMP) cmmd.bin -p "   0x" -c > cmmd.inc
	-rm cmmd.bin
	$(SPINPP) -D P2 -I ../../../target/p2 ../../../target/p2/cmmlib.t > cmml.s
	$(PASM_ASSEMBLER) cmml.s
	spinc -p2 -B2 -n CMM_LUT_LIBRARY cmml.bin >cmml.inc
	-rm cmml.bin
	$(SPINPP) -D P2 -I ../../../target/p2 ../../../target/p2/nmmd.t > nmmd.s
	$(PASM_ASSEMBLER) nmmd.s
	$(BINDUMP) nmmd.bin -p "   0x" -c > nmmd.inc
	-rm nmmd.bin
	$(SPINPP) -D P2 -I ../../../target/p2 ../../../target/p2/nmmlib.t > nmml.s
	$(PASM_ASSEMBLER) nmml.s
	spinc -p2 -B2 -n NMM_LUT_LIBRARY nmml.bin >nmml.inc
	-rm nmml.bin
else
	cp darray.p1 darray.h
	$(PASM_ASSEMBLER)  ../../../target/p1 -b ../../../target/p1/Catalina_LMM_dynamic.spin -o lmmd
	$(SPINC) lmmd.binary > lmmd.inc
	- dos2unix lmmd.inc
	-rm lmmd.binary
	$(PASM_ASSEMBLER) ../../../target/p1 -b ../../../target/p1/Catalina_CMM_dynamic.spin -o cmmd
	$(SPINC) cmmd.binary > cmmd.inc
	- dos2unix cmmd.inc
	-rm cmmd.binary
	# dummy - there is no NMM on the P1!!!
	$(PASM_ASSEMBLER)  ../../../target/p1 -b ../../../target/p1/Catalina_LMM_dynamic.spin -o nmmd
	$(SPINC) nmmd.binary > nmmd.inc
	- dos2unix nmmd.inc
	-rm nmmd.binary
	# dummy - there is no way to start an XMM kernel dynamically on the P1!!!
	$(PASM_ASSEMBLER)  ../../../target/p1 -b ../../../target/p1/Catalina_LMM_dynamic.spin -o xmmld
	$(SPINC) xmmld.binary > xmmld.inc
	- dos2unix xmmld.inc
	-rm xmmld.binary
	$(PASM_ASSEMBLER)  ../../../target/p1 -b ../../../target/p1/Catalina_LMM_dynamic.spin -o xmmsd
	$(SPINC) xmmsd.binary > xmmsd.inc
	- dos2unix xmmsd.inc
	-rm xmmsd.binary
endif

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
