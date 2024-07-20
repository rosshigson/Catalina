#include <prop.h>
#include <hmi.h>

char hex(int i) {
   if (i < 10) {
      return i + '0';
   }
   else {
      return i + 'A' - 10;
   }
}

int main (void) {
   int i, j, k;
   char c;

   t_string(1,"testing k_clear\n");
   t_string(1, "if you do not see \"ok!\" below, press a key\n");
   k_clear();
   t_string(1,"\nok!\n");


   t_string(1,"\ntesting k_wait (5 times)\n");
   for (i = 0; i < 5; i++) {
      t_string(1, "Press a key (wait): ");
      c = k_wait();
      t_integer(1,c);
      t_char(1, '\n');
   }

   t_string(1,"\ntesting k_get (5 times)\n");
   for (i = 0; i < 5; i++) {
      t_string(1, "press a key (get): ");
      j = 0;
      do {
          _waitcnt(_cnt()+_clockfreq()/100);
          c = k_get();
          j++;
      }
      while (c == 0);
      t_integer(1, c);
      t_string(1, " received after ");
      t_integer(1, j);
      t_string(1, " requests\n");
   }

   t_string(1,"\ntesting k_ready (5 times)\n");
   for (i = 0; i < 5; i++) {
      t_string(1, "Press a key (ready): ");
      while (!k_ready()) {
         ;
      }
      c = k_get();
      t_integer(1,c);
      t_char(1, '\n');
   }

   t_string(1, "\ntests complete\n");
   t_string(1, "Press any key to exit ...\n");
   k_wait();

   return 0;
}
