#ifndef _ALLOCA_H
#define _ALLOCA_H  1

#include <stddef.h>

/*
    Allocate __size bytes of space in the stack frame of the caller.

    This temporary space is automatically freed when the function that
    called alloca() returns to its caller. 

    alloca() returns a pointer to the beginning of the allocated space. 
    If the allocation causes stack overflow, program behaviour is
    undefined.
    
    Avoid use alloca() inside the list of arguments of a function call.
 */
extern void *__builtin_alloca (size_t __size);

#define alloca(size)    __builtin_alloca (size)

#endif  /* _ALLOCA_H */
