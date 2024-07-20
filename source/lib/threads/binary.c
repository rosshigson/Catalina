#include <threads.h>
#include <hmi.h>

/* print a hex value using cursor 1, protected by a a thread lock */
int _thread_bin(void *pool, int lock, unsigned num) {
   int retval;

   do { } while (!_thread_lockset(pool, lock));

   retval = t_bin (1,num);

   _thread_lockclr(pool, lock);

   return retval;
}

