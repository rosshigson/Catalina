include ../Makefile.inc

all:
ifeq ($(COMPACT),TRUE)
	cp cogatn_compact.e cogatn.s
	cp cogchk_compact.e cogchk.s
	cp hubset_compact.e hubset.s
	cp lockchk_compact.e lockchk.s
	cp lockrel_compact.e lockrel.s
	cp locktry_compact.e locktry.s
	cp pollatn_compact.e pollatn.s
	cp waitatn_compact.e waitatn.s
	cp cnth_compact.e cnth.s
	cp cnthl_compact.e cnthl.s
	cp rotxy_compact.e rotxy.s
	cp polxy_compact.e polxy.s
	cp xypol_compact.e xypol.s
	cp rnd_compact.e rnd.s
	cp rev_compact.e rev.s
	cp encod_compact.e encod.s
	cp isqrt_compact.e isqrt.s
	cp muldiv64_compact.e muldiv64.s
	cp pinstart_compact.e pinstart.s
	cp pinclear_compact.e pinclear.s
	cp waitx_compact.e waitx.s
	cp dirl_compact.e dirl.s
	cp dirh_compact.e dirh.s
	cp pinw_compact.e pinw.s
	cp pinl_compact.e pinl.s
	cp pinh_compact.e pinh.s
	cp pinnot_compact.e pinnot.s
	cp pinrnd_compact.e pinrnd.s
	cp pinf_compact.e pinf.s
	cp pinr_compact.e pinr.s
	cp wrpin_compact.e wrpin.s
	cp wxpin_compact.e wxpin.s
	cp wypin_compact.e wypin.s
	cp akpin_compact.e akpin.s
	cp rdpin_compact.e rdpin.s
	cp rqpin_compact.e rqpin.s
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
	rm -f \
	cogatn.s \
	cogchk.s \
	hubset.s \
	lockchk.s \
	lockrel.s \
	locktry.s \
	pollatn.s \
	waitatn.s \
	cnth.s \
	cnthl.s \
	rotxy.s \
	polxy.s \
	xypol.s \
	rnd.s \
	rev.s \
	encod.s \
	isqrt.s \
	muldiv64.s \
	pinstart.s \
	pinclear.s \
	waitx.s \
	dirl.s \
	dirh.s \
	pinw.s \
	pinl.s \
	pinh.s \
	pinnot.s \
	pinrnd.s \
	pinf.s \
	pinr.s \
	wrpin.s \
	wxpin.s \
	wypin.s \
	akpin.s \
	rdpin.s \
	rqpin.s

