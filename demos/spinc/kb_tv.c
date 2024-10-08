/* 
 * Created from KB_TV.binary with option -c
 * 
 * by Spin to C Array Converter, version 7.6
 */

#define KB_TV_CLOCKFREQ  12000000
#define KB_TV_CLOCKMODE  0x00

#define KB_TV_ARRAY_TYPE 1 // array contains SPIN program
#define KB_TV_PROG_SIZE  3204 // bytes
#define KB_TV_PROG_OFF   33 // byte offset in array
#define KB_TV_VAR_SIZE   1268 // bytes
#define KB_TV_STACK_SIZE 200 // bytes
#define KB_TV_STACK_OFF  4 // bytes

unsigned char KB_TV_array[] =
{
    0x84, 0x00, 0x02, 0x02, 0x21, 0x00, 0x00, 0x00, 
    0x84, 0x00, 0x08, 0x00, 0xc8, 0x05, 0x58, 0x00, 
    0x57, 0x65, 0x6c, 0x63, 0x6f, 0x6d, 0x65, 0x20, 
    0x74, 0x6f, 0x20, 0x53, 0x70, 0x69, 0x6e, 0x0d, 
    0x00, 0x01, 0x38, 0x1a, 0x38, 0x1b, 0x06, 0x02, 
    0x01, 0x01, 0x38, 0x0c, 0x06, 0x03, 0x01, 0x35, 
    0x45, 0x35, 0x41, 0x01, 0x87, 0x10, 0x06, 0x03, 
    0x03, 0x38, 0x73, 0x40, 0x36, 0x0d, 0x0d, 0x37, 
    0x00, 0x0d, 0x11, 0x37, 0x21, 0x0d, 0x1c, 0x37, 
    0x01, 0x0d, 0x20, 0x0c, 0x00, 0x06, 0x02, 0x07, 
    0x45, 0x35, 0x41, 0x0c, 0x00, 0x06, 0x02, 0x08, 
    0x0a, 0x04, 0x36, 0x45, 0x04, 0x02, 0x34, 0x45, 
    0x35, 0x41, 0x0c, 0x01, 0x44, 0x06, 0x03, 0x07, 
    0x35, 0x41, 0x0c, 0x01, 0x44, 0x06, 0x03, 0x03, 
    0x35, 0x41, 0x0c, 0x40, 0x35, 0xf9, 0x0a, 0x41, 
    0x01, 0x06, 0x03, 0x02, 0x01, 0x06, 0x02, 0x03, 
    0x32, 0x00, 0x00, 0x00, 0x44, 0x05, 0x0b, 0x00, 
    0xdc, 0x04, 0x00, 0x00, 0xe7, 0x04, 0x00, 0x00, 
    0xfb, 0x04, 0x00, 0x00, 0x09, 0x05, 0x00, 0x00, 
    0x0d, 0x05, 0x00, 0x00, 0x1d, 0x05, 0x00, 0x00, 
    0x27, 0x05, 0x00, 0x00, 0x2e, 0x05, 0x00, 0x00, 
    0x33, 0x05, 0x00, 0x00, 0x36, 0x05, 0x00, 0x00, 
    0x3d, 0x09, 0xfc, 0x54, 0xf0, 0x61, 0xbe, 0xa0, 
    0x2c, 0x60, 0xfe, 0x80, 0x04, 0x62, 0xfe, 0xa0, 
    0x30, 0x01, 0xbc, 0x08, 0xd8, 0x08, 0xbc, 0x80, 
    0x04, 0x60, 0xfe, 0x80, 0x04, 0x62, 0xfe, 0xe4, 
    0x01, 0x58, 0xfe, 0xa0, 0x3d, 0x59, 0xbe, 0x2c, 
    0x01, 0x5a, 0xfe, 0xa0, 0x3e, 0x5b, 0xbe, 0x2c, 
    0x20, 0x7a, 0x7e, 0x61, 0xd8, 0x3e, 0xbd, 0x70, 
    0xd8, 0x52, 0xbd, 0x70, 0x01, 0x76, 0xfd, 0x70, 
    0x01, 0x94, 0xfd, 0x70, 0x20, 0x7c, 0x7e, 0x61, 
    0xd8, 0x38, 0xbd, 0x70, 0xd8, 0x44, 0xbd, 0x70, 
    0x01, 0x92, 0xfd, 0x70, 0x00, 0x66, 0xfe, 0xa0, 
    0x00, 0xec, 0xff, 0xa0, 0x00, 0xee, 0xff, 0xa0, 
    0x34, 0x35, 0xfc, 0x54, 0x09, 0x60, 0xfe, 0xa0, 
    0x00, 0x00, 0xfc, 0xa0, 0xd8, 0x34, 0xbc, 0x80, 
    0x1a, 0x60, 0xfe, 0xe4, 0x08, 0x5c, 0xfe, 0xa0, 
    0x33, 0x45, 0xfc, 0x54, 0xf0, 0x61, 0xbe, 0xa0, 
    0x04, 0x60, 0xfe, 0x80, 0x0a, 0x62, 0xfe, 0xa0, 
    0x30, 0x01, 0x3c, 0x08, 0xd8, 0x44, 0xbc, 0x80, 
    0x04, 0x60, 0xfe, 0x80, 0x22, 0x62, 0xfe, 0xe4, 
    0x08, 0x5c, 0x7e, 0x61, 0xff, 0x5e, 0xf2, 0xa0, 
    0x9c, 0x68, 0xf1, 0x5c, 0x00, 0x5c, 0xfe, 0xa0, 
    0xb5, 0x88, 0xfd, 0x5c, 0x84, 0x5e, 0x7e, 0x85, 
    0xaa, 0x5e, 0x4e, 0x86, 0x80, 0x00, 0x48, 0x5c, 
    0xe0, 0x5e, 0x4e, 0x86, 0x01, 0x5c, 0xca, 0x68, 
    0x2a, 0x00, 0x48, 0x5c, 0xf0, 0x5e, 0x4e, 0x86, 
    0x02, 0x5c, 0xca, 0x68, 0x2a, 0x00, 0x48, 0x5c, 
    0x29, 0x00, 0x4c, 0x5c, 0x01, 0x5c, 0x7e, 0x61, 
    0x01, 0x5e, 0xfe, 0x34, 0x94, 0x88, 0xfd, 0x5c, 
    0x00, 0x5e, 0x7e, 0x86, 0x29, 0x00, 0x68, 0x5c, 
    0x3b, 0x65, 0xbe, 0xa0, 0x2f, 0x61, 0xbe, 0xa0, 
    0x05, 0x60, 0xfe, 0x28, 0x35, 0x61, 0xfe, 0x80, 
    0x30, 0x85, 0xbc, 0x54, 0x01, 0x62, 0xfe, 0xa0, 
    0x2f, 0x63, 0xbe, 0x2c, 0x02, 0x5c, 0x7e, 0x61, 
    0x31, 0x01, 0xbc, 0x74, 0xf0, 0x5e, 0xce, 0xe1, 
    0x1e, 0x00, 0x70, 0x5c, 0x3c, 0x63, 0xbe, 0xa0, 
    0x10, 0x62, 0xfe, 0x28, 0xe0, 0x5e, 0xfe, 0xe1, 
    0x04, 0x7e, 0x72, 0x62, 0x08, 0x5f, 0xe2, 0x80, 
    0x18, 0x5f, 0xd2, 0x80, 0x94, 0x88, 0xf1, 0x5c, 
    0x6a, 0x00, 0x70, 0x5c, 0xdd, 0x5e, 0xfe, 0xe1, 
    0x08, 0x60, 0xf2, 0xa0, 0x2f, 0x61, 0xb2, 0x2c, 
    0x3f, 0x61, 0xb2, 0x64, 0x03, 0x60, 0xf2, 0x28, 
    0x1d, 0x64, 0xf2, 0x28, 0x32, 0x61, 0xb2, 0x66, 
    0x30, 0x7f, 0xb2, 0x6c, 0xdd, 0x5e, 0xf2, 0x80, 
    0x04, 0x5c, 0xd2, 0x68, 0x03, 0x62, 0x7e, 0x62, 
    0x61, 0x5e, 0x56, 0x85, 0x5b, 0x5e, 0xd2, 0xe1, 
    0x28, 0x5f, 0xd2, 0x80, 0x94, 0x88, 0xd1, 0x5c, 
    0x03, 0x62, 0xd2, 0x64, 0x3e, 0x5e, 0x56, 0x85, 
    0x27, 0x5e, 0xd2, 0xe1, 0x2e, 0x5f, 0xd2, 0x80, 
    0x94, 0x88, 0xd1, 0x5c, 0x03, 0x62, 0xd2, 0x64, 
    0x02, 0x7e, 0x7e, 0x61, 0x20, 0xd0, 0xfc, 0x74, 
    0x40, 0x7e, 0x7e, 0x61, 0x20, 0xd0, 0xc4, 0x6c, 
    0x7b, 0x5e, 0x7e, 0x85, 0x61, 0x5e, 0xf2, 0xe1, 
    0x41, 0x5e, 0xf2, 0x80, 0x03, 0x62, 0xf2, 0x64, 
    0x08, 0x5e, 0xfe, 0x20, 0x04, 0x60, 0xfe, 0xa0, 
    0x03, 0x62, 0x7e, 0x62, 0x02, 0x62, 0xfe, 0x28, 
    0x01, 0x5e, 0xd6, 0x68, 0x01, 0x5e, 0xfe, 0x20, 
    0x6c, 0x60, 0xfe, 0xe4, 0x0c, 0x5e, 0xfe, 0x24, 
    0xf0, 0x61, 0xbe, 0x08, 0x01, 0x60, 0xfe, 0x84, 
    0x0f, 0x60, 0xfe, 0x60, 0x33, 0x61, 0x3e, 0x86, 
    0xff, 0x5e, 0x56, 0x62, 0xf0, 0x61, 0x96, 0xa0, 
    0x2c, 0x60, 0xd6, 0x80, 0x33, 0x61, 0x96, 0x80, 
    0x33, 0x61, 0x96, 0x80, 0x30, 0x5f, 0x16, 0x04, 
    0x01, 0x66, 0xd6, 0x80, 0x0f, 0x66, 0xd6, 0x60, 
    0x04, 0x5c, 0x7e, 0x61, 0x1e, 0x00, 0x4c, 0x5c, 
    0xf3, 0x5e, 0xfe, 0xa0, 0x9c, 0x68, 0xfd, 0x5c, 
    0x40, 0x5f, 0xbe, 0xa0, 0x7f, 0x5e, 0xfe, 0x60, 
    0x9c, 0x68, 0xfd, 0x5c, 0xed, 0x5e, 0xfe, 0xa0, 
    0x9c, 0x68, 0xfd, 0x5c, 0x3f, 0x5f, 0xbe, 0xa0, 
    0x1d, 0x5e, 0xfe, 0x3c, 0x04, 0x5e, 0x7e, 0x61, 
    0x01, 0x5e, 0xfe, 0x34, 0x07, 0x5e, 0xfe, 0x60, 
    0x9c, 0x68, 0xfd, 0x5c, 0x3f, 0x61, 0xbe, 0xa0, 
    0x07, 0x60, 0xfe, 0x60, 0x03, 0x78, 0xfe, 0x2c, 
    0x30, 0x79, 0xbe, 0x68, 0x03, 0x78, 0xfe, 0x20, 
    0x01, 0x68, 0xfe, 0xa0, 0x1e, 0x00, 0x7c, 0x5c, 
    0x02, 0x5e, 0xfe, 0x20, 0x2f, 0x33, 0xbd, 0x50, 
    0xda, 0x32, 0xfd, 0x80, 0x1b, 0x5e, 0xfe, 0x28, 
    0x2f, 0x61, 0xbe, 0xa0, 0x00, 0x5e, 0xbe, 0xa0, 
    0x30, 0x5f, 0xbe, 0x28, 0xc3, 0x00, 0x7c, 0x5c, 
    0x2d, 0xed, 0xbf, 0x68, 0x0d, 0xa6, 0xfd, 0x50, 
    0xd2, 0xae, 0xfd, 0x5c, 0x2c, 0xed, 0xbf, 0x68, 
    0x12, 0xa6, 0xfd, 0x50, 0xd2, 0xae, 0xfd, 0x5c, 
    0x2d, 0xed, 0xbf, 0x6c, 0xff, 0x5e, 0x7e, 0x61, 
    0x00, 0x5f, 0xfe, 0x74, 0xd8, 0x5e, 0xbe, 0x68, 
    0x0a, 0x60, 0xfe, 0xa0, 0xc5, 0x9a, 0xfd, 0x5c, 
    0x01, 0x5e, 0xfe, 0x29, 0x2c, 0xed, 0xbf, 0x74, 
    0xcf, 0x96, 0xbd, 0xa0, 0xc6, 0x9a, 0xfd, 0x5c, 
    0xa7, 0x60, 0xfe, 0xe4, 0xd0, 0x96, 0xbd, 0xa0, 
    0xc6, 0x9a, 0xfd, 0x5c, 0xd1, 0x96, 0xbd, 0xa0, 
    0xc6, 0x9a, 0xfd, 0x5c, 0xb7, 0x88, 0xfd, 0x5c, 
    0xfa, 0x5e, 0x7e, 0x86, 0x16, 0x00, 0x54, 0x5c, 
    0x00, 0x00, 0x7c, 0x5c, 0x20, 0x7c, 0x7e, 0x61, 
    0x2d, 0x5b, 0x3e, 0xf4, 0x0b, 0x60, 0xfe, 0xa0, 
    0xc5, 0x9a, 0xfd, 0x5c, 0x10, 0xa6, 0xfd, 0x50, 
    0xd2, 0xae, 0xfd, 0x5c, 0xf2, 0x59, 0x3e, 0x61, 
    0x01, 0x5e, 0xfe, 0x30, 0xcf, 0x96, 0xbd, 0xa0, 
    0xc6, 0x9a, 0xfd, 0x5c, 0xb8, 0x60, 0xfe, 0xe4, 
    0x16, 0x5e, 0xfe, 0x28, 0xff, 0x5f, 0x7e, 0x61, 
    0x16, 0x00, 0x4c, 0x5c, 0xff, 0x5e, 0xfe, 0x60, 
    0x00, 0x00, 0x7c, 0x5c, 0xce, 0x96, 0xbd, 0xa0, 
    0xd9, 0x62, 0xbe, 0xa0, 0x12, 0xa6, 0xfd, 0x50, 
    0xd2, 0xae, 0xfd, 0x5c, 0xf2, 0x5b, 0x3e, 0x61, 
    0xf2, 0x59, 0x3e, 0x62, 0xc7, 0x62, 0xc2, 0xe4, 
    0x16, 0x62, 0x7e, 0xec, 0x00, 0x00, 0x7c, 0x5c, 
    0xc7, 0x62, 0xf2, 0xe4, 0xc7, 0x62, 0xce, 0xe4, 
    0xc7, 0x62, 0xf6, 0xe4, 0xc7, 0x62, 0xee, 0xe4, 
    0x00, 0x64, 0xfe, 0x08, 0x00, 0x64, 0xfe, 0x28, 
    0x03, 0x64, 0xfe, 0x48, 0xf1, 0x65, 0xbe, 0x80, 
    0x00, 0x64, 0xfe, 0xf8, 0x00, 0x00, 0x7c, 0x5c, 
    0x00, 0x02, 0x00, 0x00, 0xc4, 0x09, 0x00, 0x00, 
    0x00, 0x00, 0xd8, 0x00, 0x00, 0x00, 0xd4, 0x00, 
    0xd2, 0x00, 0xd0, 0x00, 0xd1, 0x00, 0xdb, 0x00, 
    0x00, 0x00, 0xd9, 0x00, 0xd7, 0x00, 0xd5, 0x00, 
    0xd3, 0x00, 0x09, 0x00, 0x60, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0xf4, 0xf5, 0xf0, 0x00, 0x00, 0x00, 
    0xf2, 0xf3, 0x71, 0x00, 0x31, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x7a, 0x00, 0x73, 0x00, 
    0x61, 0x00, 0x77, 0x00, 0x32, 0x00, 0x00, 0xf6, 
    0x00, 0x00, 0x63, 0x00, 0x78, 0x00, 0x64, 0x00, 
    0x65, 0x00, 0x34, 0x00, 0x33, 0x00, 0x00, 0xf7, 
    0x00, 0x00, 0x20, 0x00, 0x76, 0x00, 0x66, 0x00, 
    0x74, 0x00, 0x72, 0x00, 0x35, 0x00, 0x00, 0xcc, 
    0x00, 0x00, 0x6e, 0x00, 0x62, 0x00, 0x68, 0x00, 
    0x67, 0x00, 0x79, 0x00, 0x36, 0x00, 0x00, 0xcd, 
    0x00, 0x00, 0x00, 0x00, 0x6d, 0x00, 0x6a, 0x00, 
    0x75, 0x00, 0x37, 0x00, 0x38, 0x00, 0x00, 0xce, 
    0x00, 0x00, 0x2c, 0x00, 0x6b, 0x00, 0x69, 0x00, 
    0x6f, 0x00, 0x30, 0x00, 0x39, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x2e, 0x00, 0x2f, 0xef, 0x6c, 0x00, 
    0x3b, 0x00, 0x70, 0x00, 0x2d, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 
    0x5b, 0x00, 0x3d, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0xde, 0x00, 0xf1, 0x00, 0x0d, 0xeb, 0x5d, 0x00, 
    0x00, 0x00, 0x5c, 0x00, 0x00, 0xcf, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0xc8, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0xe1, 0xc5, 0x00, 0x00, 0xe4, 0xc0, 
    0xe7, 0xc4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0xe0, 0xca, 0xea, 0xc9, 0xe2, 0xc3, 0xe5, 0x00, 
    0xe6, 0xc1, 0xe8, 0xc2, 0xcb, 0x00, 0xdf, 0x00, 
    0xda, 0x00, 0xec, 0x00, 0xe3, 0xc7, 0xed, 0x00, 
    0xee, 0xdc, 0xe9, 0xc6, 0xdd, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xd6, 0x00, 
    0xca, 0xc5, 0xc3, 0xc7, 0xc0, 0x00, 0xc1, 0xc4, 
    0xc2, 0xc6, 0xc9, 0x0d, 0x2b, 0x2d, 0x2a, 0x2f, 
    0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 
    0x38, 0x39, 0x2e, 0x0d, 0x2b, 0x2d, 0x2a, 0x2f, 
    0x7b, 0x7c, 0x7d, 0x00, 0x00, 0x7e, 0x22, 0x00, 
    0x00, 0x00, 0x00, 0x3c, 0x5f, 0x3e, 0x3f, 0x29, 
    0x21, 0x40, 0x23, 0x24, 0x25, 0x5e, 0x26, 0x2a, 
    0x28, 0x00, 0x3a, 0x00, 0x2b, 0x00, 0x00, 0x00, 
    0x00, 0x64, 0x68, 0x37, 0x01, 0x38, 0x28, 0x05, 
    0x02, 0x61, 0x32, 0x01, 0x05, 0x03, 0xcb, 0x30, 
    0x67, 0x37, 0x01, 0x1e, 0x34, 0xc7, 0x2c, 0x47, 
    0x28, 0x36, 0xec, 0x42, 0x80, 0x61, 0x32, 0x40, 
    0x0a, 0x05, 0x42, 0x98, 0x36, 0xed, 0x21, 0x47, 
    0x35, 0x38, 0x13, 0x1a, 0x32, 0x4c, 0xe6, 0x61, 
    0x32, 0x44, 0x48, 0xfb, 0x0a, 0x0a, 0x44, 0xb8, 
    0x30, 0x61, 0x46, 0xa6, 0x37, 0x23, 0xe8, 0x45, 
    0x32, 0x00, 0x05, 0x05, 0x62, 0x80, 0x0b, 0x02, 
    0x04, 0x77, 0x32, 0x48, 0x45, 0x00, 0x05, 0x06, 
    0x61, 0x32, 0x44, 0x48, 0xfb, 0x61, 0x32, 0x48, 
    0x45, 0x32, 0x64, 0x38, 0x05, 0xe2, 0xd8, 0x10, 
    0x64, 0xe2, 0x36, 0xe8, 0xe6, 0x61, 0x32, 0x00, 
    0x44, 0x02, 0x0b, 0x01, 0x78, 0x00, 0x00, 0x00, 
    0xab, 0x00, 0x00, 0x00, 0xb0, 0x00, 0x00, 0x00, 
    0xbd, 0x00, 0x04, 0x00, 0xfb, 0x00, 0x00, 0x00, 
    0x23, 0x01, 0x00, 0x00, 0x3a, 0x01, 0x08, 0x00, 
    0xb6, 0x01, 0x0c, 0x00, 0xf9, 0x01, 0x00, 0x00, 
    0x1f, 0x02, 0x04, 0x00, 0x44, 0x02, 0x98, 0x04, 
    0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x28, 0x00, 0x00, 0x00, 0x0d, 0x00, 0x00, 0x00, 
    0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x07, 0x0a, 0x07, 0xbb, 0x9e, 0x9b, 0x04, 0x07, 
    0x3d, 0x3b, 0x6b, 0x6e, 0xbb, 0xce, 0x3c, 0x0a, 
    0x01, 0x87, 0x68, 0x05, 0x08, 0x01, 0x35, 0x05, 
    0x07, 0xcb, 0x50, 0xc7, 0x30, 0x38, 0x0e, 0x1e, 
    0x64, 0x38, 0x38, 0xe8, 0x36, 0xe3, 0x64, 0x37, 
    0x01, 0xe8, 0x37, 0x01, 0xfc, 0x38, 0x05, 0xe8, 
    0xea, 0xc9, 0x58, 0xab, 0x80, 0x88, 0xc9, 0x60, 
    0x53, 0xc9, 0x64, 0x00, 0xcb, 0x50, 0x06, 0x0b, 
    0x01, 0x61, 0x32, 0x01, 0x06, 0x0b, 0x02, 0x32, 
    0x64, 0x16, 0x08, 0x08, 0x01, 0x66, 0xae, 0x80, 
    0x05, 0x07, 0x09, 0x78, 0x32, 0x64, 0x35, 0xf9, 
    0x0a, 0x07, 0x66, 0x46, 0x01, 0x38, 0x2d, 0x05, 
    0x07, 0x3b, 0x3b, 0x9a, 0xca, 0x00, 0x69, 0x38, 
    0x0a, 0x08, 0x27, 0x64, 0x68, 0xfe, 0x0a, 0x10, 
    0x01, 0x64, 0x68, 0xf6, 0x38, 0x30, 0xec, 0x05, 
    0x07, 0x68, 0x66, 0x57, 0x62, 0x1c, 0x04, 0x0c, 
    0x60, 0x68, 0x36, 0xfc, 0xf2, 0x0a, 0x05, 0x01, 
    0x38, 0x30, 0x05, 0x07, 0x38, 0x0a, 0x6a, 0x56, 
    0x09, 0x59, 0x32, 0x37, 0x02, 0x68, 0xed, 0x37, 
    0x00, 0xe3, 0x66, 0x43, 0x68, 0x08, 0x1b, 0x01, 
    0x35, 0x39, 0x01, 0x1e, 0x37, 0x01, 0x66, 0xc1, 
    0x37, 0x23, 0xe8, 0x38, 0x30, 0x38, 0x39, 0x12, 
    0x38, 0x41, 0x38, 0x46, 0x12, 0x0f, 0x05, 0x07, 
    0x09, 0x65, 0x32, 0x37, 0x04, 0x68, 0xed, 0x66, 
    0x43, 0x68, 0x08, 0x0d, 0x01, 0x36, 0x66, 0xc1, 
    0x36, 0xe8, 0x38, 0x30, 0xec, 0x05, 0x07, 0x09, 
    0x73, 0x32, 0x39, 0x01, 0xb3, 0x4c, 0x35, 0x0d, 
    0x10, 0x38, 0x0a, 0x0d, 0x80, 0x5b, 0x38, 0x0b, 
    0x0d, 0x80, 0x5c, 0x38, 0x0c, 0x0d, 0x80, 0x5d, 
    0x0c, 0x39, 0x01, 0xa0, 0x64, 0x35, 0x0d, 0x1a, 
    0x36, 0x0d, 0x26, 0x37, 0x02, 0x0d, 0x27, 0x38, 
    0x09, 0x0d, 0x29, 0x38, 0x0a, 0x38, 0x0c, 0x0e, 
    0x2f, 0x38, 0x0d, 0x0d, 0x2f, 0x01, 0x64, 0x05, 
    0x09, 0x0c, 0xab, 0x80, 0x88, 0x39, 0x02, 0x20, 
    0x39, 0x02, 0x08, 0x19, 0x35, 0x46, 0x80, 0x41, 
    0x0c, 0x35, 0x46, 0x80, 0x41, 0x0c, 0x40, 0x0a, 
    0x02, 0x42, 0x3e, 0x0c, 0x01, 0x37, 0x04, 0x05, 
    0x09, 0x40, 0x37, 0x22, 0xe8, 0x0b, 0x75, 0x0c, 
    0x64, 0x4d, 0x32, 0x0c, 0x01, 0x05, 0x0a, 0x0c, 
    0x0c, 0x64, 0x38, 0x28, 0xf7, 0x41, 0x0c, 0x64, 
    0x38, 0x0d, 0xf7, 0x45, 0x0c, 0x64, 0x37, 0x22, 
    0xe8, 0x49, 0x0c, 0x35, 0x4d, 0x32, 0x35, 0x69, 
    0x64, 0x68, 0x36, 0xe3, 0x90, 0x6d, 0x64, 0x68, 
    0x36, 0xe3, 0x36, 0xec, 0x90, 0x71, 0x6c, 0x38, 
    0x18, 0xe3, 0x70, 0x37, 0x03, 0xe3, 0xec, 0x6c, 
    0x37, 0x02, 0xe3, 0xec, 0x70, 0xec, 0x68, 0x36, 
    0xe3, 0xd9, 0x10, 0x6c, 0x38, 0x18, 0xe3, 0x6c, 
    0x37, 0x03, 0xe3, 0xec, 0x70, 0x37, 0x02, 0xe3, 
    0xec, 0x70, 0xec, 0x68, 0x36, 0xe3, 0x36, 0xec, 
    0xd9, 0x10, 0x35, 0x37, 0x22, 0x6a, 0x02, 0x40, 
    0x32, 0x48, 0x36, 0xe3, 0x64, 0x36, 0xe8, 0xec, 
    0x38, 0x0a, 0xe3, 0x37, 0x08, 0xec, 0x64, 0x38, 
    0xfe, 0xe8, 0xec, 0x44, 0x38, 0x28, 0xf4, 0x40, 
    0xec, 0xb9, 0x80, 0x88, 0x42, 0xa6, 0x38, 0x28, 
    0xfc, 0x0a, 0x03, 0x01, 0x05, 0x0a, 0x32, 0x35, 
    0x41, 0x46, 0xa6, 0x38, 0x0d, 0xfc, 0x0a, 0x1a, 
    0x46, 0x3e, 0xab, 0x80, 0x88, 0x38, 0x28, 0xbb, 
    0x80, 0x88, 0x39, 0x01, 0xe0, 0x1d, 0x39, 0x01, 
    0xe0, 0xbb, 0x80, 0x88, 0x39, 0x02, 0x20, 0x38, 
    0x28, 0x19, 0x32, 0x00, 0x78, 0x04, 0x03, 0x00, 
    0x60, 0x04, 0x00, 0x00, 0x6e, 0x04, 0x00, 0x00, 
    0x5c, 0x2a, 0xfe, 0xa0, 0x0a, 0x36, 0xfe, 0xa0, 
    0x15, 0x2d, 0xbe, 0x5c, 0x02, 0x36, 0xfe, 0xe4, 
    0x5c, 0x2a, 0xfe, 0xa0, 0x01, 0x6a, 0x7e, 0x61, 
    0xfc, 0xf6, 0x8d, 0xa0, 0x02, 0x6a, 0x7e, 0x62, 
    0x2c, 0x37, 0xbe, 0xa0, 0x4a, 0xa4, 0xfc, 0x5c, 
    0x03, 0x5d, 0x3e, 0xfc, 0x15, 0x2d, 0xbe, 0x5c, 
    0x09, 0x36, 0xfe, 0xe4, 0xf0, 0xf5, 0x3d, 0x08, 
    0x20, 0x37, 0xbe, 0xa0, 0x45, 0x92, 0xfc, 0x5c, 
    0x36, 0x49, 0xbe, 0xa0, 0x39, 0x39, 0xbe, 0xa0, 
    0x3b, 0x45, 0xbe, 0xa0, 0x01, 0xf0, 0xe9, 0x6c, 
    0x2b, 0xf0, 0x69, 0xec, 0x4a, 0xa4, 0xfc, 0x5c, 
    0x1e, 0xff, 0xbf, 0xa0, 0x80, 0x4b, 0xbe, 0x6c, 
    0x00, 0x4a, 0x7e, 0xfc, 0x38, 0x37, 0xbe, 0xa0, 
    0x21, 0xff, 0xbf, 0xa0, 0x24, 0x4b, 0xbe, 0x04, 
    0xfd, 0x4a, 0xbe, 0x68, 0x06, 0x4a, 0xfe, 0x24, 
    0x25, 0x4d, 0xbe, 0x08, 0x10, 0x4a, 0xfe, 0x28, 
    0x25, 0x47, 0xbc, 0x50, 0x02, 0x48, 0xfe, 0x80, 
    0xfb, 0x4a, 0xbe, 0xa0, 0x80, 0x4b, 0xbe, 0x6c, 
    0x26, 0x4b, 0x3e, 0xfc, 0x1b, 0x36, 0xfe, 0xe4, 
    0x23, 0x49, 0xbe, 0x84, 0x1d, 0xff, 0xbf, 0xa0, 
    0xfb, 0x4a, 0xbe, 0xa0, 0x80, 0x4b, 0xbe, 0x6c, 
    0x00, 0x4a, 0x7e, 0xfc, 0x13, 0x44, 0xfe, 0xe4, 
    0xff, 0xfa, 0xbd, 0x20, 0x27, 0xfb, 0xbd, 0x81, 
    0xff, 0xfa, 0xbd, 0x24, 0x12, 0x00, 0x4c, 0x5c, 
    0x23, 0x49, 0xbe, 0x80, 0x12, 0x38, 0xfe, 0xe4, 
    0x01, 0xf0, 0xe9, 0x6e, 0x01, 0x6a, 0x7e, 0x61, 
    0x1f, 0x37, 0xbe, 0xa0, 0x01, 0x36, 0xd2, 0x80, 
    0x45, 0x92, 0xfc, 0x5c, 0xf0, 0xf3, 0x15, 0x08, 
    0x4a, 0xa4, 0xe4, 0x5c, 0x29, 0xff, 0xa7, 0xa0, 
    0x03, 0x5d, 0x26, 0xfc, 0xfc, 0xf6, 0xa5, 0x6c, 
    0x53, 0xb6, 0xfc, 0x5c, 0x04, 0xaf, 0xfc, 0x50, 
    0x05, 0xb3, 0xfc, 0x50, 0x55, 0xb6, 0xfc, 0x5c, 
    0x53, 0xb6, 0xfc, 0x5c, 0x2a, 0xff, 0x97, 0xa0, 
    0x03, 0x5d, 0x16, 0xfc, 0x08, 0x00, 0x68, 0x5c, 
    0x04, 0x00, 0x7c, 0x5c, 0x4a, 0xa4, 0xfc, 0x5c, 
    0x80, 0x4b, 0xbe, 0x6c, 0x00, 0x4a, 0x7e, 0xfc, 
    0x45, 0x36, 0xfe, 0xe4, 0x00, 0x00, 0x7c, 0x5c, 
    0x01, 0x6a, 0x7e, 0x61, 0xfc, 0xf6, 0xb1, 0x6c, 
    0x30, 0xff, 0xbf, 0xa0, 0xfb, 0x4a, 0xbe, 0xa0, 
    0x2e, 0x4b, 0xbe, 0x6c, 0x32, 0x4b, 0x3e, 0xfc, 
    0x28, 0xff, 0xbf, 0xa0, 0xfb, 0x4a, 0xbe, 0xa0, 
    0x00, 0x00, 0x7c, 0x5c, 0x02, 0xaf, 0xfc, 0x50, 
    0x03, 0xb3, 0xfc, 0x50, 0x2d, 0x37, 0xbe, 0xa0, 
    0x30, 0xff, 0xbf, 0xa0, 0x02, 0x5d, 0x3e, 0xfc, 
    0x31, 0xff, 0xbf, 0xa0, 0x03, 0x5d, 0x3e, 0xfc, 
    0x56, 0x36, 0xfe, 0xe4, 0x00, 0x00, 0x7c, 0x5c, 
    0xf0, 0x2f, 0xbe, 0xa0, 0x33, 0xc1, 0xfc, 0x54, 
    0x0d, 0x30, 0xfe, 0xa0, 0x04, 0x2e, 0xfe, 0x80, 
    0x17, 0x01, 0xbc, 0x08, 0xf5, 0xc0, 0xbc, 0x80, 
    0x5f, 0x30, 0xfe, 0xe4, 0x34, 0x2f, 0xbe, 0xa0, 
    0x08, 0x2e, 0x7e, 0x61, 0x00, 0x31, 0x8e, 0xa0, 
    0x01, 0x31, 0xb2, 0xa0, 0x40, 0x2e, 0x7e, 0x61, 
    0x01, 0x2e, 0xfe, 0x28, 0x03, 0x2e, 0xfe, 0x2c, 
    0x17, 0x31, 0xbe, 0x28, 0x18, 0xfd, 0xbf, 0x50, 
    0x06, 0x2e, 0xfe, 0x28, 0x17, 0xfd, 0xbf, 0x54, 
    0x03, 0x2e, 0xfe, 0x2c, 0xff, 0x30, 0xfe, 0x60, 
    0x17, 0x31, 0xbe, 0x2c, 0x18, 0xed, 0x8f, 0xa0, 
    0x00, 0xee, 0xcf, 0xa0, 0x00, 0xec, 0xf3, 0xa0, 
    0x18, 0xef, 0xb3, 0xa0, 0xe9, 0x66, 0x7e, 0xec, 
    0x16, 0x2b, 0xbe, 0x5c, 0x06, 0xf7, 0xfc, 0x50, 
    0x28, 0xff, 0xfc, 0x54, 0x07, 0x2e, 0xfe, 0xa0, 
    0x01, 0x6a, 0x7e, 0x61, 0x00, 0x30, 0xbe, 0xa0, 
    0x01, 0xf6, 0xfc, 0x80, 0x10, 0x30, 0xce, 0x2c, 
    0x10, 0x30, 0xfe, 0x28, 0x18, 0x01, 0xbc, 0xa0, 
    0xf5, 0xfe, 0xbc, 0x80, 0x7b, 0x2e, 0xfe, 0xe4, 
    0x0d, 0x0d, 0xcd, 0x50, 0x0e, 0x0d, 0xf1, 0x50, 
    0x2f, 0x0d, 0xfd, 0x54, 0x04, 0x2e, 0xfe, 0xa0, 
    0x00, 0x00, 0xbc, 0xa0, 0xf7, 0x0c, 0xbd, 0x80, 
    0x86, 0x2e, 0xfe, 0xe4, 0x00, 0x2e, 0xfe, 0x08, 
    0x01, 0x2e, 0xfe, 0x28, 0xf3, 0x2e, 0x3e, 0x85, 
    0x00, 0x7c, 0xf2, 0xa0, 0x01, 0x2e, 0xfe, 0x28, 
    0x2f, 0x2f, 0x3e, 0x85, 0xe9, 0x00, 0x70, 0x5c, 
    0x16, 0x2b, 0xbe, 0x5c, 0x2f, 0x2f, 0xbe, 0xa0, 
    0xdc, 0xc4, 0xfd, 0x5c, 0x01, 0x6a, 0x7e, 0x61, 
    0x0f, 0xf0, 0xf3, 0x58, 0x0e, 0xf0, 0xcf, 0x58, 
    0x01, 0x30, 0xce, 0x2c, 0x18, 0xf5, 0xbf, 0xa0, 
    0x16, 0x2b, 0xbe, 0x5c, 0x3e, 0x2f, 0xbe, 0xa0, 
    0x00, 0x30, 0xfe, 0xa0, 0xa3, 0x2e, 0x7e, 0xec, 
    0xf3, 0x2e, 0xbe, 0x48, 0xf4, 0x2e, 0xbe, 0x4c, 
    0x0c, 0x30, 0xfe, 0xa0, 0x01, 0x2e, 0xfe, 0x28, 
    0x17, 0xe7, 0x3d, 0x85, 0x01, 0x30, 0xf2, 0x80, 
    0x9f, 0x00, 0x70, 0x5c, 0x18, 0xf3, 0xbf, 0x58, 
    0xdc, 0xc4, 0xfd, 0x5c, 0x18, 0xf7, 0xbf, 0xa0, 
    0x16, 0x2b, 0xbe, 0x5c, 0xa0, 0x2e, 0xfe, 0xa0, 
    0x01, 0x68, 0x7e, 0x61, 0x40, 0x2e, 0xf2, 0x68, 
    0x08, 0x6a, 0x7e, 0x61, 0x10, 0x2e, 0xce, 0x68, 
    0x04, 0x6a, 0x7e, 0x61, 0x08, 0x2e, 0xce, 0x68, 
    0x07, 0x7e, 0xfe, 0x60, 0x3f, 0x2f, 0xbe, 0x68, 
    0x17, 0xfd, 0xbf, 0x58, 0x3a, 0x43, 0xbe, 0xa0, 
    0x08, 0x42, 0xfe, 0x2c, 0x3a, 0x43, 0xbe, 0x68, 
    0x04, 0x42, 0xfe, 0x2c, 0x38, 0x47, 0xbe, 0xa0, 
    0x01, 0x46, 0xfe, 0x2c, 0x38, 0x2f, 0xbe, 0xa0, 
    0x3a, 0x31, 0xbe, 0xa0, 0xe3, 0xd0, 0xfd, 0x5c, 
    0x28, 0x3b, 0xbe, 0xa0, 0x17, 0x3b, 0xbe, 0x84, 
    0x01, 0x3a, 0xfe, 0x29, 0x3c, 0x3d, 0xbe, 0xa0, 
    0x1d, 0x3d, 0xbe, 0xc8, 0x3c, 0x3b, 0xbe, 0x84, 
    0x39, 0x2f, 0xbe, 0xa0, 0x3b, 0x31, 0xbe, 0xa0, 
    0xe3, 0xd0, 0xfd, 0x5c, 0x10, 0x6a, 0x7e, 0x61, 
    0x01, 0xfe, 0xfd, 0x70, 0xfe, 0x4e, 0xbe, 0xa0, 
    0x01, 0x4e, 0xf2, 0x28, 0x01, 0x2e, 0xf2, 0x2c, 
    0x02, 0x6a, 0x7e, 0x61, 0x01, 0x2e, 0xf2, 0x28, 
    0x2b, 0x3f, 0xbe, 0xa0, 0x17, 0x3f, 0xbe, 0x84, 
    0x01, 0x3e, 0xfe, 0x29, 0x3d, 0x41, 0xbe, 0xa4, 
    0x1f, 0x41, 0xbe, 0xc8, 0x3d, 0x3f, 0xbe, 0x80, 
    0x02, 0x6a, 0xfe, 0x6c, 0x16, 0x2b, 0xbe, 0x5c, 
    0x0d, 0x2e, 0xfe, 0xa0, 0xd7, 0x30, 0xbe, 0xa0, 
    0x07, 0x30, 0xfe, 0x28, 0xfc, 0x30, 0xfe, 0x60, 
    0x37, 0x31, 0xbe, 0x80, 0x18, 0x01, 0xbf, 0x08, 
    0xf5, 0xae, 0xbd, 0x80, 0xf6, 0xae, 0xbd, 0x64, 
    0xd3, 0x2e, 0xfe, 0xe4, 0xd1, 0x00, 0x7c, 0x5c, 
    0x00, 0x32, 0xfe, 0x08, 0x21, 0x34, 0xfe, 0xa0, 
    0x19, 0x2f, 0xbe, 0xe1, 0x01, 0x30, 0xfe, 0x34, 
    0x01, 0x2e, 0xfe, 0x2c, 0xde, 0x34, 0xfe, 0xe4, 
    0x00, 0x00, 0x7c, 0x5c, 0x0b, 0x30, 0xfe, 0x2c, 
    0x08, 0x32, 0xfe, 0xa0, 0x01, 0x2e, 0xfe, 0x29, 
    0x18, 0x2f, 0xb2, 0x80, 0xe5, 0x32, 0xfe, 0xe4, 
    0x00, 0x00, 0x7c, 0x5c, 0x00, 0xf0, 0xff, 0xa0, 
    0x00, 0xf2, 0xff, 0xa0, 0x00, 0xfc, 0xff, 0xa0, 
    0xf0, 0xe9, 0x3f, 0x08, 0x00, 0x2e, 0xfe, 0x08, 
    0x08, 0x2e, 0xfe, 0x28, 0x03, 0x2e, 0xfe, 0x48, 
    0xf1, 0x2f, 0xbe, 0x80, 0x00, 0x2e, 0xfe, 0xf8, 
    0x00, 0x00, 0x7c, 0x5c, 0x00, 0x12, 0x7a, 0x00, 
    0x00, 0x20, 0xa1, 0x07, 0x00, 0x02, 0x00, 0x00, 
    0x00, 0x80, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 
    0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0xf0, 0xf0, 0xf0, 0xf0, 0x00, 0x00, 0x06, 0x00, 
    0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 
    0x07, 0x0f, 0x70, 0xf0, 0x77, 0x7f, 0xf7, 0xff, 
    0xa5, 0x56, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 
    0xa5, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0x6a, 
    0xc8, 0x0b, 0x6c, 0x0e, 0xac, 0x04, 0x8e, 0x05, 
    0x1c, 0x07, 0xde, 0x08, 0xf3, 0x00, 0x1e, 0x01, 
    0x0a, 0x00, 0x12, 0x00, 0x06, 0x00, 0x05, 0x00, 
    0x8a, 0x02, 0xaa, 0x02, 0x99, 0x9e, 0x36, 0x00, 
    0xd2, 0xa6, 0x43, 0x00, 0x70, 0x72, 0x02, 0x00, 
    0x50, 0x53, 0x03, 0x00, 0xac, 0x34, 0x04, 0x00, 
    0x8e, 0xf5, 0x04, 0x00, 0xa5, 0xaa, 0x06, 0x50, 
    0xa5, 0xaa, 0x01, 0x54, 0x01, 0x05, 0x02, 0x34, 
    0xc7, 0x0c, 0x64, 0x28, 0x36, 0xec, 0x42, 0x80, 
    0x61, 0x32, 0x40, 0x0a, 0x05, 0x42, 0x98, 0x36, 
    0xed, 0x21, 0x32, 0x00
};

int start_KB_TV(void *prog, void *var, void *stack) {

   // zero the memory used as var and stack space
   memset(var, 0, KB_TV_VAR_SIZE);
   memset(stack, 0, KB_TV_STACK_SIZE);

   // copy the Spin program to the local array, in case it is
   // currently stored in XMM RAM
   memcpy(prog, KB_TV_array, KB_TV_PROG_SIZE);

   // start the Spin program
   return _coginit_Spin(KB_TV_array, var, stack, KB_TV_PROG_OFF, KB_TV_STACK_OFF);

}

