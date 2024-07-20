#include <serial4.h>

void s4_str(unsigned port, char *stringptr) {
   char ch;

   while ((ch = *(stringptr++)) != 0) {
      s4_tx(port, ch);
   }
}
