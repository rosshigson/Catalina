#include "ex7.h"
#include <stdio.h>

extern "C" { void ada_method2 (A *t, int v);}

void A::method1 (void)
{
  a_value = 2020;
  printf ("in A::method1, a_value = %d \n",a_value);

}

void A::method2 (int v)
{
   ada_method2 (this, v);
   printf ("in A::method2, a_value = %d \n",a_value);

}

A::A(void)
{
   a_value = 1010;
  printf ("in A::A, a_value = %d \n",a_value);
}
