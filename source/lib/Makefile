include Makefile.inc

ifeq ($(LARGE),TRUE)
LIB = large_lib
else
ifeq ($(COMPACT),TRUE)
ifeq ($(PROPELLER_2),TRUE)
LIB = compact_lib_p2
else
LIB = compact_lib
endif
else
ifeq ($(NATIVE),TRUE)
ifeq ($(PROPELLER_2),TRUE)
LIB = native_lib_p2
else
LIB = native_lib
endif
else
ifeq ($(PROPELLER_2),TRUE)
LIB = lib_p2
else
LIB = lib
endif
endif
endif
endif

ifndef LCCDIR
   CATALINA_BASE=/opt/catalina
else
   CATALINA_BASE=$(LCCDIR)
endif


DIRLIST = assert locale stdio time stdlib math ctype setjmp signal string errno catalina catalina_math catalina_io catalina_threads catalina_p2 catalina_interrupts catalina_graphics catalina_vgraphics catalina_tiny catalina_spi catalina_serial4 catalina_serial2 catalina_sound catalina_tty catalina_tty256

all: assert ctype errno locale math setjmp signal stdlib string time catalina catalina_math catalina_threads catalina_p2 catalina_interrupts catalina_graphics catalina_vgraphics catalina_tiny catalina_spi catalina_serial4 catalina_serial2 catalina_sound catalina_tty catalina_tty256 libc libci libcx libcix libm libma libmb libmc libthreads libinterrupts libgraphics libvgraphics libtiny libspi libserial4 libserial2 libsound libtty libtty256 install

clean:
	$(MAKE) -C assert clean
	$(MAKE) -C ctype clean
	$(MAKE) -C errno clean
	$(MAKE) -C locale clean
	$(MAKE) -C math clean
	$(MAKE) -C setjmp clean
	$(MAKE) -C signal clean
	$(MAKE) -C stdio clean
	$(MAKE) -C stdlib clean
	$(MAKE) -C string clean
	$(MAKE) -C time clean
	$(MAKE) -C catalina clean
	$(MAKE) -C catalina_math clean
	$(MAKE) -C catalina_io clean
	$(MAKE) -C catalina_threads clean
	$(MAKE) -C catalina_p2 clean
	$(MAKE) -C catalina_interrupts clean
	$(MAKE) -C catalina_graphics clean
	$(MAKE) -C catalina_vgraphics clean
	$(MAKE) -C catalina_tiny clean
	$(MAKE) -C catalina_spi clean
	$(MAKE) -C catalina_serial4 clean
	$(MAKE) -C catalina_serial2 clean
	$(MAKE) -C catalina_sound clean
	$(MAKE) -C catalina_tty clean
	$(MAKE) -C catalina_tty256 clean
	$(MAKE) -C libc clean
	$(MAKE) -C libci clean
	$(MAKE) -C libcx clean
	$(MAKE) -C libcix clean
	$(MAKE) -C libm clean
	$(MAKE) -C libma clean
	$(MAKE) -C libmb clean
	$(MAKE) -C libmc clean
	$(MAKE) -C libthreads clean
	$(MAKE) -C libinterrupts clean
	$(MAKE) -C libgraphics clean
	$(MAKE) -C libvgraphics clean
	$(MAKE) -C libtiny clean
	$(MAKE) -C libspi clean
	$(MAKE) -C libserial4 clean
	$(MAKE) -C libserial2 clean
	$(MAKE) -C libsound clean
	$(MAKE) -C libtty clean
	$(MAKE) -C libtty256 clean

install:
	cp -r include $(CATALINA_BASE)
	cp -r libc $(CATALINA_BASE)/$(LIB)
	cp -r libci $(CATALINA_BASE)/$(LIB)
	cp -r libcx $(CATALINA_BASE)/$(LIB)
	cp -r libcix $(CATALINA_BASE)/$(LIB)
	cp -r libm $(CATALINA_BASE)/$(LIB)
	cp -r libma $(CATALINA_BASE)/$(LIB)
	cp -r libmb $(CATALINA_BASE)/$(LIB)
	cp -r libmc $(CATALINA_BASE)/$(LIB)
	cp -r libthreads $(CATALINA_BASE)/$(LIB)
	cp -r libinterrupts $(CATALINA_BASE)/$(LIB)
	cp -r libgraphics $(CATALINA_BASE)/$(LIB)
	cp -r libvgraphics $(CATALINA_BASE)/$(LIB)
	cp -r libtiny $(CATALINA_BASE)/$(LIB)
	cp -r libspi $(CATALINA_BASE)/$(LIB)
	cp -r libserial4 $(CATALINA_BASE)/$(LIB)
	cp -r libserial2 $(CATALINA_BASE)/$(LIB)
	cp -r libsound $(CATALINA_BASE)/$(LIB)
	cp -r libtty $(CATALINA_BASE)/$(LIB)
	cp -r libtty256 $(CATALINA_BASE)/$(LIB)

assert:	ALWAYSRUN
	$(MAKE) -C assert all

ctype:	ALWAYSRUN
	$(MAKE) -C ctype all

errno:	ALWAYSRUN
	$(MAKE) -C errno all

locale:	ALWAYSRUN
	$(MAKE) -C locale all

math:	ALWAYSRUN
	$(MAKE) -C math all

setjmp:	ALWAYSRUN
	$(MAKE) -C setjmp all

signal:	ALWAYSRUN
	$(MAKE) -C signal all

stdio:	ALWAYSRUN
	$(MAKE) -C stdio all

stdlib:	ALWAYSRUN
	$(MAKE) -C stdlib all

string:	ALWAYSRUN
	$(MAKE) -C string all

time:	ALWAYSRUN
	$(MAKE) -C time all

catalina:	ALWAYSRUN
	$(MAKE) -C catalina all

catalina_math:	ALWAYSRUN
	$(MAKE) -C catalina_math all

catalina_io:	ALWAYSRUN
	$(MAKE) -C catalina_io all

catalina_threads:	ALWAYSRUN
	$(MAKE) -C catalina_threads all

catalina_p2:	ALWAYSRUN
	$(MAKE) -C catalina_p2 all

catalina_interrupts:	ALWAYSRUN
	$(MAKE) -C catalina_interrupts all

catalina_graphics:	ALWAYSRUN
	$(MAKE) -C catalina_graphics all

catalina_vgraphics:	ALWAYSRUN
	$(MAKE) -C catalina_vgraphics all

catalina_tiny:	ALWAYSRUN
	$(MAKE) -C catalina_tiny all

catalina_spi:	ALWAYSRUN
	$(MAKE) -C catalina_spi all

catalina_serial4:	ALWAYSRUN
	$(MAKE) -C catalina_serial4 all

catalina_serial2:	ALWAYSRUN
	$(MAKE) -C catalina_serial2 all

catalina_sound:	ALWAYSRUN
	$(MAKE) -C catalina_sound all

catalina_tty:   ALWAYSRUN
	$(MAKE) -C catalina_tty all

catalina_tty256:	ALWAYSRUN
	$(MAKE) -C catalina_tty256 all

libc:	ALWAYSRUN
	$(MAKE) -C stdio clean
	$(MAKE) -C catalina clean
	$(MAKE) -C catalina_p2 clean
	$(MAKE) -C catalina_io clean
	$(MAKE) -B -C catalina CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=0"
ifeq ($(PROPELLER_2),TRUE)
	$(MAKE) -B -C catalina_p2 CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=0"
endif
	$(MAKE) -B -C catalina_io CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=0"
	$(MAKE) -B -C stdio CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=0"
	$(MAKE) -C libc all

libci:	ALWAYSRUN
	$(MAKE) -C stdio clean
	$(MAKE) -C catalina clean
	$(MAKE) -C catalina_p2 clean
	$(MAKE) -C catalina_io clean
	$(MAKE) -B -C catalina CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=1 -D__CATALINA_SDCARD_IO=0 -DNOFLOAT"
ifeq ($(PROPELLER_2),TRUE)
	$(MAKE) -B -C catalina_p2 CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=1 -D__CATALINA_SDCARD_IO=0 -DNOFLOAT"
endif
	$(MAKE) -B -C catalina_io CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=1 -D__CATALINA_SDCARD_IO=0"
	$(MAKE) -B -C stdio CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=1 -D__CATALINA_SDCARD_IO=0 -DNOFLOAT"
	$(MAKE) -C libci all

libcx:	ALWAYSRUN
	$(MAKE) -C stdio clean
	$(MAKE) -C catalina clean
	$(MAKE) -C catalina_p2 clean
	$(MAKE) -C catalina_io clean
	$(MAKE) -B -C catalina CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1"
ifeq ($(PROPELLER_2),TRUE)
	$(MAKE) -B -C catalina_p2 CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1"
endif
	$(MAKE) -B -C catalina_io CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1"
	$(MAKE) -B -C stdio CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1"
	$(MAKE) -C libcx all

libcix:	ALWAYSRUN
	$(MAKE) -C stdio clean
	$(MAKE) -C catalina clean
	$(MAKE) -C catalina_p2 clean
	$(MAKE) -C catalina_io clean
	$(MAKE) -B -C catalina CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1 -DNOFLOAT"
ifeq ($(PROPELLER_2),TRUE)
	$(MAKE) -B -C catalina_p2 CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1 -DNOFLOAT"
endif
	$(MAKE) -B -C catalina_io CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1 -DNOFLOAT"
	$(MAKE) -B -C stdio CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1 -DNOFLOAT"
	$(MAKE) -C libcix all

libm:	ALWAYSRUN
	$(MAKE) -C libm all

libma:	ALWAYSRUN
	$(MAKE) -C libma all

libmb:	ALWAYSRUN
	$(MAKE) -C libmb all

libmc:	ALWAYSRUN
	$(MAKE) -C libmc all

libthreads:	ALWAYSRUN
	$(MAKE) -C libthreads all

libinterrupts:	ALWAYSRUN
	$(MAKE) -C libinterrupts all

libgraphics:	ALWAYSRUN
	$(MAKE) -C libgraphics all

libvgraphics:	ALWAYSRUN
	$(MAKE) -C libvgraphics all

libtiny:	ALWAYSRUN
	$(MAKE) -C libtiny all

libspi:	ALWAYSRUN
	$(MAKE) -C libspi all

libserial4:	ALWAYSRUN
	$(MAKE) -C libserial4 all

libserial2:	ALWAYSRUN
	$(MAKE) -C libserial2 all

libsound:	ALWAYSRUN
	$(MAKE) -C libsound all

libtty:	ALWAYSRUN
	$(MAKE) -C libtty all

libtty256: ALWAYSRUN
	$(MAKE) -C libtty256 all

ALWAYSRUN:
