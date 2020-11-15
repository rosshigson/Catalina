/* 
 * Created from hello_world.binary with option -c
 * 
 * by Spin to C Array Converter, version 4.3
 */

#define LMM_CLOCKFREQ  80000000
#define LMM_CLOCKMODE  0x6F

#define LMM_ARRAY_TYPE 2 // array contains C blob

#define LMM_LAYOUT         0

#define LMM_BLOB_SIZE      0x1e4 // bytes
#define LMM_STACK_SIZE     0x50 // bytes
#define LMM_PROGRAM_SIZE   0x1e8 // bytes
#define LMM_RUNTIME_SIZE   0x248 // bytes

#define LMM_INIT_PC        0x4014
#define LMM_INIT_BZ        0x41e4
#define LMM_INIT_SP        0x4238

#define LMM_CODE_ADDRESS   0x4000
#define LMM_CNST_ADDRESS   0x41a4
#define LMM_INIT_ADDRESS   0x41e0
#define LMM_DATA_ADDRESS   0x41e4

#define LMM_FILE_NAME      "hello_world.binary"

unsigned long LMM_array[] =
{
    0xa0fc6680, 0x0c7c6600, 0x5c7c0019, 0x5c7c000c, 
    0x5c7c000c, 0xa0bc9436, 0xa0bc9035, 0x5c7c0003, 
    0x000041c0, 0xa0bc6a2e, 0xa0fc6c01, 0xa0fc5e08, 
    0x84fc5804, 0x5c7c000b, 0x00004110, 0x80fc5804, 
    0x5c7c0003, 0x000041a8, 0xa0bc6a2e, 0xa0fc6c01, 
    0xa0fc5e08, 0x84fc5804, 0x5c7c000b, 0x00004110, 
    0x80fc5804, 0x08bc6a48, 0xa0fc6c01, 0xa0fc5e08, 
    0x84fc5804, 0x5c7c000b, 0x000040b4, 0x80fc5804, 
    0x5c7c0003, 0x000041a4, 0xa0bc6a2e, 0xa0fc6c01, 
    0xa0fc5e08, 0x84fc5804, 0x5c7c000b, 0x00004110, 
    0x80fc5804, 0x5c7c000e, 0x000040a4, 0x5c7c000e, 
    0x00004000, 0x5c7c0009, 0x5c7c0022, 0x00d00000, 
    0xa0bc9436, 0xa0bc5c2d, 0x80fc5c0c, 0x083c6a2e, 
    0xa0bc924a, 0x60fc9201, 0x2cfc9217, 0xa0bc8e2d, 
    0x80fc8e0c, 0x80bc9247, 0xa0bc6a49, 0xa0fc6c1e, 
    0xa0fc5e08, 0x84fc5804, 0x5c7c000b, 0x0000415c, 
    0x80fc5804, 0xa0bc9233, 0x5c7c0023, 0x5c7c000a, 
    0x5c7c0022, 0x00f00000, 0xa0bc9436, 0xa0bc9035, 
    0xa0bc924a, 0x60fc9201, 0x2cfc9217, 0xa0bc8e48, 
    0x80bc9247, 0xa0bc6a49, 0xa0fc6c1d, 0xa0fc5e08, 
    0x84fc5804, 0x5c7c000b, 0x0000415c, 0x80fc5804, 
    0xa0bc9233, 0x5c7c0023, 0x5c7c000c, 0x5c7c0022, 
    0x00e00000, 0xa0bc9436, 0xa0bc9035, 0x5c7c0003, 
    0x00ffffff, 0xa0bc922e, 0xa0bc6a48, 0x60bc6a49, 
    0xa4bc6c4a, 0xa0fc5e08, 0x84fc5804, 0x5c7c000b, 
    0x00004008, 0x80fc5804, 0xa0bc9233, 0x5c7c0023, 
    0x5c7c000c, 0x00000a0a, 0x6120794d, 0x6d756772, 
    0x20746e65, 0x756c6176, 0x73692065, 0x00000020, 
    0x6c6c6548, 0x77202c6f, 0x646c726f, 0x72662820, 
    0x43206d6f, 0x6c617461, 0x21616e69, 0x00000a29, 
    0x00000000
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
#else
   return _threaded_cogstart_LMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#endif

#else

#if LMM_LAYOUT == 8
   return _cogstart_CMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#else
   return _cogstart_LMM_cog(LMM_INIT_PC, LMM_INIT_SP, var_addr, cog);
#endif

#endif

}

