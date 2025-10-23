/*
 * elong.c : example of how to read data from EEPROMs from an XEPROM program.
 * 
 * Compile this program using a command like:
 *   catalina -C HYDRA -C TTY -C SMALL -C XEPROM -C CACHED_1K -y -lci elong.c 
 *
 * Note that we can read the same value from the same address in both EEPROM
 * and Hub RAM. But if the value is not a constant, reading from Hub RAM will
 * get the current value while reading from EEPROM will always get the initial
 * value. We demonstrate the difference in this program by reading both once,
 * then changing the value of the long and then reading it from both EEPROM 
 * and from Hub RAM again.
 * 
 * Note that you need a platform with an EEPROM larger than 32kb, and you need
 * a method of programming the resulting binary into the EEPROM. On the Hydra 
 * you can use the Hydra Asset Manager to do this. On other platforms you can
 * use the build_utilities command and then use the EEPROM program loader. 
 * For example:
 *    payload -i EEPROM estring.binary
 */

#include <stdio.h>
#include <prop.h>
#include <hmi.h>

/*
 * define a long to print. Note that this long will end up in both 
 * Hub RAM and the EEPROM - we will print both:
 */
static unsigned long ELONG = 0xDEADBEEFUL;

/*
 * From the listing of this program (use the -y switch), we can find that 
 * ELONG is is stored at address $00F0 - the line looks something like:
 *
 * 00f0(0087):             ' C_snu4_62f9eef7_E_L_O_N_G__L000001 ' <symbol:ELONG>
 *
 * Now define the address to read (note that we have to correct the address 
 * by subtracting 0x10 from it):
 */
#define ADDR (0xF0-0x10)

/*
 * eeprom_long: read one long from EEPROM. We use the RLNG primitive.
 */
unsigned long eeprom_long(unsigned long *src) {
  PASM("mov RI, r2");
  PASM("jmp #RLNG");
  return PASM("mov r0, BC");
}

/*
 * hub_long: read one long from Hub RAM. Note that we don't need to do this
 *           since we can just read a long directly using C, but we do this
 *           to show that we are actually reading Hub RAM.
 */
unsigned long hub_long(unsigned long *src) {
  return PASM("rdlong r0, r2");
}

/*
 * main program - read a long from EEPROM and print it. Then read the long
 *                from the same address in Hub RAM and print it. Then we
 *                change the value of the long in Hub RAM and do it again.
 */
void main() {
   unsigned long l;

   // wait for key press
   printf("Press a key to begin:\n\n");
   k_wait();

   l = 0;

   // read the long from EEPROM
   l = eeprom_long((unsigned long *)ADDR);

   // print the long
   printf("EEPROM  long = 0x%08x\n", l);

   l = 0;

   // read the long from Hub RAM
   l = hub_long((unsigned long *)ADDR);

   // print the long
   printf("Hub RAM long = 0x%08x\n", l);

   // now change the long (this will only change Hub RAM, not EEPROM).
   *(unsigned long *)ADDR = 0xFEEDFACEUL;

   l = 0;

   // read the long from EEPROM again
   l = eeprom_long((unsigned long *)ADDR);

   // print the long
   printf("EEPROM  long = 0x%08x\n", l);

   l = 0;

   // read the long from Hub RAM again
   l = hub_long((unsigned long *)ADDR);

   // print the long
   printf("Hub RAM long = 0x%08x\n", l);
}
