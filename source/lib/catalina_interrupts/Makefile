include ../Makefile.inc

CCFLAGS += -C libinterrupts

all:
ifeq ($(COMPACT),TRUE)
	cp add_CT1_compact.e add_CT1.s    
	cp add_CT2_compact.e add_CT2.s
	cp add_CT3_compact.e add_CT3.s
	cp clr_int_1_compact.e clr_int_1.s
	cp clr_int_2_compact.e clr_int_2.s
	cp clr_int_3_compact.e clr_int_3.s
	cp cog_ATN_compact.e cog_ATN.s
	cp get_status_compact.e get_status.s
	cp nix_int_1_compact.e nix_int_1.s
	cp nix_int_2_compact.e nix_int_2.s
	cp nix_int_3_compact.e nix_int_3.s
	cp poll_ANY_compact.e poll_ANY.s
	cp poll_ATN_compact.e poll_ATN.s
	cp poll_CT1_compact.e poll_CT1.s
	cp poll_CT2_compact.e poll_CT2.s
	cp poll_CT3_compact.e poll_CT3.s
	cp poll_FBW_compact.e poll_FBW.s
	cp poll_PAT_compact.e poll_PAT.s
	cp poll_QMT_compact.e poll_QMT.s
	cp poll_SE1_compact.e poll_SE1.s
	cp poll_SE2_compact.e poll_SE2.s
	cp poll_SE3_compact.e poll_SE3.s
	cp poll_SE4_compact.e poll_SE4.s
	cp poll_XFI_compact.e poll_XFI.s
	cp poll_XMT_compact.e poll_XMT.s
	cp poll_XRL_compact.e poll_XRL.s
	cp poll_XRO_compact.e poll_XRO.s
	cp set_CT1_compact.e set_CT1.s
	cp set_CT2_compact.e set_CT2.s
	cp set_CT3_compact.e set_CT3.s
	cp set_int_1_compact.e set_int_1.s
	cp set_int_2_compact.e set_int_2.s
	cp set_int_3_compact.e set_int_3.s
	cp set_PAT_compact.e set_PAT.s
	cp set_SE1_compact.e set_SE1.s
	cp set_SE2_compact.e set_SE2.s
	cp set_SE3_compact.e set_SE3.s
	cp set_SE4_compact.e set_SE4.s
	cp sim_int_1_compact.e sim_int_1.s
	cp sim_int_2_compact.e sim_int_2.s
	cp sim_int_3_compact.e sim_int_3.s
	cp wait_ANY_compact.e wait_ANY.s
	cp wait_ATN_compact.e wait_ATN.s
	cp wait_CT1_compact.e wait_CT1.s
	cp wait_CT2_compact.e wait_CT2.s
	cp wait_CT3_compact.e wait_CT3.s
	cp wait_FBW_compact.e wait_FBW.s
	cp wait_PAT_compact.e wait_PAT.s
	cp wait_SE1_compact.e wait_SE1.s
	cp wait_SE2_compact.e wait_SE2.s
	cp wait_SE3_compact.e wait_SE3.s
	cp wait_SE4_compact.e wait_SE4.s
	cp wait_XFI_compact.e wait_XFI.s
	cp wait_XMT_compact.e wait_XMT.s
	cp wait_XRL_compact.e wait_XRL.s
	cp wait_XRO_compact.e wait_XRO.s
else
	$(SPINPP) $(SPINPPFLAGS) add_CT1.e add_CT1.s    
	$(SPINPP) $(SPINPPFLAGS) add_CT2.e add_CT2.s
	$(SPINPP) $(SPINPPFLAGS) add_CT3.e add_CT3.s
	$(SPINPP) $(SPINPPFLAGS) clr_int_1.e clr_int_1.s
	$(SPINPP) $(SPINPPFLAGS) clr_int_2.e clr_int_2.s
	$(SPINPP) $(SPINPPFLAGS) clr_int_3.e clr_int_3.s
	$(SPINPP) $(SPINPPFLAGS) cog_ATN.e cog_ATN.s
	$(SPINPP) $(SPINPPFLAGS) get_status.e get_status.s
	$(SPINPP) $(SPINPPFLAGS) nix_int_1.e nix_int_1.s
	$(SPINPP) $(SPINPPFLAGS) nix_int_2.e nix_int_2.s
	$(SPINPP) $(SPINPPFLAGS) nix_int_3.e nix_int_3.s
	$(SPINPP) $(SPINPPFLAGS) poll_ANY.e poll_ANY.s
	$(SPINPP) $(SPINPPFLAGS) poll_ATN.e poll_ATN.s
	$(SPINPP) $(SPINPPFLAGS) poll_CT1.e poll_CT1.s
	$(SPINPP) $(SPINPPFLAGS) poll_CT2.e poll_CT2.s
	$(SPINPP) $(SPINPPFLAGS) poll_CT3.e poll_CT3.s
	$(SPINPP) $(SPINPPFLAGS) poll_FBW.e poll_FBW.s
	$(SPINPP) $(SPINPPFLAGS) poll_PAT.e poll_PAT.s
	$(SPINPP) $(SPINPPFLAGS) poll_QMT.e poll_QMT.s
	$(SPINPP) $(SPINPPFLAGS) poll_SE1.e poll_SE1.s
	$(SPINPP) $(SPINPPFLAGS) poll_SE2.e poll_SE2.s
	$(SPINPP) $(SPINPPFLAGS) poll_SE3.e poll_SE3.s
	$(SPINPP) $(SPINPPFLAGS) poll_SE4.e poll_SE4.s
	$(SPINPP) $(SPINPPFLAGS) poll_XFI.e poll_XFI.s
	$(SPINPP) $(SPINPPFLAGS) poll_XMT.e poll_XMT.s
	$(SPINPP) $(SPINPPFLAGS) poll_XRL.e poll_XRL.s
	$(SPINPP) $(SPINPPFLAGS) poll_XRO.e poll_XRO.s
	$(SPINPP) $(SPINPPFLAGS) set_CT1.e set_CT1.s
	$(SPINPP) $(SPINPPFLAGS) set_CT2.e set_CT2.s
	$(SPINPP) $(SPINPPFLAGS) set_CT3.e set_CT3.s
	$(SPINPP) $(SPINPPFLAGS) set_int_1.e set_int_1.s
	$(SPINPP) $(SPINPPFLAGS) set_int_2.e set_int_2.s
	$(SPINPP) $(SPINPPFLAGS) set_int_3.e set_int_3.s
	$(SPINPP) $(SPINPPFLAGS) set_PAT.e set_PAT.s
	$(SPINPP) $(SPINPPFLAGS) set_SE1.e set_SE1.s
	$(SPINPP) $(SPINPPFLAGS) set_SE2.e set_SE2.s
	$(SPINPP) $(SPINPPFLAGS) set_SE3.e set_SE3.s
	$(SPINPP) $(SPINPPFLAGS) set_SE4.e set_SE4.s
	$(SPINPP) $(SPINPPFLAGS) sim_int_1.e sim_int_1.s
	$(SPINPP) $(SPINPPFLAGS) sim_int_2.e sim_int_2.s
	$(SPINPP) $(SPINPPFLAGS) sim_int_3.e sim_int_3.s
	$(SPINPP) $(SPINPPFLAGS) wait_ANY.e wait_ANY.s
	$(SPINPP) $(SPINPPFLAGS) wait_ATN.e wait_ATN.s
	$(SPINPP) $(SPINPPFLAGS) wait_CT1.e wait_CT1.s
	$(SPINPP) $(SPINPPFLAGS) wait_CT2.e wait_CT2.s
	$(SPINPP) $(SPINPPFLAGS) wait_CT3.e wait_CT3.s
	$(SPINPP) $(SPINPPFLAGS) wait_FBW.e wait_FBW.s
	$(SPINPP) $(SPINPPFLAGS) wait_PAT.e wait_PAT.s
	$(SPINPP) $(SPINPPFLAGS) wait_SE1.e wait_SE1.s
	$(SPINPP) $(SPINPPFLAGS) wait_SE2.e wait_SE2.s
	$(SPINPP) $(SPINPPFLAGS) wait_SE3.e wait_SE3.s
	$(SPINPP) $(SPINPPFLAGS) wait_SE4.e wait_SE4.s
	$(SPINPP) $(SPINPPFLAGS) wait_XFI.e wait_XFI.s
	$(SPINPP) $(SPINPPFLAGS) wait_XMT.e wait_XMT.s
	$(SPINPP) $(SPINPPFLAGS) wait_XRL.e wait_XRL.s
	$(SPINPP) $(SPINPPFLAGS) wait_XRO.e wait_XRO.s
endif

clean:
	rm -f \
	add_CT1.s \
	add_CT2.s \
	add_CT3.s \
	clr_int_1.s \
	clr_int_2.s \
	clr_int_3.s \
	cog_ATN.s \
	get_status.s \
	nix_int_1.s \
	nix_int_2.s \
	nix_int_3.s \
	poll_ANY.s \
	poll_ATN.s \
	poll_CT1.s \
	poll_CT2.s \
	poll_CT3.s \
	poll_FBW.s \
	poll_PAT.s \
	poll_QMT.s \
	poll_SE1.s \
	poll_SE2.s \
	poll_SE3.s \
	poll_SE4.s \
	poll_XFI.s \
	poll_XMT.s \
	poll_XRL.s \
	poll_XRO.s \
	set_CT1.s \
	set_CT2.s \
	set_CT3.s \
	set_int_1.s \
	set_int_2.s \
	set_int_3.s \
	set_PAT.s \
	set_SE1.s \
	set_SE2.s \
	set_SE3.s \
	set_SE4.s \
	sim_int_1.s \
	sim_int_2.s \
	sim_int_3.s \
	wait_ANY.s \
	wait_ATN.s \
	wait_CT1.s \
	wait_CT2.s \
	wait_CT3.s \
	wait_FBW.s \
	wait_PAT.s \
	wait_SE1.s \
	wait_SE2.s \
	wait_SE3.s \
	wait_SE4.s \
	wait_XFI.s \
	wait_XMT.s \
	wait_XRL.s \
	wait_XRO.s

