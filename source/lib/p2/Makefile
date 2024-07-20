include ../Makefile.inc

all:
ifeq ($(COMPACT),TRUE)
	cp cogatn.ce cogatn.s
	cp cogchk.ce cogchk.s
	cp hubset.ce hubset.s
	cp lockchk.ce lockchk.s
	cp lockrel.ce lockrel.s
	cp locktry.ce locktry.s
	cp pollatn.ce pollatn.s
	cp waitatn.ce waitatn.s
	cp cnth.ce cnth.s
	cp cnthl.ce cnthl.s
	cp rotxy.ce rotxy.s
	cp polxy.ce polxy.s
	cp xypol.ce xypol.s
	cp rnd.ce rnd.s
	cp rev.ce rev.s
	cp encod.ce encod.s
	cp isqrt.ce isqrt.s
	cp muldiv64.ce muldiv64.s
	cp pinstart.ce pinstart.s
	cp pinclear.ce pinclear.s
	cp waitx.ce waitx.s
	cp dirl.ce dirl.s
	cp dirh.ce dirh.s
	cp pinw.ce pinw.s
	cp pinl.ce pinl.s
	cp pinh.ce pinh.s
	cp pinnot.ce pinnot.s
	cp pinrnd.ce pinrnd.s
	cp pinf.ce pinf.s
	cp pinr.ce pinr.s
	cp wrpin.ce wrpin.s
	cp wxpin.ce wxpin.s
	cp wypin.ce wypin.s
	cp akpin.ce akpin.s
	cp rdpin.ce rdpin.s
	cp rqpin.ce rqpin.s
else
	$(SPINPP) $(SPINPPFLAGS) cogatn.e > cogatn.s
	$(SPINPP) $(SPINPPFLAGS) cogchk.e > cogchk.s
	$(SPINPP) $(SPINPPFLAGS) hubset.e > hubset.s
	$(SPINPP) $(SPINPPFLAGS) lockchk.e > lockchk.s
	$(SPINPP) $(SPINPPFLAGS) lockrel.e > lockrel.s
	$(SPINPP) $(SPINPPFLAGS) locktry.e > locktry.s
	$(SPINPP) $(SPINPPFLAGS) pollatn.e > pollatn.s
	$(SPINPP) $(SPINPPFLAGS) waitatn.e > waitatn.s
	$(SPINPP) $(SPINPPFLAGS) cnth.e > cnth.s
	$(SPINPP) $(SPINPPFLAGS) cnthl.e > cnthl.s
	$(SPINPP) $(SPINPPFLAGS) rotxy.e > rotxy.s
	$(SPINPP) $(SPINPPFLAGS) polxy.e > polxy.s
	$(SPINPP) $(SPINPPFLAGS) xypol.e > xypol.s
	$(SPINPP) $(SPINPPFLAGS) rnd.e > rnd.s
	$(SPINPP) $(SPINPPFLAGS) rev.e > rev.s
	$(SPINPP) $(SPINPPFLAGS) encod.e > encod.s
	$(SPINPP) $(SPINPPFLAGS) isqrt.e > isqrt.s
	$(SPINPP) $(SPINPPFLAGS) muldiv64.e > muldiv64.s
	$(SPINPP) $(SPINPPFLAGS) pinstart.e > pinstart.s
	$(SPINPP) $(SPINPPFLAGS) pinclear.e > pinclear.s
	$(SPINPP) $(SPINPPFLAGS) waitx.e > waitx.s
	$(SPINPP) $(SPINPPFLAGS) dirl.e > dirl.s
	$(SPINPP) $(SPINPPFLAGS) dirh.e > dirh.s
	$(SPINPP) $(SPINPPFLAGS) pinw.e > pinw.s
	$(SPINPP) $(SPINPPFLAGS) pinl.e > pinl.s
	$(SPINPP) $(SPINPPFLAGS) pinh.e > pinh.s
	$(SPINPP) $(SPINPPFLAGS) pinnot.e > pinnot.s
	$(SPINPP) $(SPINPPFLAGS) pinrnd.e > pinrnd.s
	$(SPINPP) $(SPINPPFLAGS) pinf.e > pinf.s
	$(SPINPP) $(SPINPPFLAGS) pinr.e > pinr.s
	$(SPINPP) $(SPINPPFLAGS) wrpin.e > wrpin.s
	$(SPINPP) $(SPINPPFLAGS) wxpin.e > wxpin.s
	$(SPINPP) $(SPINPPFLAGS) wypin.e > wypin.s
	$(SPINPP) $(SPINPPFLAGS) akpin.e > akpin.s
	$(SPINPP) $(SPINPPFLAGS) rdpin.e > rdpin.s
	$(SPINPP) $(SPINPPFLAGS) rqpin.e > rqpin.s
endif

clean:
	-rm -f *.s

