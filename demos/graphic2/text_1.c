/******************************************************************************
 *                                                                            *
 * A simple program to test a few CGI info and P1 compatibility functions     *
 * provided by the graphic2 library (to support the new HD_VGA HMI).          *
 *                                                                            *
 * For example, on the Propeller 2:                                           *
 *                                                                            *
 *    catalina -p2 text_2.c -lci -lgraphic2 -C HD_VGA -C MHZ_297 -C CR_ON_LF  *
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
#include <graphic2.h>

static int rows;
static int cols;

void main(void) {

   int i, j;
   int geometry;
   int key;
   int rowcol, row, col;
   int pad, padcount;
   int r,s;
   long *palette;
   long *color;

   t_setpos(1, 0, 0);
   t_mode(1, HMI_cursor_fast | HMI_cursor_scroll);
   t_mode(2, HMI_cursor_on);
   t_color(1, (2<<8)+11); // yellow on green

   geometry = t_geometry();
   rows = geometry & 0xff;
   cols = geometry >> 8;
   printf("Screen geometry : %d rows * %d columns\n",rows, cols);

   t_string(1, "\nWaiting for keyboard and/or mouse\n");
   while (!k_present() && !m_present()) {
      _waitsec(1);
      t_char(1, '.');
   }

   t_char(1,0xFF); // clear the screen
   t_setpos(1, 0, 0);

   printf("sbrk = 0x%X\n", sbrk(0));
   printf("Cursor positions set\n");

   if (k_present()) {
      printf("Keyboard found\n");
   }
   else {
      printf("No keyboard found\n");
   }

   if (m_present()) {
      printf("Mouse found\n");
   }
   else {
      printf("No mouse found\n");
   }

   padcount = 0;
   for (pad = 0; pad < NUM_GAMEPADS; pad++) {
      if (g_present(pad)) {
         printf("Gamepad %d found\n", pad);
         padcount++;
      }
   }
   if (padcount == 0) {
      printf("No gamepads found\n");
   }
   // test the basic (i.e. non-graphic) v2graph support functions ...
   printf("mode = %d\n", g_mode());
   printf("x tiles = %d, ", cgi_x_tiles());
   printf("y tiles = %d\n", cgi_y_tiles());
   printf("x offs = %d, ", cgi_x_offs());
   printf("y offs = %d\n", cgi_y_offs());
   printf("x total = %d, ", cgi_x_total());
   printf("y total = %d\n", cgi_y_total());
   printf("pixel_width = 0x%X\n", cgi_pixel_width());
   printf("slices = 0x%X\n", cgi_slices());
   printf("screen = 0x%X\n", cgi_screen_data(DOUBLE_BUFFER));
   printf("g_sar(0x100,3) = 0x%X\n", g_sar(0x100,3));
   printf("g_sar(0x80000000,3) = 0x%X\n", g_sar(1<<31,3));
   printf("g_limit(100,10,1000) = %d\n", g_limit(100,10,1000));
   printf("g_limit(100,200,1000) = %d\n", g_limit(100,200,1000));
   printf("g_limit(100,10,50) = %d\n", g_limit(100,10,50));
   r = 123456;
   printf("_rand_forward(%d) = %d\n", r, s = _rand_forward(r));
   printf("_rand_reverse(%d) = %d\n", s, r = _rand_reverse(s));
   // check color data ...
   printf("_cgi_data() = %X\n", _cgi_data());
   palette = (long *)cgi_palette();
   printf("cgi_palette() = %X, palette[0]=%08X\n", palette, *palette);
   color = (long *)cgi_color_data(DOUBLE_BUFFER);
   printf("cgi_color_data() = %X, color_data[0]=%08X\n", color, *color);
   // test scroll ...
   for (i = 0; i < 9; i++) {
     for (j = 0; j < i; j++) {
        printf(".");
     }
     printf("\n");
   }
   while(1);
}
