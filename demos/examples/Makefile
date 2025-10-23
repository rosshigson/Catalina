#
# Common Makefile setup - detect P1/P2 and Windows/Linux
# ======================================================

CLOCK=

# Check if there is an RTC in CATALINA_DEFINES
ifeq (RTC, $(findstring RTC, $(CATALINA_DEFINE)))
	CLOCK   = RTC
endif

# Check if there is an RTC in CATALINA_OPTIONS
ifeq (RTC, $(findstring RTC, $(CATALINA_OPTIONS)))
	CLOCK   = RTC
endif

#if RTC not specified, use CLOCK
ifneq ("$(CLOCK)", "RTC")
  CLOCK   = CLOCK
endif

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
	CFLAGS += -lc -lm
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
	$(CC) $(CFLAGS) -o $@ $<

%.eeprom : %.c
	$(CC) -e $(CFLAGS) -o $@ $<

%.bin : %.c
	$(CC) $(CFLAGS) -p2 -o $@ $<

#
# Named Targets
# =============

# Named Targets are primarily for use with Geany, and should correspond 
# to Geany project names in this directory. Using $B as the suffix in a  
# named target means this rule chooses the appropriate binary suffix 
# for a P1 or P2 based on whether "P2" exists in CATALINA_DEFINE. 
# The first such target will be the default target of this Makefile

.PHONY : ex_leds_1
ex_leds_1 : ex_leds_1$B

# add this to the 'all' target
all :: ex_leds_1

# =============

.PHONY : ex_leds_2
ex_leds_2 : ex_leds_2$B

# add this to the 'all' target
all :: ex_leds_2

# =============

.PHONY : ex_payload
ex_payload : ex_payload$B

# add this to the 'all' target
all :: ex_payload

# =============

.PHONY : ex_printf
ex_printf : ex_printf$B

# add this to the 'all' target
all :: ex_printf

# =============

.PHONY : ex_printf_tz
ex_printf_tz : ex_printf_tz$B

# add this to the 'all' target
all :: ex_printf_tz

# =============

.PHONY : ex_registry
ex_registry : ex_registry$B

# add this to the 'all' target
all :: ex_registry

# =============

.PHONY : ex_sbrk
ex_sbrk : ex_sbrk$B

# add this to the 'all' target
all :: ex_sbrk

# =============

.PHONY : ex_args
ex_args : ex_args$B

# add this to the 'all' target
all :: ex_args

# =============

.PHONY : ex_bits
ex_bits : ex_bits$B

# add this to the 'all' target
all :: ex_bits

# =============

.PHONY : ex_bool
ex_bool : ex_bool$B

# add this to the 'all' target
all :: ex_bool

# =============

.PHONY : ex_coginit
ex_coginit : ex_coginit$B

ex_coginit.binary : ex_coginit.c
	$(CC) $(CFLAGS) -o $@ $<

ex_coginit.bin : ex_coginit.c
	

# add this to the 'all' target
all :: ex_coginit

# =============

.PHONY : ex_cogstart
ex_cogstart : ex_cogstart$B

# add this to the 'all' target
all :: ex_cogstart

# =============

.PHONY : ex_cpu_3
ex_cpu_3 : ex_cpu_3$B

# add this to the 'all' target
all :: ex_cpu_3

# =============

.PHONY : ex_cursor
ex_cursor : ex_cursor$B

# add this to the 'all' target
all :: ex_cursor

# =============

.PHONY : ex_div
ex_div : ex_div$B

# add this to the 'all' target
all :: ex_div

# =============

.PHONY : ex_float_1
ex_float_1 : ex_float_1$B

# add this to the 'all' target
all :: ex_float_1

# =============

.PHONY : ex_float_1
ex_float_1 : ex_float_1$B

# add this to the 'all' target
all :: ex_float_1

# =============

.PHONY : ex_float_2
ex_float_2 : ex_float_2$B

# add this to the 'all' target
all :: ex_float_2

# =============

.PHONY : ex_float_3
ex_float_3 : ex_float_3$B

# add this to the 'all' target
all :: ex_float_3

# =============

.PHONY : ex_float_min_max
ex_float_min_max : ex_float_min_max$B

# add this to the 'all' target
all :: ex_float_min_max

# =============

.PHONY : ex_fprintf
ex_fprintf : ex_fprintf$B

# add this to the 'all' target
all :: ex_fprintf

# =============

.PHONY : ex_freq
ex_freq : ex_freq$B

# add this to the 'all' target
all :: ex_freq

# =============

.PHONY : ex_gamepad
ex_gamepad : ex_gamepad$B

# add this to the 'all' target
all :: ex_gamepad

# =============

.PHONY : ex_hub_access
ex_hub_access : ex_hub_access$B

# add this to the 'all' target
all :: ex_hub_access

# =============

.PHONY : ex_init
ex_init : ex_init$B

# add this to the 'all' target
all :: ex_init

# =============

.PHONY : ex_inttype
ex_inttype : ex_inttype$B

# add this to the 'all' target
all :: ex_inttype

# =============

.PHONY : ex_itoa
ex_itoa : ex_itoa$B

# add this to the 'all' target
all :: ex_itoa

# =============

.PHONY : ex_key
ex_key : ex_key$B

# add this to the 'all' target
all :: ex_key

# =============

.PHONY : ex_locale
ex_locale : ex_locale$B

# add this to the 'all' target
all :: ex_locale

# =============

.PHONY : ex_malloc
ex_malloc : ex_malloc$B

# add this to the 'all' target
all :: ex_malloc

# =============

.PHONY : ex_math_1
ex_math_1 : ex_math_1$B

# add this to the 'all' target
all :: ex_math_1

# =============

.PHONY : ex_math_2
ex_math_2 : ex_math_2$B

# add this to the 'all' target
all :: ex_math_2

# =============

.PHONY : ex_math_3
ex_math_3 : ex_math_3$B

ex_math_3.binary : ex_math_3.c
	$(CC) $(CFLAGS) -C $(CLOCK) -o $@ $<

ex_math_3.bin : ex_math_3.c
	$(CC) $(CFLAGS) -C $(CLOCK) -p2 -o $@ $<

# add this to the 'all' target
all :: ex_math_3

# =============

.PHONY : ex_optimizer
ex_optimizer : ex_optimizer$B

# add this to the 'all' target
all :: ex_optimizer

# =============

.PHONY : ex_pc_time
ex_pc_time : ex_pc_time$B

# add this to the 'all' target
all :: ex_pc_time

# =============

.PHONY : ex_propterm
ex_propterm : ex_propterm$B

# add this to the 'all' target
all :: ex_propterm

# =============

.PHONY : ex_scanf
ex_scanf : ex_scanf$B

ex_scanf.bin : ex_scanf.c
	$(CC) $(CFLAGS) -p2 -o $@ $<

ex_scanf.binary : ex_scanf.c
	$(CC) $(CFLAGS) -C COMPACT -o $@ $<

# add this to the 'all' target
all :: ex_scanf

# =============

.PHONY : ex_setjmp_1
ex_setjmp_1 : ex_setjmp_1$B

# add this to the 'all' target
all :: ex_setjmp_1

# =============

.PHONY : ex_setjmp_2
ex_setjmp_2 : ex_setjmp_2$B

# add this to the 'all' target
all :: ex_setjmp_2

# =============

.PHONY : ex_setjmp_3
ex_setjmp_3 : ex_setjmp_3$B

# add this to the 'all' target
all :: ex_setjmp_3

# =============

.PHONY : ex_setjmp_4
ex_setjmp_4 : ex_setjmp_4$B

# add this to the 'all' target
all :: ex_setjmp_4

# =============

.PHONY : ex_signal
ex_signal : ex_signal$B

# add this to the 'all' target
all :: ex_signal

# =============

.PHONY : ex_stdint
ex_stdint : ex_stdint$B

# add this to the 'all' target
all :: ex_stdint

# =============

.PHONY : ex_str_print
ex_str_print : ex_str_print$B

# add this to the 'all' target
all :: ex_str_print

# =============

.PHONY : ex_string
ex_string : ex_string$B

# add this to the 'all' target
all :: ex_string

# =============

.PHONY : ex_struct
ex_struct : ex_struct$B

# add this to the 'all' target
all :: ex_struct

# =============

.PHONY : ex_terminal
ex_terminal : ex_terminal$B

# add this to the 'all' target
all :: ex_terminal

# =============

.PHONY : ex_time
ex_time : ex_time$B

ex_time.binary : ex_time.c
	$(CC) $(CFLAGS) -C $(CLOCK) -o $@ $<

ex_time.bin : ex_time.c
	$(CC) $(CFLAGS) -C $(CLOCK) -p2 -o $@ $<

# add this to the 'all' target
all :: ex_time

# =============

.PHONY : ex_try_catch
ex_try_catch : ex_try_catch$B

# add this to the 'all' target
all :: ex_try_catch

# =============

.PHONY : ex_t_print
ex_t_print : ex_t_print$B

# add this to the 'all' target
all :: ex_t_print

# =============

.PHONY : ex_t_printf
ex_t_printf : ex_t_printf$B

# add this to the 'all' target
all :: ex_t_printf

# =============

.PHONY : ex_vararg
ex_vararg : ex_vararg$B

# add this to the 'all' target
all :: ex_vararg

# =============

.PHONY : ex_va_copy
ex_va_copy : ex_va_copy$B

# add this to the 'all' target
all :: ex_va_copy

# =============

.PHONY : ex_vararg_legacy
# Note: this program will fail to compile with cake!
-ex_vararg_legacy : ex_vararg_legacy$B

# add this to the 'all' target
all :: ex_vararg_legacy

# =============

.PHONY : ex_vga
ex_vga : ex_vga$B

# add this to the 'all' target
all :: ex_vga

# =============

.PHONY : ex_registry
ex_registry : ex_registry$B

# add this to the 'all' target
all :: ex_registry

# =============

.PHONY : ex_waitx
ex_waitx : ex_waitx$B

# add this to the 'all' target
all :: ex_waitx

# =============

.PHONY : ex_simple
ex_simple : ex_simple$B

# add this to the 'all' target
all :: ex_simple

# =============

.PHONY : ex_random
ex_random : ex_random$B

# add this to the 'all' target
all :: ex_random

# =============

.PHONY : ex_psram
ex_psram : ex_psram$B

ex_psram.binary : ex_psram.c
	

ex_psram.bin : ex_psram.c
	$(CC) $(CFLAGS) -p2 -lpsram -o $@ $<

# add this to the 'all' target
all :: ex_psram

# =============

.PHONY : ex_hyper
ex_hyper : ex_hyper$B

ex_hyper.binary : ex_hyper.c
	

ex_hyper.bin : ex_hyper.c
	$(CC) $(CFLAGS) -p2 -lhyper -o $@ $<

# add this to the 'all' target
all :: ex_hyper

# =============

.PHONY : ex_wait
ex_wait : ex_wait$B

# add this to the 'all' target
all :: ex_wait

.PHONY : ex_timers
ex_timers : ex_timers$B

ex_timers.binary : ex_timers.c
	$(CC) $(CFLAGS) -C $(CLOCK) -lmb -o $@ $<

ex_timers.bin : ex_timers.c
	$(CC) $(CFLAGS) -C $(CLOCK) -lmc -p2 -o $@ $<

# add this to the 'all' target
all :: ex_timers

# =============

#
# Clean Target (should not be first target!)
# ==========================================

# clean target
clean ::
	$(RM) *$(B1)
	$(RM) *$(B2)
	$(RM) *$(E1)
	$(RM) *$L

