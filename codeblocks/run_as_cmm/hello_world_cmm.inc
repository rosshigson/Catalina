/* 
 * Created from hello_world.binary with option -c
 * 
 * by Spin to C Array Converter, version 4.3
 */

#define CMM_CLOCKFREQ  80000000
#define CMM_CLOCKMODE  0x6F

#define CMM_ARRAY_TYPE 2 // array contains C blob

#define CMM_LAYOUT         8

#define CMM_BLOB_SIZE      0x114 // bytes
#define CMM_STACK_SIZE     0x50 // bytes
#define CMM_PROGRAM_SIZE   0x118 // bytes
#define CMM_RUNTIME_SIZE   0x178 // bytes

#define CMM_INIT_PC        0x4014
#define CMM_INIT_BZ        0x4114
#define CMM_INIT_SP        0x4168

#define CMM_CODE_ADDRESS   0x4000
#define CMM_CNST_ADDRESS   0x40d4
#define CMM_INIT_ADDRESS   0x4110
#define CMM_DATA_ADDRESS   0x4114

#define CMM_FILE_NAME      "hello_world.binary"

unsigned long CMM_array[] =
{
    0x00009001, 0xa0fc0080, 0x0c7c0000, 0x10018801, 
    0x00001001, 0x0d440dc6, 0x0000b809, 0x000040f0, 
    0xd885d0c2, 0x04010233, 0xb809c648, 0x000040d8, 
    0xd885d0c2, 0x04010233, 0x20aac648, 0xd885d0c2, 
    0x04010183, 0xb809c648, 0x000040d4, 0xd885d0c2, 
    0x04010233, 0x0000c648, 0x00010163, 0x00010003, 
    0x3c000003, 0x17400003, 0x00310dc6, 0xd58238b6, 
    0xadae55ae, 0x0d360031, 0x08ac45a8, 0xd885d0fc, 
    0x040102c3, 0x0d80c648, 0x00001801, 0x17c00003, 
    0x0d440dc6, 0x55aed582, 0x0d2aadae, 0x08ac45a8, 
    0xd885d0fa, 0x040102c3, 0x0d80c648, 0x00001a01, 
    0x17800003, 0x0d440dc6, 0x0000b859, 0x00ffffff, 
    0x50ac08aa, 0xd88588ee, 0x04010033, 0x0d80c648, 
    0x00001a01, 0x00000a0a, 0x6120794d, 0x6d756772, 
    0x20746e65, 0x756c6176, 0x73692065, 0x00000020, 
    0x6c6c6548, 0x77202c6f, 0x646c726f, 0x72662820, 
    0x43206d6f, 0x6c617461, 0x21616e69, 0x00000a29, 
    0x00000000
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
#else
   return _threaded_cogstart_LMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#endif

#else

#if CMM_LAYOUT == 8
   return _cogstart_CMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#else
   return _cogstart_LMM_cog(CMM_INIT_PC, CMM_INIT_SP, var_addr, cog);
#endif

#endif

}

