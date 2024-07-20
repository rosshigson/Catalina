#include <threads.h>
#include <hmi.h>

/* print a character using cursor 1, protected by a lock */
int _thread_char(void *pool, int lock, char ch) {
   int retval;

   do { } while (!_thread_lockset(pool, lock));

   retval = t_char (1,ch);

   _thread_lockclr(pool, lock);

   return retval;
}

