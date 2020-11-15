/* Test program for <stdbool.h>.  May be compiled by C90, C99, or C++.
 */

#include <stdio.h>
#include "stdbool.h"

struct S {
  bool b : 1;
};

int main()
{
    bool b;
    struct S s;

    if (true != 1)
        printf("warning: true does not have integer value 1\n");

    if (false != 0)
        printf("warning: false does not have integer value 0\n");

    b = 2;
    if (b != 1)
        printf("warning: conversion to bool does not compare "
               "against 0\n");

    b = -1;
    if (b < 0L)
        printf("warning: bool is not unsigned\n");

    s.b = true;
    if ((int) s.b != true)
        printf("warning: bool bitfield does not cleanly hold true\n");

    /* Some compilers mistakenly issue an error for the next line */
#if !true
    printf("warning: true did not work in #if\n");
#endif

    /* Some compilers mistakenly issue an error for the next line */
#if false
    printf("warning: false did not work in #if\n");
#endif

#ifdef __bool_true_false_are_defined
    printf("note: __bool_true_false_are_defined is defined "
      "with value %d\n", __bool_true_false_are_defined);
#else
    printf("note: __bool_true_false_are_defined is not defined\n");
#endif

    printf("note: sizeof(bool) is %u bytes\n",
      (unsigned int) sizeof(bool));

    while(1) { };

    return 0;
}
