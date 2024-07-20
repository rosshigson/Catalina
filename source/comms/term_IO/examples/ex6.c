#include "ex6.h"
#include <fstream.h>

void A::non_virtual (void)
{
   cout << "in A::non_virtual, a_value = " << a_value << "\n";
}

void A::overridden(void)
{
   cout << "in A::overridden, a_value = " << a_value << "\n";
}

void A::not_overridden(void)
{
   cout << "in A::not_overridden, a_value = " << a_value << "\n";
}

A::A(void)
{
   a_value = 1010;
   cout << "in A::A, a_value = " << a_value << "\n";
}

void B::overridden (void)
{
   cout << "in B::overridden, a_value = " << a_value << "b_value = " << b_value
<< "\n";
}
B::B(void)
{
   b_value = 2020;
   cout << "in B::B, a_value = " << a_value << "b_value = " << b_value << "\n";
}
