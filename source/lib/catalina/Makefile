include ../Makefile.inc

all:	dynamic_array.h \
	threaded_kernel_array.h \
	load_overlay.s \
	cogstart_C.s \
	cogstart_C_cog.s \
	cogstart_CMM.s \
	cogstart_CMM_cog.s \
	cogstart_LMM.s \
	cogstart_LMM_cog.s \
	cogstart_NMM.s \
	cogstart_NMM_cog.s \
	threaded_cogstart_CMM_cog.s \
	threaded_cogstart_LMM_cog.s \
	threaded_cogstart_NMM_cog.s \
	catalina_hmi_k_clear.s \
	catalina_hmi_k_new.s \
	catalina_hmi_k_ready.s \
	catalina_hmi_k_wait.s \
	catalina_hmi_k_get.s \
	catalina_hmi_k_present.s \
	catalina_hmi_k_state.s \
	catalina_hmi_m_abs.s \
	catalina_hmi_m_button.s \
	catalina_hmi_m_buttons.s \
	catalina_hmi_m_delta.s \
	catalina_hmi_m_present.s \
	catalina_hmi_m_reset.s \
	catalina_hmi_enhanced_mouse.s \
	catalina_plugin_name.s \
	catalina_plugin_short.s \
	catalina_plugin_long.s \
	catalina_plugin_long_2.s \
	catalina_service_short.s \
	catalina_service_long.s \
	catalina_service_long_2.s \
	catalina_hmi_t_bin.s \
	catalina_hmi_t_float.s \
	catalina_hmi_t_hex.s \
	catalina_hmi_t_scroll.s \
	catalina_hmi_t_unsigned.s \
	catalina_hmi_t_char.s \
	catalina_hmi_t_geometry.s \
	catalina_hmi_t_integer.s \
	catalina_hmi_t_setpos.s \
	catalina_hmi_t_color.s \
	catalina_hmi_t_color_fg.s \
	catalina_hmi_t_color_bg.s \
	catalina_hmi_t_getpos.s \
	catalina_hmi_t_mode.s \
	catalina_hmi_t_string.s \
	catalina_hmi_t_printf.s \
	catalina_rtc_setfreq.s \
	catalina_rtc_getclock.s \
	catalina_rtc_settime.s \
	catalina_rtc_gettime.s \
	catalina_rtc_debug.s \
	catalina_sd_sectread.s \
	catalina_sd_sectwrite.s \
	catalina_gam_start.s \
	catalina_gam_stop.s \
	coginit_C.s \
	coginit_C_cog.s \
	coginit_Spin.s \
	coginit_Spin_cog.s
ifeq ($(COMPACT),TRUE)
	cp waitvid_compact.e waitvid.s
	cp waitcnt_compact.e waitcnt.s
	cp waitpeq_compact.e waitpeq.s
	cp waitpne_compact.e waitpne.s
	cp lockclr_compact.e lockclr.s
	cp lockset_compact.e lockset.s
	cp locknew_compact.e locknew.s
	cp lockret_compact.e lockret.s
	cp acquire_lock_compact.e acquire_lock.s
	cp release_lock_compact.e release_lock.s
	cp coginit_compact.e coginit.s
	cp cogstop_compact.e cogstop.s
	cp cogid_compact.e cogid.s
	cp cnt_compact.e cnt.s
	cp ina_compact.e ina.s
	cp inb_compact.e inb.s
	cp dira_compact.e dira.s
	cp dirb_compact.e dirb.s
	cp outa_compact.e outa.s
	cp outb_compact.e outb.s
	cp frqa_compact.e frqa.s
	cp frqb_compact.e frqb.s
	cp ctra_compact.e ctra.s
	cp ctrb_compact.e ctrb.s
	cp phsa_compact.e phsa.s
	cp phsb_compact.e phsb.s
	cp vcfg_compact.e vcfg.s
	cp vscl_compact.e vscl.s
	cp clockfreq_compact.e clockfreq.s
	cp clockmode_compact.e clockmode.s
	cp clockinit_compact.e clockinit.s
	cp registry_compact.e registry.s
	cp register_plugin_compact.e register_plugin.s
	cp unregister_plugin_compact.e unregister_plugin.s
	cp locate_plugin_compact.e locate_plugin.s
	cp request_status_compact.e request_status.s
else
	$(SPINPP) $(SPINPPFLAGS) waitvid.e > waitvid.s
	$(SPINPP) $(SPINPPFLAGS) waitcnt.e > waitcnt.s
	$(SPINPP) $(SPINPPFLAGS) waitpeq.e > waitpeq.s
	$(SPINPP) $(SPINPPFLAGS) waitpne.e > waitpne.s
	$(SPINPP) $(SPINPPFLAGS) lockclr.e > lockclr.s
	$(SPINPP) $(SPINPPFLAGS) lockset.e > lockset.s
	$(SPINPP) $(SPINPPFLAGS) locknew.e > locknew.s
	$(SPINPP) $(SPINPPFLAGS) lockret.e > lockret.s
	$(SPINPP) $(SPINPPFLAGS) acquire_lock.e > acquire_lock.s
	$(SPINPP) $(SPINPPFLAGS) release_lock.e > release_lock.s
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
	$(SPINPP) $(SPINPPFLAGS) clockfreq.e > clockfreq.s
	$(SPINPP) $(SPINPPFLAGS) clockmode.e > clockmode.s
	$(SPINPP) $(SPINPPFLAGS) clockinit.e > clockinit.s
	$(SPINPP) $(SPINPPFLAGS) registry.e > registry.s
	$(SPINPP) $(SPINPPFLAGS) register_plugin.e > register_plugin.s
	$(SPINPP) $(SPINPPFLAGS) unregister_plugin.e > unregister_plugin.s
	$(SPINPP) $(SPINPPFLAGS) locate_plugin.e > locate_plugin.s
	$(SPINPP) $(SPINPPFLAGS) request_status.e > request_status.s
endif

clean:
	rm -f \
	dynamic_array.h \
	LMM_dynamic.inc \
	CMM_dynamic.inc \
	NMM_dynamic.inc \
	LMM_library.inc \
	CMM_library.inc \
	NMM_library.inc \
	LMM_dynamic.binary \
	CMM_dynamic.binary \
	NMM_dynamic.binary \
	threaded_kernel_array.h \
	LMM_threaded_dynamic.inc \
	CMM_threaded_dynamic.inc \
	NMM_threaded_dynamic.inc \
	LMM_threaded_library.inc \
	CMM_threaded_library.inc \
	NMM_threaded_library.inc \
	LMM_threaded_dynamic.binary \
	CMM_threaded_dynamic.binary \
	NMM_threaded_dynamic.binary \
	load_overlay.s \
	cogstart_C.s \
	cogstart_C_cog.s \
	cogstart_CMM.s \
	cogstart_CMM_cog.s \
	cogstart_LMM.s \
	cogstart_LMM_cog.s \
	cogstart_NMM.s \
	cogstart_NMM_cog.s \
	threaded_cogstart_CMM_cog.s \
	threaded_cogstart_LMM_cog.s \
	threaded_cogstart_NMM_cog.s \
	catalina_hmi_k_clear.s \
	catalina_hmi_k_new.s \
	catalina_hmi_k_ready.s \
	catalina_hmi_k_wait.s \
	catalina_hmi_k_get.s \
	catalina_hmi_k_present.s \
	catalina_hmi_k_state.s \
	catalina_hmi_m_abs.s \
	catalina_hmi_m_button.s \
	catalina_hmi_m_buttons.s \
	catalina_hmi_m_delta.s \
	catalina_hmi_m_present.s \
	catalina_hmi_m_reset.s \
	catalina_hmi_enhanced_mouse.s \
	catalina_plugin_name.s \
	catalina_plugin_short.s \
	catalina_plugin_long.s \
	catalina_plugin_long_2.s \
	catalina_service_short.s \
	catalina_service_long.s \
	catalina_service_long_2.s \
	catalina_hmi_t_bin.s \
	catalina_hmi_t_float.s \
	catalina_hmi_t_hex.s \
	catalina_hmi_t_scroll.s \
	catalina_hmi_t_unsigned.s \
	catalina_hmi_t_char.s \
	catalina_hmi_t_geometry.s \
	catalina_hmi_t_integer.s \
	catalina_hmi_t_setpos.s \
	catalina_hmi_t_color.s \
	catalina_hmi_t_color_fg.s \
	catalina_hmi_t_color_bg.s \
	catalina_hmi_t_getpos.s \
	catalina_hmi_t_mode.s \
	catalina_hmi_t_string.s \
	catalina_hmi_t_printf.s \
	catalina_rtc_setfreq.s \
	catalina_rtc_getclock.s \
	catalina_rtc_settime.s \
	catalina_rtc_gettime.s \
	catalina_rtc_debug.s \
	catalina_sd_sectread.s \
	catalina_sd_sectwrite.s \
	catalina_gam_start.s \
	catalina_gam_stop.s \
	coginit_C.s \
	coginit_C_cog.s \
	coginit_Spin.s \
	coginit_Spin_cog.s \
	waitvid.s waitcnt.s waitpeq.s waitpne.s \
	lockclr.s lockset.s locknew.s lockret.s \
	acquire_lock.s release_lock.s \
	cogid.s coginit.s cogstop.s ina.s inb.s \
	outa.s outb.s dira.s dirb.s cnt.s \
	frqa.s frqb.s ctra.s ctrb.s phsa.s phsb.s vcfg.s vscl.s \
	clockfreq.s clockmode.s clockinit.s \
	registry.s register_plugin.s unregister_plugin.s \
	locate_plugin.s request_status.s 


dynamic_array.h:
ifeq ($(PROPELLER_2),TRUE)
	cp dynamic_array.p2 dynamic_array.h
	$(SPINPP) -D P2 -I ../../../target_p2 ../../../target_p2/Catalina_LMM_dynamic.spin2 > LMM_dynamic.spin2
	$(PASM_ASSEMBLER) LMM_dynamic.spin2
	$(BINDUMP) LMM_dynamic.bin -p "   0x" -c > LMM_dynamic.inc
	rm LMM_dynamic.bin
	$(SPINPP) -D P2  -I ../../../target_p2 ../../../target_p2/Catalina_LMM_library.spin2 > LMM_library.spin2
	$(PASM_ASSEMBLER) LMM_library.spin2
	spinc -p2 -B2 -n LMM_LUT_LIBRARY LMM_library.bin >LMM_library.inc
	rm LMM_library.bin
	$(SPINPP) -D P2 -I ../../../target_p2 ../../../target_p2/Catalina_CMM_dynamic.spin2 > CMM_dynamic.spin2
	$(PASM_ASSEMBLER) CMM_dynamic.spin2
	$(BINDUMP) CMM_dynamic.bin -p "   0x" -c > CMM_dynamic.inc
	rm CMM_dynamic.bin
	$(SPINPP) -D P2 -I ../../../target_p2 ../../../target_p2/Catalina_CMM_library.spin2 > CMM_library.spin2
	$(PASM_ASSEMBLER) CMM_library.spin2
	spinc -p2 -B2 -n CMM_LUT_LIBRARY CMM_library.bin >CMM_library.inc
	rm CMM_library.bin
	$(SPINPP) -D P2 -I ../../../target_p2 ../../../target_p2/Catalina_NMM_dynamic.spin2 > NMM_dynamic.spin2
	$(PASM_ASSEMBLER) NMM_dynamic.spin2
	$(BINDUMP) NMM_dynamic.bin -p "   0x" -c > NMM_dynamic.inc
	rm NMM_dynamic.bin
	$(SPINPP) -D P2 -I ../../../target_p2 ../../../target_p2/Catalina_NMM_library.spin2 > NMM_library.spin2
	$(PASM_ASSEMBLER) NMM_library.spin2
	spinc -p2 -B2 -n NMM_LUT_LIBRARY NMM_library.bin >NMM_library.inc
	rm NMM_library.bin
else
	cp dynamic_array.p1 dynamic_array.h
	$(PASM_ASSEMBLER)  ../../../target -b ../../../target/Catalina_LMM_dynamic.spin -o LMM_dynamic
	$(SPINC) LMM_dynamic.binary > LMM_dynamic.inc
	- dos2unix LMM_dynamic.inc
	rm LMM_dynamic.binary
	$(PASM_ASSEMBLER) ../../../target -b ../../../target/Catalina_CMM_dynamic.spin -o CMM_dynamic
	$(SPINC) CMM_dynamic.binary > CMM_dynamic.inc
	- dos2unix CMM_dynamic.inc
	rm CMM_dynamic.binary
	# dummy - there is no NMM on the P1!!!
	$(PASM_ASSEMBLER)  ../../../target -b ../../../target/Catalina_LMM_dynamic.spin -o NMM_dynamic
	$(SPINC) NMM_dynamic.binary > NMM_dynamic.inc
	- dos2unix NMM_dynamic.inc
	rm NMM_dynamic.binary
endif

threaded_kernel_array.h:
ifeq ($(PROPELLER_2),TRUE)
	cp threaded_kernel_array.p2 threaded_kernel_array.h
	$(SPINPP) -D P2 -D libthreads -I ../../../target_p2 ../../../target_p2/Catalina_CMM_threaded_dynamic.spin2 > CMM_threaded_dynamic.spin2
	$(PASM_ASSEMBLER) CMM_threaded_dynamic.spin2
	$(BINDUMP) CMM_threaded_dynamic.bin -p "   0x" -c > CMM_threaded_dynamic.inc
	rm CMM_threaded_dynamic.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target_p2 ../../../target_p2/Catalina_CMM_library.spin2 > CMM_threaded_library.spin2
	$(PASM_ASSEMBLER) CMM_threaded_library.spin2
	spinc -p2 -B2 -n CMM_LUT_LIBRARY CMM_threaded_library.bin >CMM_threaded_library.inc
	rm CMM_threaded_library.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target_p2 ../../../target_p2/Catalina_LMM_threaded_dynamic.spin2 > LMM_threaded_dynamic.spin2
	$(PASM_ASSEMBLER) LMM_threaded_dynamic.spin2
	$(BINDUMP) LMM_threaded_dynamic.bin -p "   0x" -c > LMM_threaded_dynamic.inc
	rm LMM_threaded_dynamic.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target_p2 ../../../target_p2/Catalina_LMM_library.spin2 > LMM_threaded_library.spin2
	$(PASM_ASSEMBLER) LMM_threaded_library.spin2
	spinc -p2 -B2 -n LMM_LUT_LIBRARY LMM_threaded_library.bin >LMM_threaded_library.inc
	rm LMM_threaded_library.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target_p2 ../../../target_p2/Catalina_NMM_threaded_dynamic.spin2 > NMM_threaded_dynamic.spin2
	$(PASM_ASSEMBLER) NMM_threaded_dynamic.spin2
	$(BINDUMP) NMM_threaded_dynamic.bin -p "   0x" -c > NMM_threaded_dynamic.inc
	rm NMM_threaded_dynamic.bin
	$(SPINPP) -D P2 -D libthreads -I ../../../target_p2 ../../../target_p2/Catalina_NMM_library.spin2 > NMM_threaded_library.spin2
	$(PASM_ASSEMBLER) NMM_threaded_library.spin2
	spinc -p2 -B2 -n NMM_LUT_LIBRARY NMM_threaded_library.bin >NMM_threaded_library.inc
	rm NMM_threaded_library.bin
else
	cp threaded_kernel_array.p1 threaded_kernel_array.h
	$(PASM_ASSEMBLER)  ../../../target -b ../../../target/Catalina_LMM_threaded_dynamic.spin -o LMM_threaded_dynamic
	$(SPINC) LMM_threaded_dynamic.binary > LMM_threaded_dynamic.inc
	- dos2unix LMM_threaded_dynamic.inc
	rm LMM_threaded_dynamic.binary
	$(PASM_ASSEMBLER) ../../../target -b ../../../target/Catalina_CMM_threaded_dynamic.spin -o CMM_threaded_dynamic
	$(SPINC) CMM_threaded_dynamic.binary > CMM_threaded_dynamic.inc
	- dos2unix CMM_threaded_dynamic.inc
	rm CMM_threaded_dynamic.binary
	# dummy - there is no NMM on the P1!!!
	$(PASM_ASSEMBLER)  ../../../target -b ../../../target/Catalina_LMM_threaded_dynamic.spin -o NMM_threaded_dynamic
	$(SPINC) NMM_threaded_dynamic.binary > NMM_threaded_dynamic.inc
	- dos2unix NMM_threaded_dynamic.inc
	rm NMM_threaded_dynamic.binary
endif
