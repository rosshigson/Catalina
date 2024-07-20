#include <vgraphic.h>

#define STACK_SPACE 150 // allow this much for run time stack space

#if defined(__CATALINA_VGA_4_COLOR) || defined(__CATALINA_DOUBLE_BUFFER)
#define TRIANGLES 5
#else
#define TRIANGLES 12
#endif

extern int _sbrk(int);


int main(void) {

   int initial_tiles;
   int initial_ram;
   int free_ram_size;

   int x_tiles = cgi_x_tiles();
   int y_tiles = cgi_y_tiles();

   register int i, k; 

   unsigned short triangle[] = {
      0x4000+0x2000/3*0,
      50,
      0x8000+0x2000/3*1+1,
      50,
      0x8000+0x2000/3*2-1,
      50,
      0x8000+0x2000/3*0,
      50,
      0
   };

   char pchip1[] = "CATALINA 6.1"; // text
   char pchip2[] = "HAS ARRIVED!"; // text

   int stack_check;

   // calculate free RAM available
   free_ram_size = (int)&stack_check - _sbrk(0) - STACK_SPACE;
   initial_ram = 64 * ((_sbrk(free_ram_size) / 64) + 1);
   initial_tiles = (((int)free_ram_size) / 64) - 1;

   // setup graphics
   g_setup(x_tiles*16>>g_mode(), y_tiles*8, initial_tiles, (void *)initial_ram);
   //setup double buffering
   g_db_setup(DOUBLE_BUFFER);

   while (1) {

     // clear display
     g_clear();

     // draw spinning triangles
     g_width(0);
     for (i = 1; i <= TRIANGLES; i++) {
        register int k0x7f = k & 0x7f; // calculate once and re-use
        register int k6 = k<<6;        // calculate once and re-use
        g_color(1);
        g_pallete(1, (k%256));
        g_vec(0, 0, (k0x7f << 3) + (i<<5), k6 + (i<<8), triangle);
     }

     // draw text
     g_textmode(2, 2, 6, 4);
     g_color(2);
     g_width(2);
     g_text(600-(k<<2)%1200, 0, pchip1);
     if ((k>>4) & 1) {
        g_color(3);
        g_text(600-(k<<2)%1200+160, 0, pchip2);
     }

     // copy to display (if double buffering)
     g_copy(DOUBLE_BUFFER);

     for (i = 0; i < 4000; i++) {
        // delay to reduce flicker
     }

     k++;

   }

   return 0;
}


