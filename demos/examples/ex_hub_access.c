#include <stdio.h>

int main(void) {
   int frequency;

   int *freq_ptr;


   freq_ptr = (int *)0x0000;
 
   frequency = *freq_ptr;

   printf("Propeller Frequency = %d\n", frequency);

   while (1) ; // propeller restarts on exit from main!

   return 0;
}
