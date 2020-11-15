#include "catalina_threads.h"
#include "catalina_hmi.h"

/* print a string with simple formatting, protected by a lock */
int _thread_printf(void *pool, int lock, char *str, ...) {
   va_list ap;
   int retval;

   do { } while (!_thread_lockset(pool, lock));

   va_start (ap, str);           /* Initialize the argument list. */
   retval = t_vprintf (str, ap);
   va_end (ap);                  /* Clean up. */

   _thread_lockclr(pool, lock);

   return retval;
}

