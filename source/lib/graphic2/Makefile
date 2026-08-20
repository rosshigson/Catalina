include ../Makefile.inc

all:	 \
	cgicolor.s \
	cgioffs.s \
	cgipal.s \
	cgiscrn.s \
	cgislice.s \
	cgitiles.s \
	cgitotal.s \
	cgiwidth.s \
	addram.s\
	arc.s \
	box.s \
	clear.s \
	color.s \
	colorw.s \
	copy.s \
	fill.s \
	justify.s \
	line.s \
	mode.s \
	move.s \
	nes.s \
	pix.s \
	pixarc.s \
	plot.s \
	quad.s \
	setcolor.s \
	setpalette.s \
	setcmd.s \
	setup.s \
	sincos.s \
	snes.s \
	text.s \
	textarc.s \
	textmode.s \
	tri.s \
	vec.s \
	vecarc.s \
	width.s
ifeq ($(COMPACT),TRUE)
	cp cgidata.ce cgidata.s
	cp sar.ce sar.s
	cp limit.ce limit.s
	cp randf.ce randf.s 
	cp randr.ce randr.s
else
	$(SPINPP) $(SPINPPFLAGS) cgidata.e > cgidata.s
	$(SPINPP) $(SPINPPFLAGS) sar.e > sar.s
	$(SPINPP) $(SPINPPFLAGS) limit.e > limit.s
	$(SPINPP) $(SPINPPFLAGS) randf.e > randf.s 
	$(SPINPP) $(SPINPPFLAGS) randr.e > randr.s
endif

clean:
	-rm -f *.s
