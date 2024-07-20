#include <threads.h>
#include <hmi.h>

/* print an integer using cursor 1, protected by a lock */
int _thread_integer(void *pool, int lock, int num) {
   int retval;

   do { } while (!_thread_lockset(pool, lock));

   retval = t_integer (1, num);

   _thread_lockclr(pool, lock);

   return retval;
}

