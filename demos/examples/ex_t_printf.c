#include <hmi.h>
#include <stdarg.h>
#include <stdio.h>

int main(void) {
   char c;
   int i;
   float f;
   char *str;
   unsigned u;

   c = 'W';
   str = "hello!";
   i = 95;
   f = 9.5;
   u = 0xdeadbeefUL;

   t_printf("Welcome ... ");
   t_printf("to Catalina!\n\n");
   t_printf("char = %c\nstr = %s\nfloat = %3f\n", c, str, f);
   t_printf("str = %s\nint = %d\nfloat = %3f\nhex = %x\n", str, i, f, u);
   t_printf("float = %10.1f\n", f);
   t_printf("\nGoodbye ... ");
   t_printf("from Catalina!\n\n");

   while (1) ; // Prop reboots on exit from main!

   return 0;
}
