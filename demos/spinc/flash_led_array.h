/* 
 * Created from flash_led.binary
 * 
 * by Spin to C Array Converter, version 6.0
 */

#define flash_led_CLOCKFREQ  80000000
#define flash_led_CLOCKMODE  0x6E

#define flash_led_ARRAYTYPE 0 // array contains PASM program
#define flash_led_PROG_SIZE  40 // bytes

unsigned long flash_led_array[] =
{
    0x68bfec07, 0x64bfe807, 0xa0bc11f1, 0x80bc1009, 
    0xf8bc1009, 0x6cbfe807, 0x5c7c0004, 0x00008000, 
    0x00000000, 0x02625a00
};
