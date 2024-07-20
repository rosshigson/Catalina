/* 
 * The files included here are created using p2asm and spinc: 
 *
 *  spinpp -D P2 -D libthreads -I lmmlib.s > lmmtl.spin2
 *  p2asm -v33 lmmtl.spin2
 *  spinc -p2 -B2 -n LMM_LUT_LIBRARY lmmtl.bin > lmmtl.inc
 *
 *  spinpp -D P2 -D libthreads -I cmmlib.s > cmmtl.spin2
 *  p2asm -v33 cmmtl.spin2
 *  spinc -p2 -B2 -n CMM_LUT_LIBRARY cmmtl.bin > cmmtl.inc
 *
 *  spinpp -D P2 -D libthreads -I nmmlib.s > nmmtl.spin2
 *  p2asm -v33 nmmtl.spin2
 *  spinc -p2 -B2 -n NMM_LUT_LIBRARY nmmtl.bin.bin > nmmtl.inc
 *
 */
#if defined(__CATALINA_COMPACT)

// Catalina CMM LUT library goes here ...

#include "cmmtl.inc"

#define LUT_SIZE  (CMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  CMM_LUT_LIBRARY_array

#elif defined (__CATALINA_NATIVE)

// Catalina NMM LUT library goes here ...

#include "nmmtl.inc"

#define LUT_SIZE  (NMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  NMM_LUT_LIBRARY_array

#else

// Catalina LMM LUT library goes here ...

#include "lmmtl.inc"

#define LUT_SIZE  (LMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  LMM_LUT_LIBRARY_array

#endif
