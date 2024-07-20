#include <cog.h>

/*
 * _coginit_C : start a C function in any cog.
 *
 * On entry:
 *    func  : address of C function to run (defined as 'void func (void)')
 *    stack : address of TOP of stack to use (i.e. points just after last long)
 * On exit:
 *    returns : cog used, or -1 on any error
 *
 * NOTE: The differences between _coginit_C and _cogstart_C are:
 *    In _coginit_C, function 'func' accepts no parameters.
 *    In _coginit_C, 'stack' specifies the TOP of the stack, not the BASE.
 *
 */
int _coginit_C(void func(void), unsigned long *stack) {
   return _coginit_C_cog(func, stack, ANY_COG);
}

