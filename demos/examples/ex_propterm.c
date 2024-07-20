#include <hmi.h>
/*
 * ex_propterm.c - compile this program with the symbol PROPTERMINAL defined. 
 * For example:
 *
 *    catalina ex_propterm.c -lc -C PROPTERMINAL
 *
 * The program displays some startup information, then allows you to either
 * type text or press a mouse button - text typed appears at the current
 * cursor position. The current cursor position is also displayed at the 
 * bottom of the screen whenever a new character is typed. Mouse button 0 
 * sets the current cursor position to be the character pointed to by the 
 * mouse, and displays the results of the m_bound functions at the bottom
 * of the screen. Mouse button 1 does not change the cursor position, but 
 * displays the absolute value of the position of the mouse at the bottom
 * of the screen.
 *
 * GENERAL NOTES ABOUT USING THE PROPTERMINAL HMI:
 *
 *  1.  You must clear the keyboard - i.e. call k_clear() at the start 
 *      of your program to avoid getting a spurious first character.
 *
 *  2.  There appears to be something slightly amiss with the way
 *      Propterm scales the mouse (at least on my machine - YMMV).
 *      I have to set the mouse scaling to xscale=8,yscale=17 for my
 *      mouse to work correctly - i.e. I call m_bound_scales(8, 17, 0).
 *      The symptoms of incorrect scaling are apparent when using the
 *      program ex_propterm.c' - pressing the left mouse button and
 *      then typing a character should make the character appear where
 *      the mouse is pointing - if the character appears elsewhere the
 *      scaling is probably not set correctly.
 *
 *  3.  Propterminal does not implement button 2 (the middle button
 *      or scroll wheel) - only buttons 0 and 1 will work correctly.
 *
 *  4.  When using the mouse, you are limited to screen sizes no larger
 *      than 64 cols by 32 rows - this limitation is due to the way
 *      propterminal sends mouse events. If you don't need a mouse, you
 *      can use larger screen sizes. To set a new screen size, you must
 *      modify the file Catalina_PC_Text.spin, and also edit the file
 *      propterm.ini and then load this file into propterm.
 *
 *  5.  Propterm only supports one cursor position. You should use either
 *      cursor 0 or cursor 1 - but not both. If you want to write to the
 *      screen at a different cursor position, save the current cursor
 *      position first, then set the new cursor position, then write, 
 *      then restore the original cursor position.
 */

static int rows;
static int cols;

void print_m(char *str, int x, int y) {
   int i;

   t_setpos(1, 0, rows-1);
   t_setpos(1, 0, rows-1);
   t_string(1, str);
   t_string(1, "x=");
   t_integer(1, x);
   t_string(1, " y=");
   t_integer(1, y);
   t_string(1, "    ");
   t_setpos(1, 0, rows-1);
}

void test_terminal() {

   int i;
   int geometry;
   int key;
   int pos;

   t_char(1,0);
   geometry = t_geometry();
   rows = geometry & 0xff;
   cols = geometry >> 8;
   t_string(1, "Screen geometry : ");
   t_integer(1, rows);
   t_string(1, " rows * ");
   t_integer(1, cols);
   t_string(1, " columns\n");
   t_string(1, "\nDelay for keyboard and mouse detect\n");
   for (i = 0; i < 1000000; i++) {
   }
   t_setpos(1, 0, 0);
   k_clear();
   t_char(1,0);
   t_string(1, "Screen cleared\n");
   t_setpos(0, 0, 0);
   t_setpos(1, 0, 1);
   t_string(1, "Cursor positions set\n");
   if (k_present()) {
      t_string(1, "Keyboard found\n");
   }
   else {
      t_string(1, "No keyboard found\n");
   }
   if (m_present() > 0) {
      t_string(1, "Mouse found\n");
   }
   else {
      t_string(1, "No mouse found\n");
   }
   if (m_present()) {
      t_mode(0, 1);
      t_string(1, "Mouse cursor mode set\n");
      m_bound_limits(0, 0, 0, cols-1, rows-1, 0);
      t_string(1, "Mouse limits set\n");
      m_bound_scales(8, 17, 0);
      t_string(1, "Mouse scales set\n");
   }

   t_string(1, "\nReady - press a key or mouse button, or Esc to exit ...\n");

   do {
      key = 0;
      if (m_present()) {
         pos = t_getpos(1);
         if (m_button(0)) {
            print_m("Bound  ", m_bound_x(), m_bound_y());
            t_setpos(1, m_bound_x(), m_bound_y());
         }
         if (m_button(1)) {
            print_m("Abs    ", m_abs_x(), m_abs_y());
            t_setpos(1, (pos >>8) & 0xff, pos & 0xff);
         }
         if (m_button(2)) {
            // NOTE: button 2 s not implemented in PropTerm !!!
            print_m("Delta  ", m_delta_x(), m_delta_y());
            t_setpos(1, (pos >>8) & 0xff, pos & 0xff);
         }
      }
      if (k_ready()) {
         key = k_get();
         t_char(1, key&0xff);
         pos = t_getpos(1);
          print_m("Cursor ", (pos >>8) & 0xff, pos & 0xff);
         t_setpos(1, (pos >>8) & 0xff, pos & 0xff);
      }
   }
   while (key != 0x1b);
   t_string(1, "\n...Exiting\n");
   t_string(1, "Press any key to exit ...\n");
   k_wait();
   
}

int main(void) {
   test_terminal();

   return 0;
}
