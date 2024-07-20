/******************************************************************************
 *                                                                            *
 * ex_waitx.c - test the new wait functions on a Propeller 1 or 2             *
 *                                                                            *
 * compile for the Propeller 1 with a command like:                           *
 *                                                                            *
 *   catalina test_waitx.c -lci -O5 -C NO_REBOOT                              *
 *                                                                            *
 * or for the Propeller 2 with a command like:                                *
 *                                                                            *
 *   catalina -p2 ex_waitx.c -lci -O5 -C NO_REBOOT                            *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <prop.h>

#ifdef __CATALINA_P2
#include <prop2.h>
#endif

void main() {
   char ch;
   unsigned start, stop;
   unsigned ten_freq_ticks = 10*_clockfreq();

   printf("press a key to wait 10 seconds...\n");
   ch = getchar();
   start = _cnt();
   _waitx(ten_freq_ticks);
   stop = _cnt();
   printf("ticks = %8u\n\n", stop-start);

   printf("press a key to wait 10 seconds...\n");
   ch = getchar();
   start = _cnt();
   _waitsec(10);
   stop = _cnt();
   printf("ticks = %8u\n\n", stop-start);

   printf("press a key to wait 10 seconds...\n");
   ch = getchar();
   start = _cnt();
   _waitms(10000);
   stop = _cnt();
   printf("ticks = %8u\n\n", stop-start);

   printf("press a key to wait 10 seconds...\n");
   ch = getchar();
   start = _cnt();
   _waitus(10000000);
   stop = _cnt();
   printf("ticks = %8u\n\n", stop-start);

   printf("done!\n");
   while (1);
}
