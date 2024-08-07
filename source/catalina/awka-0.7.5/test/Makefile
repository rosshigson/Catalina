# Makefile for Awka test suite.
#
# Copyright (C) 1999 Andrew Sumner
# Copyright (C) 1988-1997 the Free Software Foundation, Inc.
# 
# This file is part of Awka, a package for translation of
# AWK programs to ANSI-C, and a library for linking translated
# and compiled programs.
#
# This file was borrowed and modified from GAWK, the GNU implementation 
# of the AWK Programming Language.
# 
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA

SHELL = /bin/sh
AWK = gawk
CMP = cmp
CC  = gcc
EXE = 
MLIB = -lm
SLIB = 

AWKA = ../awka/awka
MATHLIB = $(MLIB) $(SLIB)

# for the brave at heart...
#AWKA = ../awka/awka -d  
#MATHLIB = $(MLIB) -L../dfa -I../dfa -ldfa

srcdir = .


bigtest:	basic unix-tests awka.extensions

basic:	msg swaplns messages a_cat pdb_find_salt argarray longwrds \
	getline getline2 fstabplus compare arrayref rs fsrs rand fun dubois \
	fsbs negexp asgext anchgsub splitargv nfset reparse bil bil2 \
	convfmt litoct resplit rswhite intprec childin splitrem aloop \
	numsubstr pcntplus prmreuse math fldchg fldchgnf reindops range \
	sprintfc backgsub tweakfld clsflnam mmap8k conflict amsal amsal2 \
	amsal3 amsal4 amsal5 dynlj substr eofsplit prt1eval prtoeval retest \
	gsubtest splitwht back89 tradanch nlfldsep splitvar intest nors hh \
	eiso eiso2 eiso3 eiso4 fnarydel funstack clobber delarprm prdupval \
	nfldstr foronsplit divide parsecsv arraycat argtest2 fw rsre unbuf \
	bslash print cox gensub zeroflag getnr2tm getnr2tb \
	numindex subslash opasnslf opasnidx arynocls getlnbuf arysubnm \
	nlstrina nextfile next rsnul1nl

unix-tests: poundbang fflush getlnhd pipeio1 pipeio2 strftlng 

awka.extensions: posix posix2 manyfiles nondec asort

extra:	regtest inftest

next::
	@$(AWKA) -f next.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx nextfile.in1 >_$@
	$(CMP) $(srcdir)/next.ok _$@ && rm -f _$@
	
nextfile::
	@$(AWKA) -f nextfile.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx nextfile.in1 nextfile.in2 nextfile.in3 >_$@
	$(CMP) $(srcdir)/nextfile.ok _$@ && rm -f _$@
	
nasty::
	@echo '-> nasty test: sometimes fails, producing a string of 123123123 etc'
	@echo '-> instead of aaaaa... I believe this to be caused by differences in the'
	@echo '-> order of execution some C compilers decide on, and really its not a'
	@echo '-> problem.  But if the test works for you, great!'
	@$(AWKA) -f nasty.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/nasty.ok _$@ && rm -f _$@
	
zeroflag::
	@$(AWKA) -f zeroflag.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/zeroflag.ok _$@ && rm -f _$@

rsnul1nl::
	@$(AWKA) -f rsnul1nl.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx rsnul1nl.in >_$@
	$(CMP) $(srcdir)/rsnul1nl.ok _$@ && rm -f _$@

getnr2tm::
	@$(AWKA) -f getnr2tm.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx getnr2tm.in >_$@
	$(CMP) $(srcdir)/getnr2tm.ok _$@ && rm -f _$@

getnr2tb::
	@$(AWKA) -f getnr2tb.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx getnr2tb.in >_$@
	$(CMP) $(srcdir)/getnr2tb.ok _$@ && rm -f _$@

asort::
	@$(AWKA) -f asort.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/asort.ok _$@ && rm -f _$@

printf1::
	@echo '-> printf1: causing grief on some platforms that unfortunately I have'
	@echo '-> no access to.  The 4th line sometimes fails to print a 0 character,'
	@echo '-> for reasons known only to itself.  If you can provide telnet access'
	@echo '-> to a machine exhibiting this problem do let me know.  -andrew'
	@$(AWKA) -f printf1.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/printf1.ok _$@ && rm -f _$@

numindex::
	@$(AWKA) -f numindex.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx <$(srcdir)/numindex.in >_$@
	$(CMP) $(srcdir)/numindex.ok _$@ && rm -f _$@

subslash::
	@$(AWKA) -f subslash.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/subslash.ok _$@ && rm -f _$@

opasnslf::
	@$(AWKA) -f opasnslf.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/opasnslf.ok _$@ && rm -f _$@

opasnidx::
	@$(AWKA) -f opasnidx.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/opasnidx.ok _$@ && rm -f _$@

arynocls::
	@$(AWKA) -f arynocls.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx arynocls.in >_$@
	$(CMP) $(srcdir)/arynocls.ok _$@ && rm -f _$@

getlnbuf::
	@$(AWKA) -f getlnbuf.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx getlnbuf.in >_$@
	@$(AWKA) -f gtlnbufv.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx getlnbuf.in >_2$@
	$(CMP) $(srcdir)/getlnbuf.ok _$@ && $(CMP) $(srcdir)/getlnbuf.ok _2$@ && rm -f _$@ _2$@

arysubnm::
	@$(AWKA) -f arysubnm.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/arysubnm.ok _$@ && rm -f _$@

nlstrina::
	@$(AWKA) -f nlstrina.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/nlstrina.ok _$@ && rm -f _$@

poundbang::
	@$(AWKA) -f poundbang >x.c;
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx poundbang >_`basename $@`
	$(CMP) $(srcdir)/poundbang.ok _`basename $@` && rm -f _`basename $@`

msg::
	@echo 'Any output from "cmp" is bad news, although some differences'
	@echo 'in floating point values are probably benign -- in particular,'
	@echo 'some systems may omit a leading zero and the floating point'
	@echo 'precision may lead to slightly different output in a few cases.'

swaplns::
	@$(AWKA) -f $(srcdir)/swaplns.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/swaplns.in >_$@
	$(CMP) $(srcdir)/swaplns.ok _$@ && rm -f _$@

messages::
	@$(AWKA) -f $(srcdir)/messages.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >out2 2>out3
	{ $(CMP) $(srcdir)/out1.ok out1 && $(CMP) $(srcdir)/out2.ok out2 && \
	$(CMP) $(srcdir)/out3.ok out3 && rm -f out1 out2 out3; } || \
	{ { test -d /dev/fd || test -d /proc/self/fd; } && \
	echo IT IS OK THAT THIS TEST FAILED; }

argarray::
	@case $(srcdir) in \
	.)	: ;; \
	*)	cp $(srcdir)/argarray.in . ;; \
	esac
	@$(AWKA) -f $(srcdir)/argarray.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@TEST=test echo just a test | ./xx -v EXE=$(EXE) ./argarray.in - >_$@
	$(CMP) $(srcdir)/argarray.ok _$@ && rm -f _$@

argtest2::
	@$(AWKA) -f $(srcdir)/argtest2.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	@$(AWKA) -f $(srcdir)/argtest2.awk -a "-v var=value" >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >>_$@
	@$(AWKA) -f $(srcdir)/argtest2.awk -a "-We -v var=value" >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >>_$@
	$(CMP) $(srcdir)/argtest2.ok _$@ && rm -f _$@
	
fstabplus::
	@$(AWKA) -f $(srcdir)/fstabplus.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@echo '1		2' | ./xx >_$@
	$(CMP) $(srcdir)/fstabplus.ok _$@ && rm -f _$@

pdb_find_salt::
	@$(AWKA) -f $(srcdir)/pdb_find_salt.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx pdb_find_salt.in >_$@
	$(CMP) $(srcdir)/pdb_find_salt.ok _$@ && rm -f _$@

print::
	@$(AWKA) -f $(srcdir)/print.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/print.ok _$@ && rm -f _$@

gensub::
	@$(AWKA) -f $(srcdir)/gensub.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/gensub.ok _$@ && rm -f _$@

cox::
	@$(AWKA) -f $(srcdir)/cox.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/cox.ok _$@ && rm -f _$@

hh::
	@$(AWKA) -f $(srcdir)/hh.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx -v scalefile=hh.in >_$@
	$(CMP) $(srcdir)/hh.ok _$@ && rm -f _$@

retest::
	@$(AWKA) -f $(srcdir)/retest.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/retest.ok _$@ && rm -f _$@

bslash::
	@$(AWKA) -f $(srcdir)/bslash.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/bslash.ok _$@ && rm -f _$@

fw::
	@$(AWKA) -f $(srcdir)/fw.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx fw.in >_$@
	$(CMP) $(srcdir)/fw.ok _$@ && rm -f _$@

rsre::
	@$(AWKA) -f $(srcdir)/rsre.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx rsre.awk >_$@
	$(CMP) $(srcdir)/rsre.ok _$@ && rm -f _$@

unbuf::
	@$(AWKA) -f $(srcdir)/unbuf.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@cat $(srcdir)/unbuf.awk | ./xx -vINFILE="$(srcdir)/unbuf.awk" unbuf.awk >_$@
	$(CMP) $(srcdir)/unbuf.ok _$@ && rm -f _$@

a_cat::
	@$(AWKA) -f $(srcdir)/a_cat.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/a_cat.ok _$@ && rm -f _$@

bil::
	@$(AWKA) -f $(srcdir)/bil.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx bil.in >_$@
	$(CMP) $(srcdir)/bil.ok _$@ && rm -f _$@

bil2::
	@$(AWKA) -f $(srcdir)/bil2.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx bil2.in1 >_$@
	$(CMP) $(srcdir)/bil2.ok _$@ && rm -f _$@

eiso::
	@$(AWKA) -f $(srcdir)/eiso.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx eiso.in >_$@
	$(CMP) $(srcdir)/eiso.ok _$@ && rm -f _$@

eiso2::
	@$(AWKA) -f $(srcdir)/eiso2.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx eiso2.in >_$@
	$(CMP) $(srcdir)/eiso2.ok _$@ && rm -f _$@

eiso3::
	@$(AWKA) -f $(srcdir)/eiso3.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/eiso3.ok _$@ && rm -f _$@

eiso4::
	@$(AWKA) -f $(srcdir)/eiso4.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx eiso4.in >_$@
	$(CMP) $(srcdir)/eiso4.ok _$@ && rm -f _$@

divide::
	@$(AWKA) -f $(srcdir)/divide.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/divide.ok _$@ && rm -f _$@

parsecsv::
	@$(AWKA) -f $(srcdir)/parsecsv.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx parsecsv.in >_$@
	$(CMP) $(srcdir)/parsecsv.ok _$@ && rm -f _$@

range::
	@$(AWKA) -f $(srcdir)/range.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx range.in >_$@
	$(CMP) $(srcdir)/range.ok _$@ && rm -f _$@

conflict::
	@$(AWKA) -f $(srcdir)/conflict.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/conflict.ok _$@ && rm -f _$@

aloop::
	@$(AWKA) -f $(srcdir)/aloop.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/aloop.ok _$@ && rm -f _$@

dubois::
	@$(AWKA) -f $(srcdir)/dubois.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/dubois.ok _$@ && rm -f _$@

splitrem::
	@$(AWKA) -f $(srcdir)/splitrem.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/splitrem.ok _$@ && rm -f _$@

fun::
	@$(AWKA) -f $(srcdir)/fun.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/fun.ok _$@ && rm -f _$@

fsrs::
	@$(AWKA) -f $(srcdir)/fsrs.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/fsrs.in >_$@
	$(CMP) $(srcdir)/fsrs.ok _$@ && rm -f _$@

amsal::
	@$(AWKA) -f $(srcdir)/amsal.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/amsal.in >_$@
	$(CMP) $(srcdir)/amsal.ok _$@ && rm -f _$@

amsal2::
	@$(AWKA) -f $(srcdir)/amsal2.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/amsal2.awk >_$@
	$(CMP) $(srcdir)/amsal2.ok _$@ && rm -f _$@

amsal3::
	@$(AWKA) -f $(srcdir)/amsal3.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/amsal3.in >_$@
	$(CMP) $(srcdir)/amsal3.ok _$@ && rm -f _$@

amsal4::
	@$(AWKA) -f $(srcdir)/amsal4.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/amsal4-1.in $(srcdir)/amsal4-2.in >_$@
	$(CMP) $(srcdir)/amsal4.ok _$@ && rm -f _$@

amsal5::
	@$(AWKA) -f $(srcdir)/amsal5.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/amsal5.in >_$@
	$(CMP) $(srcdir)/amsal5.ok _$@ && rm -f _$@

arraycat::
	@$(AWKA) -f $(srcdir)/arraycat.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/arraycat.ok _$@ && rm -f _$@

longwrds::
	@$(AWKA) -f $(srcdir)/longwrds.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/manpage >_$@
	$(CMP) $(srcdir)/longwrds.ok _$@ && rm -f _$@

regtest::
	@echo 'Some of the output from regtest is very system specific, do not'
	@echo 'be distressed if your output differs from that distributed.'
	@echo 'Manual inspection is called for.'
	AWK=`pwd`/$(AWK) CC=$(CC) MATHLIB=$(MATHLIB) $(srcdir)/regtest

posix::
	@$(AWKA) -f $(srcdir)/posix.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@echo '1:2,3 4' | ./xx >_$@
	$(CMP) $(srcdir)/posix.ok _$@ && rm -f _$@

posix2::
	@$(AWKA) -f $(srcdir)/posix2.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx posix2.in >_$@
	$(CMP) $(srcdir)/posix2.ok _$@ && rm -f _$@

manyfiles::
	@rm -rf junk
	@mkdir junk
	@$(AWK) 'BEGIN { for (i = 1; i <= 32; i++) print i, i}' >_$@
	@$(AWKA) -f $(srcdir)/manyfiles.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx _$@ _$@
	@echo "This number better be 1 ->" | tr -d '\012\015'
	@wc -l junk/* | $(AWK) '$$1 != 2' | wc -l
	@rm -rf junk _$@

compare::
	@$(AWKA) -f $(srcdir)/compare.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx 0 1 $(srcdir)/compare.in >_$@
	$(CMP) $(srcdir)/compare.ok _$@ && rm -f _$@

arrayref::
	@$(AWKA) -f $(srcdir)/arrayref.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/arrayref.ok _$@ && rm -f _$@

rs::
	@$(AWKA) '{ print $$1, $$2}' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx -v RS="" $(srcdir)/rs.in >_$@
	$(CMP) $(srcdir)/rs.ok _$@ && rm -f _$@

fsbs::
	@$(AWKA) '{ print $$1, $$2 }' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx -v FS='\' $(srcdir)/fsbs.in >_$@
	$(CMP) $(srcdir)/fsbs.ok _$@ && rm -f _$@

inftest::
	@echo This test is very machine specific...
	@$(AWKA) -f $(srcdir)/inftest.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/inftest.ok _$@ && rm -f _$@

getline::
	@$(AWKA) -f $(srcdir)/getline.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/getline.awk $(srcdir)/getline.awk >_$@
	$(CMP) $(srcdir)/getline.ok _$@ && rm -f _$@

getline2::
	@$(AWKA) -f $(srcdir)/getline2.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/getline2.in >_$@
	$(CMP) $(srcdir)/getline2.ok _$@ && rm -f _$@

rand::
	@$(AWKA) -f $(srcdir)/rand.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/rand.ok _$@ && rm -f _$@

negexp::
	@$(AWKA) 'BEGIN { a = -2; print 10^a }' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/negexp.ok _$@ && rm -f _$@

asgext::
	@$(AWKA) -f $(srcdir)/asgext.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/asgext.in >_$@
	$(CMP) $(srcdir)/asgext.ok _$@ && rm -f _$@

anchgsub::
	@$(AWKA) -f $(srcdir)/anchgsub.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/anchgsub.in >_$@
	$(CMP) $(srcdir)/anchgsub.ok _$@ && rm -f _$@

splitargv::
	@$(AWKA) -f $(srcdir)/splitargv.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/splitargv.in >_$@
	$(CMP) $(srcdir)/splitargv.ok _$@ && rm -f _$@

nfset::
	@$(AWKA) -f $(srcdir)/nfset.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/nfset.in >_$@
	$(CMP) $(srcdir)/nfset.ok _$@ && rm -f _$@

reparse::
	@$(AWKA) -f $(srcdir)/reparse.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/reparse.in >_$@
	$(CMP) $(srcdir)/reparse.ok _$@ && rm -f _$@

convfmt::
	@$(AWKA) -f $(srcdir)/convfmt.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/convfmt.ok _$@ && rm -f _$@

litoct::
	@$(AWKA) -f $(srcdir)/litoct.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@echo ab | ./xx >_$@
	$(CMP) $(srcdir)/litoct.ok _$@ && rm -f _$@

resplit::
	@$(AWKA) '{ FS = ":"; $$0 = $$0; print $$2 }' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@echo a:b:c d:e:f | ./xx > _$@
	$(CMP) $(srcdir)/resplit.ok _$@ && rm -f _$@

rswhite::
	@$(AWKA) -f $(srcdir)/rswhite.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/rswhite.in > _$@
	$(CMP) $(srcdir)/rswhite.ok _$@ && rm -f _$@

intprec::
	@-$(AWKA) -f $(srcdir)/intprec.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx > _$@ 2>&1
	$(CMP) $(srcdir)/intprec.ok _$@ && rm -f _$@

childin::
	@$(AWKA) 'BEGIN { "cat" | getline; print; close("cat") }' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@echo hi | ./xx > _$@
	$(CMP) $(srcdir)/childin.ok _$@ && rm -f _$@

numsubstr::
	@$(AWKA) -f numsubstr.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@-AWKPATH=$(srcdir) ./xx $(srcdir)/numsubstr.in >_$@
	$(CMP) $(srcdir)/numsubstr.ok _$@ && rm -f _$@

gnureops::
	@$(AWKA) -f $(srcdir)/gnureops.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/gnureops.ok _$@ && rm -f _$@

pcntplus::
	@$(AWKA) -f $(srcdir)/pcntplus.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/pcntplus.ok _$@ && rm -f _$@

prmreuse::
	@$(AWKA) -f $(srcdir)/prmreuse.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/prmreuse.ok _$@ && rm -f _$@

math::
	@$(AWKA) -f $(srcdir)/math.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/math.ok _$@ && rm -f _$@

fflush::
	@$(srcdir)/fflush.sh "$(CC)" "$(MATHLIB)" >_$@
	$(CMP) $(srcdir)/fflush.ok _$@ && rm -f _$@

fldchg::
	@$(AWKA) -f $(srcdir)/fldchg.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/fldchg.in >_$@
	$(CMP) $(srcdir)/fldchg.ok _$@ && rm -f _$@

fldchgnf::
	@$(AWKA) -f $(srcdir)/fldchgnf.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/fldchgnf.in >_$@
	$(CMP) $(srcdir)/fldchgnf.ok _$@ && rm -f _$@

reindops::
	@$(AWKA) -f $(srcdir)/reindops.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/reindops.in >_$@
	$(CMP) $(srcdir)/reindops.ok _$@ && rm -f _$@

sprintfc::
	@$(AWKA) -f $(srcdir)/sprintfc.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/sprintfc.in >_$@
	$(CMP) $(srcdir)/sprintfc.ok _$@ && rm -f _$@

getlnhd::
	@$(AWKA) -f $(srcdir)/getlnhd.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/getlnhd.ok _$@ && rm -f _$@

backgsub::
	@$(AWKA) -f $(srcdir)/backgsub.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/backgsub.in >_$@
	$(CMP) $(srcdir)/backgsub.ok _$@ && rm -f _$@

tweakfld::
	@$(AWKA) -f $(srcdir)/tweakfld.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/tweakfld.in >_$@
	@rm -f errors.cleanup
	$(CMP) $(srcdir)/tweakfld.ok _$@ && rm -f _$@

clsflnam::
	@$(AWKA) -f $(srcdir)/clsflnam.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/clsflnam.in >_$@
	$(CMP) $(srcdir)/clsflnam.ok _$@ && rm -f _$@

mmap8k::
	@$(AWKA) '{ print }' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/mmap8k.in >_$@
	$(CMP) $(srcdir)/mmap8k.in _$@ && rm -f _$@

dynlj::
	@$(AWKA) -f $(srcdir)/dynlj.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/dynlj.ok _$@ && rm -f _$@

substr::
	@$(AWKA) -f $(srcdir)/substr.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/substr.ok _$@ && rm -f _$@

eofsplit::
	@$(AWKA) -f $(srcdir)/eofsplit.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/eofsplit.ok _$@ && rm -f _$@

prt1eval::
	@$(AWKA) -f $(srcdir)/prt1eval.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/prt1eval.ok _$@ && rm -f _$@

prtoeval::
	@$(AWKA) -f $(srcdir)/prtoeval.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/prtoeval.ok _$@ && rm -f _$@

gsubtest::
	@$(AWKA) -f $(srcdir)/gsubtest.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/gsubtest.ok _$@ && rm -f _$@

splitwht::
	@$(AWKA) -f $(srcdir)/splitwht.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/splitwht.ok _$@ && rm -f _$@

back89::
	@$(AWKA) '/a\8b/' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/back89.in >_$@
	$(CMP) $(srcdir)/back89.ok _$@ && rm -f _$@

tradanch::
	@$(AWKA) -f $(srcdir)/tradanch.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/tradanch.in >_$@
	$(CMP) $(srcdir)/tradanch.ok _$@ && rm -f _$@

nlfldsep::
	@$(AWKA) -f $(srcdir)/nlfldsep.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/nlfldsep.in > _$@
	$(CMP) $(srcdir)/nlfldsep.ok _$@ && rm -f _$@

splitvar::
	@$(AWKA) -f $(srcdir)/splitvar.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/splitvar.in >_$@
	$(CMP) $(srcdir)/splitvar.ok _$@ && rm -f _$@

foronsplit::
	@$(AWKA) -f $(srcdir)/foronsplit.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/foronsplit.ok _$@ && rm -f _$@

intest::
	@$(AWKA) -f $(srcdir)/intest.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/intest.ok _$@ && rm -f _$@

strftlng::
	@$(AWKA) -f $(srcdir)/strftlng.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@TZ=UTC; export TZ; ./xx >_$@
	@if $(CMP) -s $(srcdir)/strftlng.ok _$@ ; then : ; else \
 	TZ=UTC0; export TZ; ./xx >_$@ ; \
	fi
	$(CMP) $(srcdir)/strftlng.ok _$@ && rm -f _$@

nfldstr::
	@$(AWKA) '$$1 == 0 { print "bug" }' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@echo | ./xx > _$@
	$(CMP) $(srcdir)/nfldstr.ok _$@ && rm -f _$@

nors::
	@$(AWKA) '{ print $$NF }' >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@echo A B C D E | tr -d '\012\015' | ./xx - $(srcdir)/nors.in > _$@
	$(CMP) $(srcdir)/nors.ok _$@ && rm -f _$@

fnarydel::
	@$(AWKA) -f $(srcdir)/fnarydel.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/fnarydel.ok _$@ && rm -f _$@

pipeio1::
	@$(AWKA) -f $(srcdir)/pipeio1.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	@rm -f test1 test2
	$(CMP) $(srcdir)/pipeio1.ok _$@ && rm -f _$@

pipeio2::
	@$(AWKA) -f $(srcdir)/pipeio2.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx -v SRCDIR=$(srcdir) >_$@
	$(CMP) $(srcdir)/pipeio2.ok _$@ && rm -f _$@

funstack::
	@$(AWKA) -f $(srcdir)/funstack.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/funstack.in >_$@
	$(CMP) $(srcdir)/funstack.ok _$@ && rm -f _$@

clobber::
	@$(AWKA) -f $(srcdir)/clobber.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/clobber.ok seq && $(CMP) $(srcdir)/clobber.ok _$@ && rm -f _$@
	@rm -f seq

delarprm::
	@$(AWKA) -f $(srcdir)/delarprm.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx >_$@
	$(CMP) $(srcdir)/delarprm.ok _$@ && rm -f _$@

prdupval::
	@$(AWKA) -f $(srcdir)/prdupval.awk >x.c
	@$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx
	@./xx $(srcdir)/prdupval.in >_$@
	$(CMP) $(srcdir)/prdupval.ok _$@ && rm -f _$@

nondec::
	@if grep BITOP ../config.h | grep define > /dev/null; \
	then \
		$(AWKA) -f $(srcdir)/nondec.awk >x.c; \
            	$(CC) -g x.c -L../lib -I../lib ../lib/libawka.a $(MATHLIB) -o xx \
		./xx >_$@; \
	else \
		cp $(srcdir)/nondec.ok _$@; \
	fi
	$(CMP) $(srcdir)/nondec.ok _$@ && rm -f _$@

clean:
	rm -fr _* core junk out1 out2 out3 strftime.ok test1 test2 seq *~ xx xx$(EXE) x.c

distclean: clean
	rm -f Makefile

maintainer-clean: distclean
