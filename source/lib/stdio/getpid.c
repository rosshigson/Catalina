/*
 * getpid.c - pretend to get a process id. Since we don't at this stage
 *            have a real process id, we just return a random number. But
 *            once we have generated one, we use it forever.
 *            Since this is used only for temporary file name generation
 *            this should be ok. However, note that unless there is some 
 *            non-determinism in the program (e.g. user input) this routine
 *            will generate the same result every time. Again, this is
 *            probably not an issue.
 */

#include	<stdlib.h>
#include	<cog.h>

unsigned int _getpid(void) {
   static char my_pid = 0;

   if (my_pid == 0) {
      srand(_cnt());
      my_pid = rand();

   }
   return my_pid;
}
