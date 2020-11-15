/* 
 * Created from dining_philosophers.bin with option -c
 * 
 * by Spin to C Array Converter, version 4.4
 */

#define NMM_CLOCKFREQ  180000000
#define NMM_CLOCKMODE  0x010C4707

#define NMM_ARRAY_TYPE 2 // array contains C blob

#define NMM_LAYOUT         11

#define NMM_BLOB_SIZE      0x144c // bytes
#define NMM_STACK_SIZE     0x1f40 // bytes
#define NMM_PROGRAM_SIZE   0x14e4 // bytes
#define NMM_RUNTIME_SIZE   0x3434 // bytes

#define NMM_INIT_PC        0x40364
#define NMM_INIT_SP        0x43424

#define NMM_CODE_ADDRESS   0x40000
#define NMM_CNST_ADDRESS   0x41234
#define NMM_INIT_ADDRESS   0x4137c
#define NMM_DATA_ADDRESS   0x4144c

#define NMM_FILE_NAME      "diners.nmm"


// start the blob as a C program from an overlay
int start_NMM(void* var_addr, int cog) {

   // zero the memory used for data and stack space
   memset((void *)NMM_DATA_ADDRESS, 0, NMM_RUNTIME_SIZE-NMM_BLOB_SIZE);

   // load the blob to the correct location
   _load_overlay("diners.nmm", (void *)NMM_CODE_ADDRESS, NMM_BLOB_SIZE);

#if (defined(__CATALINA_libthreads) || (defined(COGSTART_THREADED) && !defined(COGSTART_NON_THREADED)))

#if NMM_LAYOUT == 8
   return _threaded_cogstart_CMM_cog(NMM_INIT_PC, NMM_INIT_SP, var_addr, cog);
#elif NMM_LAYOUT == 11
   return _threaded_cogstart_NMM_cog(NMM_INIT_PC, NMM_INIT_SP, var_addr, cog);
#else
   return _threaded_cogstart_LMM_cog(NMM_INIT_PC, NMM_INIT_SP, var_addr, cog);
#endif

#else

#if NMM_LAYOUT == 8
   return _cogstart_CMM_cog(NMM_INIT_PC, NMM_INIT_SP, var_addr, cog);
#elif NMM_LAYOUT == 11
   return _cogstart_NMM_cog(NMM_INIT_PC, NMM_INIT_SP, var_addr, cog);
#else
   return _cogstart_LMM_cog(NMM_INIT_PC, NMM_INIT_SP, var_addr, cog);
#endif

#endif

}

