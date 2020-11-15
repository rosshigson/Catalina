include ../Makefile.inc

all:	tmpfile.s tmpnam.s rename.s remove.s fopen.s freopen.s \
	setbuf.s setvbuf.s setcbuf.s perror.s fprintf.s printf.s sprintf.s \
	vfprintf.s vprintf.s vsprintf.s doprnt.s icompute.s \
	fscanf.s scanf.s sscanf.s doscan.s fgetc.s fgets.s getc.s \
	getchar.s gets.s putc.s putchar.s fputc.s puts.s fputs.s \
	ungetc.s fread.s fwrite.s fgetpos.s fsetpos.s rewind.s \
	fseek.s ftell.s clearerr.s feof.s ferror.s fileno.s \
	fltpr.s fillbuf.s fclose.s flushbuf.s \
	fflush.s isatty.s data.s getpid.s

ifeq ($(COMPACT),TRUE)
	cp sbrk_compact.e sbrk.s
else
ifeq ($(PROPELLER_2),TRUE)
	$(SPINPP) $(SPINPPFLAGS) sbrk.e > sbrk.s
else
ifeq ($(LARGE),TRUE)
	$(SPINPP) $(SPINPPFLAGS) sbrk_large.e > sbrk.s
else
	$(SPINPP) $(SPINPPFLAGS) sbrk_small.e > sbrk.s
endif
endif
endif

clean:
	rm -f tmpfile.s tmpnam.s rename.s remove.s fopen.s freopen.s \
		setbuf.s setvbuf.s setcbuf.s perror.s fprintf.s printf.s sprintf.s \
		vfprintf.s vprintf.s vsprintf.s doprnt.s icompute.s \
		fscanf.s scanf.s sscanf.s doscan.s fgetc.s fgets.s getc.s \
		getchar.s gets.s putc.s putchar.s fputc.s puts.s fputs.s \
		ungetc.s fread.s fwrite.s fgetpos.s fsetpos.s rewind.s \
		fseek.s ftell.s clearerr.s feof.s ferror.s fileno.s \
		fltpr.s fillbuf.s fclose.s flushbuf.s sbrk.s \
		fflush.s isatty.s data.s getpid.s OLIST
