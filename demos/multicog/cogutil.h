#ifndef __MULTICOG_UTILITIES_H
#define __MULTICOG_UTILITIES_H

/*
 * include the definitions of the propeller functions:
 */
#include "prop.h"
#ifdef __CATALINA_P2
#include "prop2.h"
#endif

/*
 * include the definitions of the cog functions:
 */
#include <cog.h>

/*
 * include the definitions of the hmi functions:
 */
#include <hmi.h>

/*
 * define a default stack size to use for new cogs:
 */
#define STACK_SIZE 100 // longs

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
void randomize(void);
int  random(int max);

#endif // __MULTICOG_UTILITIES_H
