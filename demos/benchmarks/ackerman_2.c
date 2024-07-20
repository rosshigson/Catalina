#include <hmi.h>
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
   unsigned long time1, time2;

   t_string(1, "Press a key to start\n");
   k_wait();

   time1 = clock(); 
   for(n=0; n < 7; n++) {
      for(m=0; m < 4; m++) { 
         t_string(1, "A(");
         t_integer(1, m);
         t_string(1, ",");
         t_integer(1, n);
         t_string(1, ") = ");
         t_integer(1, ackermann(m,n));
         t_string(1, "\n");
      }
      t_string(1, "\n");
   }
   time2 = clock() - time1;

   t_string(1, "ackerman took ");
   t_integer(1, time2);
   t_string(1, " msec\n");

   t_string(1, "Press a key to exit\n");
   k_wait();

   return 0;
}

