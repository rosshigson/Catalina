/******************************************************************************
 *                                                                            *
 * A simple program to test some of the VGA text functions. Can be used to    *
 * demo the HIRES_VGA HMI plugins on the P1 or P2. With other HMI options     *
 * (e.g. LORES_VGA or TV on the P1) the program will work, but the text       *
 * positioning and color selections used will make the output unreadable.     *
 *                                                                            *
 * For example, on the Propeller 1:                                           *
 *                                                                            *
 *   catalina -lci -C C3 -C HIRES_VGA -C COLOR_8 ex_vga.c                     *
 *                                                                            *
 * For example, on the Propeller 2:                                           *
 *                                                                            *
 *  catalina -p2 -lc -C P2_EDGE -C VGA -C COLOR_8 -C CR_ON_LF ex_vga.c        *
 * or                                                                         *
 *  catalina -p2 -lc -C HIRES_VGA -CCR_ON_LF -C COLOR_8 -C MHZ_260 ex_vga.c   *
 * or                                                                         *
 *  catalina -p2 -lc -C HD_VGA -C CR_ON_LF -C MHZ_297 ex_vga.c                *
 *                                                                            *
 ******************************************************************************/
#include <stdio.h>
#include <prop.h>
#include <hmi.h>
#include <cog.h>

// get current col and row of specified cursor
void get_cursor(int curs, int *col, int *row) {
   int colrow;
   // get our visible cursor position
   colrow = t_getpos(1);
   *col = colrow>>8;
   *row = colrow&0xFF;
}

void main (void) {

   int i;
   int colrow, row, col;
   char ch;

   // clear the screen
   t_char(0, 0x0c); // Form Feed
   // set visible cursor mode ...
   t_mode(1, HMI_cursor_fast|HMI_cursor_scroll);

   for (i = 0; i < 50; i++) {
#ifdef __CATALINA_P2
       // t_color on the P2 uses ANSI colors for all VGA modes - this code 
       // should result in the same colors at any color depth (except MONO!)
       t_color(1, (((i+1)%8)<<8)+(i%16));
#else
       // t_color on the P1 uses RRGGBB00 for fg and bg colors for HIRES VGA
       t_color(1, ((1<<(((i+1)%6+2)))<<8)+(7<<((i%6)+2)));
#endif 
       t_printf("Hello, World (from Catalina!!!) %d", i);
       // change color back to defaults in case we scroll
       t_color(1, (4<<8)+11); 
       t_printf("\n");
   }

   t_color(1, (4<<8)+11); 

   // get our visible cursor position
   get_cursor(1, &col, &row);

   // now show how the two cursors can be used independently ...

   // first, we use the normally visible cursor (cursor 1)
   t_string(1, " <- visible cursor is here ");
   t_setpos(1, col, row);

   // next, we use the invisible cursor (cursor 0)
   while (1) {
      msleep(100);
      t_setpos(0, 35+i%16, 10 + i%16);
      t_string(0, "                           ");
      i++;
      t_setpos(0, 35+i%16, 10 + i%16);
      t_string(0, "<- invisible cursor is here");
      if (k_present() && (ch = k_get())) {
         t_setpos(0, 35+i%16, 10 + i%16);
         t_string(0, "                           ");
         t_setpos(1, col, row);
         t_string(1, "                           ");
         t_setpos(1, col, row);
         t_char(1, ch);
         get_cursor(1, &col, &row);
         t_string(1, " <- visible cursor is here ");
         t_setpos(1, col, row);
      }
   }
}
