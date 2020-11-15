/* 
 * Created from hello_world.bin with option -c
 * 
 * by Spin to C Array Converter, version 4.4
 */

#define NMM_CLOCKFREQ  180000000
#define NMM_CLOCKMODE  0x010C4707

#define NMM_ARRAY_TYPE 2 // array contains C blob

#define NMM_LAYOUT         11

#define NMM_BLOB_SIZE      0x1dc // bytes
#define NMM_STACK_SIZE     0x50 // bytes
#define NMM_PROGRAM_SIZE   0x1dc // bytes
#define NMM_RUNTIME_SIZE   0x23c // bytes

#define NMM_INIT_PC        0x40024
#define NMM_INIT_SP        0x4022c

#define NMM_CODE_ADDRESS   0x40000
#define NMM_CNST_ADDRESS   0x4019c
#define NMM_INIT_ADDRESS   0x401d8
#define NMM_DATA_ADDRESS   0x401dc

#define NMM_FILE_NAME      "hello_world.bin"

unsigned long NMM_array[] =
{
    0xff000008, 0xfb042c04, 0xf0442c06, 0xfd602c1f, 
    0xf6042c01, 0xf0642c1c, 0xfd602c00, 0xfe000009, 
    0xfe000006, 0xf6005a19, 0xf6005618, 0xff000200, 
    0xf60431b8, 0xf6043201, 0xf6042a08, 0xf187f004, 
    0xfe000005, 0x0004010c, 0xf107f004, 0xff000200, 
    0xf60431a0, 0xf6043201, 0xf6042a08, 0xf187f004, 
    0xfe000005, 0x0004010c, 0xf107f004, 0xfb00302b, 
    0xf6043201, 0xf6042a08, 0xf187f004, 0xfe000005, 
    0x000400b0, 0xf107f004, 0xff000200, 0xf604319c, 
    0xf6043201, 0xf6042a08, 0xf187f004, 0xfe000005, 
    0x0004010c, 0xf107f004, 0xfd8400a8, 0xfd840000, 
    0xfe000003, 0xfe000011, 0x00d00000, 0xf6005a19, 
    0xf60029f9, 0xf104280c, 0xfc603014, 0xf600582d, 
    0xf5045801, 0xf0645817, 0xf60055f9, 0xf104540c, 
    0xf100582a, 0xf600302c, 0xf604321e, 0xf6042a08, 
    0xf187f004, 0xfe000005, 0x00040158, 0xf107f004, 
    0xf6005816, 0xfe000012, 0xfe000004, 0xfe000011, 
    0x00f00000, 0xf6005a19, 0xf6005618, 0xf600582d, 
    0xf5045801, 0xf0645817, 0xf600542b, 0xf100582a, 
    0xf600302c, 0xf604321d, 0xf6042a08, 0xf187f004, 
    0xfe000005, 0x00040158, 0xf107f004, 0xf6005816, 
    0xfe000012, 0xfe000006, 0xfe000011, 0x00e00000, 
    0xf6005a19, 0xf6005618, 0xff007fff, 0xf60459ff, 
    0xf600302b, 0xf500302c, 0xf660322d, 0xf6042a08, 
    0xf187f004, 0xfe000005, 0x0004001c, 0xf107f004, 
    0xf6005816, 0xfe000012, 0xfe000006, 0x00000a0a, 
    0x6120794d, 0x6d756772, 0x20746e65, 0x756c6176, 
    0x73692065, 0x00000020, 0x6c6c6548, 0x77202c6f, 
    0x646c726f, 0x72662820, 0x43206d6f, 0x6c617461, 
    0x21616e69, 0x00000a29, 0x00000000
};

// start the blob as a C program from an array
int start_NMM(void* var_addr, int cog) {

   // zero the memory used for data and stack space
   memset((void *)NMM_DATA_ADDRESS, 0, NMM_RUNTIME_SIZE-NMM_BLOB_SIZE);

   // copy the blob to the correct location
   memcpy((void *)NMM_CODE_ADDRESS, NMM_array, NMM_BLOB_SIZE);

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

