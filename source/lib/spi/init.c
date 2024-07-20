#include <prop.h>
#include <spi.h>
#include <plugin.h>
#include <cog.h>

unsigned int *_spi_buffer = 0;  // initialized on first use
int          _spi_lock    = -1; // initialized on first use

void _initialize_spi() {
   int cog;
  
   if (_spi_buffer == 0) {
      // find SND plugin (if loaded)
      cog = _locate_plugin(LMM_SPI);
      if (cog >= 0) {
         // fetch our base pointer
         _spi_buffer = (unsigned int *)((*REQUEST_BLOCK(cog)).request);
         // allocate a lock (if possible)
         _spi_lock = _locknew();
      }
   }
}

/*
 * spi_getControl - get an unsigned int from the control block
 *
 *    i : control block index             
 */
extern unsigned int spi_getControl(int i) {
   if (_spi_buffer == 0) {
      _initialize_spi();
   }
   return _spi_buffer[i];
}

/*
 * spi_setControl - set a value in the control block
 *
 *    i : control block index
 *    value : value to set
 */
extern void spi_setControl(int i, unsigned int value) {
   if (_spi_buffer == 0) {
      _initialize_spi();
   }
   _spi_buffer[i] = value;
}

/*
 * spi_checkPResence - check there is an I2C bus and EEPROM at the 
 *                     specified address. Note that this routine cannot 
 *                     distinguish between a 32Kx8 and a 64Kx8 EEPROM 
 *                     since the 16th address bit is a "don't care" for 
 *                     the 32Kx8 devices.  
 *
 *  Return true if EEPROM present, false otherwise.
 *
 *  addr   : address in EEPROM to check
 *
 */
extern int spi_checkPresence(unsigned int addr) {
   if (_spi_buffer == 0) {
      _initialize_spi();
   }
   while ((spi_getControl(0) & ioTestRdy) != 0) {
      // Wait for previous I/O to finish
   }

   spi_setControl(1, 0); // Attempt to address the device
   spi_setControl(0, (ioReadCmd << 24) | (addr & 0xFFFFFF));
   while ((spi_getControl(0) & ioTestRdy) != 0) {
      // Wait for this to finish
   }
   return ((spi_getControl(0) & ioTestErr) == 0); // Return false on error
}

/*
 * spi_writeWait - wait for EEPROM Write to finish
 *
 *  addr   : address to check
 */
extern int spi_writeWait(unsigned int addr) {
   unsigned int t = CNT;
   if (_spi_buffer == 0) {
      _initialize_spi();
   }
   while (!spi_checkPresence(addr)) {
      if (CNT - t > _clockfreq()/50) {   // maximum wait time is 20 ms
         return -1;
      }
   }
   return 0;
}

