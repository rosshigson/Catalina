/*
 * readmenus.c - read menu data from EEPROM
 *
 * Compile with a command like:
 *    catalina readmenus.c -C C3 -C TTY -lci -C XEPROM -C SMALL -C CACHED_1K -D MENU_ADDR=16384
 *
 * Note that MENU_ADDR must be specified as a decimal number. The menus must
 * have been previously loaded into EEPROM using loadmenus.c
 *
 * Load with a command like:
 *    payload EEPROM readmenus.binary -Ivt100
 */

#include <prop.h>
#include <hmi.h>

unsigned long GetMemAddr(unsigned long Address) {
   PASM("mov RI, r2");
   PASM("jmp #RLNG");
   return PASM("mov r0, BC");
}

char GetMemChar(unsigned long Address) {
   PASM("mov RI, r2");
   PASM("jmp #RBYT");
   return PASM("mov r0, BC");
}

void main(void) {
   int i;
   unsigned long menu_addr;
   unsigned long addr;
   char ch;

   menu_addr = MENU_ADDR; 
   
   while ((addr=GetMemAddr(menu_addr)) != 0) {
      //t_printf("menu address = %8x\n", addr);
      //t_printf("menu string  = \"");
      while ((ch = GetMemChar(addr)) != 0) {
         t_printf("%c", ch);
         addr++;
      }
      //t_printf("\"\n\n");
      menu_addr += 4;
   }

   while(1);
}
