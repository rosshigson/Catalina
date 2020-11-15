/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */

#include	<stdlib.h>

char *
getenv(const char *name) {
   static char timezone[] = "GMT";

   if (strcmp(name,"TZ") == 0) {
      return timezone;
   }
   else {
	   return (char *)NULL;
   }
}
