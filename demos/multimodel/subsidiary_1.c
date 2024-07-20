/*
 * A trivial subsidiary program. It simply waits till a value is passed
 * to it via the shared variable, and then returns the square of the value.
 */

#include <hmi.h>
#include <cog.h>

#include "shared_1.h"

void main (shared_1_t *share) {
   t_printf("Subsidiary 1 started on cog %d\n", _cogid());
   while (1) {
      // wait till we are requested with a non-zero input
      while (share->input == 0);
      // respond by squaring the input value in the output
      share->output = share->input*share->input;
      // wait till the output is accepted (by being zeroed)
      while (share->output != 0);
   }
}
