#include <spi.h>
#include <cog.h>

extern unsigned int *_spi_buffer;
extern int          _spi_lock;

/*
 * spi_writeSDCard - write from buffer to SDCard
 * 
 *  addr   : address on SDCard
 *  buffer : buffer to write
 *  count  : count of bytes to write 
 *
 */
extern int spi_writeSDCard(unsigned int addr, void *buffer, int count) {
   if (_spi_buffer == 0) {
      _initialize_spi();
   }

   ACQUIRE(_spi_lock);

   while ((spi_getControl(0) & ioTestRdy) != 0) {
      // Wait for previous I/O to finish
   }
   spi_setControl(1, (count << 16) | ((int) buffer & 0xFFFF));
   spi_setControl(0, (ioSpiWrite<<24) | (addr & 0xFFFFFF));
   while ((spi_getControl(0) & ioTestRdy) != 0) {
      // Wait for this to finish
   }

   RELEASE(_spi_lock);

   return ((spi_getControl(0) & ioTestErr) != 0); // Return any error code
}


