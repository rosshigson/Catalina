/*****************************************************************************
 *                                                                           *
 *   This program is a simple program intended to demonstrate loading and    *
 *   executing a subsidiary C program dynamically from a primary program.    *
 *                                                                           *
 *   This subsidiary program can itself be compiled either as CMM or LMM,    *
 *   and then loaded and run from a primary program that is itself compiled  *
 *   as CMM or LMM or XMM (SMALL or LARGE).                                  *
 *                                                                           *
 *   This subsidiary program accepts the address of an integer that can be   *
 *   passed in by the primary program that dynamically loads this program.   *
 *   This can be used to share an integer variable with the primary program. *
 *                                                                           *
 *   For examples of a primary program that executes this program, see       *
 *   "run_hello_world.c" or "run_reserved.c". For examples of how to build   *
 *   both the primary program and this subsidiary program, see the           *
 *   Makefile.                                                               *
 *                                                                           *
 *****************************************************************************/

#include <hmi.h>

// Note that here we define the main function according to the C standard, 
// but this means that the integer address will appear in argv, and argc 
// will be undefined. We could instead have defined the main function as:
//    void main(int *argv)
void main(int argc, char *argv[])
{
   t_string(1, "Hello, world (from Catalina!)\n");
   t_string(1, "My argument value is ");
   t_integer(1, *(int *)argv);
   t_string(1,"\n\n");

   while (1); // we never exit - we must be stopped by the primary program
}
