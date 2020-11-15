/* 
 * Created from hello_world.bin with option -c
 * 
 * by Spin to C Array Converter, version 4.4
 */

#define LMM_CLOCKFREQ  180000000
#define LMM_CLOCKMODE  0x010C4707

#define LMM_ARRAY_TYPE 2 // array contains C blob

#define LMM_LAYOUT         0

#define LMM_BLOB_SIZE      0x1f8 // bytes
#define LMM_STACK_SIZE     0x50 // bytes
#define LMM_PROGRAM_SIZE   0x1f8 // bytes
#define LMM_RUNTIME_SIZE   0x258 // bytes

#define LMM_INIT_PC        0x7bb80
#define LMM_INIT_SP        0x7bda4

#define LMM_CODE_ADDRESS   0x7bb5c
#define LMM_CNST_ADDRESS   0x7bd10
#define LMM_INIT_ADDRESS   0x7bd4c
#define LMM_DATA_ADDRESS   0x7bd54

#define LMM_FILE_NAME      "hello_world.bin"

unsigned long LMM_array[] =
{
    0xfd800003, 0x0007bd50, 0xf0445c06, 0xfd605c1f, 
    0xf6046601, 0xf064661c, 0xfd606600, 0xfd800018, 
    0xfd80000b, 0xf6009436, 0xf6009035, 0xfd800002, 
    0x0007bd2c, 0xf6006a2e, 0xf6046c01, 0xf6045e08, 
    0xf1845804, 0xfd80000a, 0x0007bc7c, 0xf1045804, 
    0xfd800002, 0x0007bd14, 0xf6006a2e, 0xf6046c01, 
    0xf6045e08, 0xf1845804, 0xfd80000a, 0x0007bc7c, 
    0xf1045804, 0xfb006a48, 0xf6046c01, 0xf6045e08, 
    0xf1845804, 0xfd80000a, 0x0007bc20, 0xf1045804, 
    0xfd800002, 0x0007bd10, 0xf6006a2e, 0xf6046c01, 
    0xf6045e08, 0xf1845804, 0xfd80000a, 0x0007bc7c, 
    0xf1045804, 0xfd80000d, 0x0007bc10, 0xfd80000d, 
    0x0007bb5c, 0xfd800008, 0xfd800021, 0x00d00000, 
    0xf6009436, 0xf6005c2d, 0xf1045c0c, 0xfc606a2e, 
    0xf600924a, 0xf5049201, 0xf0649217, 0xf6008e2d, 
    0xf1048e0c, 0xf1009247, 0xf6006a49, 0xf6046c1e, 
    0xf6045e08, 0xf1845804, 0xfd80000a, 0x0007bcc8, 
    0xf1045804, 0xf6009233, 0xfd800022, 0xfd800009, 
    0xfd800021, 0x00f00000, 0xf6009436, 0xf6009035, 
    0xf600924a, 0xf5049201, 0xf0649217, 0xf6008e48, 
    0xf1009247, 0xf6006a49, 0xf6046c1d, 0xf6045e08, 
    0xf1845804, 0xfd80000a, 0x0007bcc8, 0xf1045804, 
    0xf6009233, 0xfd800022, 0xfd80000b, 0xfd800021, 
    0x00e00000, 0xf6009436, 0xf6009035, 0xfd800002, 
    0x00ffffff, 0xf600922e, 0xf6006a48, 0xf5006a49, 
    0xf6606c4a, 0xf6045e08, 0xf1845804, 0xfd80000a, 
    0x0007bb78, 0xf1045804, 0xf6009233, 0xfd800022, 
    0xfd80000b, 0x00000a0a, 0x6120794d, 0x6d756772, 
    0x20746e65, 0x756c6176, 0x73692065, 0x00000020, 
    0x6c6c6548, 0x77202c6f, 0x646c726f, 0x72662820, 
    0x43206d6f, 0x6c617461, 0x21616e69, 0x00000a29, 
    0x00000000, 0x00001004
};

// start the blob as a C program from an array
int start_LMM(void* var_addr, int cog) {

   // zero the memory used for data and stack space
   memset((void *)LMM_DATA_ADDRESS, 0, LMM_RUNTIME_SIZE-LMM_BLOB_SIZE);

   // copy the blob to the correct location
   memcpy((void *)LMM_CODE_ADDRESS, LMM_array, LMM_BLOB_SIZE);

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

