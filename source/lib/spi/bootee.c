#include <spi.h>
#include <cog.h>
#include <plugin.h>

extern unsigned int *_spi_buffer;
extern int          _spi_lock;

/*
 * spi_bootEEPROM - load and run a program from EEPROM.
 *
 *  addr : the address in EEPROM.
 */ 
extern int spi_bootEEPROM(unsigned int addr) {
   int cog;
   int spi;
   int this;

   if (_spi_buffer == 0) {
      _initialize_spi();
   }

   ACQUIRE (_spi_lock);

   while ((spi_getControl(0) & ioTestRdy) != 0) {
      // Wait for previous I/O to finish
   }
   if (!spi_checkPresence(addr)) {
      RELEASE (_spi_lock);
      return ioTestErr;
   }
   // Stop all COGs except this one and the one with the I2C driver in it
   spi = _locate_plugin(LMM_SPI);
   this = _cogid();
   for (cog = 0; cog < 8; cog++) {
      if ((cog != this) && (cog != spi)) {
         _cogstop(cog);
      }
   }
   // Tell the I2C driver to load 32K into HUB RAM after stopping this calling cog
   spi_setControl(1, 0x80000000);  
   spi_setControl(0, ((ioBootCmd | ioStopLdr | this) << 24) | (addr & 0xFFFFFF));
   RELEASE (_spi_lock);
   if (_spi_lock > 0) { 
      _lockret(_spi_lock);
   }

   while ((spi_getControl(0) & ioTestRdy) != 0) {
      // Wait for this to finish
   }

   return ((spi_getControl(0) & ioTestErr) != 0); // Return any error code
}
