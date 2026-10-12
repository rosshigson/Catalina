#include <string.h>
#include <plugin.h>
#include "crc7.h"
#include "ff.h"

#if !defined(__CATALINA_P2)
#error THIS PROGRAM REQUIRES A PROPELLER 2
#endif
#if !defined(__CATALINA_SD) && !(defined(__CATALINA_libcx)||defined(__CATALINA_libcix))
#error THIS PROGRAM REQUIRES AN SD CARD PLUGIN (-C SD or -lcx or -lcix)
#endif

#define DEBUG_CSD 0 // 1 to print intermediate results
#define DEBUG_CID 0 // 1 to print intermediate results
#define DEBUG_CRC 0 // 1 to print intermediate results

#define CSD_HUB_ADDR 0x20 // the P2 SD card driver puts the CSD here
/*
 * SD_get_kilobytes - return capacity in kb, or 0 if it cannot be determined
 */
unsigned SD_get_kilobytes() {
   unsigned char mem[32];
   unsigned char *ptr;
   Uint64 upper_csd, lower_csd;
   char upper_str[32], lower_str[32];
   uint32_t CSD_STRUCTURE, READ_BL_LEN, C_SIZE_MULT;
   uint32_t MULT, BLOCKNR;
   uint32_t C_SIZE, C_SIZE_UPPER, C_SIZE_LOWER;
   uint32_t CAPACITY;
   int i;
   unsigned char crc;

   // re-initilaize the SD card, to ensure the CSD and CID are up to date
	_long_service(SVC_SD_INIT, (long)0);
   // copy the CSD and CID to our own buffer, before it gets overwritten
   memcpy(mem, (unsigned char *)CSD_HUB_ADDR, 32);
   // check CRC of CSD
   crc = fio_crc7(mem, 15);
   if (mem[15]>>1 == crc) {
#if DEBUG_CRC     
      printf("CRC ok\n\n");
#endif      
   }
   else {
#if DEBUG_CRC     
      printf("CRC failed (got %02X, expected %02X)\n\n", mem[15],crc);
#endif      
      return 0;
   }

   for (i = 0; i < 32; i++) {
#if DEBUG_CSD   
     printf("%02x", mem[i]);
#endif     
     upper_csd = _or64(_shl64(upper_csd, 8), _uint32(mem[i]));
   }
  
   ptr = mem;
   upper_csd = _int64(0,0);
   upper_csd = _int64(0,0);

#if DEBUG_CSD   
   printf("\n\n");
   printf("CSD:   ");
#endif   
   for (i = 0; i < 8; i++) {
#if DEBUG_CSD   
     printf("%02x", *ptr);
#endif     
     upper_csd = _or64(_shl64(upper_csd, 8), _uint32(*ptr));
     ptr++;
   }
   for (i = 0; i < 8; i++) {
#if DEBUG_CSD   
     printf("%02x", *ptr);
#endif     
     lower_csd = _or64(_shl64(lower_csd, 8), _uint32(*ptr));
     ptr++;
   }
#if DEBUG_CSD   
   printf("\n");
#endif     

#if DEBUG_CID   
   printf("\nCID:   ");
   for (i = 0; i < 16; i++) {
     printf("%02x", *ptr++);
   }
   printf("\n\n");
#endif

   CSD_STRUCTURE = _low(_lsr64(upper_csd, 126-64)) & 0x3;

#if DEBUG_CSD
   printf("CSD_STRUCTURE=%d\n", CSD_STRUCTURE);
   LL_HEXSTR(upper_str, upper_csd);
   LL_HEXSTR(lower_str, lower_csd);
   printf("CSD64: %16s%16s\n\n", upper_str, lower_str);
   printf("CSD_STRUCTURE=%d\n", CSD_STRUCTURE);
#endif   

   if (CSD_STRUCTURE == 0) { // => CSD Structure 1.0
      // READ_BL_BL_LEN is [83:80]
      READ_BL_LEN = _low(_lsr64(upper_csd, 83-64)) & 0xF;
#if DEBUG_CSD       
      printf("READ_BL_LEN: %d\n", READ_BL_LEN);
#endif      
      READ_BL_LEN = 1<<(READ_BL_LEN-1);
      // C_SIZE is [73:62]
      C_SIZE_UPPER = _low(upper_csd) & 0x3FF;
      C_SIZE_LOWER = _low(_lsr64(lower_csd, 62)) & 0x3;
      C_SIZE = (C_SIZE_UPPER<<2)|C_SIZE_LOWER;
#if DEBUG_CSD       
      printf("C_SIZE_UPPER: %d\n", C_SIZE_UPPER);
      printf("C_SIZE_LOWER: %d\n", C_SIZE_LOWER);
#endif      
      // C_SIZE_MULT is [49:47]
      C_SIZE_MULT = _low(_lsr64(lower_csd, 47)) & 0x7;
      MULT = 1<<(C_SIZE_MULT+2);
      BLOCKNR = (C_SIZE + 1)*MULT;
#if DEBUG_CSD       
      printf("READ_BL_LEN: %d\n", READ_BL_LEN);
      printf("C_SIZE=%d\n", C_SIZE);
      printf("C_SIZE_MULT=%d\n", C_SIZE_MULT);
      printf("MULT= %d\n", MULT);
      printf("BLOCKNR= %d\n", BLOCKNR);
#endif
      CAPACITY = BLOCKNR*READ_BL_LEN/1024;
   }
   else if (CSD_STRUCTURE == 1) {  // => CSD Structure 2.0
      // C_SIZE is [69:48]
      C_SIZE_UPPER  = _low(upper_csd) & 0x3F;
      C_SIZE_LOWER = _low(_lsr64(lower_csd, 48)) & 0xFFFF;
      C_SIZE = (C_SIZE_UPPER<<16)|C_SIZE_LOWER;
#if DEBUG_CSD       
      printf("C_SIZE=%d\n", C_SIZE);
#endif
      CAPACITY = (C_SIZE+1)*512;
   }

   else if (CSD_STRUCTURE == 2) {  // => CSD Structure 3.0
      // C_SIZE is [69:48]
      C_SIZE_UPPER  = _low(upper_csd) & 0x1FF;
      C_SIZE_LOWER = _low(_lsr64(lower_csd, 48)) & 0x7FFFF;
      C_SIZE = (C_SIZE_UPPER<<16)|C_SIZE_LOWER;
#if DEBUG_CSD       
      printf("C_SIZE=%d\n", C_SIZE);
#endif
      CAPACITY = (C_SIZE+1)*512;
   }
   else {
      CAPACITY = 0;
   }
   return CAPACITY;
}

