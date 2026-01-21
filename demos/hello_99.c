/******************************************************************************
 *                            Simple C99 demo                                 *
 *                                                                            *
 * There are two ways to use Cake with Catalina to compile C99 programs:      *
 *                                                                            *
 *  1. Compile using Catalyze first, then Catalina. For example:              *
 *        cake hello_99.c -o hello_89.c                                       *
 *        catalina -lc hello_89.c                                             *
 *                                                                            *
 *  2. Compile with Catalina using the C99 option. For example:               *
 *       catalina -lc -C99 hello_89.c                                         *
 *                                                                            *
 *****************************************************************************/
#include <stdio.h>

#define PRINT(...) fprintf(stderr,__VA_ARGS__) // requires C99!

void main() {

   // although this does not require C99, it will not normally
   // work in Catalina, but it WILL when cake is used! ...
   enum my_enum { A = 'a', B = 'bb', C = 'ccc', D = 'dddd' };

   printf("A=%X\n", A);
   printf("B=%X\n", B);
   printf("B=%X\n", C);
   printf("B=%X\n", D);

   for (int i = 0; i < 10; i++) { // requires C99!
      PRINT("hello %d from %s\n", i, __func__); // requires C99!
   }

}

