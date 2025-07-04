/* 
 * The files included here are created using p2asm and spinc
 * *see the Makefile for full details): 
 *
 *  spp -D P2 lmmlib.t > lmml.s
 *  p2asm -v33  lmml.s
 *  spinc -p2 -B2 -n LMM_LUT_LIBRARY lmml.bin > lmml.inc
 *
 *  spp -D P2 cmmlib.t > cmml.s
 *  p2asm -v33  cmml.s
 *  spinc -p2 -B2 -n CMM_LUT_LIBRARY cmml.bin > cmml.inc
 *
 *  spp -D P2 nmmlib.t > nmml.s
 *  p2asm -v33  nmml.s
 *  spinc -p2 -B2 -n NMM_LUT_LIBRARY nmml.bin > nmml.inc
 *
 */
#if defined(__CATALINA_COMPACT)

// Catalina CMM LUT library goes here ...

#include "cmml.inc"

#define LUT_SIZE  (CMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  CMM_LUT_LIBRARY_array

#elif defined (__CATALINA_NATIVE)

// Catalina NMM LUT library goes here ...

#include "nmml.inc"

#define LUT_SIZE  (NMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  NMM_LUT_LIBRARY_array

#else

// Catalina LMM LUT library goes here ...

#include "lmml.inc"

#define LUT_SIZE  (LMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  LMM_LUT_LIBRARY_array

#endif
