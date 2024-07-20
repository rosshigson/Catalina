#include "cogutil.h"

/*
 * wait : pause for a specified number of milliseconds
 */ 
void wait(int milliseconds) {
   _waitcnt(_cnt() + milliseconds *(_clockfreq()/1000));
}


/* print a string */
void cogsafe_print(int lock, char *str) {
   do { } while (!_lockset(lock));
   t_printf(str);
   _lockclr(lock);
}


/* print a formatted integer */
void cogsafe_print_int(int lock, char *format, int i) {
   do { } while (!_lockset(lock));
   t_printf(format, i);
   _lockclr(lock);
}


/* print a formatatted string */
void cogsafe_print_str(int lock, char *format, char *str) {
   do { } while (!_lockset(lock));
   t_printf(format, str);
   _lockclr(lock);
}


/* 
 * randomize : seed the randomizer with the clock - to get a random
 *             seed, ask for user entry before calling this function
 */
void randomize(void)
{
  srand ((unsigned) _cnt());
}


/* 
 * random : returns an integer from 1 to max 
 */
int random(int max)
{
  return((rand() % max) + 1);
}


