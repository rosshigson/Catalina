/* 
 * Created from dining_philosophers.bin with option -c
 * 
 * by Spin to C Array Converter, version 4.4
 */

#define CMM_CLOCKFREQ  180000000
#define CMM_CLOCKMODE  0x010C4707

#define CMM_ARRAY_TYPE 2 // array contains C blob

#define CMM_LAYOUT         8

#define CMM_BLOB_SIZE      0xf00 // bytes
#define CMM_STACK_SIZE     0x1f40 // bytes
#define CMM_PROGRAM_SIZE   0xf98 // bytes
#define CMM_RUNTIME_SIZE   0x2ee8 // bytes

#define CMM_INIT_PC        0x40200
#define CMM_INIT_SP        0x42ed8

#define CMM_CODE_ADDRESS   0x40000
#define CMM_CNST_ADDRESS   0x40ce4
#define CMM_INIT_ADDRESS   0x40e2c
#define CMM_DATA_ADDRESS   0x40f00

#define CMM_FILE_NAME      "diners.cmm"


// start the blob as a C program from an overlay
int start_CMM(void* var_addr, int cog) {

   // zero the memory used for data and stack space
   memset((void *)CMM_DATA_ADDRESS, 0, CMM_RUNTIME_SIZE-CMM_BLOB_SIZE);

   // load the blob to the correct location
   _load_overlay("diners.cmm", (void *)CMM_CODE_ADDRESS, CMM_BLOB_SIZE);

#if (defined(__CATALINA_libthreads) || (defined(COGSTART_THREADED) && !defined(COGSTART_NON_THREADED)))

#if CMM_LAYOUT == 8
   return _threaded_cogstart_CMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#elif CMM_LAYOUT == 11
   return _threaded_cogstart_NMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#else
   return _threaded_cogstart_LMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#endif

#else

#if CMM_LAYOUT == 8
   return _cogstart_CMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#elif CMM_LAYOUT == 11
   return _cogstart_NMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#else
   return _cogstart_LMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#endif

#endif

}

