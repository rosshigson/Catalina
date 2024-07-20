#ifndef __MULTICOG_UTILITIES_H
#define __MULTICOG_UTILITIES_H

/*
 * include the definitions of the hmi functions:
 */
#include <hmi.h>

/*
 * define a default stack size to use for new cogs:
 */
#define STACK_SIZE 400 // bytes

/*
 * define some cog safe print functions:
 */
void cogsafe_print(int lock, char *str);
void cogsafe_print_int(int lock, char *format, int i);
void cogsafe_print_str(int lock, char *format, char *str);

/*
 * define some handy utility functions:
 */
void wait(int milliseconds);
void randomize();
int  random(int max);

#endif // __MULTICOG_UTILITIES_H
