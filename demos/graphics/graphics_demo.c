#include <graphics.h>
#include <hmi.h>
#include <stdlib.h>

#define lines 5

#define thickness 2

#define bytes_to_short(a,b) ((short)((b<<8)+a)) // used in pixel definitions

// these macros provide an easy means of scaling the X, Y coordinates when
// we change x or y resolution - this is done to retain the proportions of 
// the original demo on different screen sizes.
//
// Ideally, we should scale something like this ...
//
//    #define X(n) ((n)*x_tiles/16)
//    #define Y(n) ((n)*y_tiles/12)
//
// ... but that makes the code larger and slower, so instead we just hardcode 
// the x_tiles and y_tiles values. If you change these values, change this:
//
#define X(n) (n) // e.g. (((n)*10)/16)
#define Y(n) (n) // e.g. (((n)*8)/12)

// if NO_MOUSE has been specified, use dummy mouse functions (saves space!):
//
#ifdef __CATALINA_NO_MOUSE
#define mm_reset()   0
#define mm_button(b) 0
#define mm_delta_x() 0
#define mm_delta_y() 0
#else
#define mm_reset     gm_reset
#define mm_button    gm_button
#define mm_delta_x   gm_delta_x
#define mm_delta_y   gm_delta_y
#endif

// The main program - implements the same functions as the Parallax graphics 
// demonstration program:
//
int main(void) {

   int x_tiles = cgi_x_tiles();
   int y_tiles = cgi_y_tiles();

   long mousex = 0, mousey = 0;
   long limitx = 0, limity = 0;

   signed char x[lines];
   signed char y[lines];
   signed char xs[lines];
   signed char ys[lines];

   register int i, j, k; 
   int kk, dx, dy, pp, pq, rr, numx, numchr;

   // this is defined locally so it exists in Hub RAM even for XMM programs:
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

   // this is defined locally so it exists in Hub RAM even for XMM programs:
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

   // this is defined locally so it exists in Hub RAM even for XMM programs:
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
   
   // this is defined locally so it exists in Hub RAM even for XMM programs:
   unsigned short pixdef2[] = {
      bytes_to_short(1,4), bytes_to_short(0,3), // dog
      0x800A,
      0x2AAA,
      0x2AA0,
      0x2020,
   };
   
   // this is defined locally so it exists in Hub RAM even for XMM programs:
   char pchip[] = "Catalina"; // text

   
  // init bouncing lines
  i = 1001;
  j = 123123;
  k = 8776434;
  for (i = 0; i <= lines - 1; i++) {
    x[i] = (j = _rand_forward(j)) % 64;
    y[i] = (k = _rand_reverse(k)) % 48;
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

  // setup graphics
  g_setup(x_tiles*8, y_tiles*8, DOUBLE_BUFFER);

  // reset mouse
  mm_reset();

  limitx = x_tiles*16/2;
  limity = y_tiles*16/2;

  while (1) {

    // clear display
    g_clear();

    // draw spinning triangles
    g_colorwidth(3,0);
    for (i = 1; i <= 8; i++) {
       register int k0x7f = k & 0x7f; // calculate once and re-use
       register int k6 = k<<6;        // calculate once and re-use
       g_vec(0, 0, (k0x7f << 3) + (i<<5), k6 + (i<<8), vecdef);
    }

    // draw expanding mouse crosshairs
    g_colorwidth(2, k>>2);
    mousex += mm_delta_x();
    mousey += mm_delta_y();
    mousex = g_limit(mousex, -limitx, limitx);
    mousey = g_limit(mousey, -limity, limity);
    g_pix(mousex, mousey, (k >> 4) & 0x7, pixdef);

    // if left mouse button pressed, throw snowballs
    if (mm_button(0)) {
      g_width(pq & 0xF);
      g_color(2);
      pp = (pq & 0xF)*(pq & 0xF) + 5;
      pq++;
      g_arc(mousex, mousey, pp, pp>>1, -k * 200, 0x200, 8, 0);
    }
    else {
      pq = 0;
    }

    // if right mouse button pressed, pause
    while (mm_button(1)) { }

    // draw expanding pixel halo
    g_colorwidth(1, k);
    g_arc(0, 0, X(80), Y(30), -k << 5, 0x2000/9, 9, 0);

    // step bouncing lines
    for (i = 0; i <= lines - 1; i++) {
      if (x[i] > X(60) || x[i] < -X(60)) {
        xs[i] = -xs[i];
      }
      if (y[i] > Y(40) || y[i] < -Y(40)) {
        ys[i] = -ys[i];
      }
      x[i] += xs[i];
      y[i] += ys[i];
    }

    // draw bouncing lines
    g_colorwidth(1, thickness);
    g_plot(x[0], y[0]);
    for (i = 1; i <= lines - 1; i++) {
       g_line(x[i], y[i]);
    }
    g_line(x[0], y[0]);

    // draw spinning stars and revolving crosshairs and dogs
    g_colorwidth(2, 0);
    for (i = 0; i <= 7; i++) {
       register int i10k6 = (i<<10) + (k<<6); // calculate once and re-use
       register int k7 = -(k<<7);             // calculate once and re-use
       g_vecarc( X(80),  Y(50), X(30), Y(30), -(i10k6), 0x40, k7, vecdef2);
       g_pixarc(-X(80), -Y(40), X(30), Y(30),  (i10k6), 0, pixdef2);
       g_pixarc(-X(80), -Y(40), X(20), Y(20), -(i10k6), 0, pixdef);
      
    }
    
    // draw small box with text
    g_colorwidth(1, 14);
    g_box(X(60), -Y(80), 60, 16);
    g_textmode(1, 1, 6, 5);
    g_colorwidth(2, 0);
    g_text(X(60)+30, -Y(80)+8, pchip);

    // draw incrementing digit
    if (!(++numx & 7)) {
       numchr++;
    }
    if ((numchr < '0') || (numchr > '9')) {
       numchr = '0';
    }
    g_textmode(X(8), Y(8), 6, 5);
    g_colorwidth(1, 8);
    g_text(-X(90), Y(50), &numchr);

    // copy bitmap to display (if double buffering)
    g_copy(NULL);

    // increment counter that makes everything change
    k++;


  }


  return 0;
}


