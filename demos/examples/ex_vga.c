/******************************************************************************
 *                                                                            *
 * A simple program to test some of the VGA text functions. Can be used to    *
 * demo the HIRES_VGA HMI plugins on the P1 or P2. With other HMI options     *
 * (e.g. LORES_VGA or TV on the P1) the program will work, but the text       *
 * positioning and color selections used will make the output unreadable.     *
 *                                                                            *
 * For example, on the Propeller 1:                                           *
 *                                                                            *
 *   catalina -lci -C HYDRA -C HIRES_VGA ex_vga.c                             *
 *                                                                            *
 * For example, on the Propeller 2:                                           *
 *                                                                            *
 *   catalina -p2 -lci -C P2_EVAL -C LORES_VGA -C COLOR_8 ex_vga.c            *
 *   catalina -p2 -lci -C P2_EVAL -C HIRES_VGA -C COLOR_8 -C MHZ_260 ex_vga.c *
 *                                                                            *
 ******************************************************************************/
#include <stdio.h>
#include <prop.h>
#include <hmi.h>
#include <cog.h>

// cursor mode definitions ...
#define ALWAYS_OFF 0x0 // cursor is invisible
#define ALWAYS_ON  0x1 // cursor is visible, does not blink
#define BLINK_SLOW 0x2 // cursor is visible, blinks slowly
#define BLINK_FAST 0x3 // cursor is visible, blinks fast
#define UNDERSCORE 0x4 // or BLOCK if not set
#define SCROLL     0x8 // or WRAP if not set

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

   // set visible cursor mode ...
   t_mode(1, SCROLL+BLINK_SLOW);

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
