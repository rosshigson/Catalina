include ../Makefile.inc

all:	 \
	cgibbase.s \
	cgicolor.s \
	cgidbase.s \
	cgiscrn.s \
	cgixtile.s \
	cgiytile.s \
	arc.s \
	box.s \
	clear.s \
	color.s \
	colorw.s \
	copy.s \
	fill.s \
	finish.s \
	justify.s \
	line.s \
	pix.s \
	pixarc.s \
	plot.s \
	quad.s \
	setup.s \
	text.s \
	textarc.s \
	textmode.s \
	tri.s \
	vec.s \
	vecarc.s \
	width.s \
	basicm.s \
	basicm2.s \
	basicmz.s \
	enhm.s \
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
	cp memmove.ce memmove.s
	cp memset.ce memset.s
	cp setcmd.ce setcmd.s
	cp sar.ce sar.s
	cp limit.ce limit.s
	cp randf.ce randf.s 
	cp randr.ce randr.s
else
	$(SPINPP) $(SPINPPFLAGS) cgidata.e > cgidata.s
	$(SPINPP) $(SPINPPFLAGS) memmove.e > memmove.s
	$(SPINPP) $(SPINPPFLAGS) memset.e > memset.s
	$(SPINPP) $(SPINPPFLAGS) setcmd.e > setcmd.s
	$(SPINPP) $(SPINPPFLAGS) sar.e > sar.s
	$(SPINPP) $(SPINPPFLAGS) limit.e > limit.s
	$(SPINPP) $(SPINPPFLAGS) randf.e > randf.s 
	$(SPINPP) $(SPINPPFLAGS) randr.e > randr.s
endif

clean:
	-rm -f *.s
