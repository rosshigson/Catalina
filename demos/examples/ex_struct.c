#include <stdio.h>

// simple test of passing and returning structures to/from a function

struct a {
   int i;
   int j;
};

struct a f(struct a x)
{
   struct a r = x;
   r.i++;
   r.j--;
   return r;
}

void main(void)
{
   struct a x = { 12, -37 };
   struct a y = f(x);

   printf("Simple structure passing test ...\n\n");
   printf("   original = { %d, %d }\n", x.i, x.j);
   printf("   result   = { %d, %d }\n", y.i, y.j);
   printf("\n... done!\n");
   while (1) { };
}

