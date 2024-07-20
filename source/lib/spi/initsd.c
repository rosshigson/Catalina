#include <spi.h>
#include <cog.h>

extern unsigned int *_spi_buffer;
extern int          _spi_lock;

/*
 * spi_initSDCard - Initialize SD Card
 *
 *   DO, Clk, DI, CS : Pin numbers to use
 */
extern int spi_initSDCard(int DO, int Clk, int DI, int CS) {
   if (_spi_buffer == 0) {
      _initialize_spi();
   }

   ACQUIRE(_spi_lock);

   while ((spi_getControl(0) & ioTestRdy) != 0) {
      // Wait for previous I/O to finish
   }
   spi_setControl(1, 0);
   spi_setControl(0, (ioSpiInit<<24) | (DO<<18) | (Clk<<12) | (DI<<6) | CS);
   while ((spi_getControl(0) & ioTestRdy) != 0) {
      // Wait for this to finish
   }

   RELEASE(_spi_lock);

   return ((spi_getControl(0) & ioTestErr) != 0); // Return any error code
}


