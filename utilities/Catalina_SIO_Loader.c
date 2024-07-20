#include <prop.h>
#include <prop2.h>
#include <cog.h>
#include <serial2.h>

#if defined(__CATALINA_HYPER) || defined(__CATALINA_libhyper)
#include <hyper.h>
#define xmm_read hyper_read
#define xmm_write hyper_write
#define xmm_getresult hyper_write
#else
#include <psram.h>
#define xmm_read psram_read
#define xmm_write psram_write
#define xmm_getresult psram_write
#endif

/*
 * Simple serial XMM load program for the Propeller 2. This program currently 
 * only loads PSRAM (e.g. on the P2_EDGE) or Hyper RAM (e.g. on the P2_EVAL or
 * P2_EDGE). It loads the first 64kb received into Hub RAM and the remainder 
 * of the data into XMM RAM. Then it restarts the Propeller from location 0, 
 * assuming that what it loaded into Hub RAM is a program that knows how to 
 * execute the program it loaded into XMM RAM.
 *
 * The program must load the 2 port serial and PSRAM or Hyper RAM drivers. 
 * Also, it cannot use a serial HMI, so it must either use a non-serial HMI 
 * option or NO_HMI. 
 * Finally, it must execute above the first 64kb, which it will overwrite. 
 *
 * Therefore it must be compiled using a command such as:
 *
 *  catalina Catalina_SIO_Loader.c -p2 -lci -lserial2 -lpsram -R$10000 -C NO_HMI
 * or
 *
 *  catalina Catalina_SIO_Loader.c -p2 -lci -lserial2 -lhyper -R$10000 -C NO_HMI
 *
 * Note that the use of the -R parameter makes the binaries larger than 
 * necessary, but payload skips downloading any null sectors, so this does 
 * not impact on actual load times. 
 *
 * Typically, this program is built using the 'build_utilities' batch
 * file, which knows how to build it for all supported platforms. 
 *
 * The compiled version of this program is usually called XMM.bin and 
 * saved in the Catalina bin directory.
 *
 */

// the following all require a non-serial HMI option ...
//#define PSRAM_VERIFY     // define this to verify all PSRAM writes
//#define DIAGNOSE         // print diagnostics
//#define CONFIRM_REBOOT   // ask before rebooting

#define SECTOR_SIZE        0x0200 // size of packets (also size of prologue)

#define PROLOGUE_OFFS      0x1000 // used to reconstruct short layout 2
#define PROLOGUE_SIZE      0x0200 // should be one sector

#define LAYOUT_OFFS        0x10   // offset within prologue sector

#define DEFAULT_PORT       0      // serial port to use           
#define DEFAULT_CPU        1      // only the default cpu is supported
#define DEFAULT_ATTEMPTS   5
#define DEFAULT_SYNCTIME   100    // milliseconds

#define INTERCHAR_DELAY    0      // milliseconds
#define INTERPAGE_DELAY    0      // milliseconds

#define SIO_EOP            0x00FFFFFE

static int port         = DEFAULT_PORT;
static int cpu          = DEFAULT_CPU;
static int max_attempts = DEFAULT_ATTEMPTS;
static int synctime     = DEFAULT_SYNCTIME;

// use the 2 port serial plugin to send and receive serial data ...

int SendByte(int port, unsigned char ch) {
  return s2_tx(port, ch);
}

int ReceiveByte(int port) {
  return s2_rx(port);
}
void Flush(int port) {
   s2_txflush(port);
}

// the cat_XXXXX functions must match those used by payload - they implement
// byte stuffing, packet sync, LRC checks and also multi-cpu support (which
// is not currently used) ...

void cat_WriteByte(int port, unsigned char b) {
#ifdef DIAGNOSE
      t_printf("Sending byte 0x%x\n", b);
#endif
   if (b == 0xff) {
      SendByte(port, b);
      SendByte(port, 0);
   }
   else {
      SendByte(port, b);
   }
}

void cat_WriteLong(int port, unsigned long l) {
   int i;

   for (i = 0; i < 4; i++) {
      cat_WriteByte(port, l & 0xff);
      l >>= 8;
   }
   Flush(port);
}

void cat_WriteSync(int port, int cpu) {
   SendByte(port, 0xff);
   SendByte(port, cpu);
   Flush(port);
}

void cat_WritePage(int port, unsigned char *page, unsigned long addr, int cpu) {
   int i;

#ifdef DIAGNOSE
   t_printf("Sending page %lx\n", addr);
#endif
   cat_WriteLong(port, (cpu << 24) | addr);
   cat_WriteLong(port, SECTOR_SIZE);
   for (i = 0; i < SECTOR_SIZE; i++) {
      cat_WriteByte(port, page[i]);
      if (INTERCHAR_DELAY > 0) {
         _waitms(INTERCHAR_DELAY);
      }
   }
   Flush(port);
}

int cat_ReadByte(int port, int cpu) {
   int result;
   int i;

   static int save_data = 0;

   if (save_data & 0x100) {
      if (save_data != 0x1ff) {
        result = save_data & 0xff;
        save_data = 0;
#ifdef DIAGNOSE
        t_printf("Read byte 0x%x\n", result);
#endif
        return result;
      }
   }
   
   while (1) {
      for (i = 0; i < 5; i++) {
         result = ReceiveByte(port);
#ifdef DIAGNOSE
         t_printf("Read result %d\n", result);
#endif
         if (result != -1) {
            break;
         }
      }
      if (result < 0) {
#ifdef DIAGNOSE
         t_printf("Read result %d\n", result);
#endif
         return result;
      }
      if (save_data == 0x1ff) {
        if (result == cpu) {
#ifdef DIAGNOSE
           t_printf("Read sync for cpu %d\n", cpu);
#endif
           return -2;
        }
        if (result == 0) {
           result = 0xff;
           save_data = 0;
        }
        else {
           save_data = result | 0x100;
           result = 0xff;
        }
#ifdef DIAGNOSE
        t_printf("Read byte 0x%x\n", result);
#endif
        return result;
      }
      else {
         if (result == 0xff) {
            save_data = 0x1ff;
         }
         else {
            save_data = 0;
#ifdef DIAGNOSE
            t_printf("Read byte 0x%x\n", result);
#endif
            return result;
         }
      }
   }
   return result;
}

void cat_ReadLong(int port, unsigned long *l) {
   int i;
   unsigned char byte[4];
   int cpu;

   for (i = 0; i < 4; i++) {
      byte[i] = cat_ReadByte(port, cpu);
   }
   *l = (unsigned long)byte[0]
      | (unsigned long)byte[1]<<8
      | (unsigned long)byte[2]<<16
      | (unsigned long)byte[3]<<24;
}

int cat_ReadSync(int port, int cpu) {
   int result;
   int retries;
   retries = 0;
   while (1) {
      result = ReceiveByte(port);
      //if (result < 0) {
         //return result;
      //}
      if (result == 0xff) {
         result = ReceiveByte(port);
         if (result == cpu) {
            return 1;
         }
      }
      retries++;
      if (retries > max_attempts) {
         return 0;
      }
      if (synctime > 0) {
         _waitms (synctime);
      }
   }
   return result;
}

int cat_ReadPage(int port, unsigned char *page, unsigned long *addr, int *cpu) {
   int i;
   int byte;
   unsigned long cpu_addr;
   unsigned long size;

   size = 0;
   cat_ReadLong(port, &cpu_addr);
   *cpu  = cpu_addr>>24;
   *addr = cpu_addr &0xFFFFFF;
   

   if (*addr == SIO_EOP) {
#ifdef DIAGNOSE
      t_printf("Received EOP\n");
#endif
      return 0; // end of pages 
   }

   cat_ReadLong(port, &size);

   for (i = 0; i < size; i++) {
      byte = cat_ReadByte(port, *cpu);
      if (INTERCHAR_DELAY > 0) {
         _waitms(INTERCHAR_DELAY);
      }
      if (i < SECTOR_SIZE) {
         page[i] = byte;
      }
   }
#ifdef DIAGNOSE
   t_printf("Received page 0x%x\n", *addr);
#endif
   if (size > SECTOR_SIZE) {
      return SECTOR_SIZE;
   }
   else {
      return size;
   }
}

unsigned char cat_LRC(unsigned char *buffer, int size) {
   int i;
   unsigned char result = 0;

   for (i = 0; i < size; i++) {
      result ^= buffer[i];
   }
   return result;
}


void main() {

   int i;
   unsigned char buff1[SECTOR_SIZE];
#ifdef PSRAM_VERIFY
   unsigned char buff2[SECTOR_SIZE];
#endif
   int read_cpu;
   unsigned long addr;
   unsigned long corr;
   unsigned char lrc;
   unsigned char byte;
   int size;
   int result;
   char *xmm_addr;
   int seglayout;

   corr = 0;

   // zero the area of Hub RAM used by the loader embedded in the XMM
   // program, because payload does not send any null sectors but the 
   // loader code may be expecting these locations to be initialized
   memset((void *)0, 0, P2_LOAD_SIZE);

   cat_ReadSync(port, cpu);
   while(1) {
      for (i = 0; i < SECTOR_SIZE; i++) {
         buff1[i] = 0;
      }
      size = cat_ReadPage(port, buff1, &addr, &read_cpu);
      if (size > 0) {
         if (read_cpu == cpu) {
            cat_WriteSync(port, cpu);
            lrc = cat_LRC(buff1, SECTOR_SIZE);
            cat_WriteByte(port, lrc);
            if (addr < P2_LOAD_SIZE) {
               // write page to Hub RAM
               memcpy((char *)addr, buff1, SECTOR_SIZE);
            }
            else {
               if (addr == P2_LOAD_SIZE) {
                  seglayout = (unsigned long)buff1[LAYOUT_OFFS+0]
                            | (unsigned long)buff1[LAYOUT_OFFS+1]<<8
                            | (unsigned long)buff1[LAYOUT_OFFS+2]<<16
                            | (unsigned long)buff1[LAYOUT_OFFS+3]<<24;
               }
               // write page to XMM RAM
               xmm_addr = (char *)(addr + corr - P2_LOAD_SIZE);
               if ((result = xmm_write(buff1, xmm_addr, SECTOR_SIZE) < 0)) {
#ifdef DIAGNOSE
                  t_printf("xmm write error: %d\n", result);
#endif
                  exit(1);
               }
#ifdef PSRAM_VERIFY
               if ((result = xmm_read(buff2, xmm_addr, SECTOR_SIZE) < 0)) {
#ifdef DIAGNOSE
                  t_printf("xmm read error: %d\n", result);
#endif
                  //exit(1);
               }
               if (strncmp(buff1, buff2, SECTOR_SIZE) != 0) {
#ifdef DIAGNOSE
                  t_printf("xmm compare error: %d\n", result);
#endif
                  //exit(1);
               }
#endif
               // after writing prologue, correct for bytes omitted in layout 2
               if (seglayout == 2) {
                  corr = PROLOGUE_OFFS;
               }
            }
         }
      }
      else {
         break; // done
      }
   }
   //xmm_getResult(0);

#ifdef CONFIRM_REBOOT
   printf("Press a key to reboot\n");
   k_wait();
#endif

   // now reboot cog 0 from address 0 with parameter 0!
   _coginit(0, 0, 0);

   // the following will never be executed if we are cog 0, or we 
   // are stopped by cog 0 reloadng this cog before we get a chance 
   // (which is ok!)
   _cogstop(_cogid()); 

}
