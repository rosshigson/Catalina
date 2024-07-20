 /***************************************************************************\
 *                                                                           *
 *                            Dining Philosophers                            *
 *                                                                           *
 * This progran simulates the "Dining Philosophers" dilemma on the Propeller *
 * using a cog to represent each philosopher, and a lock to represent each   *
 * fork.                                                                     *
 *                                                                           *
 * For more details on this classic problem in concurrency, see:             *
 *                                                                           *
 *     http://en.wikipedia.org/wiki/Dining_philosophers_problem              *
 *                                                                           *
 \***************************************************************************/

/*
 * include the definitions of some useful multi-cog utility functions:
 */
#include "cogutil.h"

/*
 * define the maximum number of seats (i.e. Philosophers) we can have:
 */
#define MAX_SEATS 5

/*
 * define how many Philosophers we actually have:
 * (decreasing this increases the chance of deadlocks)
 */
#ifndef NUM_PHILOSOPHERS
#define NUM_PHILOSOPHERS MAX_SEATS
#endif

/*
 * define amount of time to wait between pickup up left and right fork
 * (increasing this increases the chance of deadlocks)
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

static struct Customer Philosopher[MAX_SEATS] = {
   {"Aristotle", 0, 1},
   {"Kant",      1, 2},
   {"Spinoza",   2, 3},
   {"Marx",      3, 4},
   {"Russell",   4, 0},
};


static int Seat[MAX_SEATS]; // maps cogs to seats

static int Lock[MAX_SEATS]; // maps forks to locks

static int HMI_Lock = 0;    // lock to prevent HMI contention

static int Dinner_Bell = 0; // set to 1 to start dinner


/*
 * Pick_Up - pick up a fork
 */
void Pick_Up(int fork) {
   do { } while (!_lockset(Lock[fork]));
}


/*
 * Put_Down - put down a fork
 */
void Put_Down(int fork) {
   _lockclr(Lock[fork]);
}


/*
 * Diner - function to run on a cog to simulate a philosopher
 */
void Diner(void) {
   int me;
   int course;

   // wait till dinner is served
   do { } while (!Dinner_Bell);

   // get our identity 
   me = Seat[_cogid()];

   // be seated
   cogsafe_print_str(HMI_Lock, "%s has been seated\n", Philosopher[me].name);

   // have dinner
   for (course = 1; course <= NUM_COURSES; course++) {
      cogsafe_print_str(HMI_Lock, "%s is thinking\n", Philosopher[me].name);
      wait(random(2000));
      cogsafe_print_str(HMI_Lock, "%s is hungry\n", Philosopher[me].name);
      Pick_Up(Philosopher[me].left);
      wait(random(INTERFORK_WAIT));
      Pick_Up(Philosopher[me].right);
      cogsafe_print_str(HMI_Lock, "%s is eating\n", Philosopher[me].name);
      wait(random(2000));
      Put_Down(Philosopher[me].right);
      Put_Down(Philosopher[me].left);
   }

   // leave
   cogsafe_print_str(HMI_Lock, "%s is leaving\n", Philosopher[me].name);
   wait(100);
   _cogstop(_cogid());
}

 
/*
 * main - set up the diners and then start dinner
 */
void main(void) {
   int i = 0;
   int kbd;
   int fork = 0;
   int seat = 0;
   int num_seats = 0;
   unsigned long stacks[STACK_SIZE*MAX_SEATS];

   // assign a lock to be used by all cogs (to avoid HMI plugin contention)
   HMI_Lock = _locknew();

   cogsafe_print(HMI_Lock, "Dining Philosophers\n\n");

   // check the actual number of philosophers
   if ((NUM_PHILOSOPHERS < 2) || (NUM_PHILOSOPHERS > MAX_SEATS)) {
      cogsafe_print_int(HMI_Lock,  
         "NUM_PHILOSOPHERS must be between 2 and %d\n", MAX_SEATS);
      while(1);
   }

   cogsafe_print(HMI_Lock, "Press a key to begin ...\n\n");
   k_wait();
   randomize();

   // kill the keyboard (so we have 5 cogs spare)
   kbd = _locate_plugin(LMM_KBD);
   if (kbd > 0) {
      _cogstop(kbd);
   }

   // set up seats and forks until we reach the maximum or
   // there are no cogs (seats) or locks (forks) left
   do {
      seat = _coginit_C(&Diner, &stacks[STACK_SIZE*(num_seats + 1)]);
      if (seat >= 0) {
         Seat[seat] = num_seats;
         fork = _locknew();
         if (fork < 8) {
            Lock[num_seats] = fork;
            num_seats++;
         }
      }
   } while ((num_seats < NUM_PHILOSOPHERS) && (seat >= 0) && (fork >= 0));

   if (num_seats >= 2) {
      cogsafe_print_int(HMI_Lock, "There are %d seats\n\n", num_seats);
      // set up forks (in case there are less than MAX_SEATS seats)
      Philosopher[num_seats - 1].right = 0;
      // now start dinner
      Dinner_Bell = 1;
   }
   else {
      cogsafe_print(HMI_Lock, "There are not enough seats!\n");
   }

   while (1) ; // loop forever 
}

