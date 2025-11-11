/* x86s running Cygwin or Linux */

#include <string.h>

static char rcsid[] = "$Id: catalina_linux.c,v 1.0 2009/03/28 20:41:09 rjh Exp $";

#ifndef BINDIR
#define BINDIR "/bin"
#endif

#ifndef LCCDIR
#define LCCDIR "/opt/catalina"
#endif

char *suffixes[] = { ".c", ".i", ".s", ".o", ".out", 0 };
char inputs[256] = "";
char *cpp[] = { LCCDIR "/bin/cake",
	"-D_POSIX_SOURCE",
	"-D__CATALINA__",
	"$1", "$2", "-o", "$3", 0 };
char *include[] = {"-I" LCCDIR "/include", 0 };
char *com[] = { LCCDIR "/bin/rcc", "-target=catalina/linux", "$1", "$2", "$3", 0 };
char *as[] = { BINDIR "/mv", "$2", "$3", 0 }; /* no assembler - just move ! */
char *ld[] = {
	/* 0 */ LCCDIR "/bin/catbind",  
	/* 1 */ "-o", "$3",
	/* 3 */ "-L" LCCDIR "/lib",
	/* 4 */ "-T" LCCDIR "/target",
	/* 5 */ "$1", "$2",
	        0 };

extern char *concat(char *, char *);

int option(char *arg) {
  if (strncmp(arg, "-lccdir=", 8) == 0) {
		cpp[0] = concat(&arg[8], "/bin/cake");
		include[0] = concat("-I", concat(&arg[8], "/include"));
    ld[0] = concat(&arg[8], "/bin/catbind");
		ld[3] = concat("-L", concat(&arg[8], "/lib"));
		ld[4] = concat("-T", concat(&arg[8], "/target"));
		com[0] = concat(&arg[8], "/bin/rcc");
	}
	else if (strncmp(arg, "-ld=", 4) == 0) {
		ld[0] = &arg[4];
	}
	else if (strncmp(arg, "-g", 2) == 0)
		;
	else {
		return 0;
	}
	return 1;
}
