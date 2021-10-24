#include <stdio.h>

int main (void) {
   fprintf(stdout, "hello, world (from Catalina!)\n");

   fprintf(stdout, "string = \"%s\",\nint = %d,\nchar = '%c'\n", 
                   "String", 3,'a');

   printf("Press any key to continue...\n");
   getchar();

   return 0;
}
