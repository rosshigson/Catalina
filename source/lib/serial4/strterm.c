#include <serial4.h>

void s4_strterm(unsigned port, char *stringptr, char term) {
   s4_str(port, stringptr);
   s4_tx(port, term);
}
