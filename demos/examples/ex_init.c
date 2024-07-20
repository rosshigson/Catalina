#include <hmi.h>

int main (void) {
   int argc = 8;
   char * argv[] = {"jzip", "-l", "30", "-c", "40", "-k", "1024", "game.dat", "\0"};
   int i;
   for (i = 0; i < argc; i++) {
      t_printf("arg %d = %s\n",i,argv[i]);
   }

   t_string(1, "Press any key to exit ...\n");
   k_wait();

   return 0;
}
