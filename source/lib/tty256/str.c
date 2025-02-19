#include <tty.h>

void s_str(char *stringptr) {
   char ch;

   while ((ch = *(stringptr++)) != 0) {
      s_tx(ch);
   }
}
