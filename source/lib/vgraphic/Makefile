include ../Makefile.inc

all:	 \
	cgicolor.s \
	cgidbase.s \
	cgiscrn.s \
	cgixtile.s \
	cgiytile.s \
	arc.s \
	box.s \
	color.s \
	pallete.s \
	colorw.s \
	flush.s \
	finish.s \
	justify.s \
	line.s \
	pix.s \
	pixarc.s \
	plot.s \
	quad.s \
	mode.s \
	setup.s \
	dbsetup.s \
	clear.s \
	copy.s \
	move.s \
	text.s \
	textarc.s \
	textmode.s \
	tri.s \
	vec.s \
	vecarc.s \
	width.s \
	basicm.s \
	basicm2.s \
	enhm.s \
	basicmz.s \
	enhmz.s \
	kclear.s \
	kget.s \
	kinit.s \
	knew.s \
	kpresent.s \
	kready.s \
	kstate.s \
	kwait.s
ifeq ($(COMPACT),TRUE)
	cp cgidata.ce cgidata.s
	cp setcmd.ce setcmd.s
	cp dbsetcmd.ce dbsetcmd.s
	cp sar.ce sar.s
	cp limit.ce limit.s
	cp randf.ce randf.s 
	cp randr.ce randr.s
else
	$(SPINPP) $(SPINPPFLAGS) cgidata.e > cgidata.s
	$(SPINPP) $(SPINPPFLAGS) setcmd.e > setcmd.s
	$(SPINPP) $(SPINPPFLAGS) dbsetcmd.e > dbsetcmd.s
	$(SPINPP) $(SPINPPFLAGS) sar.e > sar.s
	$(SPINPP) $(SPINPPFLAGS) limit.e > limit.s
	$(SPINPP) $(SPINPPFLAGS) randf.e > randf.s 
	$(SPINPP) $(SPINPPFLAGS) randr.e > randr.s
endif

clean:
	-rm -f *.s
