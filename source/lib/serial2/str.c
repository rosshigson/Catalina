#include <serial2.h>

void s_str(unsigned port, char *stringptr) {
   char ch;

   while ((ch = *(stringptr++)) != 0) {
      s_tx(port, ch);
   }
}
