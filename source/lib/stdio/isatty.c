/*
 * _isatty - check if a file descriptor is associated with a terminal
 *
 * This is a hack for catalina - since we don't currently support i/o
 * redirection, stdin, stdout and stderr are assumed to be terminals.
 */
#include <stdio.h>

int _isatty(int d)
{
   if (d == fileno(stdin) || d == fileno(stdout) || d == fileno(stderr)) {
      return 1;
   }
   else {
      return 0;
   }
}
