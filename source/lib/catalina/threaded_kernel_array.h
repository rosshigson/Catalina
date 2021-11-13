/* 
 * The files included herea are created using p2_asm and bindump: 
 *
 *    cp threaded_kernel_array.p2 threaded_kernel_array.h
 *
 *    p2_asm  Catalina_LMM_threaded_dynamic.spin2
 *    bindump Catalina_LMM_threaded_dynamic.bin -p "   0x" -c > LMM_threaded_dynamic.inc
 *
 *    p2_asm  Catalina_CMM_threaded_dynamic.spin2
 *    bindump Catalina_CMM_threaded_dynamic.bin -p "   0x" -c > CMM_threaded_dynamic.inc
 *
 *    p2_asm  Catalina_NMM_threaded_dynamic.spin2
 *    bindump Catalina_NMM_threaded_dynamic.bin -p "   0x" -c > NMM_threaded_dynamic.inc
 *
 */

#if defined(__CATALINA_COMPACT)

// Catalina_CMM_threaded_dynamic kernel goes here ...

unsigned long CMM_threaded_dynamic_array[] = {

#include "CMM_threaded_dynamic.inc"

};

#elif defined (__CATALINA_NATIVE)

// Catalina_NMM_threaded_dynamic kernel goes here ...

unsigned long NMM_threaded_dynamic_array[] = {

#include "NMM_threaded_dynamic.inc"

};

#else

// Catalina_LMM_threaded_dynamic kernel goes here ...

unsigned long LMM_threaded_dynamic_array[] = {

#include "LMM_threaded_dynamic.inc"

};

#endif

