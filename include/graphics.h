#ifndef _GRAPHICS_H
#define _GRAPHICS_H

// this is just a convenience so we can use the symbol DOUBLE_BUFFER
// in our call to g_setup, or in the calls to the CGI functions
#ifdef __CATALINA_DOUBLE_BUFFER
#define DOUBLE_BUFFER 1 // use double buffer
#else
#define DOUBLE_BUFFER 0 // no double buffering
#endif

// If the size of the font data ever changes, so must this constant:
//
#define FONT_WORDS 287

// plugin codes (used in requests to plugin cog):
//
#define CGI_setup     1
#define CGI_color     2
#define CGI_width     3
#define CGI_plot      4
#define CGI_line      5
#define CGI_arc       6
#define CGI_vec       7
#define CGI_vecarc    8
#define CGI_pix       9
#define CGI_pixarc   10
#define CGI_text     11
#define CGI_textarc  12
#define CGI_textmode 13
#define CGI_fill     14
#define CGI_loop     15

struct g_var {
   int X_TILES;           
   int Y_TILES;           
   int BITMAP_BASE;       
   int BITMAP_SIZE;       
   int PIXEL_WIDTH;       
   int TEXT_XS;           
   int TEXT_YS;           
   int TEXT_SP;           
   int TEXT_JUST;         
   int SLICES[8];         
   int COLORS[4];         
   int ARGS[8];           
   short BASES[32];        
#if defined (__CATALINA_TINY)
#elif defined (__CATALINA_COMPACT)
#elif defined (__CATALINA_P2)
#else
   short FONT[FONT_WORDS]; // only required when using XMM
#endif   
};

extern struct g_var G_VAR;



/* private functions */

void g_fill(int x, int y, int da, int db, int db2, 
            int linechange, int lines_minus_1);

void g_justify(void *string_ptr, int *just_x, int *just_y);


/* public functions */

// Get x_tiles
//
int cgi_x_tiles();


// Get y_tiles
//
int cgi_y_tiles();


// Get address of underlying CGI display.
//
// Note that this is always a Hub RAM address.
// The bitmap data will be:
//   (x_tiles * y_tiles) tiles, or
//   ((x_tiles * y_tiles) * 16 * 16 * 2) / 8) bytes.
//
void *cgi_display_base();


// Get address of underlying CGI bitmap to draw on.
//
// We must tell this function if we are double buffering.
//
// Note that this is always a Hub RAM address.
// The bitmap data will be:
//   (x_tiles * y_tiles) tiles, or
//   ((x_tiles * y_tiles) * 16 * 16 * 2) / 8) bytes.
//
void *cgi_bitmap_base(int double_buffer); 


// Get address of underlying CGI screen data.
//
// We must tell this function if we are double buffering.
//
// Note that this is always a Hub RAM address.
// The screen data will be (x_tiles * y_tiles) words.
//
void *cgi_screen_data(int double_buffer);


// Get address of underlying CGI color data.
//
// We must tell this function if we are double buffering.
//
// Note that this is always a Hub RAM address.
// The colors data will always be 64 longs
//
void *cgi_color_data(int double_buffer);


// Set bitmap parameters
//
//   x_origin       - relative-x center pixel
//   y_origin       - relative-y center pixel
//   double_buffer  - true if double buffering
//
// NOTE: you do not need to provide x_tiles, y_tiles, or the
//       display pointer - this function gets them automatically.
//
void g_setup(int x_org, int y_org, int double_buffer);
   

// Clear ether the display (if not double buffering),
// or the double buffer bitmap (if double buffering)
//
void g_clear();


// Copy either the specified bitmap, or (if NULL)
// the double buffer bitmap to the display
// (use for flicker-free display)
//
void g_copy(void *bitmap_base);


// Set pixel color to two-bit pattern
//
//   color       - color code in bits[1..0]
//
void g_color(int color); 


// Set pixel width
// actual width is w[3..0] + 1
//
//   width       - 0..15 for round pixels, 16..31 for square pixels
//
void g_width(int width);


// Set pixel color and width
//
void g_colorwidth(int color, int width);


// Plot point
//
//   x,y         - endpoint
//
void g_plot(int x, int y);


// Draw a line to point
//
//   x,y         - endpoint
//
void g_line(int x, int y);


// Draw an arc
//
//   x,y        - center of arc
//   xr,yr      - radii of arc
//   angle      - initial angle in bits[12..0] (0..$1FFF = 0°..359.956°)
//   anglestep  - angle step in bits[12..0]
//   steps      - number of steps (0 just leaves (x,y) at initial arc position)
//   arcmode    - 0: plot point(s)
//                1: line to point(s)
//                2: line between points
//                3: line from point(s) to center
//
void g_arc(int x, int y, int xr, int yr, 
           int angle, int anglestep, int steps, int arcmode);


// Draw a vector sprite
//
//   x,y         - center of vector sprite
//   vecscale    - scale of vector sprite ($100 = 1x)
//   vecangle    - rotation angle of vector sprite in bits[12..0]
//   vecdef_ptr  - address of vector sprite definition
//
//
// Vector sprite definition:
//
//   word $8000|$4000+angle  'vector mode + 13-bit angle 
//                           '(mode: $4000=plot, $8000=line)
//   word length             'vector length
//   ...                     'more vectors
//   ...
//   word 0                  'end of definition
//
void g_vec(int x, int y, int vecscale, int vecangle, 
           void * vecdef_ptr);


// Draw a vector sprite at an arc position
//
//   x,y         - center of arc
//   xr,yr       - radii of arc
//   angle       - angle in bits[12..0] (0..$1FFF = 0°..359.956°)
//   vecscale    - scale of vector sprite ($100 = 1x)
//   vecangle    - rotation angle of vector sprite in bits[12..0]
//   vecdef_ptr  - address of vector sprite definition
//
void g_vecarc(int x, int y, int xr, int yr, int angle, 
              int vecscale, int vecangle, void * vecdef_ptr);
      

// Draw a pixel sprite
//
//   x,y         - center of vector sprite
//   pixrot      - 0: 0°, 1: 90°, 2: 180°, 3: 270°, +4: mirror
//   pixdef_ptr  - address of pixel sprite definition
//
//
// Pixel sprite definition:
//
//    word    'word align, express dimensions and center, define pixels
//    byte    xwords, ywords, xorigin, yorigin
//    word    %%xxxxxxxx,%%xxxxxxxx
//    word    %%xxxxxxxx,%%xxxxxxxx
//    word    %%xxxxxxxx,%%xxxxxxxx
//    ...
//
void g_pix(int x, int y, int pixrot, void *pixdef_ptr);


// Draw a pixel sprite at an arc position
//
//   x,y         - center of arc
//   xr,yr       - radii of arc
//   angle       - angle in bits[12..0] (0..$1FFF = 0°..359.956°)
//   pixrot      - 0: 0°, 1: 90°, 2: 180°, 3: 270°, +4: mirror
//   pixdef_ptr  - address of pixel sprite definition
//
void g_pixarc(int x, int y, int xr, int yr, int angle, 
              int pixrot, void *pixdef_ptr);


// Draw text
//
//   x,y         - text position (see textmode for sizing and justification)
//   string_ptr  - address of zero-terminated string (it may be necessary to 
//                 call finish immediately afterwards to prevent subsequent 
//                 code from clobbering the string as it is being drawn
void g_text(int x, int y, void *string_ptr);


// Draw text at an arc position
//
//   x,y         - center of arc
//   xr,yr       - radii of arc
//   angle       - angle in bits[12..0] (0..$1FFF = 0°..359.956°)
//   string_ptr  - address of zero-terminated string (it may be necessary to 
//                 call finish immediately afterwards to prevent subsequent 
//                 code from clobbering the string as it is being drawn
//
void g_textarc(int x, int y, int xr, int yr, 
               int angle, void *string_ptr);


// Set text size and justification
//
//   x_scale        - x character scale, should be 1+
//   y_scale        - y character scale, should be 1+
//   spacing        - character spacing, 6 is normal
//   justification  - bits[1..0]: 0..3 = left, center, right, left
//                    bits[3..2]: 0..3 = bottom, center, top, bottom
//
void g_textmode(int x_scale, int y_scale, 
                int spacing, int justification);


// Draw a box with round/square corners, according to pixel width
//
//   x,y      - box left, box bottom
//
void g_box(int x, int y, int box_width, int box_height);


// Draw a solid quadrilateral
// vertices must be ordered clockwise or counter-clockwise
//
void g_quad(int x1, int y1, int x2, int y2, 
            int x3, int y3, int x4, int y4);


// Draw a solid triangle
//
void g_tri(int x1, int y1, int x2, int y2, int x3, int y3);


// Wait for any current graphics command to finish
// use this to insure that it is safe to manually manipulate the bitmap
//
void g_finish();

// Limit an integer to be within the bounds min to max
//
extern int g_limit(int val, int min, int max);

#ifndef __CATALINA_NO_MOUSE

// Graphics Mouse functions:
//
// NOTE that you MUST call gm_present or gm_reset before calling any other
//      mouse functions.
//
extern int gm_present();
extern int gm_button (unsigned long b);
extern int gm_buttons();
extern int gm_abs_x();
extern int gm_abs_y();
extern int gm_abs_z();
extern int gm_delta_x();
extern int gm_delta_y();
extern int gm_delta_z();
extern int gm_reset();
extern void gm_bound_limits(int xmin, int ymin, int zmin, int xmax, int ymax, int zmax);
extern void gm_bound_scales (int xscale, int yscale, int zscale);
extern int gm_abs (int value);
extern void gm_bound_preset (int xpreset, int ypreset, int zpreset);
extern int gm_limit (int i, int value);
extern int gm_bound (int i, int delta);
extern int gm_bound_x();
extern int gm_bound_y();
extern int gm_bound_z();

#endif

#ifndef __CATALINA_NO_KEYBOARD

// Offsets into Keyboard Block (used internally)
//
#define OFF_TAIL    (0)
#define OFF_HEAD    (OFF_TAIL + 4)
#define OFF_PRESENT (OFF_HEAD + 4)
#define OFF_STATES  (OFF_PRESENT + 4)
#define OFF_KEYS    (OFF_STATES + 8 * 4)
#define OFF_BREAK   (OFF_KEYS + 16 * 2)

// Graphics Keyboard functions:
//
extern int gk_present();
extern int gk_get();
extern int gk_wait();
extern int gk_new();
extern int gk_ready();
extern int gk_clear();
extern int gk_state(int key);

#endif

// Graphics support functions:
//
extern int _rand_forward(int var); // Simulate SPIN ?var operator
extern int _rand_reverse(int var); // Simulate SPIN var? operator

extern int g_sar(int var, int count); // Simulate PASM SAR var,count

#endif


