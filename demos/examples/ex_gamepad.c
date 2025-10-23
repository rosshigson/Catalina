/*
 * A simple test program for the gamepad plugin. Make sure to compile
 * this program with the -C GAMEPAD command-line option. For example:
 *
 *    catalina test_gamepad.c -lci -C GAMEPAD
 */

#include <hmi.h>
#include <gamepad.h>


int main(void) {

   // delcare bits locally so it is in Hub RAM for all memory models
   long bits;

   // simple macro to convert bit 'name' to a char (i.e. '0' or '1')
   #define BIT(name) ('0' + ((bits & (name)?1:0)))

   t_setpos(1, 7, 1);  t_string(1, "Testing Gamepad Plugin");
   t_setpos(1, 3, 13); t_string(1, "Press A on both Gamepads to Stop");

   start_gamepad_updates(&bits);

   while (1) {
      // display raw bits
      t_setpos(1, 9, 2); t_string(1, "All bits : "); t_hex(1, bits);
      // display gamepad 0 bits
      t_setpos(1, 6, 3);   t_string(1, "GAMEPAD 0");
      t_setpos(1, 6, 4);   t_string(1, "Left   :"); t_char(1, BIT(NES0_LEFT));
      t_setpos(1, 6, 5);   t_string(1, "Right  :"); t_char(1, BIT(NES0_RIGHT));
      t_setpos(1, 6, 6);   t_string(1, "Up     :"); t_char(1, BIT(NES0_UP));
      t_setpos(1, 6, 7);   t_string(1, "Down   :"); t_char(1, BIT(NES0_DOWN));
      t_setpos(1, 6, 8);   t_string(1, "Start  :"); t_char(1, BIT(NES0_START));
      t_setpos(1, 6, 9);   t_string(1, "Select :"); t_char(1, BIT(NES0_SELECT));
      t_setpos(1, 6, 10);  t_string(1, "A      :"); t_char(1, BIT(NES0_A));
      t_setpos(1, 6, 11);  t_string(1, "B      :"); t_char(1, BIT(NES0_B));
      // display gamepad 1 bits
      t_setpos(1, 22, 3);  t_string(1, "GAMEPAD 1");
      t_setpos(1, 22, 4);  t_string(1, "Left   :"); t_char(1, BIT(NES1_LEFT));
      t_setpos(1, 22, 5);  t_string(1, "Right  :"); t_char(1, BIT(NES1_RIGHT));
      t_setpos(1, 22, 6);  t_string(1, "Up     :"); t_char(1, BIT(NES1_UP));
      t_setpos(1, 22, 7);  t_string(1, "Down   :"); t_char(1, BIT(NES1_DOWN));
      t_setpos(1, 22, 8);  t_string(1, "Start  :"); t_char(1, BIT(NES1_START));
      t_setpos(1, 22, 9);  t_string(1, "Select :"); t_char(1, BIT(NES1_SELECT));
      t_setpos(1, 22, 10); t_string(1, "A      :"); t_char(1, BIT(NES1_A));
      t_setpos(1, 22, 11); t_string(1, "B      :"); t_char(1, BIT(NES1_B));
      // check if done
      if ((bits & NES0_A) && (bits & NES1_A)) {
         stop_gamepad_updates();
         t_setpos(1, 3, 13); t_string(1,"             Done!                ");
      }
   }

   return 0;
}

