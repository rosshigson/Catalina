include ../Makefile.inc

CCFLAGS += -C libthreads

all:	threaded_kernel_array.h \
	thread_cog.s \
	threadstart_C.s \
	threadstart_C_cog.s \
	threadstart_CMM.s \
	threadstart_CMM_cog.s \
	threadstart_LMM.s \
	threadstart_LMM_cog.s \
	threadstart_NMM.s \
	threadstart_NMM_cog.s \
	thread_integer.s \
	thread_unsigned.s \
	thread_string.s \
	thread_char.s \
	thread_hex.s \
	thread_binary.s \
	thread_printf.s \
	thread_wait.s \
	thread_utilities.s 
ifeq ($(COMPACT),TRUE)
	cp thread_misc_compact.e thread_misc.s
	cp thread_ticks_compact.e thread_ticks.s
	cp thread_yield_compact.e thread_yield.s
	cp thread_start_compact.e thread_start.s
	cp thread_stop_compact.e thread_stop.s
	cp thread_join_compact.e thread_join.s
	cp thread_check_compact.e thread_check.s
	cp thread_halt_compact.e thread_halt.s
	cp thread_unlocked_prev_compact.e thread_unlocked_prev.s
	cp thread_unlocked_check_compact.e thread_unlocked_check.s
	cp thread_affinity_compact.e thread_affinity.s
	cp thread_affinity_stop_compact.e thread_affinity_stop.s
	cp thread_affinity_change_compact.e thread_affinity_change.s
	cp thread_init_lock_pool_compact.e thread_init_lock_pool.s
	cp thread_pool_setup_compact.e thread_pool_setup.s
	cp thread_locknew_compact.e thread_locknew.s
	cp thread_lockret_compact.e thread_lockret.s
	cp thread_lockset_compact.e thread_lockset.s
	cp thread_lockclr_compact.e thread_lockclr.s 
else
	$(SPINPP) $(SPINPPFLAGS) thread_misc.e thread_misc.s
	$(SPINPP) $(SPINPPFLAGS) thread_ticks.e thread_ticks.s
	$(SPINPP) $(SPINPPFLAGS) thread_yield.e thread_yield.s
	$(SPINPP) $(SPINPPFLAGS) thread_start.e thread_start.s
	$(SPINPP) $(SPINPPFLAGS) thread_stop.e thread_stop.s
	$(SPINPP) $(SPINPPFLAGS) thread_join.e thread_join.s
	$(SPINPP) $(SPINPPFLAGS) thread_check.e thread_check.s
	$(SPINPP) $(SPINPPFLAGS) thread_halt.e thread_halt.s
	$(SPINPP) $(SPINPPFLAGS) thread_unlocked_prev.e thread_unlocked_prev.s
	$(SPINPP) $(SPINPPFLAGS) thread_unlocked_check.e thread_unlocked_check.s
	$(SPINPP) $(SPINPPFLAGS) thread_affinity.e thread_affinity.s
	$(SPINPP) $(SPINPPFLAGS) thread_affinity_stop.e thread_affinity_stop.s
	$(SPINPP) $(SPINPPFLAGS) thread_affinity_change.e thread_affinity_change.s
	$(SPINPP) $(SPINPPFLAGS) thread_init_lock_pool.e thread_init_lock_pool.s
	$(SPINPP) $(SPINPPFLAGS) thread_pool_setup.e thread_pool_setup.s
	$(SPINPP) $(SPINPPFLAGS) thread_locknew.e thread_locknew.s
	$(SPINPP) $(SPINPPFLAGS) thread_lockret.e thread_lockret.s
	$(SPINPP) $(SPINPPFLAGS) thread_lockset.e thread_lockset.s
	$(SPINPP) $(SPINPPFLAGS) thread_lockclr.e thread_lockclr.s 
endif

clean:
	rm -f \
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
	thread_cog.s \
	threadstart_C.s \
	threadstart_C_cog.s \
	threadstart_CMM.s \
	threadstart_CMM_cog.s \
	threadstart_LMM.s \
	threadstart_LMM_cog.s \
	threadstart_NMM.s \
	threadstart_NMM_cog.s \
	thread_integer.s \
	thread_unsigned.s \
	thread_string.s \
	thread_char.s \
	thread_hex.s \
	thread_binary.s \
	thread_printf.s \
	thread_wait.s \
	thread_utilities.s \
	thread_misc.s \
	thread_ticks.s \
	thread_yield.s \
	thread_start.s \
	thread_stop.s \
	thread_join.s \
	thread_check.s \
	thread_halt.s \
	thread_unlocked_prev.s \
	thread_unlocked_check.s \
	thread_affinity.s \
	thread_affinity_stop.s \
	thread_affinity_change.s \
	thread_init_lock_pool.s \
	thread_pool_setup.s \
	thread_locknew.s \
	thread_lockret.s \
	thread_lockset.s \
	thread_lockclr.s

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
