/******************************************************************************
 *                                                                            *
 * A simple program to test a few basic text and mouse functions, such as     *
 * might be used in a very simple terminal emulator. On the Propeller 1 it    *
 * can be used to demo either the TV HMI or VGA HMI plugins, which both       *
 * incorporate text output, keyboard input and mouse functions all in one     *
 * package. On the Propeller 2 it can be used with the VGA HMI options.       *
 * However, note that not all cursor modes are supported by all HMI drivers.  *
 * The codes defined in this program are will work in all the VGA modes on    *
 * the P2, but only in the TV and HIRES_VGA drivers on the P1. However, note  *
 * that not all cursor modes are supported by all HMI drivers - the cursor    *
 * modes defined in this program are will work in all the VGA modes on the P2 *
 * but only in the TV and HIRES_VGA drivers on the P1.                        *
 *                                                                            *
 * For example, on the Propeller 1:                                           *
 *                                                                            *
 *   catalina -lci -C C3 -C HIRES_VGA -C COLOR_8 ex_terminal.c                *
 *                                                                            *
 * For example, on the Propeller 2:                                           *
 *                                                                            *
 *  catalina -p2 -lc -C P2_EDGE -C VGA -C COLOR_8 -C CR_ON_LF ex_terminal.c   *
 * or                                                                         *
 *  catalina -p2 -lc -CHIRES_VGA -CCR_ON_LF -CCOLOR_8 -CMHZ_260 ex_terminal.c *
 * or                                                                         *
 *  catalina -p2 -lc -C HD_VGA -C CR_ON_LF -C MHZ_297 ex_terminal.c           *
 *                                                                            *
 ******************************************************************************/

#include <hmi.h>
#include <cog.h>
#include <prop.h>

static int rows;
static int cols;

// print mouse data
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

void main(void) {

   int i;
   int geometry;
   int key;

#ifdef __CATALINA_HD_VGA
   // turn off the graphic cursor
   t_mode(2, HMI_cursor_off);
#endif

   t_mode(1, HMI_cursor_fast);
   geometry = t_geometry();
   rows = geometry & 0xff;
   cols = geometry >> 8;

   t_string(1, "Screen geometry : ");
   t_integer(1, rows);
   t_string(1, " rows * ");
   t_integer(1, cols);
   t_string(1, " columns\n");

   t_string(1, "\nDelay for keyboard and mouse detect\n");
   msleep(5000);

   t_setpos(1, 0, 0);
   t_scroll(40, 0,255);
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

   if (m_present()) {
      t_string(1, "Mouse found\n");
   }
   else {
      t_string(1, "No mouse found\n");
   }

   if (m_present()) {
      m_bound_limits(0, 0, 0, cols-1, rows-1, 0);
      t_string(1, "Mouse limits set\n");
      m_bound_scales(2, -3, 0);
      t_string(1, "Mouse scales set\n");
   }

   t_string(1, "\nReady - press a key or mouse button, drag the mouse, or press Esc when done\n");

   do {
      key = 0;
      msleep(50); 
      if (m_present()) {
         if (m_button(0)) {
            t_setpos(1, m_bound_x(), m_bound_y());
            print_m("Button 0 : Abs ", m_abs_x(), m_abs_y());
         }
         if (m_button(1)) {
            print_m("Button 1 : Delta ", m_delta_x(), m_delta_y());
         }
         if (m_button(2)) {
            t_setpos(1, m_bound_x(), m_bound_y());
            print_m("Button 2 : Bound ", m_bound_x(), m_bound_y());
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
}
