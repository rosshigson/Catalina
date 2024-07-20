#include <propeller.h>
#include <catalina_spi.h>
#include <catalina_plugin.h>

/*
 * EEPROM dump program using the SPI/I2C plugin. The I2C bus is intended 
 * for use in communicating with EEPROMs, and the SPI bus is intended for use 
 * in communicating with an SD Card. The EEPROM functions should work on 
 * all Propellers.
 *
 */

#define SCL_PIN  28 // should suit all platforms


#define BUFFER_SIZE 256

// function to print the names of all loaded plugins
void print_plugin_names() {
   int type;
   request_t *rqst;
   int i;
   
   for (i = 0; i < 8; i++) {
      type = REGISTERED_TYPE(i);
      rqst = REQUEST_BLOCK(i);
      printf("Cog %d (%x) %s\n", i, (unsigned)rqst, _plugin_name(type));
   }
}

// function to read an integer from stdin
int get_int() {
   char line[80];
   int i;

   gets(line);
   i= atoi(line);
   return i;
}

// function to print a message then pause till a key is pressed
void pause(char *message) {
   k_clear();
   t_printf(message);
   k_wait();
}

// function to dump the buffer to stdout - prints 128 bytes at a time
void dump_buffer(char *buffer, int buffer_size) {
   int i, j;

   for (i = 0; i < buffer_size/8; i++) {
      for (j = 0; j < 8; j ++) {
         printf("%02X ", buffer[i*8+j]);
      }
      printf("\n");
      if ((i > 0) && (i % 16) == 0) {
         pause("Press a key to continue...");
         printf("\n");
      }
   }
}

void main() {

   int i;
   int addr;
   int sect;

   char buffer[BUFFER_SIZE];

   printf("I2C EEPROM Dump Program!\n\n");
   print_plugin_names();

   while (1) {
      printf("\nEnter a decimal EEPROM Address\n(or -1 to exit):");
      addr = get_int();

      if (addr >= 0) {
         // read the first BUFFER_SIZE bytes of EEPROM 
         printf("\n\nReading %d (%06x)\n\n", addr, addr);
         spi_readEEPROM(EEPROM_ADDR(SCL_PIN, addr), buffer, BUFFER_SIZE);
   
         // display them
         dump_buffer(buffer, BUFFER_SIZE);
      }
      else {
         exit();
      }
   }
}
