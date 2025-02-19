#include <serial4.h>

void s_strterm(unsigned port, char *stringptr, char term) {
   s_str(port, stringptr);
   s_tx(port, term);
}
