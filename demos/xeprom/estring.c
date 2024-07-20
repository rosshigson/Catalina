/*
 * estring.c : example of how to read data from EEPROMs from an XEPROM program.
 * 
 * Compile this program using a command like:
 *   catalina -C HYDRA -C TTY -C SMALL -C XEPROM -C CACHED_1K -y -lci estring.c 
 *
 * Note that you need a platform with an EEPROM larger than 32kb, and you need
 * a method of programming the resulting binary into the EEPROM. On the Hydra 
 * you can use the Hydra Asset Manager to do this. On other platforms you can
 * use the build_utilities command and then use the EEPROM program loader. 
 * For example:
 *    payload -i EEPROM estring.binary
 */

/*
 * define a message to print. Note that this message will end up in both 
 * Hub RAM and the EEPROM, but we do not use the Hub RAM copy - instead, 
 * we copy it from the EEPROM to a buffer and print that copy:
 */
static const char MESG[] = "Hello, World (from EEPROM)!\n";

/*
 * From the listing of this program (use the -y switch), we can find that 
 * MESG is is stored at address $0048 - the line looks something like:
 *
 * 0048(005d):             ' C_s1cg_62f9c19b_M_E_S_G__L000001 ' <symbol:MESG>
 *
 * Now define the EEPROM address to read (note that we have to correct the
 * address by subtracting 0x10 from it):
 */
#define EEPROM_ADDR (0x48-0x10)

/*
 * copy_eeprom_char: copy one char from EEPROM to Hub RAM (and return the char)
 */
char copy_eeprom_char(char *src, char *dst) {
  PASM("mov RI, r3");
  PASM("jmp #RBYT");
  PASM("mov r0, BC");
  PASM("wrbyte r0, r2");
  return PASM("and r0, #$FF");
}

/*
 * define a message buffer - messages must be 128 characters or less!
 */
static char buffer[128]; 

/*
 * main program - copy a message from EEPROM and print it
 */
void main() {
   char *src = (char *)EEPROM_ADDR;
   char *dst = buffer;              
   char ch;

   // wait for key press
   printf("Press a key to begin:\n\n");
   k_wait();

   // copy the message from EEPROM (including null terminator)
   do {
      ch = copy_eeprom_char(src++, dst++);
   }
   while (ch != 0);

   // print the copy of message
   printf(buffer);
}
