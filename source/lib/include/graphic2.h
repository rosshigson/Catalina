#ifndef _GRAPHIC2_H
#define _GRAPHIC2_H

struct g_var {
   int X_TILES;           
   int Y_TILES;           
   int TEXT_XS;           
   int TEXT_YS;           
   int TEXT_SP;           
   int TEXT_JUST;         
   int *PIXEL_WIDTH;       
   int *SLICES;
   int *SCREEN; 
   unsigned COLORS[4];         
   int ARGS[8];
};

extern struct g_var G_VAR;

#include <hmi.h>

// this is just a convenience so we can use the symbol DOUBLE_BUFFER
// in our call to g_setup, or in the calls to the CGI functions
#define DOUBLE_BUFFER 0

// Graphics tiles are 64 bytes each
//
#define TILE_SIZE 64 
#define TILE_MASK 0x3F // mask (can be used to align tile RAM if required)

// number of gamepads supporteded - this is arbitrary, 
// but it must match the number in constant.inc
// 
#define NUM_GAMEPADS 2

// plugin codes (used in SVC_T_GRAPHICS requests):
//
#define VGI_setup     1
#define VGI_color     2
#define VGI_width     3
#define VGI_plot      4
#define VGI_line      5
#define VGI_arc       6
#define VGI_vec       7
#define VGI_vecarc    8
#define VGI_pix       9
#define VGI_pixarc   10
#define VGI_text     11
#define VGI_textarc  12
#define VGI_textmode 13
#define VGI_fill     14
#define VGI_loop     15
#define VGI_clear    16
#define VGI_copy     17
#define VGI_add      18

// angular constants to make object declarations easier. These are
// 12 bit fixed point values (0 .. $2000 = 0 .. 360 degrees). Note
// that the very small values (e.g. ARG_0) are only approximations,
// so use the larger values where possible.
//
#define ANG_0    0x0000
#define ANG_360  0x2000
#define ANG_240  (0x2000*2/3)
#define ANG_180  (0x2000/2)
#define ANG_270  (0x2000*3/4)
#define ANG_300  (0x2000*5/6)
#define ANG_120  (0x2000/3)
#define ANG_90   (0x2000/4)
#define ANG_60   (0x2000/6)
#define ANG_45   (0x2000/8)
#define ANG_30   (0x2000/12)
#define ANG_22_5 (0x2000/16)
#define ANG_15   (0x2000/24)
#define ANG_10   (0x2000/36)
#define ANG_5    (0x2000/72)
#define ANG_1    (0x2000/360)


/* private functions */

void g_fill(int x, int y, int da, int db, int db2, 
            int linechange, int lines_minus_1);

void g_justify(void *string_ptr, int *just_x, int *just_y);


/* public functions */


// Get offset of first graphic x tile
//
int cgi_x_offs();


// Get offset of first graphic y tile
//
int cgi_y_offs();


// Get  number of graphic x tiles
//
int cgi_x_tiles();


// Get number of graphic y tiles
//
int cgi_y_tiles();


// Get total x tiles (not just graphics tiles)
//
int cgi_x_total();


// Get total y tiles (not just graphics tiles)
//
int cgi_y_total();


// Get address of pixel_width from CGI_Info
//
void *cgi_pixel_width();


// Get address of slices from CGI_Info
//
void *cgi_slices();


// Get address of color palette from CGI_Info
//
void *cgi_palette();


// Get address of underlying CGI screen data.
//
// The double_buffer parameter is for compatiibility with P1 graphics, 
// and is ignored.
//
// Note that this is always a Hub RAM address, and also that the screen
// data will be (x_tiles * y_tiles) LONGS, not WORDS (as it is on the P1).
//
void *cgi_screen_data(int double_buffer);


// Get address of underlying CGI color data.
//
// The double_buffer parameter is for compatiibility with P graphics, 
// and is ignored.
//
// Note that this is always a Hub RAM address.
// The color data will always be 256 longs
//
void *cgi_color_data(int double_buffer);


// Get mode - always returns 3 (for 8 bit color). This is intended mainly
// for programs to differentiate P2 virtual graphics from P1  virtual 
// graphics - on the P1, g_mode may return either 0 (for 1 bit color, 
// or 1 (for 2 bit color).
//
int g_mode();


// Set bitmap parameters (P1 or P2)
//
//   x_org          - relative-x center pixel
//   y_org          - relative-y center pixel
//   n_tiles        - number of tiles in tile space
//   tile_ptr       - tile space pointer (TILE_SIZE * n_tiles longs)
//
// NOTE: this function is provided for compatibility with the P1,
//       and simply calls g_setup_2(), g_set_color(), g_clear() and 
//       g_add_ram(). 
//       It assumes the full screen is to be used for graphics and
//       does not support setting graphic screen offsets or number
//       of graphic tiles.
//
void g_setup(int x_org, int y_org, int n_tiles, void *tile_ptr);

// Set graphics parameters (P2 only)
//
//   x_offs      - tile offset of top left of graphics
//   y_offs      - tile offset of top left of graphics window
//   x_tiles     - number of horizontal tiles in graphics window
//   y_tiles     - number of vertical tiles in graphics window
//   x_og        - relative-x center pixel
//   y_org       - relative-y centre pixel
//   reset       - reset tile data (for re-use)
//
void g_setup_2(int x_offs, int y_offs, 
               int x_tiles, int y_tiles, 
               int x_org, int y_org,
               int reset);

   
// Set double buffer parameters
//
// This is provided only for compatibility with the P1, and is ignored.
//
void g_db_setup(int double_buffer);


// Clear the working buffer
//
void g_clear();


// Copy the working buffer to the display
//
// The double_buffer parameter is ignored.
//
void g_copy(int double_buffer);


// Move the double buffer bitmap to the display.
//
// This is provided only for compatibility with the P1, and is ignored.
//
void g_move(int double_buffer);


// Add RAM to the free tile list
//
// addr is the address of the first new RAM byte, 
// size is the number of bytes (note: bytes, not tiles!)
//
void g_add_ram(void *addr, unsigned size);


// g_set_colors - set the whole screen to use the specified four colors 
// chosen from the current 256 color color palette
//
void g_set_colors(int color_bg, int color_1, int color_2, int color_3);


// g_palette - set one color (of four) for the whole screen to the 
// specified color from the current 256 color color palette. This 
// should be called AFTER g_setup(), which will override anything set
// beforehand with default values. It assumes the full screen is to be 
// used for graphics.
//
// color = 0 .. 3 (0 = background)
// palette_color = 0 .. 255
//
// Note that the palette_color is different to the P1, which accepted an rgb 
// value specified in bits[7..6] (red), [5..4] (green) and bits[3..2] (blue).
//
int g_palette(int color, int palette_color); 


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
//   angle      - initial angle in bits[12..0] (0..$1FFF = 0 ..359.956 )
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
//   angle       - angle in bits[12..0] (0..$1FFF = 0 ..359.956 )
//   vecscale    - scale of vector sprite ($100 = 1x)
//   vecangle    - rotation angle of vector sprite in bits[12..0]
//   vecdef_ptr  - address of vector sprite definition
//
void g_vecarc(int x, int y, int xr, int yr, int angle, 
              int vecscale, int vecangle, void * vecdef_ptr);
      

// Draw a pixel sprite
//
//   x,y         - center of vector sprite
//   pixrot      - 0: 0 , 1: 90 , 2: 180 , 3: 270 , +4: mirror
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
//   angle       - angle in bits[12..0] (0..$1FFF = 0 ..359.956 )
//   pixrot      - 0: 0 , 1: 90 , 2: 180 , 3: 270 , +4: mirror
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
//   angle       - angle in bits[12..0] (0..$1FFF = 0 ..359.956 )
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
//   justification  - bits[3..2]: 0..3 = left, center, right, left
//                    bits[1..0]: 0..3 = bottom, center, top, bottom
//
void g_textmode(int x_scale, int y_scale, 
                int spacing, int justification);


// Draw a box 
//
//   x,y      - box left, box bottom
//
void g_box(int x, int y, int box_width, int box_height);


// Draw a quadrilateral
// vertices must be ordered clockwise or counter-clockwise
//
void g_quad(int x1, int y1, int x2, int y2, 
            int x3, int y3, int x4, int y4);


// Draw a triangle
//
void g_tri(int x1, int y1, int x2, int y2, int x3, int y3);

// Ignored. Provided only for compatibility with the P1 
//
void g_flush();

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
// There are no special mouse functions for P2 virtual graphics - just
// use the ordinary functions - these #defines are for compatibility 
// with the P1 graphics only
//
#define gm_present      m_present
#define gm_button       m_button
#define gm_buttons      m_buttons
#define gm_abs_x        m_abs_x
#define gm_abs_y        m_abs_y
#define gm_abs_z        m_abs_z
#define gm_delta_x      m_delta_x
#define gm_delta_y      m_delta_y
#define gm_delta_z      m_delta_z
#define gm_reset        m_reset  
#define gm_bound_limits m_bound_limits
#define gm_bound_scales m_bound_scales
#define gm_abs          m_abs
#define gm_bound_preset m_bound_preset
#define gm_limit        m_limit
#define gm_bound        m_bound
#define gm_bound_x      m_bound_x
#define gm_bound_y      m_bound_y
#define gm_bound_z      m_bound_z     

#endif

#ifndef __CATALINA_NO_KEYBOARD

// Graphics Keyboard functions:
// There are no special keyboard functions for P2 virtual graphics - just
// use the ordinary functions - these #defines are for compatibility only
//
#define gk_present k_present
#define gk_get     k_get
#define gk_wait    k_wait
#define gk_new     k_new
#define gk_ready   k_ready
#define gk_clear   k_clear
#define gk_state   k_state

#endif

// NES gamepad bit encodings (as used on the P1)
//
#define NES_RIGHT  0x01 // %00000001
#define NES_LEFT   0x02 // %00000010
#define NES_DOWN   0x04 // %00000100
#define NES_UP     0x08 // %00001000
#define NES_START  0x10 // %00010000
#define NES_SELECT 0x20 // %00100000
#define NES_B      0x40 // %01000000
#define NES_A      0x80 // %10000000

// SNES gamepad bit encodings
//
#define SNES_B      0x0001 // %000000000001 
#define SNES_Y      0x0002 // %000000000010 
#define SNES_SELECT 0x0004 // %000000000100 
#define SNES_START  0x0008 // %000000001000 
#define SNES_UP     0x0010 // %000000010000 
#define SNES_DOWN   0x0020 // %000000100000 
#define SNES_LEFT   0x0040 // %000001000000 
#define SNES_RIGHT  0x0080 // %000010000000 
#define SNES_A      0x0100 // %000100000000 
#define SNES_X      0x0200 // %001000000000 
#define SNES_L      0x0400 // %010000000000 
#define SNES_R      0x0800 // %100000000000 

// reproduce P1 NES gamepad behaviour
//
unsigned g_nes(unsigned pad);

// reproduce SNES gamepad behaviour
//
unsigned g_snes(unsigned pad);

// Graphics support functions:
//

extern unsigned long _cgi_data();  // read CGI_DATA from upper HUB RAM

extern int _rand_forward(int var); // Simulate SPIN ?var operator
extern int _rand_reverse(int var); // Simulate SPIN var? operator

extern int g_sar(int var, int count); // Simulate PASM SAR var,count

#endif
