#include <threads.h>
#include <hmi.h>

/* print a string with simple formatting, protected by a lock */
int _thread_printf(void *pool, int lock, char *str, ...) {
   va_list ap;
   int retval;

   while (_thread_lockset(pool, lock) == 0) {
     _thread_yield();
   }

   va_start (ap, str);           /* Initialize the argument list. */
   retval = t_vprintf (str, ap);
   va_end (ap);                  /* Clean up. */

   _thread_lockclr(pool, lock);

   return retval;
}

