/******************************************************************************
 *                                                                            *
 *              Catalina Secondary Loader Example Program                     *
 *                                                                            *
 * This program demonstrates a Catalina secondary loader implemented in C.    *
 * It accepts, acknowledges and decodes the packets sent by the payload       *
 * loader when loading second and subsequent files specified on the command   *
 * line (the first file uses the Parallax protocol, unless the payload -x     *
 * option is specified) but it does nothing with the packets.                 *
 *                                                                            *
 * To see the diagnostic messages generated from this program, you must use a *
 * non-serial HMI option, such as VGA or TV. If you do not have a non-serial  *
 * HMI option, you should instead specify NO_HMI                              *
 *                                                                            *
 * You can load any binary file as the second file to be loaded, but the      *
 * examples below use the same binary for both the first and second file.     * 
 *                                                                            *
 * On the Propeller 1, you must use the tty256 plugin (not the tty one,       *
 * because it does not have a large enough buffer), so compile this program   *
 * with a command like:                                                       *
 *                                                                            *
 *    catalina loader.c -lci -ltty256 -C VGA                                  *
 * or                                                                         *
 *    catalina loader.c -lci -ltty256 -C NO_HMI                               *
 *                                                                            *
 * Then test it using a payload command like:                                 *
 *                                                                            *
 *    payload loader.binary loader.binary -d                                  *
 *                                                                            *
 * The -d option to payload causes it to display progress messages, such as   *
 * the address of each packet as it is sent.                                  *
 *                                                                            *
 * On the Propeller 2, you can use the 2-port serial library, so compile      *
 * this program with a command like:                                          *
 *                                                                            *
 *    catalina -p2 loader.c -lci -lserial2 -C VGA                             *
 * or                                                                         *
 *    catalina -p2 loader.c -lci -lserial2 -C NO_HMI                          *
 *                                                                            *
 * Then test it using a payload command like:                                 *
 *                                                                            *
 *    payload loader.bin loader.bin -d                                        *
 *                                                                            *
 ******************************************************************************/

#include <stdio.h>
#include <stdint.h>
#include <hmi.h>

#define CPU             1             // Payload defaults to CPU 1
#define TIMEOUT         1000          // read timeout (milliseconds)
#define MAX_SIZE        512           // Payload uses a 512 byte packet size
#define SIO_EOP         0x00FFFFFE    // end of packets marker

#ifdef __CATALINA_P2
// On the Propeller 2, we can use the 2-port serial plugin
#include <serial2.h>
#define PORT 0
#define tx(ch)        s2_tx(PORT, ch)
#define rx(timeout)   s2_rxtime(PORT, timeout);
#else
// On the Propeller 1, we must use the tty256 plugin
#include <tty.h>
#define tx(ch)        tty_tx(ch)
#define rx(timeout)   tty_rxtime(timeout);
#endif

int diagnose = 1;      // 0 = no diagnostics, increment for more diagnostics

// ReadByte - read a byte, unstuffing if necessary
//            returns 0 .. 0xFF on success, -1 on timeout, -2 on sync
int ReadByte(int cpu) {
   int result = -1;
   int i;

   static int save_data = 0;

   if (save_data & 0x100) {
      if (save_data != 0x1ff) {
        result = save_data & 0xff;
        save_data = 0;
        if (diagnose > 1) {
           printf("Read byte 0x%02x\n", result);
        }
        return result;
      }
   }
   
   while (1) {
      for (i = 0; i < 5; i++) {
         result = rx(TIMEOUT);
         if (diagnose > 2) {
            printf("Read result %d\n", result);
         }
         if (result != -1) {
            break;
         }
      }
      if (result < 0) {
         if (diagnose > 0) {
            printf("Read result %d\n", result);
         }
         return result;
      }
      if (save_data == 0x1ff) {
        if (result == cpu) {
           if (diagnose > 1) {
              printf("Read sync for cpu %d\n", cpu);
           }
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
        if (diagnose > 1) {
           printf("[%02x] ", result);
        }
        return result;
      }
      else {
         if (result == 0xff) {
            save_data = 0x1ff;
         }
         else {
            save_data = 0;
            if (diagnose > 1) {
               printf("[%02x] ", result);
            }
            return result;
         }
      }
   }
   return result;
}

// ReadSync - returns 1 when sync signal read (note no unstuffing!)
int ReadSync(int cpu) {
   int result = 0;

   while (1) {
      result = rx(TIMEOUT);
      //if (result < 0) {
         //return result;
      //}
      if (result == 0xff) {
         result = rx(TIMEOUT);
         if (result == cpu) {
            return 1;
         }
      }
   }
   return result;
}

// WriteSync - write a sync (note no stuffing!)
void WriteSync(uint8_t cpu) {
   tx(0xff);
   tx(cpu);
}

// ReadLong - read a long value, unstuffing if necessary
//            updates long value l
//            returns 1 on success, -1 on timeout, -2 on sync
int ReadLong(uint32_t *l) {
   int i;
   int b;
   uint32_t tmp = 0;

   for (i = 0; i < 4; i++) {
      b = ReadByte(CPU);
      if (b < 0) {
         return b;
      }
      else {
         tmp |= (b & 0xFF) << (i * 8);
      }
   }
   *l = tmp;
   return 1;
}

// WriteByte - write a byte value, stuffing if necessary
void WriteByte(uint8_t b) {
   if (diagnose > 1) {
      printf("<0x%02x> ", b);
   }
   if (b == 0xff) {
      tx(b);
      tx(0);
   }
   else {
      tx(b);
   }
}

// WriteLong - write a long value, stuffing if necessary
void WriteLong(unsigned long l) {
   int i;

   for (i = 0; i < 4; i++) {
      WriteByte(l & 0xff);
      l >>= 8;
   }
}

// WritePacket - write a packet, stuffing if necessary
void WritePacket(uint8_t *buff, uint32_t addr, int size, uint8_t cpu) {
   int i;

   if (diagnose > 1) {
      printf("Sending Packet %08lX\n", addr);
   }
   WriteLong((cpu << 24) | addr);
   WriteLong(size);
   for (i = 0; i < size; i++) {
      WriteByte(buff[i]);
   }
}


// ReadPacket - read a packet, unstuffing if necessary
//              updates values in buff, addr, size and cpu
//              returns cpu on success, 0 on wrong cpu, -1 on other error
int ReadPacket(uint8_t *buff, uint32_t *addr, uint32_t *size, uint8_t *cpu) {
   uint32_t cpu_addr = 0;
   int b;
   int i;

   if (diagnose > 1) {
      printf("Receiving Packet\n");
   }
   ReadLong(&cpu_addr);
   *addr = cpu_addr & 0xFFFFFF;
   *cpu = cpu_addr >> 24;
   ReadLong(size);
   if (diagnose > 1) {
      printf("CPU %d, addr %08lX, size %d\n", *cpu, *addr, *size);
   }
   for (i = 0; i < *size; i++) {
      b = ReadByte(CPU);
      if (b < 0) {
         return -1;
      }
      if (i < MAX_SIZE) {
        buff[i] = b;
      }
      else {
         if (diagnose > 0) {
            printf("Buffer Overflow!\n");
         }
      }
   }
   if (*cpu != CPU) {
      return 0;
   }
   if (*size > MAX_SIZE) {
      return -1;
   }
   return *cpu;
}


// LRC - calculate LRC of buffer
uint8_t LRC(uint8_t *buff, int size) {
   int i;
   uint8_t result = 0;

   for (i = 0; i < size; i++) {
      result ^= buff[i];
   }
   return result;
}

void main() {
   int result;
   uint32_t addr;
   uint32_t size;
   uint8_t cpu;
   uint8_t lrc;
   uint8_t buffer[MAX_SIZE];

   if (diagnose > 0) {
      printf("Secondary Loader\n");
   }

   // wait for our sync signal ...
   if (diagnose > 0) {
      printf("Awaiting Sync\n");
   }
   ReadSync(CPU);
   if (diagnose > 0) {
      printf("Received Sync\n");
   }

   // the first packet is a dummy, used by payload
   // to verify that a secondary loader is executing
   result = ReadPacket(buffer, &addr, &size, &cpu);
   if (result > 0) {
      lrc = LRC(buffer, size);
      if (diagnose > 1) {
         printf("Received Dummy Packet, LRC = %02x\n", lrc);
      }
      WriteSync(CPU);
      WriteByte(lrc);
   }

   // now read real packets until SIO_EOP detected
   while ((result > 0) && (addr != SIO_EOP)) {
      result = ReadPacket(buffer, &addr, &size, &cpu);
      if ((result > 0) && (addr != SIO_EOP)) {
         lrc = LRC(buffer, size);
         if (diagnose > 0) {
            printf("Received Packet, Addr = %06X\n", addr);
         }
         WriteSync(CPU);
         WriteByte(lrc);

         /************************************************
          *                                              *
          *  insert code to process each packet here!!!  *
          *                                              *
          ************************************************/

      }
   }

#ifndef __CATALINA_NO_HMI
   if (diagnose > 0) {
      printf("Press a key to exit\n");
      k_wait();
   }
#endif

}
