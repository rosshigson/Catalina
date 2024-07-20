#include <threads.h>
#include <hmi.h>

/* print a string using cursor 1, protected by a lock */
int _thread_string(void *pool, int lock, char *str) {
   int retval;

   do { } while (!_thread_lockset(pool, lock));

   retval = t_string (1, str);

   _thread_lockclr(pool, lock);

   return retval;
}

