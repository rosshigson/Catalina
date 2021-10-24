#include <stdio.h>

int main(void) {
   char name[11];
   printf("Enter your name: ");
   scanf("%10s", name);
   printf(" Hello %s", name);

   while (1) ; // Prop reboots on exit from main!

   return 0;
}

