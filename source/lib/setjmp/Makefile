include ../Makefile.inc

all:	sigmisc.s
ifeq ($(COMPACT),TRUE)
	cp setjmp_compact.e setjmp.s
else
	$(SPINPP) $(SPINPPFLAGS) setjmp.e > setjmp.s
endif

clean:
	rm -f setjmp.s sigmisc.s OLIST
