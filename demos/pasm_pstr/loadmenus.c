/*
 * loadmenus.c - load menu data into EEPROM
 *
 * Compile with a command like:
 *    catalina loadmenus.c -C C3 -C XEPROM -C CACHED_1K -C SMALL -D MENU_ADDR=16384
 *
 * Note that MENU_ADDR must be specified as a decimal number. This program
 * does nothing - it is simply used to store the menu data into EEPROM. The 
 * menu data is stored as an array of addresses starting at MENU_ADDR, followed
 * by the data of each menu. If the number of menus is not known in advance, 
 * terminate the array by adding a known end marker value such as a zero.
 *
 * Load with a command like:
 *    payload EEPROM loadmenus.binary
 */

// stringizing functions (required to process MENU_ADDR):
#define STRING_VALUE(x) STRING_VALUE__(x)
#define STRING_VALUE__(x) #x

// start menus by padding to the address:
#define START_MENUS(addr) \
   PASM( \
      "\n" \
      "' Catalina Init\n" \
      " alignl\n" \
        "Menu_Pad\n" \
        " byte $00["STRING_VALUE(addr) " - @Menu_Pad]\n" \
   );

// declare a menu - the name must be unique and the value must be a string:
#define DECLARE_MENU(name, value) \
   PASM( \
      "\n" \
      "' Catalina Init\n" \
      " alignl\n" \
      ""#name" long @"#name"_val\n" \
      "' end\n" \
      "' Catalina Data\n" \
      " alignl\n" \
      ""#name"_val _PSTR("#value")\n" \
      " byte 0\n" \
      "' end\n" \
   );

// add an optional end marker (this allows for a variable number of menus)
#define END_MENUS(marker) \
   PASM( \
      "\n" \
      "' Catalina Init\n" \
      " alignl\n" \
      " long "#marker"\n" \
   );

void main(void) {

   START_MENUS(MENU_ADDR); // the menu addresses will be stored here
   DECLARE_MENU(HELLO, "HELLO AND WELCOME!!!");
   DECLARE_MENU(M0I0, "\x1b[1m\x1b[40m\x1b[2J");
   DECLARE_MENU(M0I1, "\x1b[6;30H\x1b[37;40mMiniPlate Participant");
   DECLARE_MENU(M0I2, "\x1b[8;20H\x1b[37;40mFirmWare Version 1.0, Rev Data: 14 Sep 22");
   DECLARE_MENU(M0I3, "\x1b[10;21H\x1b[37;40mCopyright(c) 2022, All Rights Reserved");
   DECLARE_MENU(M0I4, "\x1b[12;31H\x1b[37;40m(1) WiFi Main Menu");
   DECLARE_MENU(M0I5, "\x1b[14;31H\x1b[37;40m(2) GPS Main Menu ");
   DECLARE_MENU(M0I6, "\x1b[16;31H\x1b[37;40m(3) Diagnostics   ");
   DECLARE_MENU(M0I7, "\x1b[18;28H\x1b[37;40mMake Selection (1 To 3):");
   END_MENUS(0); // a marker can be added to indicate the end of the menus

}
