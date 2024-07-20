#include <threads.h>
#include <cog.h>

/*
 * _thread_cog : start a C function as a thread in a new multi-threaded cog.
 *
 * On entry:
 *    func  : address of C function to run (defined as 'int f(int, char **)')
 *    stack : address of TOP of stack to use (i.e. points just after last long)
 *    argc  : argument to C function (ends up in r3)
 *    argv  : argument to C function (ends up in r2)
 *    
 * On exit:
 *    cog   : cog used, or -1 on any error
 */
int _thread_cog(_thread func, unsigned long *stack, int argc, char *argv[]) {
   return _threadstart_C_cog(func, argc, argv, stack, 0, ANY_COG);
}

