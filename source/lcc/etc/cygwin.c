/* x86s running Cygwin */

#include <string.h>

static char rcsid[] = "$Id: cygwin.c,v 1.5 1998/09/16 20:41:09 drh Exp $";

#ifndef LCCDIR
#define LCCDIR "/usr/local/lib/lcc/"
#endif

char *suffixes[] = { ".c", ".i", ".s", ".o", ".out", 0 };
char inputs[256] = "";
char *cpp[] = { LCCDIR "cpp.exe",
	"-U__GNUC__", "-D_POSIX_SOURCE", "-D__STDC__=1", "-D__STRICT_ANSI__",
	"-Dunix", "-Di386", "-Dlinux",
	"-D__extension__=""""",
	"-D__cdecl=""""",
	"-D__unix__", "-D__i386__", "-D__linux__", "-D__signed__=signed",
	"$1", "$2", "$3", 0 };
char *include[] = {"-I" LCCDIR "include", "-I" LCCDIR "gcc/include", "-I/usr/include", 0 };
char *com[] = {LCCDIR "rcc.exe", "-target=x86/cygwin", "$1", "$2", "$3", 0 };
char *as[] = { "/usr/bin/as.exe", "-o", "$3", "$1", "$2", 0 };
char *ld[] = {
	/*  0 */ "/usr/bin/ld.exe", "-m", "i386pe", 
        /*  3 */ "--disable-auto-import", 
	/*  4 */ "--dll-search-prefix=cyg",
	/*  5 */ "-o", "$3",
	/*  7 */ "/usr/lib/crt0.o", 
	/*  8 */ "$1", "$2",
	/* 10 */ "-L" "/usr/lib/",
	/* 11 */ "-L" LCCDIR,
	/* 12 */ "-llcc",
	/* 13 */ "-L" LCCDIR "gcc/", "-ladvapi32", "-lshell32", 
        /* 17 */ "-lgcc", "-lc", "-lm", "-luser32", "-lkernel32", 
	/* 22 */ "-lcygwin"
	/* 23 */ "",
	0 };

extern char *concat(char *, char *);

int option(char *arg) {
  	if (strncmp(arg, "-lccdir=", 8) == 0) {
		cpp[0] = concat(&arg[8], "/cpp");
		include[0] = concat("-I", concat(&arg[8], "/include"));
		include[1] = concat("-I", concat(&arg[8], "/gcc/include"));
		ld[11] = concat("-L", &arg[8]);
		ld[13] = concat("-L", concat(&arg[8], "/gcc"));
		com[0] = concat(&arg[8], "/rcc");
	} else if (strcmp(arg, "-p") == 0 || strcmp(arg, "-pg") == 0) {
		ld[7] = "/usr/lib/gcrt0.o";
		ld[23] = "-lgmon";
	} else if (strcmp(arg, "-b") == 0) 
		;
	else if (strcmp(arg, "-g") == 0)
		;
	else if (strncmp(arg, "-ld=", 4) == 0)
		ld[0] = &arg[4];
	else if (strcmp(arg, "-static") == 0) {
	        ld[3] = "-static";
	        ld[4] = "";
	} else
		return 0;
	return 1;
}
