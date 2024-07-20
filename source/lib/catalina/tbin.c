#include <hmi.h>

/*
 * HMI calls : text (screen)
 */
#define T_BIN_PRIMITIVE 1 /* 0 = implemented in plugin, 1 = implemented in C */

#if T_BIN_PRIMITIVE==0

int t_bin (unsigned curs, unsigned val) {
	return _short_service(SVC_T_BIN, ((curs&1)<<23) + (int)&val);
}

#else

int t_bin (unsigned curs, unsigned val) {
   int i;
   for (i = 0; i < 32; i++) {
      t_char(curs, ((val & 0x80000000) ? '1':'0'));
      val <<= 1;
   }
   return 0;
}

#endif
