/* 
 * The files included here are created using p2asm and spinc: 
 *
 *  spinpp -D P2 -D libthreads -I Catalina_LMM_library.spin2 > LMM_threaded_library.spin2
 *  p2asm -v33 Catalina_LMM_threaded_library.spin2
 *  spinc -p2 -B2 -n LMM_LUT_LIBRARY Catalina_LMM_threaded_library.bin > LMM_threaded_library.inc
 *
 *  spinpp -D P2 -D libthreads -I Catalina_CMM_library.spin2 > CMM_threaded_library.spin2
 *  p2asm -v33 Catalina_CMM_threaded_library.spin2
 *  spinc -p2 -B2 -n CMM_LUT_LIBRARY Catalina_CMM_threaded_library.bin > CMM_threaded_library.inc
 *
 *  spinpp -D P2 -D libthreads -I Catalina_NMM_library.spin2 > NMM_threaded_library.spin2
 *  p2asm -v33 Catalina_NMM_threaded_library.spin2
 *  spinc -p2 -B2 -n NMM_LUT_LIBRARY Catalina_NMM_threaded_library.bin > NMM_threaded_library.inc
 *
 */
#if defined(__CATALINA_COMPACT)

// Catalina CMM LUT library goes here ...

#include "CMM_threaded_library.inc"

#define LUT_SIZE  (CMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  CMM_LUT_LIBRARY_array

#elif defined (__CATALINA_NATIVE)

// Catalina NMM LUT library goes here ...

#include "NMM_threaded_library.inc"

#define LUT_SIZE  (NMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  NMM_LUT_LIBRARY_array

#else

// Catalina LMM LUT library goes here ...

#include "LMM_threaded_library.inc"

#define LUT_SIZE  (LMM_LUT_LIBRARY_BLOB_SIZE/4)
#define LUT_ADDR  LMM_LUT_LIBRARY_array

#endif
