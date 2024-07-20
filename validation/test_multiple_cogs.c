 /***************************************************************************\
 *                                                                           *
 *                         Multiple Cogs Validation                          *
 *                                                                           *
 * Simple multiple cog program that can be validated by the Lua script       *
 * 'test_multiple_cogs.lua'                                                  *
 *                                                                           *
 \***************************************************************************/

/*
 * define a default stack size to use for new cogs:
 */
#define STACK_SIZE 100

/*
 * define some global variables that all cogs will share:
 */
static int ping;
static int lock;

/*
 * wait : pause for a specified number of milliseconds
 */ 
void wait(int milliseconds) {
   _waitcnt(_cnt() + milliseconds *(_clockfreq()/1000));
}


/* print a formatted integer */
void cogsafe_print_int(int lock, char *format, int i) {
   do { } while (!_lockset(lock));
   t_printf(format, i);
   _lockclr(lock);
}


/*
 * ping_function : C function that can be executed in a cog.
 *                (the only requirement for such a function is that it 
 *                be a void function that requires no parameters - to 
 *                share data with it, use commmon variables)
 */
void ping_function(void) {
   int me = _cogid();

   cogsafe_print_int(lock, "Cog %d started!\n", me);
   while (1) {
      if (ping == me) {
         cogsafe_print_int(lock, "... Cog %d pinged!\n", me);
         ping = -1;
      }
   }
}

/*
 * main : start up to 7 cogs, then ping each one in turn
 */
int main(void) {
   int i = 0;
   int cog = 0;
   unsigned long stacks[STACK_SIZE* 7];

   // assign a lock to be used to avoid plugin contention
   lock = _locknew();

   // start instances of ping_function until there are no cogs left
   do {
      cog = _coginit_C(&ping_function, &stacks[STACK_SIZE*(++i)]);
   } while (cog >= 0);

   // now loop forever, pinging each cog in turn
   while (1) {
      for (cog = 0; cog < 8; cog++) {
         cogsafe_print_int(lock, "Pinging cog %d ...\n", cog);
         ping = cog;
         // slow things down a bit so we can see the messages
         wait(200); 
      }
   }

   return 0;
}
