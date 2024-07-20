include Makefile.inc

ifeq ($(LARGE),TRUE)
ifeq ($(PROPELLER_2),TRUE)
LIB = lib/p2/xmm
else
LIB = lib/p1/xmm
endif
else
ifeq ($(COMPACT),TRUE)
ifeq ($(PROPELLER_2),TRUE)
LIB = lib/p2/cmm
else
LIB = lib/p1/cmm
endif
else
ifeq ($(NATIVE),TRUE)
ifeq ($(PROPELLER_2),TRUE)
LIB = lib/p2/nmm
else
LIB = lib/p1/nmm
endif
else
ifeq ($(PROPELLER_2),TRUE)
LIB = lib/p2/lmm
else
LIB = lib/p1/lmm
endif
endif
endif
endif

ifndef OUTPUT
ifndef LCCDIR
   OUTPUT=/opt/catalina
else
   OUTPUT=$(LCCDIR)
endif
endif


ifeq ($(PROPELLER_2),TRUE)

all: assert ctype errno locale math setjmp signal stdlib string time catalina float threads int tiny spi lua libc p2 serial2 serial8 psram hyper libci libcix libcx libm libma libmb libmc libthreads libint libtiny libspi liblua libluax libserial2 libserial8 libpsram libhyper install 

else

all: assert ctype errno locale math setjmp signal stdlib string time catalina float threads int tiny spi lua graphics vgraphic serial4 sound tty tty256 libc libci libcix libcx libm libma libmb libmc libthreads libint libtiny libspi liblua libluax libgraphics libvgraphic libserial4 libsound libtty libtty256 install

endif

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
	$(MAKE) -C float clean
	$(MAKE) -C io clean
	$(MAKE) -C threads clean
	$(MAKE) -C p2 clean
	$(MAKE) -C int clean
	$(MAKE) -C graphics clean
	$(MAKE) -C vgraphic clean
	$(MAKE) -C tiny clean
	$(MAKE) -C spi clean
	$(MAKE) -C serial4 clean
	$(MAKE) -C serial2 clean
	$(MAKE) -C serial8 clean
	$(MAKE) -C psram clean
	$(MAKE) -C hyper clean
	$(MAKE) -C sound clean
	$(MAKE) -C tty clean
	$(MAKE) -C tty256 clean
	$(MAKE) -C lua clean
	$(MAKE) -C lib/c clean
	$(MAKE) -C lib/ci clean
	$(MAKE) -C lib/cx clean
	$(MAKE) -C lib/cix clean
	$(MAKE) -C lib/m clean
	$(MAKE) -C lib/ma clean
	$(MAKE) -C lib/mb clean
	$(MAKE) -C lib/mc clean
	$(MAKE) -C lib/threads clean
	$(MAKE) -C lib/int clean
	$(MAKE) -C lib/graphics clean
	$(MAKE) -C lib/vgraphic clean
	$(MAKE) -C lib/tiny clean
	$(MAKE) -C lib/spi clean
	$(MAKE) -C lib/serial4 clean
	$(MAKE) -C lib/serial2 clean
	$(MAKE) -C lib/serial8 clean
	$(MAKE) -C lib/psram clean
	$(MAKE) -C lib/hyper clean
	$(MAKE) -C lib/sound clean
	$(MAKE) -C lib/tty clean
	$(MAKE) -C lib/tty256 clean
	$(MAKE) -C lib/lua clean
	$(MAKE) -C lib/luax clean

install:
	-cp -r include $(OUTPUT)
	-cp -r lib/c $(OUTPUT)/$(LIB)
	-cp -r lib/ci $(OUTPUT)/$(LIB)
	-cp -r lib/cx $(OUTPUT)/$(LIB)
	-cp -r lib/cix $(OUTPUT)/$(LIB)
	-cp -r lib/m $(OUTPUT)/$(LIB)
	-cp -r lib/ma $(OUTPUT)/$(LIB)
	-cp -r lib/mb $(OUTPUT)/$(LIB)
	-cp -r lib/mc $(OUTPUT)/$(LIB)
	-cp -r lib/threads $(OUTPUT)/$(LIB)
	-cp -r lib/int $(OUTPUT)/$(LIB)
	-cp -r lib/graphics $(OUTPUT)/$(LIB)
	-cp -r lib/vgraphic $(OUTPUT)/$(LIB)
	-cp -r lib/tiny $(OUTPUT)/$(LIB)
	-cp -r lib/spi $(OUTPUT)/$(LIB)
	-cp -r lib/serial4 $(OUTPUT)/$(LIB)
	-cp -r lib/serial2 $(OUTPUT)/$(LIB)
	-cp -r lib/serial8 $(OUTPUT)/$(LIB)
	-cp -r lib/psram $(OUTPUT)/$(LIB)
	-cp -r lib/hyper $(OUTPUT)/$(LIB)
	-cp -r lib/sound $(OUTPUT)/$(LIB)
	-cp -r lib/tty $(OUTPUT)/$(LIB)
	-cp -r lib/tty256 $(OUTPUT)/$(LIB)
	-cp -r lib/lua $(OUTPUT)/$(LIB)
	-cp -r lib/luax $(OUTPUT)/$(LIB)

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

float:	ALWAYSRUN
	$(MAKE) -C float all

io:	ALWAYSRUN
	$(MAKE) -C io all

threads:	ALWAYSRUN
	$(MAKE) -C threads all

int:	ALWAYSRUN
	$(MAKE) -C int all

tiny:	ALWAYSRUN
	$(MAKE) -C tiny all

spi:	ALWAYSRUN
	$(MAKE) -C spi all

lua:	ALWAYSRUN
	$(MAKE) -C lua all

p2:	ALWAYSRUN
	$(MAKE) -C p2 all

serial2:	ALWAYSRUN
	$(MAKE) -C serial2 all

serial8:	ALWAYSRUN
	$(MAKE) -C serial8 all

psram:	ALWAYSRUN
	$(MAKE) -C psram all

hyper:	ALWAYSRUN
	$(MAKE) -C hyper all

graphics:	ALWAYSRUN
	$(MAKE) -C graphics all

vgraphic:	ALWAYSRUN
	$(MAKE) -C vgraphic all

serial4:	ALWAYSRUN
	$(MAKE) -C serial4 all

sound:	ALWAYSRUN
	$(MAKE) -C sound all

tty:   ALWAYSRUN
	$(MAKE) -C tty all

tty256:	ALWAYSRUN
	$(MAKE) -C tty256 all

libc:	ALWAYSRUN
	$(MAKE) -C stdio clean
	$(MAKE) -C catalina clean
	$(MAKE) -C p2 clean
	$(MAKE) -C io clean
	$(MAKE) -B -C catalina CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=0"
ifeq ($(PROPELLER_2),TRUE)
	$(MAKE) -B -C p2 CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=0"
endif
	$(MAKE) -B -C io CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=0"
	$(MAKE) -B -C stdio CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=0"
	$(MAKE) -C lib/c all

libci:	ALWAYSRUN
	$(MAKE) -C stdio clean
	$(MAKE) -C catalina clean
	$(MAKE) -C p2 clean
	$(MAKE) -C io clean
	$(MAKE) -B -C catalina CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=1 -D__CATALINA_SDCARD_IO=0 -DNOFLOAT"
ifeq ($(PROPELLER_2),TRUE)
	$(MAKE) -B -C p2 CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=1 -D__CATALINA_SDCARD_IO=0 -DNOFLOAT"
endif
	$(MAKE) -B -C io CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=1 -D__CATALINA_SDCARD_IO=0"
	$(MAKE) -B -C stdio CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=1 -D__CATALINA_SDCARD_IO=0 -DNOFLOAT"
	$(MAKE) -C lib/ci all

libcx:	ALWAYSRUN
	$(MAKE) -C stdio clean
	$(MAKE) -C catalina clean
	$(MAKE) -C p2 clean
	$(MAKE) -C io clean
	$(MAKE) -B -C catalina CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1"
ifeq ($(PROPELLER_2),TRUE)
	$(MAKE) -B -C p2 CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1"
endif
	$(MAKE) -B -C io CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1"
	$(MAKE) -B -C stdio CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1"
	$(MAKE) -C lib/cx all

libcix:	ALWAYSRUN
	$(MAKE) -C stdio clean
	$(MAKE) -C catalina clean
	$(MAKE) -C p2 clean
	$(MAKE) -C io clean
	$(MAKE) -B -C catalina CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1 -DNOFLOAT"
ifeq ($(PROPELLER_2),TRUE)
	$(MAKE) -B -C p2 CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1 -DNOFLOAT"
endif
	$(MAKE) -B -C io CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1 -DNOFLOAT"
	$(MAKE) -B -C stdio CCFLAGS="$(CCFLAGS) -D__CATALINA_SIMPLE_IO=0 -D__CATALINA_SDCARD_IO=1 -DNOFLOAT"
	$(MAKE) -C lib/cix all

libm:	ALWAYSRUN
	$(MAKE) -C lib/m all

libma:	ALWAYSRUN
	$(MAKE) -C lib/ma all

libmb:	ALWAYSRUN
	$(MAKE) -C lib/mb all

libmc:	ALWAYSRUN
	$(MAKE) -C lib/mc all

libthreads:	ALWAYSRUN
	$(MAKE) -C lib/threads all

libint:	ALWAYSRUN
	$(MAKE) -C lib/int all

libtiny:	ALWAYSRUN
	$(MAKE) -C lib/tiny all

libspi:	ALWAYSRUN
	$(MAKE) -C lib/spi all

liblua: ALWAYSRUN
	$(MAKE) -C lib/lua all

libluax: ALWAYSRUN
	$(MAKE) -C lib/luax all

libgraphics:	ALWAYSRUN
	$(MAKE) -C lib/graphics all

libvgraphic:	ALWAYSRUN
	$(MAKE) -C lib/vgraphic all

libserial4:	ALWAYSRUN
	$(MAKE) -C lib/serial4 all

libsound:	ALWAYSRUN
	$(MAKE) -C lib/sound all

libtty:	ALWAYSRUN
	$(MAKE) -C lib/tty all

libtty256: ALWAYSRUN
	$(MAKE) -C lib/tty256 all

libserial2:	ALWAYSRUN
	$(MAKE) -C lib/serial2 all

libserial8:	ALWAYSRUN
	$(MAKE) -C lib/serial8 all

libpsram:	ALWAYSRUN
	$(MAKE) -C lib/psram all

libhyper:	ALWAYSRUN
	$(MAKE) -C lib/hyper all

ALWAYSRUN:


