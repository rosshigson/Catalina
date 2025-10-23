/*
 * over_p1.c : run secondary programs at a fixed Hub address.
 *                   
 * NOTE: This file is configured for a Propeller 1 C3 board,  
 *       a serial HMI and address 0x4000 using the catapult 
 *       pragmas.
 *                   
 */

#pragma catapult common options(-C C3 -C TTY -C FS_OVERLAY -C NO_ARGS -O5 -lcx -lma)

// common includes or definitions should go here ...

#include "catapult.h"
#include <stdlib.h>
#include <string.h>
#include <prop.h>

typedef struct func_1 {
   int a;
   int b;
   int c;
} func_1_t;

typedef struct func_2 {
   float a;
   float b;
   float c;
} func_2_t;

#pragma catapult secondary func_1 mode(TINY) address(0x4000) stack(500) overlay(func_1.ovl)

// includes, definitions or functions specific to this secondary go here ...

void func_1(func_1_t *s) {
   t_string(1, "func_1 running on cog ");
   t_integer(1, _cogid());
   t_string(1, "\na = ");
   t_integer(1, s->a);
   t_string(1, ", b = ");
   t_integer(1, s->b);
   t_string(1, "\n");
   s->c  = s->a + s->b;
}
 
#pragma catapult secondary func_2 mode(TINY) address(0x4000) stack(500) overlay(func_2.ovl)

// includes, definitions or functions specific to this secondary go here ...

void func_2(func_2_t *s) {
   t_string(1, "func_2 running on cog ");
   t_integer(1, _cogid());
   t_string(1, "\na = ");
   t_float(1, s->a, 2);
   t_string(1, ", b = ");
   t_float(1, s->b, 2);
   t_string(1, "\n");
   s->c = s->a * s->b;
}

#pragma catapult primary mode(COMPACT) binary(over_p1)

// includes, definitions or functions specific to the primary go here ...

void pause() {
   msleep(250);
}

void main() {
   func_1_t args_1;
   func_2_t args_2;
   int cog;

   args_1.a = 1;
   args_1.b = 2;
   args_1.c = 0;

   _mount(0, 0);

   t_string(1, "starting ...\n\n");

   FIXED_START(func_1, args_1, ANY_COG, cog);
   pause();
   t_string(1, "result = ");
   t_integer(1, args_1.c);
   t_string(1, "\n\n");
   STOP(cog);
   
   args_2.a = 11.1;
   args_2.b = 22.2;
   args_2.c = 0.0;

   FIXED_START(func_2, args_2, ANY_COG, cog);
   pause();
   t_string(1, "result = ");
   t_float(1, args_2.c, 2);
   t_string(1, "\n\n");
   STOP(cog);

   t_string(1, "... done!\n");

   while(1);

}
