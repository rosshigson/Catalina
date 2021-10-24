#include <stdio.h>
#include <sys/types.h>
#include <time.h>
#define u_int int

u_int ackermann(u_int m, u_int n)
{
   if ( m == 0 ) return n+1;
   if ( n == 0 ) {
      return ackermann(m-1, 1);
   }
   return ackermann(m-1, ackermann(m, n-1));
}
 
int main(void)
{
   int m, n;
   int time;

   printf("Press a key to start\n");
   getchar();

   time = clock(); 
   for(n=0; n < 7; n++) {
     for(m=0; m < 4; m++) { 
       printf("A(%d,%d) = %d\n", m, n, ackermann(m,n));
     }
     printf("\n");
   }
   time = clock() - time;

   printf("ackerman took %d msec\n", time);

   printf("Press a key to exit\n");
   getchar();
 
   return 0;
}

