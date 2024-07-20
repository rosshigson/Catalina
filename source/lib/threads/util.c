#include <thutil.h>

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


