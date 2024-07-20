include ../../Makefile.inc

MALLOCS =	mal_mal.s mal_cal.s mal_rea.s mal_fre.s mal_sel.s\
				pcrc.s pcomc.s ptrunc.s lfp.s lfle.s llfc.s\
				lsfl.s lufc.s check.s global.s

MALLOCSRC =	sizetype.h param.h impl.h check.h log.h phys.h \
				mal_mal.c mal_cal.c mal_rea.c mal_fre.c mal_sel.c\
				pcrc.c pcomc.c ptrunc.c lfp.c lfle.c llfc.c\
				lsfl.c lufc.c check.c global.c 

$(MALLOCOBJ):	$(MALLOCS) Makefile 

all:	$(MALLOCS)

clean:
	-rm -f *.s
