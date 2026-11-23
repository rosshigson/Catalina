/*-------------------------------------------------------------------------
 *  FatFs Interface to either the SD or SD2 plugin - the SD2 plugin is
 *  assumed if the Catalina symbol SD2 is defined, otherwise the SD plugin
 *  is assumed and functions not supported (e.g. the IOCTL functions) are
 *  simulated or ignored.
 *-------------------------------------------------------------------------
 */
#include "ff.h"      /* Basic definitions of FatFs */
#include "sd2_cat.h"
#include <int64.h>
#include <stdio.h>
#include <string.h>

/*-------------------------------------------------------------------------*/
/* Platform dependent macros and functions needed to be modified           */
/*-------------------------------------------------------------------------*/

#include <propeller.h>
#include <sd.h>

#ifdef __CATALINA_P2
#include <propeller2.h>
#include <plugin.h>
#else
#error THIS PROGRAM REQUIRES A PROPELLER 2
#endif

#define SCRATCH_BUFF 0x20 // scratch buffer (>=18 bytes, also used for CSD)

#define DECODE_CSD 0 // 1 to fully decode CSD
#define DEBUG_CSD  0 // 1 to print intermediate results
#define DEBUG_CRC  0 // 1 to print intermediate results

#define DEBUG_WRITESECTOR 0
#define DEBUG_READSECTOR 0
#define DEBUG_IOCTL 0

#if DEBUG_CSD || DEBUG_CRC || DEBUG_WRITESECTOR || DEBUG_READSECTOR
#include <stdio.h>
#include <hmi.h>
#endif

#define READ_RETRIES 10  // only used if using SD plugin, not SD2
#define WRITE_RETRIES 10 // only used if using SD plugin, not SD2

#if DEBUG_READSECTOR || DEBUG_WRITESECTOR
static char xdigit(int i) {
   if (i >= 10) {
      return i - 10 + 'A';
   }
   else {
      return i + '0';
   }
}

static void press_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
}
#endif

/* Table for CRC-7 (polynomial x^7 + x^3 + 1) */
const unsigned char crc7_syndrome_table[256] = {
	0x00, 0x09, 0x12, 0x1b, 0x24, 0x2d, 0x36, 0x3f,
	0x48, 0x41, 0x5a, 0x53, 0x6c, 0x65, 0x7e, 0x77,
	0x19, 0x10, 0x0b, 0x02, 0x3d, 0x34, 0x2f, 0x26,
	0x51, 0x58, 0x43, 0x4a, 0x75, 0x7c, 0x67, 0x6e,
	0x32, 0x3b, 0x20, 0x29, 0x16, 0x1f, 0x04, 0x0d,
	0x7a, 0x73, 0x68, 0x61, 0x5e, 0x57, 0x4c, 0x45,
	0x2b, 0x22, 0x39, 0x30, 0x0f, 0x06, 0x1d, 0x14,
	0x63, 0x6a, 0x71, 0x78, 0x47, 0x4e, 0x55, 0x5c,
	0x64, 0x6d, 0x76, 0x7f, 0x40, 0x49, 0x52, 0x5b,
	0x2c, 0x25, 0x3e, 0x37, 0x08, 0x01, 0x1a, 0x13,
	0x7d, 0x74, 0x6f, 0x66, 0x59, 0x50, 0x4b, 0x42,
	0x35, 0x3c, 0x27, 0x2e, 0x11, 0x18, 0x03, 0x0a,
	0x56, 0x5f, 0x44, 0x4d, 0x72, 0x7b, 0x60, 0x69,
	0x1e, 0x17, 0x0c, 0x05, 0x3a, 0x33, 0x28, 0x21,
	0x4f, 0x46, 0x5d, 0x54, 0x6b, 0x62, 0x79, 0x70,
	0x07, 0x0e, 0x15, 0x1c, 0x23, 0x2a, 0x31, 0x38,
	0x41, 0x48, 0x53, 0x5a, 0x65, 0x6c, 0x77, 0x7e,
	0x09, 0x00, 0x1b, 0x12, 0x2d, 0x24, 0x3f, 0x36,
	0x58, 0x51, 0x4a, 0x43, 0x7c, 0x75, 0x6e, 0x67,
	0x10, 0x19, 0x02, 0x0b, 0x34, 0x3d, 0x26, 0x2f,
	0x73, 0x7a, 0x61, 0x68, 0x57, 0x5e, 0x45, 0x4c,
	0x3b, 0x32, 0x29, 0x20, 0x1f, 0x16, 0x0d, 0x04,
	0x6a, 0x63, 0x78, 0x71, 0x4e, 0x47, 0x5c, 0x55,
	0x22, 0x2b, 0x30, 0x39, 0x06, 0x0f, 0x14, 0x1d,
	0x25, 0x2c, 0x37, 0x3e, 0x01, 0x08, 0x13, 0x1a,
	0x6d, 0x64, 0x7f, 0x76, 0x49, 0x40, 0x5b, 0x52,
	0x3c, 0x35, 0x2e, 0x27, 0x18, 0x11, 0x0a, 0x03,
	0x74, 0x7d, 0x66, 0x6f, 0x50, 0x59, 0x42, 0x4b,
	0x17, 0x1e, 0x05, 0x0c, 0x33, 0x3a, 0x21, 0x28,
	0x5f, 0x56, 0x4d, 0x44, 0x7b, 0x72, 0x69, 0x60,
	0x0e, 0x07, 0x1c, 0x15, 0x2a, 0x23, 0x38, 0x31,
	0x46, 0x4f, 0x54, 0x5d, 0x62, 0x6b, 0x70, 0x79
};

static unsigned char crc7_byte(unsigned char crc, unsigned char data)
{
	return crc7_syndrome_table[(crc << 1) ^ data];
}


unsigned char fio_crc7(const unsigned char *buffer, unsigned int len)
{
	unsigned char crc = 0;

	while (len--)
		crc = crc7_byte(crc, *buffer++);
	return crc;
}

/*
 * SD_get_kilobytes - return capacity in kb, or 0 if it cannot be determined
 */
unsigned SD_get_kilobytes() {
   unsigned char mem[16];
   unsigned char *ptr;
   Uint64 upper_csd, lower_csd;
   uint32_t CSD_STRUCTURE, READ_BL_LEN, C_SIZE_MULT;
   uint32_t MULT, BLOCKNR;
   uint32_t C_SIZE, C_SIZE_UPPER, C_SIZE_LOWER;
   uint32_t CAPACITY;
   int i;
   unsigned char crc;
   DWORD sector_count;
   unsigned char *CSD = (unsigned char *)SCRATCH_BUFF;
   DRESULT res;

   DSTATUS result = SD_disk_initialize();

   if ((result & STA_NOINIT) == STA_NOINIT) {
     return 0;
   }

   // first, use GET_SECTOR_COUNT to get size in kilobytes
   res = SD_disk_ioctl(GET_SECTOR_COUNT, (BYTE *)&sector_count);

#if DECODE_CSD

   // next, decode the CSD to get card size in kilobytes
   res = SD_disk_ioctl(MMC_GET_CSD, (BYTE *)CSD);

#else

   // we are not decoding the CSD, so we are done
   if (res == RES_OK) {
     return sector_count/2;
   }
   else {
     return 0;
   }

#endif

#if DECODE_CSD

   // we need to decode the CSD, so convert it to an Int64
   for (i = 0; i < 16; i++) {
     upper_csd = _or64(_shl64(upper_csd, 8), _uint32(CSD[i]));
   }
  
   ptr = CSD;
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

   // check CRC of CSD
   crc = fio_crc7(CSD, 15);
   if (CSD[15]>>1 == crc) {
#if DEBUG_CRC     
      printf("CRC ok\n\n");
#endif      
   }
   else {
#if DEBUG_CRC     
      printf("CRC failed (got %02X, expected %02X)\n\n", CSD[15], crc);
#endif      
      return 0;
   }

   CSD_STRUCTURE = _low(_lsr64(upper_csd, 126-64)) & 0x3;

#if DEBUG_CSD
   char upper_str[32], lower_str[32];
   printf("CSD_STRUCTURE=%lu\n", CSD_STRUCTURE);
   LL_HEXSTR(upper_str, upper_csd);
   LL_HEXSTR(lower_str, lower_csd);
   printf("CSD64: %16s%16s\n\n", upper_str, lower_str);
#endif   

   if (CSD_STRUCTURE == 0) { // => CSD Structure 1.0
      // READ_BL_BL_LEN is [83:80]
      READ_BL_LEN = _low(_lsr64(upper_csd, 83-64)) & 0xF;
#if DEBUG_CSD       
      printf("READ_BL_LEN: %lu\n", READ_BL_LEN);
#endif      
      READ_BL_LEN = 1<<(READ_BL_LEN-1);
      // C_SIZE is [73:62]
      C_SIZE_UPPER = _low(upper_csd) & 0x3FF;
      C_SIZE_LOWER = _low(_lsr64(lower_csd, 62)) & 0x3;
      C_SIZE = (C_SIZE_UPPER<<2)|C_SIZE_LOWER;
#if DEBUG_CSD       
      printf("C_SIZE_UPPER: %lu\n", C_SIZE_UPPER);
      printf("C_SIZE_LOWER: %lu\n", C_SIZE_LOWER);
#endif      
      // C_SIZE_MULT is [49:47]
      C_SIZE_MULT = _low(_lsr64(lower_csd, 47)) & 0x7;
      MULT = 1<<(C_SIZE_MULT+2);
      BLOCKNR = (C_SIZE + 1)*MULT;
#if DEBUG_CSD       
      printf("READ_BL_LEN: %lu\n", READ_BL_LEN);
      printf("C_SIZE=%lu\n", C_SIZE);
      printf("C_SIZE_MULT=%lu\n", C_SIZE_MULT);
      printf("MULT= %lu\n", MULT);
      printf("BLOCKNR= %lu\n", BLOCKNR);
#endif
      CAPACITY = BLOCKNR*READ_BL_LEN/1024;
   }
   else if (CSD_STRUCTURE == 1) {  // => CSD Structure 2.0
      // C_SIZE is [69:48]
      C_SIZE_UPPER  = _low(upper_csd) & 0x3F;
      C_SIZE_LOWER = _low(_lsr64(lower_csd, 48)) & 0xFFFF;
      C_SIZE = (C_SIZE_UPPER<<16)|C_SIZE_LOWER;
#if DEBUG_CSD       
      printf("C_SIZE=%lu\n", C_SIZE);
#endif
      CAPACITY = (C_SIZE+1)*512;
   }

   else if (CSD_STRUCTURE == 2) {  // => CSD Structure 3.0
      // C_SIZE is [75:48]
      C_SIZE_UPPER  = _low(upper_csd) & 0xFFF;
      C_SIZE_LOWER = _low(_lsr64(lower_csd, 48)) & 0xFFFF;
      C_SIZE = (C_SIZE_UPPER<<16)|C_SIZE_LOWER;
#if DEBUG_CSD       
      printf("C_SIZE=%lu\n", C_SIZE);
#endif
      CAPACITY = (C_SIZE+1)*512;
   }
   else {
      CAPACITY = 0;
   }

#if DECODE_CSD && DEBUG_CSD
   if (CAPACITY != sector_count/2) {
      printf("CAPACITY mismatch=%lu vs %lu\n", CAPACITY, sector_count/2);
   }
#endif
   return CAPACITY;

#endif // DECODE_CSD
}

/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

DSTATUS SD_disk_status (void) {
  int res;

  res = _short_service(SVC_SD_IOCTL, MMC_GET_SDSTAT);

  return (DSTATUS)res;
}

/*-----------------------------------------------------------------------*/
/* Initialize Disk                                                       */
/*-----------------------------------------------------------------------*/

DSTATUS SD_disk_initialize (void) {
  int res;

  // pass address of scratch/CSD buffer
  res = _long_service_2(SVC_SD_INIT, SCRATCH_BUFF, 0); 
  return (DSTATUS)res;
}

/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT SD_disk_read (
  BYTE *buff,      /* Pointer to the data buffer to store read data */
  LBA_t blkadr,    /* Start block number (LBA) */
  UINT count       /* Sector count */
) {
  DWORD  blknum = _low(blkadr);
  int res, k;

#if DEBUG_READSECTOR
  printf("READ SECTOR %lu\n", blknum);
#endif  

  if (_high(blkadr) != 0) {
    return RES_PARERR; // cannot do it!
  }


  // bit 24 is used to indicate a count is specified (otherwise 1 is assumed)
  res = _long_service_3(SVC_SD_READ, (long)buff|0x1000000, (long)blknum, (long)count);
#if DEBUG_READSECTOR
  t_string(1, "\nReadSector ");
  t_integer(1, blknum);
  t_string(1, "\n");
  for (k = 0; k < count*SECTOR_SIZE; k++) {
     t_char(1, xdigit((buff[k]>>4) & 0xf));
     t_char(1, xdigit(buff[k] & 0xf));
     if (((k+1)&0x1f) == 0) {
        t_char(1, '\n'); // 32 entries, then newline
     }
     else {
        t_char(1, ' ');
     }
  }
  t_char(1, '\n');
  press_to_continue();
#endif

  return (DRESULT)res;
}

/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

DRESULT SD_disk_write (
  const BYTE *buff,  /* Pointer to the data to be written */
  LBA_t blkadr,      /* Start block number (LBA) */
  UINT count         /* Sector count */
) {
  DWORD  blknum = _low(blkadr);
  int res, k;

#if DEBUG_WRITESECTOR
  printf("WRITE SECTOR %lu\n", blknum);
#endif  

  if (_high(blkadr) != 0) {
    return RES_PARERR; // cannot do it!
  }

  // bit 24 is used to indicate a count is specified (otherwise 1 is assumed)
  res = _long_service_3(SVC_SD_WRITE, (long)buff|0x1000000, (long)blknum, (long)count);
#if DEBUG_WRITESECTOR
  if (res == 0) {
    printf("WRITE OK, SECTOR %lu\n", blknum);
    t_string(1, "\nWriteSector ");
    t_integer(1, blknum);
    t_string(1, "\n");
    for (k = 0; k < count*SECTOR_SIZE; k++) {
      t_char(1, xdigit((buff[k]>>4) & 0xf));
      t_char(1, xdigit(buff[k] & 0xf));
      if (((k+1)&0x1f) == 0) {
        t_char(1, '\n'); // 32 entries, then newline
      }
      else {
        t_char(1, ' ');
      }
    }
    t_char(1, '\n');
    press_to_continue();
  }
#endif

  return (DRESULT)res;
}

/*-----------------------------------------------------------------------*/
/* Perform an IOCTL function                                             */
/*-----------------------------------------------------------------------*/

DRESULT SD_disk_ioctl (
  UINT ctrl,    /* Control code */
  BYTE *buff    /* Buffer to send/receive control data */
) {
  int res;

#if DEBUG_IOCTL
  printf("IOCTL CODE=%d\n", ctrl);
#endif

  res = _short_service(SVC_SD_IOCTL, ctrl);

  if (res >= 128) {
#if FF_LBA64
   QWORD qres = _int64(0, res);
   *(QWORD *)(buff) = qres;
   res = RES_OK;
#if DEBUG_IOCTL
   printf("IOCTL VALUE=(%ld,%ld)\n", _high(qres), _low(qres));
#endif         
#else
   *(DWORD *)(buff) = res;
   res = RES_OK;
#if DEBUG_IOCTL
   printf("IOCTL VALUE=%ld\n", maxlba);
#endif         
#endif           
  }
#if DEBUG_IOCTL
  printf("IOCTL RESULT=%d\n", res);
#endif

  return (DRESULT)res;
}


//
// new routine: deinitialize (clean up pins, if necessary)
//
DSTATUS SD_disk_deinitialize( void ) {
  int res;

  res = _short_service(SVC_SD_STOPIO, 0);
  return (DSTATUS)res;
}

