/* 
 * The files included herea are created using p2_asm and bindump: 
 *
 *    cp tkarray.p2 tkarray.h
 *
 *    p2_asm  lmmtd.spin2
 *    bindump lmmtd.bin -p "   0x" -c > lmmtd.inc
 *
 *    p2_asm  cmmtd.spin2
 *    bindump cmmtd.bin -p "   0x" -c > cmmtd.inc
 *
 *    p2_asm  nmmtd.spin2
 *    bindump nmmtd.bin -p "   0x" -c > nmmtd.inc
 *
 */

#if defined(__CATALINA_COMPACT)

// cmmtd kernel goes here ...

unsigned long cmmtd_array[] = {

#include "cmmtd.inc"

};

#elif defined (__CATALINA_NATIVE)

// nmmtd kernel goes here ...

unsigned long nmmtd_array[] = {

#include "nmmtd.inc"

};

#else

// lmmtd kernel goes here ...

unsigned long lmmtd_array[] = {

#include "lmmtd.inc"

};

#endif

