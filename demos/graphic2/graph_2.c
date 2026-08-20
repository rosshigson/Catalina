/******************************************************************************
 *  graphics_2.c - this program reproduces Parallax's original graphics       *
 *  demo on the Propeller 2 using Full HD VGA.It is based partly on Raymond   *
 *  Allen's verion used to demonstrate his original Full HD VGA driver.       *
 *                                                                            *
 *  Unlike graphics_1.c, this program does not try to estimate how much       *
 *  free RAM is available and use _sbrk() to allocate that space - instead,   *
 *  it just hardocdes the number of tiles and then uses malloc() to allocate  *
 *  the necessary space on the heap. This can be overridden by specifying the *
 *  number of graphic tiles on the command line (e.g by defining the symbol   *
 *  GRAPHIC_TILES, such as -C GRAPHIC_TILES=4500). Note that if insufficient  *
 *  tiles are defined, some displays will be incomplete, and if too many are  *
 *  defined, the program may not execute at all.                              *
 *                                                                            *
 *  Compile this program using a command like:                                *
 *                                                                            *
 *    catalina -p2 graphics_2.c -lci -lgraphic2 -C HD_VGA -C MHZ_297          *
 *                                                                            *
*******************************************************************************/
#include <hmi.h>
#include <stdlib.h>

#include <graphic2.h>

#if defined(__CATALINA_LARGE)
#include <hmalloc.h>
#endif

#define lines 5

#define thickness 2

#if defined(__CATALINA_GRAPHIC_TILES)
#define NUM_TILES 0 // if tiles were specified on the command line, use those
#else
#define NUM_TILES 4500 // otherwise, allocate a default number of tiles
#endif

#define EXTRA_TILES 10 // some extra tiles (just used as a demonstration)

#define MAX_COLS 120
#define MAX_ROWS 68

#define bytes_to_short(a,b) ((short)((b<<8)+a)) // used in pixel definitions

signed char gx[lines];
signed char gy[lines];
signed char xs[lines];
signed char ys[lines];
long colors[MAX_ROWS];
long *gri, *grj;
long grk;
long mx, my;
long numx, numchr, pq;

long  yTvColors[MAX_ROWS];  // turn tv colors into VGA color faster

unsigned char TV_Palette[256][4] = {
// entries are x,r,g,b
  {0x02,  10,9,10},
  {0x03,  52,52,52},
  {0x04,  114,114,114},
  {0x05,  177,177,177},
  {0x06,  240,245,250},
  {0x07,  255,255,255},
  {0x08,  114,168,0},
  {0x0A,  10,0,125},
  {0x0B,  52,32,177},
  {0x0c,  114,88,240},
  {0x0d,  177,153,255},
  {0x0e,  229,214,255},
  {0x18,  188,136,0},
  {0x1A,  0,0,127},
  {0x1B,  32,46,167},
  {0x1C,  92,108,229},
  {0x1D,  146,172,255},
  {0x1E,  209,233,255},
  {0x28,  240,94,0},
  {0x2A,  0,16,94},
  {0x2B,  10,62,146},
  {0x2C,  62,124,198},
  {0x2D,  125,188,255},
  {0x2E,  188,250,255},
  {0x38,  255,58,0},
  {0x3A,  0,32,52},
  {0x3B,  0,78,104},
  {0x3C,  52,138,159},
  {0x3D,  114,203,229},
  {0x3E,  177,255,255},
  {0x48,  255,22,114},
  {0x4A,  0,42,10},
  {0x4B,  0,88,52},
  {0x4C,  42,146,114},
  {0x4D,  104,214,177},
  {0x4E,  167,255,245},
  {0x58,  255,6,250},
  {0x5A,  0,52,0},
  {0x5B,  0,94,10},
  {0x5C,  52,156,73},
  {0x5D,  114,219,136},
  {0x5E,  177,255,198},
  {0x68,  241,6,255},
  {0x6A,  0,52,0},
  {0x6B,  10,94,0},
  {0x6C,  62,156,32},
  {0x6D,  125,219,94},
  {0x6E,  188,255,156},
  {0x78,  177,26,255},
  {0x7A,  0,42,0},
  {0x7B,  32,93,0},
  {0x7C,  84,151,5},
  {0x7D,  146,218,62},
  {0x7E,  209,255,125},
  {0x88,  114,62,255},
  {0x8A,  10,32,0},
  {0x8B,  52,78,0},
  {0x8C,  114,137,0},
  {0x8D,  177,203,52},
  {0x8E,  240,255,114},
  {0x98,  42,99,255},
  {0x9A,  32,16,0},
  {0x9B,  76,62,0},
  {0x9C,  136,125,10},
  {0x9D,  201,188,71},
  {0x9E,  255,250,128},
  {0xA8,  0,136,255},
  {0xAA,  52,0,0},
  {0xAB,  104,46,0},
  {0xAC,  156,110,32},
  {0xAD,  219,172,94},
  {0xAE,  255,235,156},
  {0xB8,  0,177,250},
  {0xBA,  73,0,0},
  {0xBB,  114,32,10},
  {0xBC,  167,94,73},
  {0xBD,  237,156,136},
  {0xBE,  255,219,198},
  {0xC8,  0,210,116},
  {0xCA,  73,0,10},
  {0xCB,  114,22,59},
  {0xCC,  177,78,114},
  {0xCD,  240,146,177},
  {0xCE,  255,203,240},
  {0xD8,  0,229,0},
  {0xDA,  73,0,61},
  {0xDB,  114,16,104},
  {0xDC,  167,73,168},
  {0xDD,  240,136,229},
  {0xDE,  255,198,255},
  {0xE8,  0,229,0},
  {0xEA,  52,0,94},
  {0xEB,  94,16,146},
  {0xEC,  156,73,198},
  {0xED,  219,136,255},
  {0xEE,  255,198,255},
  {0xF8,  42,206,0},
  {0xFA,  32,0,119},
  {0xFB,  71,22,167},
  {0xFC,  136,83,229},
  {0xFD,  198,145,255},
  {0xFE,  255,203,255},
  {0,0,0,0}
};

   // 'scan all palette entries for closes match to this color 
   // (lower 8 bits in color long are zero)
long FindClosestColor(long xc1) {
   long xc2;
   long j,c,r,g,b,r1,g1,b1,e,e1;
   long *palette = (long *)cgi_palette();
   //note:  Making green difference count a bit more than red or blue.
   e =100000; // big error
   xc2 = 0;
   r = (xc1>>8)&0xFF;
   g = (xc1>>16)&0xFF;
   b = (xc1>>24)&0xFF;
   for (j = 0;j < 256; j++) {
      c = *(palette + j); // note this is pointer arithmetic!
      r1 = (c>>8)&0xFF;
      g1 = (c>>16)&0xFF;
      b1 = (c>>24)&0xFF;
      e1 = (r-r1)*(r-r1)+(2*(g-g1)*(g-g1))+(b-b1)*(b-b1);
      if (e1 < e) {
         e = e1;
         xc2 = j;
      }
   }
   return xc2;
}

//Take a TV color index, x, and convert to RGB value, using table
long TvToRGB(int x) {
   int c = 0;
   int j,y,r,g,b;

   for (j = 0; j < 256; j++) {
      y = TV_Palette[j][0];
      if (y == 0) {  //zero marks end of table
          return c; //didn't find a match, so returning black
      }
      if (y == x) { //find the color?
          r = TV_Palette[j][1];
          g = TV_Palette[j][2];
          b = TV_Palette[j][3];
          c = (r<<24)+(g<<16)+(b<<8); // lower 8 bits are zero
          return c;
      }
   }
   return c;
}

//take set of 4 TV colors and convert to set of 4 of this palette colors
long ConvertTvColors(c) {
  int x;
  int c1,c2,c3,c4,i,j,k; 

  //Get VGA Driver find closest color
  //get individual colors from set
  c1 = c>>24;
  c2 = (c>>16)&0xFF;
  c3 = (c>>8)&0xFF;
  c4 = c&0xFF;
  //convert them all to palette index in vga driver
  c1 = TvToRGB(c1); // convert tv color to RGB
  c1 = FindClosestColor(c1); // find closest color in our palette
  c2 = TvToRGB(c2); // convert tv color to RGB
  c2 = FindClosestColor(c2); // find closest color in our palette
  c3 = TvToRGB(c3); // convert tv color to RGB
  c3 = FindClosestColor(c3); // find closest color in our palette
  c4 = TvToRGB(c4); // convert tv color to RGB
  c4 = FindClosestColor(c4); // find closest color in our palette
  return (c4<<24)+(c3<<16)+(c2<<8)+c1;
}

char pchip[] = "PROPELLER"; // text
char cchip[] = "CATALINA"; // text

void graphics_demo_init() {
   int dx, dxo, dy, dyo;
   int x_offs, y_offs;
   int x_tiles, y_tiles;
   int x_total, y_total;
   int i, j, k;

   x_offs = cgi_x_offs();
   y_offs = cgi_y_offs();

   x_tiles = cgi_x_tiles();
   y_tiles = cgi_y_tiles();

   x_total = cgi_x_total();
   y_total = cgi_y_total();

   //Graphics demo colors precalculation
   //Calculate matching TV colors for graphics demo
   for (i = 0; i < y_tiles; i++) {
       colors[i] = 0x00001010 * ((i+4) & 0xF) + 0x2B060C02;
   }
   //get matches
   for (j = 0; j < y_tiles; j++) {
       yTvColors[j] = ConvertTvColors(colors[j]);
   }

   //Set tile colors
   grj = (long *)cgi_color_data(DOUBLE_BUFFER);
   for (dx = 0; dx < x_tiles; dx++) {
      dxo = dx + x_offs;
      for (dy = 0; dy < y_tiles; dy++) {
         dyo = (dy + y_offs)*x_total + dxo;
         *(grj + dyo) = yTvColors[dy];
      }
   }

   // init bouncing lines
   i = 1001;
   j = 123123;
   k = 8776434;
   for (i = 0; i < lines; i++) {
      gx[i] = (j = _rand_forward(j)) % 64;
      gy[i] = (k = _rand_reverse(k)) % 48;
      while (1) {
          k = _rand_reverse(k);
          if ((xs[i] = g_sar(k, 29)) != 0) {
             break;
          }
      }
      while (1) {
         j = _rand_forward(j);
         if ((ys[i] = g_sar(j, 29)) != 0) {
            break;
         }
      }
   }

   mx = 0;
   my = 0;
}

void graphics_demo_update_small() {
    int i;
    int pp; 
    int x,y;

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

unsigned short vecdef2[] = {
   0x4000+0x2000/12*0, // star
   50,
   0x8000+0x2000/12*1,
   20,
   0x8000+0x2000/12*2,
   50,
   0x8000+0x2000/12*3,
   20,
   0x8000+0x2000/12*4,
   50,
   0x8000+0x2000/12*5,
   20,
   0x8000+0x2000/12*6,
   50,
   0x8000+0x2000/12*7,
   20,
   0x8000+0x2000/12*8,
   50,
   0x8000+0x2000/12*9,
   20,
   0x8000+0x2000/12*10,
   50,
   0x8000+0x2000/12*11,
   20,
   0x8000+0x2000/12*0,
   50,
   0
};

unsigned short pixdef[] = {
   bytes_to_short(2,7), bytes_to_short(3,3), // crosshair
   0x0FC0, 0x0000,
   0x3230, 0x0000,
   0xC20C, 0x0000,
   0xEAAC, 0x0000,
   0xC20C, 0x2000,
   0x3230, 0xA800,
   0x0FC0, 0x2000
};
   
unsigned short pixdef2[] = {
   bytes_to_short(1,4), bytes_to_short(0,3), // dog
   0x800A,
   0x2AAA,
   0x2AA0,
   0x2020,
};

    // clear display
    g_clear();
    g_colorwidth(2,0);
    x = 60*16/2-1;
    y = 45*16/2-1;
    g_plot(-x,y);
    g_line(x,y);
    g_line(x,-y);
    g_line(-x,-y);
    g_line(-x,y);

    //draw introductory text
    g_textmode(3,3,6,5);
    g_colorwidth(2,2);
    g_text(0,300, "This is about as large as a Parallax graphics demo");
    g_text(0,260, "could be when using Spin and a normal tile driver");
    g_text(0,-300, "(press a key for next screen)");

    // draw spinning triangles
    g_colorwidth(3,0);
    for (i = 1; i <= 8; i++) {
       register int kx7f = grk & 0x7F; // calculate once and re-use
       g_vec(0, 0, (kx7f << 3) + (i<<5), (grk<<6) + (i<<8), vecdef);
    }

    // draw expanding mouse crosshairs
    g_colorwidth(2, grk>>2);

    //Update mouse coordinates if in graphics window
    mx += m_delta_x();
    my += m_delta_y();

    g_pix(mx, my, (grk >> 4) & 0x7, pixdef);

    // if left mouse button pressed, throw snowballs
    if (m_button(0)) {
       g_width(pq & 0xF);
       g_color(2);
       pp = (pq & 0xF)*(pq & 0xF) + 5;
       pq++;
       g_arc(mx, my, pp, pp>>1, -grk * 200, 0x200, 8, 0);
    }
    else {
       pq = 0;
    }

    // if right mouse button pressed, pause
    while (m_button(1)) { }

    // draw expanding pixel halo
    g_colorwidth(1, grk);
    g_arc(0, 0, 80, 30, -grk << 5, 0x2000/9, 9, 0);

    // step bouncing lines
    for (i = 0; i < lines; i++) {
      if (abs(gx[i]) > 60) {
        xs[i] = -xs[i];
      }
      if (abs(gy[i]) > 40) {
        ys[i] = -ys[i];
      }
      gx[i] += xs[i];
      gy[i] += ys[i];
    }

    // draw bouncing lines
    g_colorwidth(1, thickness);
    g_plot(gx[0], gy[0]);
    for (i = 1; i < lines; i++) {
       g_line(gx[i], gy[i]);
    }
    g_line(gx[0], gy[0]);

    // draw spinning stars and revolving crosshairs and dogs
    g_colorwidth(2, 0);
    for (i = 0; i <= 7; i++) {
       register int i10k6 = (i<<10) + (grk<<6); // calculate once and re-use
       register int k7 = -(grk<<7);             // calculate once and re-use
       g_vecarc( 80,  50, 30, 30, -i10k6, 0x40, k7, vecdef2);
       g_pixarc(-80, -40, 30, 30,  i10k6, 0, pixdef2);
       g_pixarc(-80, -40, 20, 20, -i10k6, 0, pixdef);
      
    }
    
    // draw small box with text
    g_colorwidth(1, 15);
    g_box(60, -80, 60*2, 16*2);
    g_textmode(2, 2, 6, 5);
    g_colorwidth(2, 2);
    g_text(120, -65, pchip);

    // draw incrementing digit
    if (!(++numx & 7)) {
       numchr++;
    }
    if ((numchr < '0') || (numchr > '9')) {
       numchr = '0';
    }
    g_textmode(8*2, 8*2, 6, 5);
    g_colorwidth(1, 15);
    g_text(-90*2, 50*2, &numchr);

    // copy bitmap to display
    g_copy(DOUBLE_BUFFER);

    // increment counter that makes everything change
    grk++;

}

void graphics_demo_update_large() {
    int i;
    int pp; 

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

unsigned short vecdef2[] = {
   0x4000+0x2000/12*0, // star
   50,
   0x8000+0x2000/12*1,
   20,
   0x8000+0x2000/12*2,
   50,
   0x8000+0x2000/12*3,
   20,
   0x8000+0x2000/12*4,
   50,
   0x8000+0x2000/12*5,
   20,
   0x8000+0x2000/12*6,
   50,
   0x8000+0x2000/12*7,
   20,
   0x8000+0x2000/12*8,
   50,
   0x8000+0x2000/12*9,
   20,
   0x8000+0x2000/12*10,
   50,
   0x8000+0x2000/12*11,
   20,
   0x8000+0x2000/12*0,
   50,
   0
};

unsigned short pixdef[] = {
   bytes_to_short(2,7), bytes_to_short(3,3), // crosshair
   0x0FC0, 0x0000,
   0x3230, 0x0000,
   0xC20C, 0x0000,
   0xEAAC, 0x0000,
   0xC20C, 0x2000,
   0x3230, 0xA800,
   0x0FC0, 0x2000
};
   
unsigned short pixdef2[] = {
   bytes_to_short(1,4), bytes_to_short(0,3), // dog
   0x800A,
   0x2AAA,
   0x2AA0,
   0x2020,
};

    // clear display
    g_clear();

    //draw small box with text
    g_textmode(3,3,6,5);
    g_colorwidth(2,2);
    g_text(0,300, "But using Catalina we can go bigger!");
    g_text(0,-400, "(press a key for next screen)");

    // draw spinning triangles
    g_colorwidth(3,1);
    for (i = 1; i <= 10; i++) {
       register int kx7f = grk & 0xFF; // calculate once and re-use
       g_vec(0, 0, (kx7f << 3) + (i<<5), (grk<<6) + (i<<8), vecdef);
    }

    // draw expanding mouse crosshairs
    g_colorwidth(2, grk>>2);

    //Update mouse coordinates if in graphics window
    mx += m_delta_x();
    my += m_delta_y();

    g_pix(mx, my, (grk >> 4) & 0x7, pixdef);

    // if left mouse button pressed, throw snowballs
    if (m_button(0)) {
       g_width(pq & 0xF);
       g_color(2);
       pp = (pq & 0xF)*(pq & 0xF) + 5;
       pq++;
       g_arc(mx, my, pp, pp>>1, -grk * 200, 0x200, 8, 0);
    }
    else {
       pq = 0;
    }

    // if right mouse button pressed, pause
    while (m_button(1)) { }

    // draw expanding pixel halo
    g_colorwidth(1, grk);
    g_arc(0, 0, 240, 90, -grk << 6, 0x2000/9, 9, 0);

    // step bouncing lines
    for (i = 0; i < lines; i++) {
      if (abs(gx[i]) > 120) {
        xs[i] = -xs[i];
      }
      if (abs(gy[i]) > 80) {
        ys[i] = -ys[i];
      }
      gx[i] += xs[i];
      gy[i] += ys[i];
    }

    // draw bouncing lines
    g_colorwidth(1, thickness*2);
    g_plot(gx[0]*2, gy[0]*2);
    for (i = 1; i < lines; i++) {
       g_line(gx[i]*2, gy[i]*2);
    }
    g_line(gx[0]*2, gy[0]*2);

    // draw spinning stars and revolving crosshairs and dogs
    g_colorwidth(2, 5);
    for (i = 0; i <= 7; i++) {
       register int i10k6 = (i<<10) + (grk<<6); // calculate once and re-use
       g_vecarc( 480,  150, 30*5, 30*5, -i10k6, 0x80, -(grk<<6), vecdef2);
       g_pixarc(-480, -240, 30*5, 30*5,  i10k6, 0, pixdef2);
       g_pixarc(-480, -240, 20*5, 20*5, -i10k6, 0, pixdef);
      
    }
    
    // draw small box with text
    g_colorwidth(1, 15);
    g_box(400, -290, 60*4, 16*4);
    g_textmode(4, 4, 6, 5);
    g_colorwidth(2, 4);
    g_text(520, -256, cchip);

    // draw incrementing digit
    if (!(++numx & 7)) {
       numchr++;
    }
    if ((numchr < '0') || (numchr > '9')) {
       numchr = '0';
    }
    g_textmode(8*5, 8*5, 6, 5);
    g_colorwidth(1, 15);
    // double write (6 pixels apart horizontally and vertically) 
    // to simulate "bigger" text!
    g_text(-120*4, 50*4, &numchr);
    g_text(-120*4, 50*4+6, &numchr);
    g_text(-120*4+6, 50*4, &numchr);
    g_text(-120*4+6, 50*4+6, &numchr);

    // copy bitmap to display
    g_copy(DOUBLE_BUFFER);

    // increment counter that makes everything change
    grk++;

}

void graphics_demo_update_catalina() {
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

    //clear bitmap
    g_clear();

    //draw text
    g_textmode(4, 4, 6, 5);
    g_colorwidth(1, 1);
    g_text(0, 0, "Catalina 9.0");

    //Update mouse coordinates if in graphics window
    mx += m_delta_x();
    my += m_delta_y();

    // use mouse to choose color
    if (m_button(0)) {
      g_colorwidth(3,1);
    }
    else if (m_button(1)) {
      g_colorwidth(2,1);
    }

    //draw spinning triangles
    for (i = 1; i < 10; i++) {
       g_vec(mx, my, ((grk & 0xFF) << 3) + (i<<5), (grk<<8) + (i<<8), vecdef);
    }

    //copy bitmap to display
    g_copy(DOUBLE_BUFFER);

    //increment counter that makes everything change
    grk++;
}


// The main program - implements the same functions as the Parallax graphics 
// demonstration program:
//
void main(void) {

   int x_tiles = cgi_x_tiles();
   int y_tiles = cgi_y_tiles();
   char extra_tile_space[EXTRA_TILES*TILE_SIZE];

#if defined(__CATALINA_LARGE)
   // g_setup, allocating tiles using malloc() ...
   g_setup(cgi_x_tiles()*8, cgi_y_tiles()*8, NUM_TILES, hub_malloc(NUM_TILES*TILE_SIZE));
#else
   // g_setup, allocating tiles using malloc() ...
   g_setup(cgi_x_tiles()*8, cgi_y_tiles()*8, NUM_TILES, malloc(NUM_TILES*TILE_SIZE));
#endif

   // add some extra tiles (just as a demonstration) ...
   g_add_ram(extra_tile_space, EXTRA_TILES*TILE_SIZE);

   // reset mouse
   m_reset();

   // make graphics cursor invisible for this demo
   t_mode(2,0);

   while(1) {
     
      graphics_demo_init();

      grk = 0;
      k_clear();
      do {
         graphics_demo_update_small();
         _waitms(40);
      } while (!k_ready());
 
      k_get(); // consume the key press
 
      graphics_demo_init();

      grk = 0;
      do {
        graphics_demo_update_large();
        //_waitms(5);
      } while (!k_ready());
 
      k_get(); // consume the key press
 
      grk = 0;
      t_setpos(1,1920/2,1080/2); // cursor to centre
      do {
         graphics_demo_update_catalina();
         _waitms(25);
      } while (!k_ready());
 
      k_get(); // consume the key press
 
   }
}

