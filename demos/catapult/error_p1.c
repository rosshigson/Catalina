/*
 * error_p1.c : run secondary programs at reserved Hub addresses.
 *                   
 * NOTE: This file is configured for a Propeller 1 C3 board  
 *       and a serial HMI using the catapult common pragma.
 *                   
 */

#pragma catapult common options(-C C3 -C TTY -C NO_ARGS -O5 -lc -lma)

// common includes or definitions should go here ...

#include "catapult.h"
#include <stdlib.h>
#include <string.h>
#include <prop.h>

// undefine the default version of CATAPULT_ERROR
#undef CATAPULT_ERROR
// defined our custom version of CATAPULT_ERROR
#define CATAPULT_ERROR(name, address) \
{ \
   t_string(1, "OOPS! : "); t_string(1, name); \
   t_string(1, " should be at 0x"); t_hex(1, (int)address); \
   t_string(1, "\n"); \
}

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

#pragma catapult secondary func_1 mode(COMPACT) address(0x7A0C) stack(500)

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
 
#pragma catapult secondary func_2 mode(TINY) address(0x4000) stack(500)

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

#pragma catapult primary mode(COMPACT) binary(error_p1)

// includes, definitions or functions specific to the primary go here ...

void pause() {
   msleep(250);
}

void main() {
   func_1_t args_1;
   func_2_t args_2;
   int cog;

   RESERVE_SPACE(func_1); // reserve space for func_1

   args_1.a = 1;
   args_1.b = 2;
   args_1.c = 0;

   t_string(1, "starting ...\n\n");

   t_string(1, "func_1 address = ");
   t_hex(1, (int)RESERVED_ADDRESS(func_1));
   t_string(1, "\n\n");

   RESERVED_START(func_1, args_1, ANY_COG, cog);
   pause();
   t_string(1, "result = ");
   t_integer(1, args_1.c);
   t_string(1, "\n\n");
   STOP(cog);
   
   args_2.a = 11.1;
   args_2.b = 22.2;
   args_2.c = 0.0;

   RESERVE_AND_START(func_2, args_2, ANY_COG, cog);
   pause();
   t_string(1, "result = ");
   t_float(1, args_2.c, 2);
   t_string(1, "\n\n");
   STOP(cog);

   t_string(1, "... done!\n");

   while(1);

}
