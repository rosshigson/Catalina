/* 
 * Created from hello_world.bin with option -c
 * 
 * by Spin to C Array Converter, version 4.4
 */

#define CMM_CLOCKFREQ  180000000
#define CMM_CLOCKMODE  0x010C4707

#define CMM_ARRAY_TYPE 2 // array contains C blob

#define CMM_LAYOUT         8

#define CMM_BLOB_SIZE      0x124 // bytes
#define CMM_STACK_SIZE     0x50 // bytes
#define CMM_PROGRAM_SIZE   0x124 // bytes
#define CMM_RUNTIME_SIZE   0x184 // bytes

#define CMM_INIT_PC        0x7bb7c
#define CMM_INIT_SP        0x7bcd0

#define CMM_CODE_ADDRESS   0x7bb5c
#define CMM_CNST_ADDRESS   0x7bc3c
#define CMM_INIT_ADDRESS   0x7bc78
#define CMM_DATA_ADDRESS   0x7bc80

#define CMM_FILE_NAME      "hello_world.bin"

unsigned long CMM_array[] =
{
    0x081ef1f3, 0x90010836, 0xf0440006, 0xfd60001f, 
    0xf6040001, 0xf064001c, 0xfd600000, 0x10018801, 
    0x0d440dc6, 0x0000b809, 0x0007bc58, 0xd885d0c2, 
    0x041eefd3, 0xb809c648, 0x0007bc40, 0xd885d0c2, 
    0x041eefd3, 0x20aac648, 0xd885d0c2, 0x041eef23, 
    0xb809c648, 0x0007bc3c, 0xd885d0c2, 0x041eefd3, 
    0x0000c648, 0x001eef03, 0x001eed73, 0x3c000003, 
    0x17400003, 0x00310dc6, 0xd58238b6, 0xadae55ae, 
    0x0d360031, 0x08ac45a8, 0xd885d0fc, 0x041ef063, 
    0x0d80c648, 0x00001801, 0x17c00003, 0x0d440dc6, 
    0x55aed582, 0x0d2aadae, 0x08ac45a8, 0xd885d0fa, 
    0x041ef063, 0x0d80c648, 0x00001a01, 0x17800003, 
    0x0d440dc6, 0x0000b859, 0x00ffffff, 0x50ac08aa, 
    0xd88588ee, 0x041eede3, 0x0d80c648, 0x00001a01, 
    0x00000a0a, 0x6120794d, 0x6d756772, 0x20746e65, 
    0x756c6176, 0x73692065, 0x00000020, 0x6c6c6548, 
    0x77202c6f, 0x646c726f, 0x72662820, 0x43206d6f, 
    0x6c617461, 0x21616e69, 0x00000a29, 0x00000000, 
    0x00001004
};

// start the blob as a C program from an array
int start_CMM(void* var_addr, int cog) {

   // zero the memory used for data and stack space
   memset((void *)CMM_DATA_ADDRESS, 0, CMM_RUNTIME_SIZE-CMM_BLOB_SIZE);

   // copy the blob to the correct location
   memcpy((void *)CMM_CODE_ADDRESS, CMM_array, CMM_BLOB_SIZE);

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

