#include <stdio.h>
#include <stdlib.h>
#include <prop.h>
#include <spi.h>
#include <hmi.h>
#include <plugin.h>

/*
 * Simple test program for the SPI/I2C plugin. The I2C bus is intended for
 * use in communicating with EEPROMs, and the SPI bus is intended for use 
 * in communicating with an SD Card. The EEPROM functions should work on 
 * all Propellers, and the SD Card functions should work with the SD Cards 
 * on all Propellers except the C3 (which requires additional select logic 
 * to select amongst various devices that share the SPI bus).
 * However, the existing Catalina SD Plugin supprts the C3, so the SD Card
 * functions provided by this plugin are not really necessary - but they
 * can be used to create another SPI bus on the C3 or any other platform.
 *
 */

#ifdef __CATALINA_C3
#define SDCARD_TEST 0 // 1 = enable SD Card Test, 0 = disable
#else
#define SDCARD_TEST 1 // 1 = enable SD Card Test, 0 = disable
#endif

#define SCL_PIN  28 // should suit all platforms


#if SDCARD_TEST

#if defined __CATALINA_HYDRA

// Here are the Hydra pin definitions:

#define DO_PIN   16
#define CLK_PIN  17
#define DI_PIN   18
#define CS_PIN   19

#elif defined __CATALINA_HYBRID

// Here are the Hybrid pin definitions:

#define DO_PIN   8 
#define CLK_PIN  9 
#define DI_PIN   10
#define CS_PIN   11

#elif defined __CATALINA_TRIBLADEPROP

// Here are the TriBladePRop pin definitions:

#define DO_PIN   9 
#define CLK_PIN  28 
#define DI_PIN   8
#define CS_PIN   14

#elif defined __CATALINA_RAMBLADE

// Here are the RamBlade pin definitions:

#define DO_PIN   24 
#define CLK_PIN  26 
#define DI_PIN   25
#define CS_PIN   19

#elif defined __CATALINA_PP

// Here are the Propeller Platform pin definitions:

#define DO_PIN   0 
#define CLK_PIN  1 
#define DI_PIN   2
#define CS_PIN   3

#elif defined __CATALINA_DRACBLADE

// Here are the DracBlade pin definitions:

#define DO_PIN   12 
#define CLK_PIN  13
#define DI_PIN   14
#define CS_PIN   15

#elif defined __CATALINA_ASC

// Here are the ASC pin definitions:

#define DO_PIN   12 
#define CLK_PIN  13
#define DI_PIN   11
#define CS_PIN   10

#else

// The SD Cards on most platforms will work if the pins are specified here, 
// except for the C3. The C3 requires select logic on the SPI bus used for 
// the SD Card (and other peripherals). To access the SD Card on the C3,
// use the Catalina SD Plugin instead.

#error SD CARD PIN NUMBERS NOT SPECIFIED!

//#define DO_PIN  xx // edit to suit your platform
//#define CLK_PIN xx // edit to suit your platform
//#define DI_PIN  xx // edit to suit your platform
//#define CS_PIN  xx // edit to suit your platform

#endif

#endif


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

   printf("SPI/I2C Test Program!\n\n");
   print_plugin_names();

   printf("\nEnter decimal BOOT Address\n(or -1 to skip EEPROM boot):");
   addr = get_int();

   if (addr >= 0) {

      pause("\nPress a key to boot from EEPROM ...");

      // read the first BUFFER_SIZE bytes of EEPROM 
      printf("\n\nBooting ...\n\n");
      spi_bootEEPROM(EEPROM_ADDR(SCL_PIN, addr));
      // if we get here we failed to boot!
      printf("\n\n... failed!\n\n");
   }
   
   printf("\nEnter decimal EEPROM Address\n(or -1 to skip EEPROM read/write test):");
   addr = get_int();

   if (addr >= 0) {

      pause("\nPress a key to read EEPROM ...");

      // read the first BUFFER_SIZE bytes of EEPROM 
      printf("\n\nReading ...\n\n");
      spi_readEEPROM(EEPROM_ADDR(SCL_PIN, addr), buffer, BUFFER_SIZE);

      // display them
      dump_buffer(buffer, BUFFER_SIZE);

      pause("\nPress a key to write EEPROM ...");

      // initialize the buffer to a set of known values
      for (i = 0; i < BUFFER_SIZE; i++) {
         buffer[i] = 255 - (i % 256);
      }

      // write the first BUFFER_SIZE bytes of EEPROM
      printf("\n\nWriting ...\n\n");
      spi_writeEEPROM(EEPROM_ADDR(SCL_PIN, addr), buffer, BUFFER_SIZE);

      // wait for the write to complete !IMPORTANT!
      spi_writeWait(EEPROM_ADDR(SCL_PIN, addr));

      // re-initialize the buffer
      for (i = 0; i < BUFFER_SIZE; i++) {
         buffer[i] = 0;
      }

      // read the first BUFFER_SIZE bytes of EEPROM
      printf("Reading ...\n\n");
      spi_readEEPROM(EEPROM_ADDR(SCL_PIN, addr), buffer, BUFFER_SIZE);

      // display them
      dump_buffer(buffer, BUFFER_SIZE);
   }

#if SDCARD_TEST

   // initialize the SD Card
   spi_initSDCard(DO_PIN, CLK_PIN, DI_PIN, CS_PIN);

   printf("\nEnter decimal BOOT Sector\n(or -1 to skip SD Card boot):");
   sect = get_int();

   if (sect >= 0) {

      pause("\nPress a key to boot from SD Card ...");

      // boot from EEPROM
      printf("\n\nBooting ...\n\n");
      spi_bootSDCard(sect, 0x8000);
      // if we get here we failed to boot!
      printf("\n\n... failed!\n\n");
   }
   
   printf("\nWARNING: Writing to the SD Card can\ncorrupt the file system!\n");
   printf("\nEnter decimal SD Card Sector\n(or -1 to skip SD Card read/write test):");
   sect = get_int();

   if (sect >= 0) {

      pause("\nPress a key to read SD Card ...");

      // read the first BUFFER_SIZE bytes of SD Card
      printf("\n\nReading ...\n\n");
      spi_readSDCard(sect, buffer, BUFFER_SIZE);

      // display them
      dump_buffer(buffer, BUFFER_SIZE);

      pause("\nPress a key to write ...");

      // initialize the buffer to a set of known values
      for (i = 0; i < BUFFER_SIZE; i++) {
         buffer[i] = 255 - (i % 256);
      }

      // write the first BUFFER_SIZE bytes of SD Card
      printf("\n\nWriting ...\n\n");
      spi_writeSDCard(sect, buffer, BUFFER_SIZE);

      // wait for the write to complete !IMPORTANT!
      spi_writeWait(0);

      // re-initialize the buffer
      for (i = 0; i < BUFFER_SIZE; i++) {
         buffer[i] = 0;
      }

      // read the first BUFFER_SIZE bytes of SD Card
      printf("Reading ...\n\n");
      spi_readSDCard(sect, buffer, BUFFER_SIZE);

      // display them
      dump_buffer(buffer, BUFFER_SIZE);

   }

   // stop the SD Card
   spi_stopSDCard();

#endif

   printf("\nAll tests completed\n");

   while(1);
}
