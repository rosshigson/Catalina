/* 
 * Created from cmmtl.bin
 * 
 * by Spin to C Array Converter, version 8.1
 */

#define CMM_LUT_LIBRARY_CLOCKFREQ  180000000
#define CMM_LUT_LIBRARY_CLOCKMODE  0x010008FB

#define CMM_LUT_LIBRARY_ARRAY_TYPE 2 // array contains C blob

#define CMM_LUT_LIBRARY_LAYOUT         8

#define CMM_LUT_LIBRARY_BLOB_SIZE      0x32c // bytes
#define CMM_LUT_LIBRARY_STACK_SIZE     0x64 // bytes
#define CMM_LUT_LIBRARY_PROGRAM_SIZE   0x32c // bytes
#define CMM_LUT_LIBRARY_RUNTIME_SIZE   0x3a0 // bytes

#define CMM_LUT_LIBRARY_INIT_PC        0x0
#define CMM_LUT_LIBRARY_INIT_SP        0x1f90

#define CMM_LUT_LIBRARY_CODE_ADDRESS   0x1c00
#define CMM_LUT_LIBRARY_CNST_ADDRESS   0x1f2c
#define CMM_LUT_LIBRARY_INIT_ADDRESS   0x1f2c
#define CMM_LUT_LIBRARY_DATA_ADDRESS   0x1f2c

#define CMM_LUT_LIBRARY_FILE_NAME      "cmmtl.bin"

unsigned long CMM_LUT_LIBRARY_array[] =
{
    0xfd100001, 0xfd600018, 0x0d600219, 0xf6005201, 
    0xf6005400, 0xf6400201, 0xf6400000, 0xf560522a, 
    0xfda00300, 0xf610542a, 0xf6800201, 0xf6105229, 
    0x06800000, 0xf6004e55, 0xf6045000, 0xf21c5010, 
    0x3d90001c, 0xfb005227, 0xf0445218, 0xf2085200, 
    0xad64002d, 0xf1045001, 0xf1044e04, 0xfd9fffdc, 
    0x066c5001, 0xf6045410, 0xf6100003, 0xcd90001c, 
    0xf7cc0080, 0x5d900068, 0xf6000003, 0xfda0030d, 
    0x5d90009c, 0xf6000028, 0xfd900054, 0xf0640001, 
    0xf1000055, 0xfae00000, 0xf6004e00, 0xf044000c, 
    0xf504000f, 0xf6005027, 0xf5044e7f, 0xf06c4e18, 
    0xad90006c, 0xf6005428, 0xf0445407, 0xf504541f, 
    0xf7cc5410, 0x5d900010, 0xf43bd42a, 0x5d705406, 
    0x1403d42a, 0xbd9ffff0, 0xf5200422, 0xf5400427, 
    0xf504000f, 0xf0640002, 0xf1000055, 0xfb000000, 
    0xf7c80022, 0xad900028, 0xf5200022, 0xfc600400, 
    0xfb080600, 0x5d9ffff8, 0xf1040004, 0xfb000000, 
    0xf21c5410, 0xcd605407, 0xc403d42a, 0xfd64002d, 
    0xf6640001, 0xfd9fffe8, 0xf0640202, 0xff0003df, 
    0xf10403b0, 0xfb000401, 0xff007fff, 0xf50405ff, 
    0xf0640618, 0xf5400403, 0xfc600401, 0x0c600002, 
    0xfac00602, 0xfc400600, 0xf1040001, 0xf1040401, 
    0xfb6c03fb, 0xfd64002d, 0xff000001, 0xfaa44f61, 
    0xf9b84e01, 0xff000001, 0xfc344f61, 0xfb005000, 
    0x00000000, 0xfaa44e00, 0xf2084e28, 0xff000001, 
    0xfaa44f69, 0xf9b04e01, 0xff000001, 0xfc344f69, 
    0xfd603629, 0x0b000000, 0xf607c864, 0xf587ca01, 
    0xf5e7ca02, 0xf25fce00, 0xcd90008c, 0xf43bd5e7, 
    0x5d73ce06, 0x1403d5e7, 0xbd90007c, 0xfb0051e6, 
    0xfb084e54, 0x5d900074, 0xf20851e6, 0xad900060, 
    0xf6005228, 0xf1045285, 0xfac04e29, 0xf7cc4ee0, 
    0xad900010, 0xf5444e80, 0xfc404e29, 0xfb005028, 
    0xfc6051e6, 0xf6004fe6, 0xf1044e04, 0xfd643e28, 
    0xfc600027, 0xf1044e80, 0xfc43ca27, 0xf603cc28, 
    0xf1045004, 0xfd643e28, 0xfb000028, 0xf1045080, 
    0xfac3ca28, 0xf1045002, 0xfaebc828, 0xa607c864, 
    0xfd63ce07, 0xf403d5e7, 0x005fca01, 0xf20851e6, 
    0x5b005228, 0x5c605227, 0xac605027, 0xfc604e28, 
    0xf6005027, 0xf6045485, 0xf1005427, 0xfac0562a, 
    0xfd604e01, 0xf5245607, 0xf5405627, 0xfc40562a, 
    0xf6045400, 0xfc605454, 0xfd9fff54, 0xf587ca01, 
    0xf5e7ca02, 0xfb0051e6, 0xf20851e6, 0xad900008, 
    0xfdbfff3c, 0xfd9ff328, 0xfdbfff94, 0xfd9ff320, 
    0xfd604224, 0xfd63ce07, 0xf403d5e7, 0xf607c801, 
    0xfd604024, 0xfd604824, 0xfd64002d, 0xfd604224, 
    0xf43bd5e7, 0x5d73ce06, 0x1403d5e7, 0xfd604024, 
    0xfd74806f, 0xfd64002d, 0xfd604224, 0xfd63ce07, 
    0xf403d5e7, 0xfd604024, 0xfd64002d, 0xfd604224, 
    0xf43bd401, 0x5d700206, 0x1403d401, 0xfd604024, 
    0xfd74806f, 0xfd64002d, 0xfd604224, 0xfd600207, 
    0xf403d401, 0xfd604024, 0xfd64002d
};
