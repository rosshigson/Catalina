#include <hmi.h>

/*
 * HMI calls : text (screen)
 */
#define T_HEX_PRIMITIVE 1 /* 0 = implemented in plugin, 1 = implemented in C */

#if T_HEX_PRIMITIVE==0

int t_hex (unsigned curs, unsigned val) {
	return _short_service(SVC_T_HEX, ((curs&1)<<23) + (int)&val);
}

#else

int t_hex (unsigned curs, unsigned val) {
   int i,j;
   for (i = 0; i < 8; i++) {
      j = (val & 0xF0000000)>>28;
      t_char(curs, (j < 10 ? '0' + j : 'A' + j - 10));
      val <<= 4;
   }
   return 0;
}

#endif
