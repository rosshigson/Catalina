#include <hmi.h>
#include <sd.h>

#define START_SECTOR 0 //0x200

/*
 * WARNING !!!! 
 * THIS PROGRAM WILL OVERWRITE SECTORS OF YOUR SD CARD
 * FROM START_SECTOR ONWARDS IF YOU SET WRITE_ENABLE 
 */

#define WRITE_ENABLE 0

char hex(int i) {
   if (i < 10) {
      return i + '0';
   }
   else {
      return i + 'A' - 10;
   }
}

int main (void) {
   char buffer[512];
   long sector = START_SECTOR;
   long new_sector;
   int i, j, k;
   char c;

   t_string(1, "Starting at Sector ");
   t_integer(1, sector),
   t_string(1, "\n");

   while (1) {   
      t_string(1, "\nEnter sector number, or \n");
      t_string(1, "RETURN for this sector: ");
      c = k_wait();
      new_sector = -1;
      while ((c >= '0') && (c <= '9')) {
         t_char( 1, c);
         if (new_sector < 0) {
            new_sector = 0;
         }
         new_sector = 10*new_sector + (c - '0');
         c = k_wait();
      }
      t_char(1, '\n');
      if (new_sector >= 0) {
         sector = new_sector;
      }
#if WRITE_ENABLE   
      // fill buffer with test data
      for (i = 0; i < 256; i++) {
         buffer[i] = i;
         buffer[511-i]=i;
      }
      //write to sector
      t_string(1, "Writing sector ...");
      sd_sectwrite(buffer, sector);
      t_string(1, " written\n");
#endif

      // erase buffer 
      for (i = 0; i < 512; i++) {
         buffer[i] = 0;
      }
      // re-read sector from SD card
      t_string(1, "Reading sector ...");
      sd_sectread(buffer, sector);
      t_string(1, " read\n");
      // display buffer
      for (i = 0; i < 8; i++) {
         for (j = 0; j < 8; j++) {
            for (k = 0; k < 8; k++) {
               c = buffer[64*i + 8*j + k];
               t_char(1, hex((c>>4)&0xF));
               t_char(1, hex(c&0xF));
               t_char(1, ' ');
            }
            t_char(1, '\n');
         }
         t_string(1, "Press a key to continue");
         c = k_wait();
         t_char(1, '\n');
      }
      t_string(1, "\nSector ");
      t_integer(1, sector),
      t_string(1, " Complete.\n");
      sector++;
      t_string(1, "Current Sector is ");
      t_integer(1, sector),
      t_string(1, "\n");
   }

   return 0;
}
