include ../Makefile.inc

all:	tmpfile.s tmpnam.s rename.s remove.s fopen.s freopen.s \
	setbuf.s setvbuf.s setcbuf.s perror.s fprintf.s printf.s sprintf.s \
	vfprintf.s vprintf.s vsprintf.s doprnt.s icompute.s snprintf.s \
	fscanf.s scanf.s sscanf.s doscan.s fgetc.s fgets.s getc.s \
	getchar.s gets.s putc.s putchar.s fputc.s puts.s fputs.s \
	ungetc.s fread.s fwrite.s fgetpos.s fsetpos.s rewind.s \
	fseek.s ftell.s clearerr.s feof.s ferror.s fileno.s \
	fltpr.s fillbuf.s fclose.s flushbuf.s \
	fflush.s isatty.s data.s getpid.s

ifeq ($(COMPACT),TRUE)
	cp sbrk.ce sbrk.s
	cp hbrk.ce hbrk.s
else
ifeq ($(LARGE),TRUE)
	$(SPINPP) $(SPINPPFLAGS) sbrk.le > sbrk.s
	$(SPINPP) $(SPINPPFLAGS) hbrk.le > hbrk.s
else
	$(SPINPP) $(SPINPPFLAGS) sbrk.e > sbrk.s
	$(SPINPP) $(SPINPPFLAGS) hbrk.e > hbrk.s
endif
endif

clean:
	-rm -f tmpfile.s tmpnam.s rename.s remove.s fopen.s freopen.s \
		setbuf.s setvbuf.s setcbuf.s perror.s fprintf.s printf.s sprintf.s \
		vfprintf.s vprintf.s vsprintf.s doprnt.s icompute.s snprintf.s \
		fscanf.s scanf.s sscanf.s doscan.s fgetc.s fgets.s getc.s \
		getchar.s gets.s putc.s putchar.s fputc.s puts.s fputs.s \
		ungetc.s fread.s fwrite.s fgetpos.s fsetpos.s rewind.s \
		fseek.s ftell.s clearerr.s feof.s ferror.s fileno.s \
		fltpr.s fillbuf.s fclose.s flushbuf.s sbrk.s hbrk.s \
		fflush.s isatty.s data.s getpid.s OLIST
