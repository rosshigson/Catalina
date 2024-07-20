include ../Makefile.inc

all: 	isalnum.s isalpha.s iscntrl.s isdigit.s isgraph.s \
	islower.s isprint.s ispunct.s isspace.s isupper.s \
	isxdigit.s isascii.s tolower.s toupper.s chartab.s \
	tabgen

clean:
	-rm -f	isalnum.s isalpha.s iscntrl.s isdigit.s isgraph.s \
		islower.s isprint.s ispunct.s isspace.s isupper.s \
		isxdigit.s isascii.s tolower.s toupper.s chartab.s \
		isalnum.c isalpha.c iscntrl.c isdigit.c isgraph.c \
		islower.c isprint.c ispunct.c isspace.c isupper.c \
		isxdigit.c isascii.c chartab.c tabgen \
		OLIST

chartab.c: char.tab tabgen
	tabgen -fchar.tab > chartab.c

tabgen:	tabgen.c
	$(GCC) tabgen.c -o tabgen

isalnum.c isalpha.c iscntrl.c isdigit.c isgraph.c islower.c isprint.c \
ispunct.c isspace.c isupper.c isxdigit.c isascii.c: genfiles
	genfiles
