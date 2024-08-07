/* 
 * Created from flash.binary with option -a
 * 
 * by Spin to C Array Converter, version 7.6
 */

#define FLASH_CLOCKFREQ  80000000
#define FLASH_CLOCKMODE  0x6E

#define FLASH_ARRAY_TYPE 1 // array contains SPIN program
#define FLASH_PROG_SIZE  56 // bytes
#define FLASH_PROG_OFF   8 // byte offset in array
#define FLASH_VAR_SIZE   8 // bytes
#define FLASH_STACK_SIZE 100 // bytes
#define FLASH_STACK_OFF  4 // bytes

unsigned char FLASH_array[] =
{
    0x38, 0x00, 0x02, 0x00, 0x08, 0x00, 0x00, 0x00, 
    0x36, 0x37, 0x03, 0x36, 0xed, 0xe3, 0x41, 0x40, 
    0x3f, 0xb6, 0x3f, 0x91, 0x3b, 0x04, 0xc4, 0xb4, 
    0x00, 0x37, 0x00, 0xf6, 0xec, 0x45, 0x36, 0x37, 
    0x03, 0x36, 0xed, 0xe3, 0x42, 0x4b, 0x40, 0x3f, 
    0xb4, 0x44, 0x23, 0x3b, 0x04, 0xc4, 0xb4, 0x00, 
    0x37, 0x00, 0xf6, 0x46, 0x4c, 0x04, 0x67, 0x32
};
