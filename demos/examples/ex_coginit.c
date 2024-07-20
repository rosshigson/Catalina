#ifdef __CATALINA_P2
#error THIS PROGRAM REQUIRES A PROPELLER 1
#endif

/*
 * This program uses _coginit() to load a PASM program that toggles pin 0.
 * This would flash a LED on a Hydra or Hybrid.
 */
#include <cog.h>

   unsigned long code[] = {
                  // entry                       
      0x68ffec01, //    or dira, #LED_PIN        
      0x64ffe801, //    andn outa, #LED_PIN      
      0xa0bc0ff1, //    mov count,cnt            
      0x80bc0e08, //    add count,increment      
      0xf8bc0e08, // loop                        
                  //    waitcnt count, increment 
      0x6cffe801, //    xor outa, #LED_PIN       
      0x5c7c0004, //    jmp #loop                
      0x00000000, // count long 0                
      0x05F5E100  // increment long 100000000        
   };

   long data[] = {1, 2, 3, 4}; // this data is not used - it's just an example


void main(void) {


   if (_coginit ((int)data>>2, (int)code>>2, ANY_COG) == -1) {
      // LED should start flashing on success - turn it
      // on and leave it to indicate a coginit failure
      _dira(1, 1);
      _outa(1, 1);
   }

   while(1); // loop forever
}
