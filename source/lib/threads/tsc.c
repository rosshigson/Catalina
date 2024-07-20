#include <stdint.h>
#include <threads.h>
#include <cog.h>

/*
 * _threadstart_C : start a C function in any cog.
 *
 * On entry:
 *    func  : address of C function to run (defined as 'int f(int, char **)')
 *    stack : address of base of stack (i.e. points to start of stack)
 *    size  : size of stack (in bytes)
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 */
int _threadstart_C(_thread func, int argc, char *argv[], void *stack, uint32_t size) {
   return _threadstart_C_cog(func, argc, argv, stack, size, ANY_COG);
}

