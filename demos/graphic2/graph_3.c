/******************************************************************************
 *  text_graphics.c - demonstrate mixing text and graphics on the display     *
 *                                                                            *
 *  An important aspect of this demo is that it shows how tile RAM must be    *
 *  managed when switching between text and graphics. Text does not need any  *
 *  tile RAM, but graphics does - and this RAM cannot be re-used while the    *
 *  graphics are still on display. But the tile RAM CAN be re-used once the   *
 *  graphic display has been reset, which indicates the graphics they hold    *
 *  are no longer needed. This is particularly critical if the tile RAM has   *
 *  been allocated using malloc() or hub_malloc() - in that case the          *
 *  allocated block of tile RAM must be remembered so that it can be added    *
 *  back in again after the graphics reset (which is done by specifying 1 for *
 *  the "reset" parameter to the g_setup_2() function. When this is done, all *
 *  the memory currently used for graphics is "frozen", but new RAM can be    *
 *  added (or the graphic can be cleared and the same RAM block prevously     *
 *  used can be used again.                                                   *
 *                                                                            *
 *  Note that multiple graphics can be animated using the usual technique of  *
 *  clearing and redrawing the graphic, but this has to be done separately    *
 *  for each such graphic - see the animate() function in the demo.           *
 *                                                                            *
 *  Note that text functions should only be used when the graphics has been   *
 *  set up to use the entire display - e.g. by using g_setup(), or by using   *
 *  g_setup_2(0, 0, 120, 68, ...) - which is the default when the program     *
 *  is first started (so text operations can be used immediately without      *
 *  needing additional setup). Failure to do so will corrupt the display.     *
 *                                                                            *
 *  Also note that writing text to a tile used for graphics will also corrupt *  *  the display, and that this is not checked by any of the graphics          *
 *  functions - it must be ensured by the program.                            *
 *                                                                            *
 *  Compile this program using a command like:                                *
 *                                                                            *
 *  catalina -p2 text_graphics.c -lci -lgraphic2 -C HD_VGA -C MHZ_297         *
 *                                                                            *
*******************************************************************************/
#include <hmi.h>
#include <stdlib.h>

#include <graphic2.h>

#if defined(__CATALINA_LARGE)
#include <hmalloc.h>
#define alloc hub_malloc
#else
#define alloc malloc
#endif

#define CHUNK_SIZE  100*64 // 100 tiles

static int step = 0; // used for animation

static void *block_1;
static void *block_2;
static void *block_3;
static void *block_4;

// demo of how to animate multiple graphics 
void animate() {
    int i;

   unsigned short vecdef[] = {
      0x4000+0x2000/3*0, // triangle
      50,
      0x8000+0x2000/3*1+1,
      50,
      0x8000+0x2000/3*2-1,
      50,
      0x8000+0x2000/3*0,
      50,
      0
   };

    // set up for the first graphic to be animated (and do a reset) ...
    g_setup_2(80, 15, 10, 10, 10*8, 10*8, 1);

    // clear bitmap
    g_clear();

    // add some RAM
    g_add_ram(block_3, CHUNK_SIZE);

    // draw some spinning triangles
    g_set_colors(4, 11, 10, 12);
    g_colorwidth(1, 0);
    for (i = 1; i < 8; i++) {
       g_vec(0, 0, (step & 0xFF) + (i<<4), (step<<6) + (i<<8), vecdef);
    }

    // copy bitmap to display
    g_copy(DOUBLE_BUFFER);

    // set up for the second graphic to be animated (and do a reset) ...
    g_setup_2(80, 40, 10, 10, 10*8, 10*8, 1);

    // clear bitmap
    g_clear();

    // add some RAM
    g_add_ram(block_4, CHUNK_SIZE);

    // draw more spinning triangles (in reverse!)
    g_set_colors(4, 11, 10, 12);
    g_colorwidth(2, 0);
    for (i = 1; i < 8; i++) {
       g_vec(0, 0, (step & 0xFF) + (i<<4), -(step<<6) - (i<<8), vecdef);
    }

    // copy bitmap to display
    g_copy(DOUBLE_BUFFER);

}


void main(void) {

   t_string(1, "\nWaiting for keyboard and/or mouse\n");
   while (!k_present() && !m_present()) {
      _waitsec(1);
      t_char(1, '.');
   }

   // allocate some blocks of tile ram - and remember them so we 
   // can re-use them after resetting the graphics display ...
   block_1 = alloc(CHUNK_SIZE);
   block_2 = alloc(CHUNK_SIZE);
   block_3 = alloc(CHUNK_SIZE);
   block_4 = alloc(CHUNK_SIZE);

   while(1) {
     
      // do some text operations ...
      t_setpos(1, 0, 0);
      t_color(1, (4<<8)+15); // white on blue(navy)
      t_char(1,0xFF); // writing 0xFF clears the screen
      t_string(1,"We can mix text operations ... ");

      // now setup graphics (P2 style) to use only a 
      // portion of the screen ...
      g_setup_2(10, 4, 10, 10, 10*8, 10*8, 0);
      // ... and add some RAM ...
      g_add_ram(block_1, CHUNK_SIZE);

      // do some graphics operations ...
      g_set_colors(0, 9, 2, 12);
      g_colorwidth(1, 0);
      g_color(1);
      g_clear();
      g_plot(-50, -50);
      g_line(50, 50);
      g_plot(-50, 50);
      g_line(50, -50);
      g_copy(DOUBLE_BUFFER);

      // setup to use full screen again (no reset) - this
      // is required to do more text operations ...
      g_setup_2(0, 0, 120, 68, 120*8, 68*8, 0);

      // do more text operations ...
      t_setpos(1, 10, 8);
      t_string(1,"... AND graphics operations ...");

      // setup graphics again (no reset) ...
      g_setup_2(20, 20, 10, 10, 10*8, 10*8, 0);

      // do more graphics operations ...
      g_set_colors(0, 9, 2, 12);
      g_clear();
      g_color(2);
      g_plot(-50, -50);
      g_line(50, -50);
      g_line(50,  50);
      g_line(-50,  50);
      g_line(-50,-50);
      g_copy(DOUBLE_BUFFER);

      // setup to use full screen again (no reset) - this
      // is required to do more text operations ...
      g_setup_2(0, 0, 120, 68, 120*8, 68*8, 0);

      // do more text operations ...
      t_setpos(1, 20, 16);
      t_string(1,"... as long as ...");

      // setup graphics again (no reset) ...
      g_setup_2(30, 36, 10, 10, 10*8, 10*8, 0);

      // we cannot recover tile RAM until we do a "reset", 
      // but we can add more RAM only as we need it ...
      g_add_ram(block_2, CHUNK_SIZE);

      // do more graphics operations ...
      g_set_colors(4, 15, 2, 9);
      g_clear();
      g_color(1);
      g_plot(-79, -79);
      g_line(79, -79);
      g_line(79,  79);
      g_line(-79,  79);
      g_line(-79,-79);
      g_arc(0, 0, 50, 50, 0x0000, 0x0010, 0x1FFF/0x0010, 0);
      g_copy(DOUBLE_BUFFER);

      // setup to use full screen again (no reset) - this
      // is required to do more text operations ...
      g_setup_2(0, 0, 120, 68, 120*8, 68*8, 0);

      // do more text operations ...
      t_setpos(1, 30, 24);
      t_string(1,"... we can allocate enough tile RAM");

      // setup graphics again (no reset) ...
      g_setup_2(40, 52, 10, 10, 10*8, 10*8, 0);

      // do more graphics operations ...
      g_set_colors(136, 0, 15, 15);
      g_clear();
      g_color(1);
      g_plot(0,-40);
      g_line(40,40);
      g_line(-40,40);
      g_line(0,-40);
      g_copy(DOUBLE_BUFFER);

      // setup to use full screen again (no reset) - this
      // is required to do more text operations ...
      g_setup_2(0, 0, 120, 68, 120*8, 68*8, 0);

      // do more text operations  ...
      t_setpos(1, 68, 4);
      t_color(1, (4<<8)+13); // fuschia on blue(navy)
      t_string(1,"We can also animate multiple graphics");

      // prompt to restart the demo ...
      t_setpos(1, 66, 16);
      t_color(1, (4<<8)+9); // red on blue(navy)
      t_string(1,"Press a key to reset and restart the demo");

      // ... and do a couple of animated graphics while waiting ...
      while (!k_ready()) {
         animate();
         _waitms(25);
         step++;
      }
      k_get(); // consume the key pressed

      // setup to use full screen again and do a reset - this
      // will free all the tiles in use and all the RAM can
      // then be used again ...
      g_setup_2(0, 0, 120, 68, 120*8, 68*8, 1);

      step = 0; // restart the animations

   }

   while(1);

}


