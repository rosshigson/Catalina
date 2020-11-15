
/* simple program declares and then calls a function */

#include <stdio.h>

extern int func(int);

int main(void) {

   int i = 9;

   printf("func(%d) = %d\n", i, func(i));

   return 0;
}
