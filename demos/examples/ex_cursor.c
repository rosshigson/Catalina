/******************************************************************************
 *                                                                            *
 * A simple program to test a few basic text and mouse cursor functions.      *
 * On the Propeller 1 it can be used to demo either the TV HMI or VGA HMI     *
 * plugins, which incorporate text output, keyboard input and mouse functions *
 * all in one package. On the Propeller 2 it can be used with the VGA HMI     *
 * options. However, note that not all cursor modes are supported by all HMI  *
 * drivers - the cursor modes defined in this program are will work in all    *
 * the VGA modes on the P2, but only in the TV and HIRES_VGA drivers on the   *
 * P1.                                                                        *
 *                                                                            *
 * For example, on the Propeller 1:                                           *
 *                                                                            *
 *    catalina -lci -C C3 -C HIRES_VGA -C COLOR_8 ex_cursor.c                 *
 *                                                                            *
 * For example, on the Propeller 2:                                           *
 *                                                                            *
 *  catalina -p2 -lc -C P2_EDGE -C VGA -C COLOR_8 -C CR_ON_LF ex_cursor.c     *
 * or                                                                         *
 *  catalina -p2 -lc -CHIRES_VGA -CCR_ON_LF -CCOLOR_8 -CMHZ_260 ex_cursor.c   *
 * or                                                                         *
 *  catalina -p2 -lc -C HD_VGA -C CR_ON_LF -C MHZ_297 ex_cursor.c             *
 *                                                                            *
 ******************************************************************************/
#include <hmi.h>
#include <prop.h>

static int rows;
static int cols;
static int color = 1;
static int visible = 1;

#ifdef __CATALINA_HIRES_VGA
//
// For the the HiresVGA driver, color is bg<<8 + fg
// where bg,fg = RRGGBB00 and color applies to whole row
//
static color_lookup[8] = { 
   0x1074,
   0x04f0,
   0x1C30,
   0xfC0C,
   0x0Cf0,
   0xf070,
   0x30c0,
   0x3C30
};
#endif

void test_cursor() {

   int i;
   int geometry;
   int key;

   
#ifdef __CATALINA_HD_VGA
   // turn off the graphic cursor
   t_mode(2, HMI_cursor_off);
#endif

   geometry = t_geometry();
   rows = geometry & 0xff;
   cols = geometry >> 8;
   t_string(1, "Screen geometry : "); 
   t_integer(1, rows);
   t_string(1, " rows * ");
   t_integer(1, cols);
   t_string(1, " columns\n");

   t_string(1, "\nDelay for keyboard and mouse detect\n");
   msleep(5000); // WHY DOES IT TAKE SO LONG!!!

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
   if (m_present() > 0) {
      t_string(1, "Mouse found\n");
   }
   else {
      t_string(1, "No mouse found\n");
   }
   if (m_present()) {
      t_mode(0, HMI_cursor_off); // and wrap
      t_mode(1, HMI_cursor_slow); // and wrap
      t_string(1, "Text cursor mode set\n");
      m_bound_limits(0, 0, 0, cols-1, rows-1, 0);
      t_string(1, "Mouse limits set\n");
      m_bound_scales(2, -3, 0);
      t_string(1, "Mouse scales set\n");
   }

   t_string(1, "\nReady - press a key or mouse button (button 0 moves cursor, button 1 changes color, button 2 toggles visible cursor). Or Esc to exit ...\n");

   do {
      key = 0;
      if (m_present()) {
         if (m_button(0)) {
            t_setpos(1, m_bound_x(), m_bound_y());
            
         }
         if (m_button(1)) {
            t_string(1, " Setting color to ");
#ifdef __CATALINA_HIRES_VGA
            t_color(1, color_lookup[color]);
#else            
            t_color(1, color);
#endif            
            t_integer(1, color);
            color = (color + 1) & 0x7;
            t_string(1, " ");
            while (m_button(1)) {
            }
         }
         if (m_button(2)) {
            if (visible) {
               t_string(1, " Making cursor invisible ");
               visible = 0;
               t_mode(1, HMI_cursor_off); // cursor off (and wrap)
            }
            else {
               t_string(1, " Making cursor visible");
               visible = 1;
               t_mode(1, HMI_cursor_slow); // cursor slow flash (and wrap)
            }
            while (m_button(2)) {
            }
         }
      }
      if (k_ready()) {
         key = k_get();
         t_char(1, key&0xff);
      }
   }
   while (key != 0x1b);
   t_string(1, "\n...Exiting - press a key ...\n");
   k_wait();
}

int main(void) {
   test_cursor();

   return 0;
}
