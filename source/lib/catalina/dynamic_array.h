/* 
 * The files included herea are created using p2_asm and bindump: 
 *
 *    cp dynamic_array.p2 dynamic_array.h
 *
 *    p2_asm  Catalina_LMM_dynamic.spin2
 *    bindump Catalina_LMM_dynamic.bin -p "   0x" -c > LMM_dynamic.inc
 *
 *    p2_asm  Catalina_CMM_dynamic.spin2
 *    bindump Catalina_CMM_dynamic.bin -p "   0x" -c > CMM_dynamic.inc
 *
 *    p2_asm  Catalina_NMM_dynamic.spin2
 *    bindump Catalina_NMM_dynamic.bin -p "   0x" -c > NMM_dynamic.inc
 *
 */

#if defined(__CATALINA_COMPACT)

// Catalina_CMM_dynamic kernel goes here ...

unsigned long CMM_dynamic_array[] = {

#include "CMM_dynamic.inc"

};

#elif defined (__CATALINA_NATIVE)

// Catalina_NMM_dynamic kernel goes here ...

unsigned long NMM_dynamic_array[] = {

#include "NMM_dynamic.inc"

};

#else

// Catalina_LMM_dynamic kernel goes here ...

unsigned long LMM_dynamic_array[] = {

#include "LMM_dynamic.inc"

};

#endif

