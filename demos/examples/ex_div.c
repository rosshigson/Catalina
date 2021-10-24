#include <stdio.h>
#include <limits.h>
#include <stdlib.h>

//
// This program tests random divisions, comparing integer division with the
// same division done as floating point. It allows some errors due to the
// inaccuracy of floating point representations of large integers. It will
// print out every thousandth result, and also stops if it ever finds 
// something seriously amiss.
//
// build this program with -C PLATFORM -lc -lm -C CLOCK 
//
void randomize(void);
int get_rand(int iSpread);

/* Seed the randomizer with the timer */
void randomize(void) {
  //time_t timer;

  //srand ((unsigned) time (&timer));
  srand ((unsigned) _cnt());
}

/* Returns an integer from 1 to iSpread */
int get_rand(int iSpread) {
  return((rand() % iSpread) + 1);
}

int main(void) {
   int i, j, k, l, m;

   printf("INT_MAX = %d\n", INT_MAX);
   printf("\nPress a key to continue...");
   getchar();
   randomize();

   while(1) {
      for (i = 0; i < 5000; i++) {
         j = get_rand(INT_MAX) * get_rand(INT_MAX);
         k = get_rand(INT_MAX);

         l = j/k;
         m = ((int)((float)j/(float)k));
         if ((l != m) || (i == 0)) {
            printf("\n%d / %d = %d or %d)", j, k, l, m);
            if (abs(l - m) > abs(l/1000000) + 1) {
               printf("\nPress a key to continue...");
               getchar();
            }
         }

         l = -j/k;
         m = (int)((float)-j/(float)k);
         if ((l != m) || (i == 0)) {
            printf("\n%d / %d = %d or %d)", -j, k, l, m);
            if (abs(l - m) > abs(l/1000000) + 1) {
               printf("\nPress a key to continue...");
               getchar();
            }
         }

         l = j/-k;
         m = (int)((float)j/(float)-k);
         if ((l != m) || (i == 0)) {
            printf("\n%d / %d = %d or %d)", j, -k, l, m);
            if (abs(l - m) > abs(l/1000000) + 1) {
               printf("\nPress a key to continue...");
               getchar();
            }
         }

         l = -j/-k;
         m = (int)((float)-j/(float)-k);
         if ((l != m) || (i == 0)) {
            printf("\n%d / %d = %d or %d)", -j, -k, l, m);
            if (abs(l - m) > abs(l/1000000) + 1) {
               printf("\nPress a key to continue...");
               getchar();
            }
         }
      }
   }

   return 0;
}
