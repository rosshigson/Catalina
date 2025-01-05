/*
 * Simple HYPER RAM & Hyper Flash test program for the Propeller 2.
 *
 * Inspired by rogloh's memtest.spin2 program.
 *
 * Compile with the hyper library and the extended C library (for file support).
 * For example:
 *
 *   catalina -p2 -lcx -lhyper test.c -C P2_EVAL -C VT100 -C SIMPLE
 *
 * Note that -C SIMPLE should be specified even if this is the default, so
 * the program can change the way line editing works with a serial HMI.
 *
 * Note that in rogloh's program, addresses are offsets from the base of the
 * RAM or FLASH address, but in this program they are all absolute addresses.
 *
 * Note that while it is POSSIBLE to compile this program as an XMM program 
 * to execute from HyperRAM and then use it to read, write or program both the
 * HyperRAM and HyperFlash, if you do so and then write to the HyperRAM area 
 * being used by the program itself, the results will be unpredictable!
 *
 */

#ifndef __CATALINA_P2
#error THIS PROGRAM MUST BE COMPILED FOR THE PROPELLER 2 (-p2)
#endif

#ifndef __CATALINA_libhyper
#error THIS PROGRAM MUST BE COMPILED WITH THE HYPER LIBRARY (-lhyper)
#endif

#include <ctype.h>
#include <stdio.h>
#include <stdint.h>
#include <plugin.h>
#include <hyper.h>
#include <hmi.h>

#define ESC 0x1b                // escape character
#define MAX_LINE  80            // max length of command line
#define MAX_LONGS 4             // longs to dump in each line
#define PROGRAM_SIZE 512        // Flash likes programming this size

// Hyper RAM & Flash ranges - may need to be modified to suit hardware:
#define RAM    ((void *)0x0)
#define FLASH1 ((void *)0x2000000)
#define FLASH2 ((void *)0x3000000)

#if defined(__CATALINA_PC) \
  ||defined(__CATALINA_TTY) \
  ||defined(__CATALINA_TTY256) \
  ||defined(__CATALINA_SIMPLE)
#define SERIAL_HMI
#endif

#define WINDOWS_EOL  0          // 1 = Windows style line termination

/*
 * freadln : a simple fgets replacement that adds line 
 *           editing when used on stdin - must know if
 *           a serial HMI option is used!
 */
char *freadln(char *s, int n, FILE *stream) {
   register char *ss = s;
   register int nn = n;
   register int ch;
   int x, y, x_y;

   if (stream != stdin) {
      // just use fgets
      return fgets(s, n, stream);
   }

   k_clear();

   while (--nn) {
      // k_wait() translates EOT to -1
      if ((ch = k_wait()) == -1) {
         if (ss == s) {
            *ss = '\0';
            return NULL;
         }
         break;
      }
      else if ((ch == 8) || (ch == 127)) { // BS or DEL
#ifdef SERIAL_HMI
         t_char(1, 8);
#else
         x_y = t_getpos(1);
         x = x_y >> 8;
         y = x_y & 0xFF;
         if (x > 0) {
            x--;
            t_setpos(1, x, y);
            t_char(1, ' ');
            t_setpos(1, x, y);
         }
#endif
         if (ss > s) {
            ss--;
            nn++;
         }
      }
      else if ((ch == '\n') || (ch == '\r')) {
         *ss++ = 0; // don't save line terminators
#if WINDOWS_EOL
         t_char(1, '\r');
#endif
         t_char(1, '\n');
         break;
      }
      else {
         t_char(1, ch);
         *ss++ = ch;
      }
   }
   *ss = '\0';
   return s;
}

/*
 * get_addr - prompt for address
 */
unsigned long get_addr() {
   char line[MAX_LINE];
   unsigned long addr = 0;
   int i;

   fprintf(stdout, "Addr: ");
   fflush(stdout);

   for (i = 0; i < MAX_LINE; i++) {
      line[i] = 0;
   }
   freadln(line, MAX_LINE, stdin);

   if (strlen(line) == 0) {
      return 0;
   }

   if (strncmp(line,"$",1) == 0) {
      sscanf(line+1, "%x", &addr);
   }
   else if ((line[0] == '0') && (toupper(line[1]) == 'X')) {
      sscanf(line+2, "%x", &addr);
   }
   else {
      sscanf(line, "%d", &addr);
   }
   return addr;
}

/*
 * get_size - prompt for size (none=0, byte=1, word=2, long=4)
 */
int get_size() {
   int size = 0;
   char ch;

   fprintf(stdout, "[B]yte [W]ord [L]ong or [ESC]: ");
   while (size == 0) {
      fflush(stdout);
      ch = k_wait();
      switch (toupper(ch)) {
         case 'B': 
            fprintf(stdout, "Byte ");
            fflush(stdout);
            size = 1;
            break;
         case 'W': 
            fprintf(stdout, "Word ");
            fflush(stdout);
            size = 2;
            break;
         case 'L': 
            fprintf(stdout, "Long ");
            fflush(stdout);
            size = 4;
            break;
         case ESC:
            fprintf(stdout, "Cancelled ");
            fflush(stdout);
            return 0;
         default:
            ch = 0;
            break;
      }
   }
   return size;
}

/*
 * get_data - prompt for data (unsigned long)
 */
unsigned long get_data(int size) {
   char line[MAX_LINE];
   int i;
   char ch;
   unsigned long data = 0;

   fprintf(stdout, "Data: ");
   fflush(stdout);

   for (i = 0; i < MAX_LINE; i++) {
      line[i] = 0;
   }
   freadln(line, MAX_LINE, stdin);

   if (strlen(line) == 0) {
      data = 0;
   }

   if (strncmp(line,"$",1) == 0) {
      sscanf(line+1, "%x", &data);
   }
   else if ((line[0] == '0') && (toupper(line[1]) == 'X')) {
      sscanf(line+2, "%x", &data);
   }
   else {
      sscanf(line, "%d", &data);
   }
   if (size == 1) {
      data &= 0xFF;
      //fprintf(stdout, "\nData: %02X\n", *data);
   }
   if (size == 2) {
      data &= 0xFFFF;
      //fprintf(stdout, "\nData: %04X\n", *data);
   }
   else {
      //fprintf(stdout, "\nData: %08X\n", *data);
   }
   return data;
}

/*
 * get_name - prompt for file name, return length
 */
int get_name(char name[MAX_LINE]) {
   int i;

   fprintf(stdout, "Name: ");
   fflush(stdout);

   for (i = 0; i < MAX_LINE; i++) {
      name[i] = 0;
   }
   freadln(name, MAX_LINE, stdin);

   return (strlen(name));
}

/*
 * dump - interactively dump Hyper RAM or Flash (as longs and characters)
 */
void dump(unsigned long addr) {
   unsigned long buff[MAX_LONGS];
   int result;
   int i;
   char ch;

   fprintf(stdout, "Dumping Addr 0x%08X (%d)\n", addr, addr);
   fprintf(stdout, "Press a key to continue or [ESC] to exit)\n");

   while (1) {
      for (i = 0; i < MAX_LONGS; i++) {
         buff[i] = 0;
      }
      if ((result = hyper_read(buff, (char *)addr, MAX_LONGS*4)) < 0) {
         fprintf(stdout, "read error: %d\n", result);
      }
   
      fprintf(stdout, "%08X : ", addr);
      for (i = 0; i < MAX_LONGS; i++) {
         fprintf(stdout, "%08X ", buff[i]);
      }
      fprintf(stdout, " : ", addr);
      for (i = 0; i < MAX_LONGS*4; i++) {
         if (isprint(*((char *)(buff) + i))) {
            fprintf(stdout, "%c", *((char *)(buff)+i));
         }
         else {
            fprintf(stdout, " ");
         }
      }
      fprintf(stdout, "\n");
      ch = k_wait();
      if (ch == ESC) {
         break;
      }
      addr += MAX_LONGS*4;
   }
}

/*
 * read - read a hyper RAM or Flash long, word or byte
 */
void read(int size, unsigned long *data, unsigned long addr) {
   int result;
   *data = 0;
   if (size == 1) {
      hyper_readByte(data, (void *)addr);
      result = hyper_getResult(0);
      if (result >= 0) {
         fprintf(stdout, "Data: 0x%02X (%d)\n", *data, *data);
      }
   }
   else if (size == 2) {
      hyper_readWord(data, (void *)addr);
      result = hyper_getResult(0);
      if (result >= 0) {
         fprintf(stdout, "Data: 0x%04X (%d)\n", *data, *data);
      }
   }
   else {
      hyper_readLong(data, (void *)addr);
      result = hyper_getResult(0);
      if (result >= 0) {
         fprintf(stdout, "Data: 0x%08X (%d)\n", *data, *data);
      }
   }
   if (result < 0) {
      fprintf(stdout, "read error: %d\n", result);
   }
}

/*
 * write - write a hyper RAM or Flash long, word or byte
 */
void write(int size, unsigned long *data, unsigned long addr) {
   int result;
   unsigned long check;
   if (size == 1) {
      result = hyper_writeByte(data, (void *)addr);
   }
   else if (size == 2) {
      result = hyper_writeWord(data, (void *)addr);
   }
   else {
      result = hyper_writeLong(data, (void *)addr);
   }
   if (result < 0) {
      fprintf(stdout, "write error: %d\n", result);
   }
   else {
      fprintf(stdout, "\n");
      read(size, &check, addr);
   }
}

/*
 * program - program a hyper Flash long, word or byte
 */
void program(int size, unsigned long data, unsigned long addr) {
   int result;
   unsigned long check;
   if (size == 1) {
      fprintf(stdout, "Programming Byte ...\n");
      result = hyper_programFlashByte((void *)addr, data);
      fprintf(stdout, "... Done\n");
   }
   else if (size == 2) {
      fprintf(stdout, "Programming Word ...\n");
      result = hyper_programFlashWord((void *)addr, data);
      fprintf(stdout, "... Done\n");
   }
   else {
      fprintf(stdout, "Programming Long ...\n");
      result = hyper_programFlashLong((void *)addr, data);
      fprintf(stdout, "... Done\n");
   }
   if (result < 0) {
      fprintf(stdout, "program error: %d\n", result);
   }
   else {
      fprintf(stdout, "\n");
      read(size, &check, addr);
   }
}

/*
 * erase - erase hyper Flash (whole device or one sector)
 */
void erase() {
   char extent = 0;
   int result;
   unsigned long addr, starttime, delta;


   fprintf(stdout, "[D]evice or [S]ector or [ESC]: ");
   while (extent == 0) {
      fflush(stdout);
      extent = k_wait();
      switch (toupper(extent)) {
         case 'D': 
            fprintf(stdout, "Device\n");
            break;
         case 'S':
            fprintf(stdout, "Sector\n");
            addr = get_addr();
            break;
         case ESC:
            fprintf(stdout, "Cancelled\n");
            return;
         default:
            extent = 0;
            break;
      }
   }
   if (toupper(extent) == 'S') {
      fprintf(stdout, "Erasing Sector ...\n");
      starttime = _cnt();
      result = hyper_eraseFlash((void *)(addr), ERASE_SECTOR_256K);
      delta = _cnt();
      fprintf(stdout, "... Done\n");
   }
   else {
      fprintf(stdout, "Erasing Device ...\n");
      starttime = _cnt();
      result = hyper_eraseFlash((void *)(FLASH1), ERASE_ENTIRE_FLASH);
      delta = _cnt();
      fprintf(stdout, "... Done\n");
   }
   delta -= starttime;
   if (result) {
      fprintf(stdout, "Erase failed, result = %d", result);
   }
   else {
      fprintf(stdout, "Erase successful, completed in %dms", 
              delta/(_clockfreq()/1000));
   }
}

/*
 * is_flash - return true if address is in Flash range
 */
int is_flash(unsigned long addr) {
   return (addr >= (unsigned long)FLASH1);
}

/*
 * cont - prompt to continue or cancel (returns 1 if continue, otherwise 0)
 */
int cont() {
   char ch = 0;
   int result;

   fprintf(stdout, "[C]ontinue or [ESC]: ");
   fflush(stdout);
   while (ch == 0) {
      fflush(stdout);
      ch = k_wait();
      switch (toupper(ch)) {
         case 'C': 
            fprintf(stdout, "Continue\n");
            return 1;
         case ESC:
            fprintf(stdout, "Cancelled\n");
            return 0;
         default:
            ch = 0;
            break;
      }
   }
   return 0;
}

/*
 * file - perform a file load or compare
 */
void file() {
   char ch = 0;
   char name[MAX_LINE];
   unsigned long addr;
   int result;
   FILE *f;
   char buffer[PROGRAM_SIZE];
   char check[PROGRAM_SIZE];
   int len;
   int i;

   fprintf(stdout, "[L]load or [C]ompare or [ESC]: ");
   while (ch == 0) {
      fflush(stdout);
      ch = k_wait();
      switch (toupper(ch)) {
         case 'L': 
            fprintf(stdout, "Load\n");
            fflush(stdout);
            break;
         case 'C':
            fprintf(stdout, "Compare\n");
            fflush(stdout);
            break;
         case ESC:
            fprintf(stdout, "Cancelled\n");
            return;
         default:
            ch = 0;
            break;
      }
   }
   result = get_name(name);
   if (result == 0) {
      return;
   }
   if (!(f=fopen(name, "r"))) {
      fprintf(stdout, "Cannot open file '%s'\n", name);
      return;
   }
   else {
     fseek(f, 0, SEEK_END);
     len = ftell(f);
     printf("File '%s' is %d bytes\n", name, len);
     fseek(f, 0, SEEK_SET);
   }
   if (len == 0) { // nothing to do
      return;
   }
   addr=get_addr();
   if (toupper(ch) == 'L') {
      if (is_flash(addr)) {
         fprintf(stdout, "Loading Flash ...\n");
      }
      else {
         fprintf(stdout, "Loading RAM ...\n");
      }
      do {
         len = fread(buffer, 1, PROGRAM_SIZE, f);
         //fprintf(stdout, "len=%d\n", len);
         //for (i = 0; i < len; i++) {
            //fprintf(stdout, "%02X ", buffer[i]);
            //fflush(stdout);
         //}
         if (len > 0) {
            if (is_flash(addr)) {
               printf("Programming %d bytes to 0x%08X\n", len, addr);
               result = hyper_programFlash((void *)addr, buffer, len, 0);
               if (result < 0) {
                  fprintf(stdout, "program error: %d\n", result);
                  return;
               }
            }
            else {
               printf("Writing %d bytes to 0x%08X\n", len, addr);
               result = hyper_write(buffer, (void *)addr, len);
               if (result < 0) {
                   fprintf(stdout, "write error: %d\n", result);
                   return;
               }
            }
            addr += len;
         }
      } while (len > 0);
   }
   else {
      if (is_flash(addr)) {
         fprintf(stdout, "Comparing Flash ...\n");
      }
      else {
         fprintf(stdout, "Comparing RAM ...\n");
      }
      do {
         len = fread(buffer, 1, PROGRAM_SIZE, f);
         if (len > 0) {
            result = hyper_read(check, (void *)addr, len);
            for (i = 0; i < len; i++) {
               if (buffer[i] != check[i]) {
                  fprintf(stdout, "Difference at 0x%08X\n", addr+i);
                  if (!cont()) {
                     return;
                  }
               }
            }
            addr += len;
         }
      } while (len > 0);
   }
   fprintf(stdout, "... Done\n");

   fclose(f);
}

/*
 * settings - display Huper Flash/RAM settings (as per rogloh!)
 */
void settings() {
  unsigned long i, cog, qos, bank, driverCog, pins, bankparams, prio, flagbits;

   fprintf(stdout, "\n");
   fprintf(stdout, "HyperRAM IR0 die0 = %08X\n", hyper_readRamIR(RAM,0,0));
   fprintf(stdout, "HyperRAM IR0 die1 = %08X\n", hyper_readRamIR(RAM,0,1));
   fprintf(stdout, "HyperRAM IR1 die0 = %08X\n", hyper_readRamIR(RAM,1,0));
   fprintf(stdout, "HyperRAM IR1 die1 = %08X\n", hyper_readRamIR(RAM,1,1));

   fprintf(stdout, "HyperRAM CR0 die0 = %08X\n", hyper_readRamCR(RAM,0,0));
   fprintf(stdout, "HyperRAM CR0 die1 = %08X\n", hyper_readRamCR(RAM,0,1));
   fprintf(stdout, "HyperRAM CR1 die0 = %08X\n", hyper_readRamCR(RAM,1,0));
   fprintf(stdout, "HyperRAM CR1 die1 = %08X\n", hyper_readRamCR(RAM,1,1));

   fprintf(stdout, "HyperFlash Status = %08X\n", hyper_readFlashStatus(FLASH1));
   fprintf(stdout, "HyperFlash VCR    = %08X\n", hyper_readFlashVCR(FLASH1));
   fprintf(stdout, "HyperFlash ICR    = %08X\n", hyper_readFlashICR(FLASH1));
   fprintf(stdout, "HyperFlash ISR    = %08X\n", hyper_readFlashISR(FLASH1));

   fprintf(stdout, "getDelay RAM      = %08X\n", hyper_getDelay(RAM));
   fprintf(stdout, "getDelay FLASH1   = %08X\n", hyper_getDelay(FLASH1));
   fprintf(stdout, "getDelay FLASH2   = %08X\n", hyper_getDelay(FLASH2));

   fprintf(stdout, "getBurst RAM      = %08X\n", hyper_getBurst(RAM));
   fprintf(stdout, "getBurst FLASH1   = %08X\n", hyper_getBurst(FLASH1));
   fprintf(stdout, "getBurst FLASH2   = %08X\n", hyper_getBurst(FLASH2));

   fprintf(stdout, "getLatency RAM    = %08X\n", hyper_getDriverLatency(RAM));
   fprintf(stdout, "getLatency FLASH1 = %08X\n", hyper_getDriverLatency(FLASH1));
   fprintf(stdout, "getLatency FLASH2 = %08X\n", hyper_getDriverLatency(FLASH2));

   fprintf(stdout, "Flash Device ID and CFI data:\n");
   for (i = 0; i <= 0x7f; i++) {
      if ((i % 16) == 0) {
         fprintf(stdout, "%04X:", i);
      }
      fprintf(stdout, " %04X", hyper_readFlashInfo(FLASH1, i));
      if (((i+1) % 16) == 0) {
         fprintf(stdout, "\n");
      }
   }

   // get the driver COG for this bus to see if the bus is active, 
   // skip if not active
   driverCog = hyper_getDriverCogId();
   if (driverCog > 7) {
      return;
   }

   // display Qos parameters
   fprintf(stdout, "COG QoS Parameters for bus:\n");
   for (cog = 0; cog <= 7; cog++) {
      fprintf(stdout, "Cog %d", cog);
      // skip driver COG
      if (cog == driverCog) {
         fprintf(stdout, " is the HyperRAM/HyperFlash Driver COG\n");
      }
      else {
         qos = hyper_getQos(cog);
         if (qos >> 16 == 0) { 
            fprintf(stdout, " is not polled");
         }
         // display QOS values
         fprintf(stdout, " QoS = %08X", qos);
         fprintf(stdout, " Burst=%d", qos >> 16);
         prio = qos >> 12 & 7;
         if ((qos >> 15) & 1) {
            fprintf(stdout, " Priority=", prio);
         }
         else {
            fprintf(stdout, " Round-Robin", prio);
         }
         flagbits = (qos >> 10) & 3;
         fprintf(stdout, " Flags: ");
         if (flagbits & 2) {
            fprintf(stdout, "ATN-NOTIFY ");
         }
         if (flagbits & 1) { 
            fprintf(stdout, "LOCKED-BURST");
         }
         fprintf(stdout, "\n");
       }
   }
   fprintf(stdout, "Bank Settings:\n");
   // iterate through all possible banks and display the parameters
   for (bank = 0; bank <= 15; bank++) {
      bankparams = hyper_getBankParameters(bank);
      fprintf(stdout, "Bank %02d BankInfo %08X", bank, bankparams);
      pins = hyper_getPinParameters(bank);
      fprintf(stdout, "  PinInfo %08X   ", pins,8);
      if ((pins & 0x80000000) == 0) {  // decode if valid
         if (bankparams & (1<<10)) {
            fprintf(stdout, " HyperFlash ");
         }
         else {
            fprintf(stdout, " HyperRAM   ");
         }
         fprintf(stdout, " RWDS_Pin =%02d", (pins >> 16) & 0x3f);
         fprintf(stdout, "  CLK_Pin =%02d", (pins >> 8) & 0x3f);
         fprintf(stdout, "  CS_Pin =%02d", (pins & 0x3f));
      }
      else {
         fprintf(stdout, " [Unmapped]");
      }
      fprintf(stdout, "\n");
   }
}

void main(int argc, char *argv[]) {
   unsigned long addr = 0;
   int size;
   unsigned long data;
   char ch;
   int result;

#if __CATALINA_VT100
   _waitms(500);
#endif
   fprintf(stdout, "Hyper RAM & Hyper Flash Test\n\n");
   fprintf(stdout, "Press [H] or [?] for Help\n");

   while (1) {
      fprintf(stdout, "\nCommand: ");
      fflush(stdout);
      ch = k_wait();
      switch (toupper(ch)) {
         case 'H':
         case '?':
            fprintf(stdout, "\n\nCommands are:\n");
            fprintf(stdout, " [D] = Dump memory\n");
            fprintf(stdout, " [R] = Read memory\n");
            fprintf(stdout, " [W] = Write memory\n");
            fprintf(stdout, " [E] = Erase Flash\n");
            fprintf(stdout, " [F] = File Load/Compare\n");
            fprintf(stdout, " [P] = Program Flash\n");
            fprintf(stdout, " [S] = Show settings\n");
            fprintf(stdout, " [Q] = Quit\n");
            fprintf(stdout, "\nEnter numbers and addresses as decimal or $hex or 0xhex\n");
            fprintf(stdout, "\nHyper RAM is at    0x%08X\n", RAM);
            fprintf(stdout, "Hyper FLASH1 is at 0x%08X\n", FLASH1);
            fprintf(stdout, "Hyper FLASH2 is at 0x%08X\n\n", FLASH2);
            break;
         case 'D' :
           fprintf(stdout, "Dump ");
           fflush(stdout);
           addr = get_addr();
           dump(addr);
           break;
         case 'R' :
           fprintf(stdout, "Read ");
           fflush(stdout);
           size = get_size();
           fprintf(stdout, "\n");
           if (size != 0) {
              addr = get_addr();
              fprintf(stdout, "\n");
              read(size, &data, addr);
           }
           break;
         case 'W' :
           fprintf(stdout, "Write ");
           fflush(stdout);
           size = get_size();
           fprintf(stdout, "\n");
           if (size != 0) {
              addr = get_addr();
              data = get_data(size);
              write(size, &data, addr);
           }
           break;
         case 'E' :
           fprintf(stdout, "Erase ");
           fflush(stdout);
           erase();
           break;
         case 'F' :
           fprintf(stdout, "File ");
           fflush(stdout);
           file();
           break;
         case 'P' :
           fprintf(stdout, "Program ");
           fflush(stdout);
           size = get_size();
           fprintf(stdout, "\n");
           if (size != 0) {
              addr = get_addr();
              data = get_data(size);
              program(size, data, addr);
           }
           break;
         case 'S' :
           fprintf(stdout, "Settings ");
           fflush(stdout);
           settings();
           break;
         case 'Q' :
           fprintf(stdout, "Quit\n");
           exit();
         default :
           break;
      }
   }
}
