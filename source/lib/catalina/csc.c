#include <stdint.h>
#include <cog.h>

/*
 * _cogstart_C : start a C function in any cog.
 *
 * On entry:
 *    func  : address of C function to run (defined as 'void func (void *)')
 *    arg   : argument to C function (ends up in r2)
 *    stack : address of base of stack (i.e. points to start of stack)
 *    size  : size of stack (in bytes)
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 * NOTE: The differences between _coginit_C and _cogstart_C are:
 *    In _cogstart_C, function 'func' accepts a parameter (i.e. 'arg').
 *    In _cogstart_C, 'stack' specifies the BASE of the stack, not the TOP.
 *
 */
int _cogstart_C(void func(void *), void *arg, void *stack, uint32_t size) {
   return _cogstart_C_cog(func, arg, stack, size, ANY_COG);
}

