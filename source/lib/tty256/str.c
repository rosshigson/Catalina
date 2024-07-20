#include <tty.h>

void tty_str(char *stringptr) {
   char ch;

   while ((ch = *(stringptr++)) != 0) {
      tty_tx(ch);
   }
}
