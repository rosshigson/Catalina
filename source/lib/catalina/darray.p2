/* 
 * The files included herea are created using p2_asm and bindump
 * (see the Makefile for full details): 
 *
 *    cp darray.p2 darray.h
 *
 *    spp -D P2 lmmd.t > lmmd.s
 *    p2_asm  lmmd.s
 *    bindump lmmd.bin -p "   0x" -c > lmmd.inc
 *
 *    spp -D P2 cmmd.t > cmmd.s
 *    p2_asm  cmmd.s
 *    bindump cmmd.bin -p "   0x" -c > cmmd.inc
 *
 *    spp -D P2 nmmd.t > nmmd.s
 *    p2_asm  nmmd.s
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

