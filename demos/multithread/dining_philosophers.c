/***************************************************************************\
 *                                                                           *
 *                            Dining Philosophers                            *
 *                                                                           *
 * This progran simulates the "Dining Philosophers" dilemma on the Propeller *
 * using a thread to represent each philosopher, and a thread lock to        *
 * represent each fork.                                                      *
 *                                                                           *
 * For more details on this classic problem in concurrency, see:             *
 *                                                                           *
 *   http://en.wikipedia.org/wiki/Dining_philosophers_problem                *
 *                                                                           *
 \***************************************************************************/

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
 * define stack size for threads:
 */
#define STACK_SIZE (MIN_THREAD_STACK_SIZE + 100)

/*
 * define the maximum number of Philosophers we can have:
 */
#define MAX_PHILOSOPHERS 16
/*
 * define how many Philosophers we actually have:
 */
#ifndef NUM_PHILOSOPHERS
#define NUM_PHILOSOPHERS 16
#endif

/*
 * define amount of time to wait between pickup up left and right fork
 * (increasing this increases the chance of deadlocks!)
 */
#ifndef INTERFORK_WAIT
#define INTERFORK_WAIT 100
#endif

/*
 * define how many courses they will eat:
 */
#ifndef NUM_COURSES
#define NUM_COURSES 20
#endif

struct Customer {
   char *name;  // customer's name
   int   left;  // customer's left fork
   int   right; // customer's right fork
};

static struct Customer Philosopher[MAX_PHILOSOPHERS] = {
   {"Aristotle",     0,  1},
   {"Kant",          1,  2},
   {"Spinoza",       2,  3},
   {"Marx",          3,  4},
   {"Russell",       4,  5},
   {"Aquinas",       5,  6},
   {"Bacon",         6,  7},
   {"Hume",          7,  8},
   {"Descarte",      8,  9},
   {"Plato",         9, 10},
   {"Hegel",        10, 11},
   {"de Beauvoir",  11, 12},
   {"Sartre",       12, 13},
   {"Wittgenstein", 13, 14},
   {"Schopenhauer", 14, 15},
   {"Rousseau",     15,  0},
};


/*
 * a pool of thread locks - note that the pool must be 5 bytes larger than
 * the actual number of locks required (MIN_THREAD_POOL_SIZE = 5) 
 */
static char Pool[MIN_THREAD_POOL_SIZE + NUM_PHILOSOPHERS + 1]; 

static void * Seat[NUM_PHILOSOPHERS];       // maps seats to threads

static int Fork[NUM_PHILOSOPHERS];          // maps forks to thread locks

static int HMI_Lock = 0;                    // thread lock to protect HMI calls

static int Dinner_Bell = 0;                 // set this to 1 to start dinner


/*
 * Pick_Up - pick up a fork (a fork is modelled by a thread lock)
 */
void Pick_Up(int fork) {
   while (_thread_lockset(Pool, Fork[fork]) == 0) {
     _thread_yield();
   }
}


/*
 * Put_Down - put down a fork (a fork is modelled by a thread lock)
 */
void Put_Down(int fork) {
   _thread_lockclr(Pool, Fork[fork]);
}


/*
 * Diner - (each diner is modelled by a thread)
 */
int Diner(int me, char *not_used[]) {
   int course;
   char *my_name = Philosopher[me].name;

   // wait till dinner is served
   do { 
      _thread_yield();
   } while (!Dinner_Bell);

   // be seated
   _thread_printf(Pool, HMI_Lock, "%s has been seated\n", my_name);

   // eat dinner
   for (course = 0; course < NUM_COURSES; course++) {
      _thread_printf(Pool, HMI_Lock, "%s is thinking\n", my_name);
      _thread_wait(random(2000));
      _thread_printf(Pool, HMI_Lock, "%s is hungry\n", my_name);
      Pick_Up(Philosopher[me].left);
      _thread_wait(random(INTERFORK_WAIT)); // <-- increase for more deadlocks!
      Pick_Up(Philosopher[me].right);
      _thread_printf(Pool, HMI_Lock, "%s is eating\n", my_name);
      _thread_wait(random(2000));
      Put_Down(Philosopher[me].right);
      Put_Down(Philosopher[me].left);
   }

   // leave
   _thread_printf(Pool, HMI_Lock, "%s is leaving\n", my_name);
   _thread_wait(100);
   return 0;
}
   
/*
 * main - set up the diners and then start dinner
 */
int main(void) {

   int i = 0;
   long stacks[STACK_SIZE * NUM_PHILOSOPHERS];

   // assign a lock to avoid context switch contention 
   _thread_set_lock(_locknew());

   // allocate a pool of thread locks to use as forks (note we
   // need one extra lock to use as our HMI Lock)
   _thread_init_lock_pool(Pool, NUM_PHILOSOPHERS + 1, _locknew());

   // assign a lock to avoid HMI contention
   HMI_Lock = _thread_locknew(Pool);

   _thread_printf(Pool, HMI_Lock, "The Dining Philosophers\n\n");
   _thread_printf(Pool, HMI_Lock, "Press a key to begin ...\n\n");

   k_wait();
   randomize();

   if ((NUM_PHILOSOPHERS < 2) || (NUM_PHILOSOPHERS > MAX_PHILOSOPHERS)) {
      _thread_printf(Pool, HMI_Lock, 
         "NUM_PHILOSOPHERS must be between 2 and %d\n", MAX_PHILOSOPHERS);
      while(1);
   }

   // fix forks to suit actual number of philosophers
   Philosopher[NUM_PHILOSOPHERS - 1].right = 0;

   // set up seats and forks 
   for (i = 0; i < NUM_PHILOSOPHERS; i++) {
      Seat[i] = _thread_start(&Diner, &stacks[STACK_SIZE * (i + 1)], i, NULL);
      Fork[i] = _thread_locknew(Pool);
      if (Fork[i] < 0) {
         _thread_printf(Pool, HMI_Lock, "Only %d Forks!\n\n", i - 1);
         _thread_printf(Pool, HMI_Lock, 
             "\nPROGRAM WILL NOT EXECUTE CORRECTLY\n\n");
         break;
      }
   }
   _thread_printf(Pool, HMI_Lock, 
       "Table set for %d diners\n\n", NUM_PHILOSOPHERS);

   // now start dinner
   Dinner_Bell = 1;

   // now loop forever 
   while (1) { 
      _thread_yield();
   };

   return 0;
}

