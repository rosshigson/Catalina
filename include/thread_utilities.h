#ifndef __CATALINA_UTILITIES_H
#define __CATALINA_UTILITIES_H
/*
 * include Catalina multi-threading:
 */
#include "catalina_threads.h"

/*
 * include the definitions of the cog functions:
 */
#include <catalina_cog.h>

/*
 * include the definitions of the hmi functions:
 */
#include <catalina_hmi.h>

/* 
 * define a function to initiate a C function in a new multithreaded cog:
 */
int _thread_cog(_thread func, unsigned long *stack, int argc, char *argv[]);

/*
 * define thread safe equivalents of the t_ HMI functions:
 */
int _thread_integer(void *pool, int lock, int num);
int _thread_unsigned(void *pool, int lock, unsigned num);
int _thread_string(void *pool, int lock, char *str);
int _thread_char(void *pool, int lock, char ch);
int _thread_hex(void *pool, int lock, unsigned num);
int _thread_bin(void *pool, int lock, unsigned num);

/*
 * define a thread safe equivalent of the HMI printf function:
 */
int _thread_printf(void *pool, int lock, char *str, ...);

/*
 * define some handy utility functions for random numbers:
 */
void randomize();
int  random(int max);

#endif // __CATALINA_UTILITIES_H
