/******************************************************************************
 *                                                                            *
 * A simple program to test a few basic text, gamepad and mouse functions     *
 * provided by the P2 HD_VGA HMI plugin.                                      *
 *                                                                            *
 * For example, on the Propeller 2:                                           *
 *                                                                            *
 *    catalina -p2 text_1.c -lci -lgraphic2 -C HD_VGA -C MHZ_297 _C CR_ON_LF  *
 *                                                                            *
 ******************************************************************************/

#if !(defined(__CATALINA_HD_VGA)   || \
      defined(__CATALINA_FULL_HD_VGA) || \
      defined(__CATALINA_VGA_1920) || \
      defined(__CATALINA_VGA_1080) || \
      defined(_CATALINA_VGA_1080P))
#error THIS PROGRAM REQUIRES 1080p VGA - e.g. -C HD_VGA
#endif

#if !defined(__CATALINA_MHZ_297)
#error THIS PROGRAM RECOMMENDS 297Mhz - e.g. -C MHZ_297
#endif

#include <cog.h>
#include <prop.h>
#include <hmi.h>

#define NUM_GAMEPADS 2 // to avoid having to include <graphic2.h>

static int rows;
static int cols;

/*
 * print mouse data
 */
void print_m(char *str, int x, int y) {
   int i;

   t_setpos(0, 0, rows-1);
   for (i = 0; i < cols-1; i++) {
      t_char(0, ' ');
   }
   t_setpos(0, 0, rows-1);
   t_string(0, str);
   t_string(0, " x = ");
   t_integer(0, x);
   t_string(0, ", y = ");
   t_integer(0, y);
   t_setpos(0, 0, rows-1);
}

/*
 * print gamepad data, raw and then encoded to simulate a P1 gamepad
 */
void print_gamepad(pad) {
   int i;
   int x, y;
   unsigned buttons;
   int b;

   t_setpos(0, 0, rows-2-pad);
   for (i = 0; i < cols -1; i++) {
      t_char(0, ' ');
   }
   t_setpos(0, 0, rows-2-pad);
   if (g_present(pad) >= 0) {
      buttons = g_buttons(pad);
      x = g_abs_x(pad);
      y = g_abs_y(pad);
      t_string(0, "gamepad ");
      t_integer(0, pad );
      t_string(0, ", x = ");
      t_integer(0, x);
      t_string(0, ", y = ");
      t_integer(0, y);
      t_string(0, ", buttons = 0x");
      t_hex(0, buttons);
      t_string(0, " [");
      b = 1<<15; // buttons are from bits 15 ...
      for (i = 16; i > 0; i--) {
         t_string(0, (buttons&b) ? "1" : "0");
         b>>=1; // ... to bit 0
      }
      t_string(0, "]");

      t_string(0, ", NES = 0x");
      t_hex(0, g_nes(pad));

      t_string(0, ", SNES = 0x");
      t_hex(0, g_snes(pad));
      t_setpos(0, 0, rows-2-pad);
   }
   else {
      t_string(0, "gamepad ");
      t_integer(0, pad );
      t_string(0, " not detected");
   }
}

/*
 * set specified text cursor to the location of the graphics cursor
 */
void set_text_cursor_to_graphics_cursor(int curs) {
  int rowcol, row, col;

  rowcol = t_getpos(2);    // get graphic cursor position
  col = (rowcol>>11)/16;   // convert pixels ...
  row = (rowcol&0x7FF)/32; // ... to rows and columns
  t_setpos(curs, col,row); // set specified cursor to this position
}

/*
 * set graphics cursor to the location of the specified text cursor
 */
void set_graphics_cursor_to_text_cursor(int curs) {
  int rowcol, row, col;

   rowcol = t_getpos(curs);   // get visible cursor position
   col = rowcol>>8;           // extract text col ...
   row = rowcol&0xFF;         // ... and row
   t_setpos(2,col*16,row*32); // set graphics cursor to match visible cursor
}

void main(void) {

   int i;
   int geometry;
   int key;
   int rowcol, row, col;
   int pad, padcount;

   t_mode(1, HMI_cursor_fast); // make visible cursor blink fast
   t_setpos(1, 0, 0);
   t_color(1, (2<<8)+11); // yellow on green

   geometry = t_geometry();
   rows = geometry & 0xff;
   cols = geometry >> 8;
   t_string(1, "Screen geometry : ");
   t_integer(1, rows);
   t_string(1, " rows * ");
   t_integer(1, cols);
   t_string(1, " columns\n");

   t_string(1, "\nWaiting for keyboard and/or mouse\n");
   while (!k_present() && !m_present()) {
      _waitsec(1);
      t_char(1, '.');
   }

   t_char(1,0xFF); // clear the screen
   t_setpos(1, 0, 0);

   t_string(1, "sbrk = 0x");
   t_hex(1, sbrk(0));
   t_setpos(1, 0, 1);
   t_string(1, "Cursor positions set\n");

   if (k_present()) {
      t_string(1, "Keyboard found\n");
   }
   else {
      t_string(1, "No keyboard found\n");
   }

   if (m_present()) {
      t_string(1, "Mouse found\n");
   }
   else {
      t_string(1, "No mouse found\n");
   }

   padcount = 0;
   for (pad = 0; pad < NUM_GAMEPADS; pad++) {
      if (g_present(pad)) {
         t_string(1, "Gamepad ");
         t_integer(1, pad);
         t_string(1, " found\n");
         padcount++;
      }
   }
   if (padcount == 0) {
      t_string(1, "No gamepads found\n");
   }

   if (m_present()) {
      t_mode(2, HMI_cursor_on); // make mouse cursor visible
      t_string(1, "Mouse cursor mode set\n");
      m_bound_limits(0, 0, 0, cols-1, rows-1, 0);
      t_string(1, "Mouse limits set\n");
      m_bound_scales(16, -32, 0); // note different scaling for graphics cursor
      t_string(1, "Mouse scales set\n");

   }

   t_string(1, "\nReady - press a key or mouse button, drag the mouse, or press Esc when done\n");
   t_string(1, "Dynamic mouse and gamepad data is displayed while any mouse button is pressed\n");

   set_graphics_cursor_to_text_cursor(1);

   do {
      key = 0;
      msleep(25); 
      if (m_present()) {
         if (m_button(0)) {
            print_m("Button 0 : Abs ", m_abs_x(), m_abs_y());
            set_text_cursor_to_graphics_cursor(1);
         }
         if (m_button(1)) {
            print_m("Button 1 : Delta ", m_delta_x(), m_delta_y());
            set_text_cursor_to_graphics_cursor(1);
         }
         if (m_button(2)) {
            print_m("Button 2 : Bound ", m_bound_x(), m_bound_y());
            set_text_cursor_to_graphics_cursor(1);
         }
         if (m_buttons() != 0) { // i.e. any button
            for (pad = 0; pad < NUM_GAMEPADS; pad++) {
               print_gamepad(pad);
            }
         }
      }
      if (k_present() && k_ready()) {
         key = k_get();
         t_char(1, key&0xff);
      }
   } while (key != 0x1b);

   t_string(1, "\n...Done!\n");
   t_string(1, "Press any key to exit ...\n");
   k_wait();

   while(1);

}
