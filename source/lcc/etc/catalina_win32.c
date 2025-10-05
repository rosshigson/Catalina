/* x86s running MS Windows NT 4.0 */

#include <string.h>
#include <windows.h>

static char rcsid[] = "$Id: catalina_win32.c,v 1.00 2009/03/28 18:00:13 rjh Exp $";

#ifndef LCCDIR
#define LCCDIR "C:\\Program Files (x86)\\Catalina"
#endif

char *suffixes[] = { ".c;.C", ".i;.I", ".s;.S", ".obj;.OBJ", ".out", 0 };
char inputs[256] = "";
char *cpp[] = { LCCDIR "\\bin\\cpp.exe", 
	"-U__GNUC__", "-D_POSIX_SOURCE", "-D__STDC__=1", "-D__STRICT_ANSI__",
	//"-Dwin32", "-D_WIN32", "-D_M_IX86", 
	"-D__extension__=""""", "-D__cdecl=""""",
	"-D__CATALINA__",
	"$1", "$2", "$3", 0 };
char *include[] = { "-I" LCCDIR "\\include", 0 };
char *com[] = { LCCDIR "\\bin\\rcc.exe", "-target=catalina/win32", "$1", "$2", "$3", 0 };
char *as[] = { "cmd.exe", "/c", "move", "$2", "$3", ">NUL:", 0 }; /* no assembler - just move! */
char *ld[] = {
	/* 0 */ LCCDIR "\\bin\\catbind.exe",  
	/* 1 */ "-o", "$3",
	/* 3 */ "-L" LCCDIR "\\lib",
	/* 4 */ "-T" LCCDIR "\\target",
	/* 5 */ "$1", "$2",
	        0 };

extern char *concat(char *, char *);

void correct_paths() {
   char ShortPathName[MAX_PATH + 1];
   // correct any long path names in the names of the executables
   if (strchr(cpp[0], ' ') != NULL) {
      GetShortPathName(cpp[0], ShortPathName, MAX_PATH);
      cpp[0] = strdup(ShortPathName);
   }
   if (strchr(com[0], ' ') != NULL) {
      GetShortPathName(com[0], ShortPathName, MAX_PATH);
      com[0] = strdup(ShortPathName);
   }
   if (strchr(as[0], ' ') != NULL) {
      GetShortPathName(as[0], ShortPathName, MAX_PATH);
      as[0] = strdup(ShortPathName);
   }
   if (strchr(ld[0], ' ') != NULL) {
      GetShortPathName(ld[0], ShortPathName, MAX_PATH);
      ld[0] = strdup(ShortPathName);
   }
}

int option(char *arg) {
  	if (strncmp(arg, "-lccdir=", 8) == 0) {
		cpp[0] = concat(&arg[8], "\\bin\\cpp.exe");
		include[0] = concat("-I", concat(&arg[8], "\\include"));
      ld[0] = concat(&arg[8], "\\bin\\catbind.exe");
		ld[3] = concat("-L", concat(&arg[8], "\\lib"));
		ld[4] = concat("-T", concat(&arg[8], "\\target"));
		com[0] = concat(&arg[8], "\\bin\\rcc.exe");
	}
	else if (strncmp(arg, "-ld=", 4) == 0) {
		ld[0] = &arg[4];
	}
	else if (strncmp(arg, "-g", 2) == 0)
		;
	else {
      correct_paths();
		return 0;
	}
   correct_paths();
	return 1;
}
