#include <prop.h>
#include <cog.h>

/*
 * We can define the symbol COGSTART_THREADED here - this forces the start 
 * functions in the include files to start threaded kernels, even though 
 * this is a non-threaded program.
 */
#define COGSTART_THREADED

#include "dining_philosophers_cmm.inc"

void main(int argc, char *argv[]) {
   int arg;
   int cog;

   arg = 1;
   cog = start_CMM(&arg, ANY_COG);

   while (1) { }; // loop forever
}
