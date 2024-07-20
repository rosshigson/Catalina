/* 
 * The files included herea are created using p2_asm and bindump: 
 *
 *    cp dynamic_array.p2 dynamic_array.h
 *
 *    p2_asm  lmmd.spin2
 *    bindump lmmd.bin -p "   0x" -c > lmmd.inc
 *
 *    p2_asm  cmmd.spin2
 *    bindump cmmd.bin -p "   0x" -c > cmmd.inc
 *
 *    p2_asm  nmmd.spin2
 *    bindump nmmd.bin -p "   0x" -c > nmmd.inc
 *
 */

#if defined(__CATALINA_COMPACT)

// cmmd kernel goes here ...

unsigned long cmmd_array[] = {

#include "cmmd.inc"

};

#elif defined (__CATALINA_NATIVE)

// nmmd kernel goes here ...

unsigned long nmmd_array[] = {

#include "nmmd.inc"

};

#else

// lmmd kernel goes here ...

unsigned long lmmd_array[] = {

#include "lmmd.inc"

};

#endif

