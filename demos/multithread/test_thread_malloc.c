 /***************************************************************************\
 *                                                                           *
 *                       Multiple Thread Malloc Demo                         *
 *                                                                           *
 *    Demonstrates many threads executing concurrently with each thread      *
 *    doing random memory operations - i.e. malloc,  calloc, realloc,        *
 *    free, sbrk - to ensure they do not interfere. Each memory block        *
 *    is marked with a name unique to the thread so we can tell if the       *
 *    same memory is accidentally used by another thread.                    *
 *                                                                           *
 *    NOTE 1: The random memory allocation done by this program means that   *
 *            the memory requirements will climb until all the threads       *
 *            have allocated their maximum amount (calloc is the worst       *
 *            offender, because it allocates a variable number of randomly   *
 *            sized blocks). To assist in managing fragmented memory,        *
 *            the program calls malloc_defragment() periodically. This is    *
 *            a type of garbage collection, except it is only required in    *
 *            programs that allocate lots of small randomly sized chunks     *
 *            (like this demo!) and thus may end up with all available       *
 *            memory broken up into chunks too small to use. Programs        *
 *            that allocate and deallocate mostly fixed size blocks will     *
 *            have freed blocks re-used automatically as required without    *
 *            needing to manually defragment.                                *
 *                                                                           *
 *    NOTE 2: This program includes a version of itoa as an alternative to   *
 *            using sprintf, because if we do that we must link with the     *
 *            full C library (libc) rather than the integer one (libci),     *
 *            which can make this program too large for the Propeller 1.     *
 *                                                                           *
 \***************************************************************************/

/*
 * include standard C library functions:
 */
#include <stdlib.h>
#include <string.h>

/*
 * include propeller functions
 */
#include <prop.h>
#ifdef __CATALINA_P2
#include <prop2.h>
#endif

/*
 * include Catalina multi-threading:
 */
#include <threads.h>

/*
 * include some useful multi-threading utility functions:
 */
#include <thutil.h>

/*
 * define how many threads we want:
 */
#ifdef __CATALINA_P2
#define THREAD_COUNT 100
#else
#define THREAD_COUNT 5
#endif
/*
 * define the stack size each thread needs (since this number depends on the
 * function executed by the thread, the stack size has to be established by 
 * trial and error):
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 200)

/*
 * define the number of thread locks we need:
 */
#define NUM_LOCKS 1    // need 1 lock for HMI functions

/*
 * define the number of blocks, and the minimum and maximum memory block size:
 */
#define NUM_BLOCK 5    // only used for calloc
#define MIN_BLOCK 50
#define MAX_BLOCK 100

/*
 * define a string used to name each thread and each memory block 
 * (must fit in minimum block size):
 */
#define NAME_STRING "Thread         \0"

/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5) 
 */
static char pool[MIN_THREAD_POOL_SIZE + NUM_LOCKS]; 

/*
 * a lock allocated from the pool - required to protect the thread HMI
 * plugin functions.
 */
static int lock;

/*
 * global flag use to start threads
 */
static int start;

/*
 * itoa - convert int to string
 * Written by Lukás Chmela
 * Released under GPLv3.
 */
char* itoa(int value, char* result, int base) {
		char* ptr = result, *ptr1 = result, tmp_char;
		int tmp_value;

		// check that the base if valid
		if (base < 2 || base > 36) { *result = '\0'; return result; }

		do {
			tmp_value = value;
			value /= base;
			*ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
		} while ( value );

		// Apply negative sign
		if (tmp_value < 0) *ptr++ = '-';
		*ptr-- = '\0';
		while(ptr1 < ptr) {
			tmp_char = *ptr;
			*ptr--= *ptr1;
			*ptr1++ = tmp_char;
		}
		return result;
}


/*
 * function : this function can be executed as a thread.
 */
int function(int me, char *not_used[]) {
   int  r, n;
   char *block = NULL;
   char name[MIN_BLOCK] = "";

   // set up our unique name string
   strcpy(name, NAME_STRING);
   itoa(me, name+7, 10);

   // wait for start flag before proceeding
   while (!start) {
      _thread_yield();
   }

   while (1) {
      r = random(100);
      switch (r) {
      case 1: // malloc
         // if we have a block, free it
         if (block != NULL) {
            free(block);
            block = NULL;
         }
         // malloc a block of random size (between MIN_BLOCK and MAX_BLOCK)
         block = malloc(MIN_BLOCK + random(MAX_BLOCK - MIN_BLOCK));
         if (block != NULL) {
            // put our name on the block
            strcpy(block, name);
            _thread_printf(pool, lock, "%s  malloc,  sbrk %X\n", block, sbrk(0));
         }
         else {
            _thread_printf(pool, lock, "%s  malloc FAILED\n", name);
         }
         break;
      case 2: // calloc
         // if we have a block, free it
         if (block != NULL) {
            free(block);
            block = NULL;
         }
         n = random(NUM_BLOCK) + 1;
         // calloc a random number of blocks of random size (between 
         // MIN_BLOCK and MAX_BLOCK)
         block = calloc(n, MIN_BLOCK + random(MAX_BLOCK - MIN_BLOCK));
         if (block != NULL) {
            // put our name on the block
            strcpy(block, name);
            _thread_printf(pool, lock, "%s  calloc,  sbrk %X\n", block, sbrk(0));
         }
         else {
            _thread_printf(pool, lock, "%s  calloc FAILED\n", name);
         }
         break;
      case 3: // realloc
         // if we have a block, realloc it to a random size (between 
         // MIN_BLOCK and MAX_BLOCK)
         if (block != NULL) {
            char *block2 = NULL;
            block2 = realloc(block, MIN_BLOCK + random(MAX_BLOCK - MIN_BLOCK));
            if (block2 != NULL) {
               block = block2;
               _thread_printf(pool, lock, "%s  realloc, sbrk %X\n", block, sbrk(0));
            }
            else {
               _thread_printf(pool, lock, "%s  realloc FAILED\n", name);
            }
         }
         break;
      case 4: // defragment 
         // defragment free space periodically (otherwise memory can end
         // up too fragmented - in the worst case we can run out altogether)
         malloc_defragment();
         break;
      default: // check 
         // if we have a block, check it still has the correct name
         if (block != NULL) {
            if (strcmp(block, name) != 0) {
               _thread_printf(pool, lock, "%s BLOCK CORRUPTED\n", name);
            }
            else {
               //_thread_printf(pool, lock, "%s block ok!\n", name);
            }
         }
         else {
            //_thread_printf(pool, lock, "%s block is null!\n", name);
         }
         break;
      }
      // throw in some more randomness ...
      r = random(100);
      for (n = 0; n < r; n++) {
          _thread_yield();
      }
   }
   return 0;
}


/*
 * main : start up to THREAD_COUNT threads and just let them run
 */
void main(void) {

   int i = 0;
   void *thread_id;

   unsigned long stacks[STACK_SIZE * THREAD_COUNT];

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // initialize a pool of thread locks (we need only 1 lock)
   _thread_init_lock_pool (pool, NUM_LOCKS, _locknew());

   // assign a thread lock to avoid HMI plugin contention.
   lock = _thread_locknew(pool);

   _thread_printf(pool, lock, "Press a key to create threads\n");
   k_wait();

   randomize();

   // start instances of function until we have started THREAD_COUNT of them
   for (i = 1; i <= THREAD_COUNT; i++) {
      thread_id = _thread_start(&function, &stacks[STACK_SIZE*i], i, NULL);
      _thread_printf(pool, lock, "Thread %04d ", i);
      if (thread_id == (void *)0) {
         _thread_printf(pool, lock, " failed to start\n");
         while (1);
      }
      else {
         _thread_printf(pool, lock, " started, id = %d\n", (unsigned)thread_id);
      }
   }

   _thread_printf(pool, lock, 
       "\nPress a key to start threads allocating memory\n");
   k_wait();

   // start all threads
   start = 1;

   // now loop forever, letting the threads do their thing
   while (1) {
     _thread_yield();
   }
}
