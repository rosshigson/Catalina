#include <catalina_hmi.h>
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

   t_string(1, "Press a key to start\n");
   k_wait();

   time = clock(); 
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
      printf("\n");
   }
   time = clock() - time;

   t_string(1, "ackerman took ");
   t_integer(1, time);
   t_string(1, "\n");

   t_string(1, "Press a key to exit\n");
   k_wait();

   return 0;
}

