/* 
 * Created from dining_philosophers.bin with option -c
 * 
 * by Spin to C Array Converter, version 4.4
 */

#define LMM_CLOCKFREQ  180000000
#define LMM_CLOCKMODE  0x010C4707

#define LMM_ARRAY_TYPE 2 // array contains C blob

#define LMM_LAYOUT         0

#define LMM_BLOB_SIZE      0x1640 // bytes
#define LMM_STACK_SIZE     0x1f40 // bytes
#define LMM_PROGRAM_SIZE   0x16d8 // bytes
#define LMM_RUNTIME_SIZE   0x3628 // bytes

#define LMM_INIT_PC        0x403b0
#define LMM_INIT_SP        0x43618

#define LMM_CODE_ADDRESS   0x40000
#define LMM_CNST_ADDRESS   0x41424
#define LMM_INIT_ADDRESS   0x4156c
#define LMM_DATA_ADDRESS   0x41640

#define LMM_FILE_NAME      "diners.lmm"


// start the blob as a C program from an overlay
int start_LMM(void* var_addr, int cog) {

   // zero the memory used for data and stack space
   memset((void *)LMM_DATA_ADDRESS, 0, LMM_RUNTIME_SIZE-LMM_BLOB_SIZE);

   // load the blob to the correct location
   _load_overlay("diners.lmm", (void *)LMM_CODE_ADDRESS, LMM_BLOB_SIZE);

#if (defined(__CATALINA_libthreads) || (defined(COGSTART_THREADED) && !defined(COGSTART_NON_THREADED)))

#if LMM_LAYOUT == 8
   return _threaded_cogstart_CMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#elif LMM_LAYOUT == 11
   return _threaded_cogstart_NMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#else
   return _threaded_cogstart_LMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#endif

#else

#if LMM_LAYOUT == 8
   return _cogstart_CMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#elif LMM_LAYOUT == 11
   return _cogstart_NMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#else
   return _cogstart_LMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#endif

#endif

}

