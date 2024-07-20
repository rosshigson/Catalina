/* 
 * The files included herea are created using p2_asm and bindump: 
 *
 *    cp tkarray.p2 tkarray.h
 *
 *    p2_asm  Catalina_lmmtd.spin2
 *    bindump Catalina_lmmtd.bin -p "   0x" -c > lmmtd.inc
 *
 *    p2_asm  Catalina_cmmtd.spin2
 *    bindump Catalina_cmmtd.bin -p "   0x" -c > cmmtd.inc
 *
 *    p2_asm  Catalina_nmmtd.spin2
 *    bindump Catalina_nmmtd.bin -p "   0x" -c > nmmtd.inc
 *
 */

#if defined(__CATALINA_COMPACT)

// Catalina_cmmtd kernel goes here ...

unsigned long cmmtd_array[] = {

#include "cmmtd.inc"

};

#elif defined (__CATALINA_NATIVE)

// Catalina_nmmtd kernel goes here ...

unsigned long nmmtd_array[] = {

#include "nmmtd.inc"

};

#else

// Catalina_lmmtd kernel goes here ...

unsigned long lmmtd_array[] = {

#include "lmmtd.inc"

};

#endif

