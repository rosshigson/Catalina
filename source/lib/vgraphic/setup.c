#include <vgraphic.h>

#include <plugin.h>

#include <stdlib.h>

#include <string.h>

#define min(a,b) ((a)<(b)?(a):(b))

// globals 
struct g_var G_VAR;

// external function to return data about the CGI Block
// (stored during setup of CGI plugin)
extern unsigned long _cgi_data();

// external functions to return x, y tiles
extern int cgi_x_tiles();
extern int cgi_y_tiles();

/* private data */

/*
 * cog number of virtual graphics cogs (initialized by g_setup)
 */
int _vgi_cog = -1; 
int _vdb_cog = -1; 

/*
 * base address of display data - initialized during setup, 
 * but stored here to speed up the copying of bitmaps
 */
char * _display_base;

/*
 * Vector font primitives
 */
#define xa0   (0 << 0)     // x line start / arc center
#define xa1   (1 << 0)
#define xa2   (2 << 0)
#define xa3   (3 << 0)
#define xa4   (4 << 0)
#define xa5   (5 << 0)
#define xa6   (6 << 0)
#define xa7   (7 << 0)

#define ya0   (0  << 3)    // y line start / arc center
#define ya1   (1  << 3)
#define ya2   (2  << 3)
#define ya3   (3  << 3)
#define ya4   (4  << 3)
#define ya5   (5  << 3)
#define ya6   (6  << 3)
#define ya7   (7  << 3)
#define ya8   (8  << 3)
#define ya9   (9  << 3)
#define yaA   (10 << 3)
#define yaB   (11 << 3)
#define yaC   (12 << 3)
#define yaD   (13 << 3)
#define yaE   (14 << 3)
#define yaF   (15 << 3)

#define xb0   (0 << 7)     // x line end
#define xb1   (1 << 7)
#define xb2   (2 << 7)
#define xb3   (3 << 7)
#define xb4   (4 << 7)
#define xb5   (5 << 7)
#define xb6   (6 << 7)
#define xb7   (7 << 7)

#define yb0   (0  << 10)   // y line end
#define yb1   (1  << 10)
#define yb2   (2  << 10)
#define yb3   (3  << 10)
#define yb4   (4  << 10)
#define yb5   (5  << 10)
#define yb6   (6  << 10)
#define yb7   (7  << 10)
#define yb8   (8  << 10)
#define yb9   (9  << 10)
#define ybA   (10 << 10)
#define ybB   (11 << 10)
#define ybC   (12 << 10)
#define ybD   (13 << 10)
#define ybE   (14 << 10)
#define ybF   (15 << 10)

#define ax1   (0 << 7)     // x arc radius
#define ax2   (1 << 7)

#define ay1   (0 << 8)     // y arc radius
#define ay2   (1 << 8)
#define ay3   (2 << 8)
#define ay4   (3 << 8)

#define a0    (0  << 10)   // arc start/length
#define a1    (1  << 10)   // bits[1..0] = start (0..3 = 0°, 90°, 180°, 270°)
#define a2    (2  << 10)   // bits[3..2] = length (0..3 = 360°, 270°, 180°, 90°)
#define a3    (3  << 10)
#define a4    (4  << 10)
#define a5    (5  << 10)
#define a6    (6  << 10)
#define a7    (7  << 10)
#define a8    (8  << 10)
#define a9    (9  << 10)
#define aA    (10 << 10)
#define aB    (11 << 10)
#define aC    (12 << 10)
#define aD    (13 << 10)
#define aE    (14 << 10)
#define aF    (15 << 10)

#define fline (0 << 14)    // line command
#define farc  (1 << 14)    // arc command

#define more  (1 << 15)    // another arc/line

/*
 * Font data - must be in Hub RAM when using XMM !!!
 */
static unsigned short font[FONT_WORDS] = {
   fline + xa2 + yaC + xb2 + yb7 + more,      // !
   fline + xa2 + ya5 + xb2 + yb4,

   fline + xa1 + yaD + xb1 + ybC + more,      // "
   fline + xa3 + yaD + xb3 + ybC,

   fline + xa1 + yaA + xb1 + yb6 + more,      // #
   fline + xa3 + yaA + xb3 + yb6 + more,
   fline + xa0 + ya9 + xb4 + yb9 + more,
   fline + xa0 + ya7 + xb4 + yb7,

   farc + xa2 + ya9 + a9 + ax2 + ay1 + more,  // $
   farc + xa2 + ya7 + aB + ax2 + ay1 + more,
   fline + xa0 + ya6 + xb2 + yb6 + more,
   fline + xa2 + yaA + xb4 + ybA + more,
   fline + xa2 + yaA + xb2 + ybB + more,
   fline + xa2 + ya6 + xb2 + yb5,

   farc + xa1 + yaA + a0 + ax1 + ay1 + more,  // %
   farc + xa3 + ya6 + a0 + ax1 + ay1 + more,
   fline + xa0 + ya6 + xb4 + ybA,

   farc + xa2 + yaA + a7 + ax1 + ay1 + more,  // &
   farc + xa2 + ya7 + a5 + ax2 + ay2 + more,
   fline + xa1 + yaA + xb4 + yb5,

   fline + xa2 + yaD + xb2 + ybC,             //  '

   farc + xa3 + ya9 + aD + ax1 + ay4 + more,  // (
   farc + xa3 + ya7 + aE + ax1 + ay4 + more,
   fline + xa2 + ya7 + xb2 + yb9,

   farc + xa1 + ya9 + aC + ax1 + ay4 + more,  // )
   farc + xa1 + ya7 + aF + ax1 + ay4 + more,
   fline + xa2 + ya7 + xb2 + yb9,

   fline + xa4 + ya6 + xb0 + ybA + more,      // *
   fline + xa0 + ya6 + xb4 + ybA + more,
   fline + xa2 + yaB + xb2 + yb5,

   fline + xa0 + ya8 + xb4 + yb8 + more,      // +
   fline + xa2 + yaA + xb2 + yb6,

   fline + xa2 + ya4 + xb1 + yb3,             // ,

   fline + xa0 + ya8 + xb4 + yb8,             // -

   fline + xa2 + ya5 + xb2 + yb4,             // .

   fline + xa0 + ya4 + xb4 + ybC,             // /

   farc + xa2 + ya8 + a0 + ax2 + ay4,         // 0

   fline + xa0 + ya4 + xb4 + yb4 + more,      // 1
   fline + xa2 + ya4 + xb2 + ybC + more,
   fline + xa0 + yaA + xb2 + ybC,

   farc + xa2 + yaA + a8 + ax2 + ay2 + more,  // 2
   farc + xa2 + yaA + aF + ax2 + ay2 + more,
   farc + xa2 + ya6 + aD + ax2 + ay2 + more,
   fline + xa0 + ya4 + xb0 + yb6 + more,
   fline + xa0 + ya4 + xb4 + yb4,

   farc + xa2 + yaA + a7 + ax2 + ay2 + more,  // 3
   farc + xa2 + ya6 + a6 + ax2 + ay2,

   fline + xa2 + yaC + xb0 + yb7 + more,      // 4
   fline + xa0 + ya7 + xb4 + yb7 + more,
   fline + xa3 + ya4 + xb3 + yb8,

   farc + xa2 + ya6 + aB + ax2 + ay2 + more,  // 5
   fline + xa4 + yaC + xb0 + ybC + more,
   fline + xa0 + yaC + xb0 + yb8 + more,
   fline + xa0 + ya8 + xb2 + yb8 + more,
   fline + xa0 + ya4 + xb2 + yb4,

   farc + xa2 + ya6 + a0 + ax2 + ay2 + more,  // 6
   farc + xa2 + ya8 + aD + ax2 + ay4 + more,
   fline + xa0 + ya6 + xb0 + yb8 + more,
   fline + xa2 + yaC + xb3 + ybC,

   fline + xa0 + yaC + xb4 + ybC + more,      // 7
   fline + xa1 + ya4 + xb4 + ybC,

   farc + xa2 + ya6 + a0 + ax2 + ay2 + more,  // 8
   farc + xa2 + yaA + a0 + ax2 + ay2,

   farc + xa2 + yaA + a0 + ax2 + ay2 + more,  // 9
   farc + xa2 + ya8 + aF + ax2 + ay4 + more,
   fline + xa4 + ya8 + xb4 + ybA + more,
   fline + xa1 + ya4 + xb2 + yb4,

   fline + xa2 + ya6 + xb2 + yb7 + more,      // :
   fline + xa2 + yaA + xb2 + yb9,

   fline + xa2 + ya4 + xb1 + yb3 + more,      // ;
   fline + xa2 + ya8 + xb2 + yb7,

   fline + xa0 + ya8 + xb4 + ybA + more,      // <
   fline + xa0 + ya8 + xb4 + yb6,

   fline + xa0 + yaA + xb4 + ybA + more,      // =
   fline + xa0 + ya6 + xb4 + yb6,

   fline + xa4 + ya8 + xb0 + ybA + more,      // >
   fline + xa4 + ya8 + xb0 + yb6,

   farc + xa2 + yaB + a8 + ax2 + ay1 + more,  // ?
   farc + xa3 + yaB + aF + ax1 + ay2 + more,
   farc + xa3 + ya7 + aD + ax1 + ay2 + more,
   fline + xa2 + ya5 + xb2 + yb4,

   farc + xa2 + ya8 + a0 + ax1 + ay1 + more,  // @
   farc + xa2 + ya8 + a4 + ax2 + ay3 + more,
   farc + xa3 + ya8 + aF + ax1 + ay1 + more,
   farc + xa2 + ya6 + aF + ax2 + ay1 + more,
   fline + xa3 + ya7 + xb3 + yb9,

   farc + xa2 + yaA + a8 + ax2 + ay2 + more,  // A
   fline + xa0 + ya4 + xb0 + ybA + more,
   fline + xa4 + ya4 + xb4 + ybA + more,
   fline + xa0 + ya8 + xb4 + yb8,

   farc + xa2 + yaA + aB + ax2 + ay2 + more,  // B
   farc + xa2 + ya6 + aB + ax2 + ay2 + more,
   fline + xa0 + ya4 + xb0 + ybC + more,
   fline + xa0 + ya4 + xb2 + yb4 + more,
   fline + xa0 + ya8 + xb2 + yb8 + more,
   fline + xa0 + yaC + xb2 + ybC,

   farc + xa2 + yaA + a8 + ax2 + ay2 + more,  // C
   farc + xa2 + ya6 + aA + ax2 + ay2 + more,
   fline + xa0 + ya6 + xb0 + ybA,

   farc + xa2 + yaA + aC + ax2 + ay2 + more,  // D
   farc + xa2 + ya6 + aF + ax2 + ay2 + more,
   fline + xa0 + ya4 + xb0 + ybC + more,
   fline + xa4 + ya6 + xb4 + ybA + more,
   fline + xa0 + ya4 + xb2 + yb4 + more,
   fline + xa0 + yaC + xb2 + ybC,

   fline + xa0 + ya4 + xb0 + ybC + more,      // E
   fline + xa0 + ya4 + xb4 + yb4 + more,
   fline + xa0 + ya8 + xb3 + yb8 + more,
   fline + xa0 + yaC + xb4 + ybC,

   fline + xa0 + ya4 + xb0 + ybC + more,      // F
   fline + xa0 + ya8 + xb3 + yb8 + more,
   fline + xa0 + yaC + xb4 + ybC,

   farc + xa2 + yaA + a8 + ax2 + ay2 + more,  // G
   farc + xa2 + ya6 + aA + ax2 + ay2 + more,
   fline + xa0 + ya6 + xb0 + ybA + more,
   fline + xa4 + ya4 + xb4 + yb7 + more,
   fline + xa3 + ya7 + xb4 + yb7,

   fline + xa0 + ya4 + xb0 + ybC + more,      // H
   fline + xa4 + ya4 + xb4 + ybC + more,
   fline + xa0 + ya8 + xb4 + yb8,

   fline + xa2 + ya4 + xb2 + ybC + more,      // I
   fline + xa0 + ya4 + xb4 + yb4 + more,
   fline + xa0 + yaC + xb4 + ybC,

   farc + xa2 + ya6 + aA + ax2 + ay2 + more,  // J
   fline + xa4 + ya6 + xb4 + ybC,

   fline + xa0 + ya4 + xb0 + ybC + more,      // K
   fline + xa4 + yaC + xb0 + yb8 + more,
   fline + xa4 + ya4 + xb0 + yb8,

   fline + xa0 + ya4 + xb0 + ybC + more,      // L
   fline + xa0 + ya4 + xb4 + yb4,

   fline + xa0 + ya4 + xb0 + ybC + more,      // M
   fline + xa4 + ya4 + xb4 + ybC + more,
   fline + xa2 + ya8 + xb0 + ybC + more,
   fline + xa2 + ya8 + xb4 + ybC,

   fline + xa0 + ya4 + xb0 + ybC + more,      // N
   fline + xa4 + ya4 + xb4 + ybC + more,
   fline + xa4 + ya4 + xb0 + ybC,

   farc + xa2 + yaA + a8 + ax2 + ay2 + more,  // 0
   farc + xa2 + ya6 + aA + ax2 + ay2 + more,
   fline + xa0 + ya6 + xb0 + ybA + more,
   fline + xa4 + ya6 + xb4 + ybA,

   farc + xa2 + yaA + aB + ax2 + ay2 + more,  // P
   fline + xa0 + ya4 + xb0 + ybC + more,
   fline + xa0 + ya8 + xb2 + yb8 + more,
   fline + xa0 + yaC + xb2 + ybC,

   farc + xa2 + yaA + a8 + ax2 + ay2 + more,  // Q
   farc + xa2 + ya6 + aA + ax2 + ay2 + more,
   fline + xa0 + ya6 + xb0 + ybA + more,
   fline + xa4 + ya6 + xb4 + ybA + more,
   fline + xa2 + ya6 + xb4 + yb3,

   farc + xa2 + yaA + aB + ax2 + ay2 + more,  // R
   fline + xa0 + ya4 + xb0 + ybC + more,
   fline + xa0 + ya8 + xb2 + yb8 + more,
   fline + xa0 + yaC + xb2 + ybC + more,
   fline + xa4 + ya4 + xb2 + yb8,

   farc + xa2 + yaA + a4 + ax2 + ay2 + more,  // S
   farc + xa2 + ya6 + a6 + ax2 + ay2,

   fline + xa2 + ya4 + xb2 + ybC + more,      // T
   fline + xa0 + yaC + xb4 + ybC,

   farc + xa2 + ya6 + aA + ax2 + ay2 + more,  // U
   fline + xa0 + ya6 + xb0 + ybC + more,
   fline + xa4 + ya6 + xb4 + ybC,

   fline + xa2 + ya4 + xb0 + ybC + more,      // V
   fline + xa2 + ya4 + xb4 + ybC,

   fline + xa0 + yaC + xb0 + yb4 + more,      // W
   fline + xa4 + yaC + xb4 + yb4 + more,
   fline + xa2 + ya8 + xb0 + yb4 + more,
   fline + xa2 + ya8 + xb4 + yb4,

   fline + xa4 + ya4 + xb0 + ybC + more,      // X
   fline + xa0 + ya4 + xb4 + ybC,

   fline + xa0 + yaC + xb2 + yb8 + more,      // Y
   fline + xa4 + yaC + xb2 + yb8 + more,
   fline + xa2 + ya4 + xb2 + yb8,

   fline + xa0 + yaC + xb4 + ybC + more,      // Z
   fline + xa0 + ya4 + xb4 + ybC + more,
   fline + xa0 + ya4 + xb4 + yb4,

   fline + xa2 + yaD + xb2 + yb3 + more,      // [
   fline + xa2 + yaD + xb4 + ybD + more,
   fline + xa2 + ya3 + xb4 + yb3,

   fline + xa4 + ya4 + xb0 + ybC,             // \

   fline + xa2 + yaD + xb2 + yb3 + more,      // [
   fline + xa2 + yaD + xb0 + ybD + more,
   fline + xa2 + ya3 + xb0 + yb3

/*
   ,

   fline + xa2 + yaA + xb0 + yb6 + more,      // ^
   fline + xa2 + yaA + xb4 + yb6,

   fline + xa0 + ya1 + xa4 + yb1,             // _

   fline + xa1 + ya9 + xb3 + yb7,             // `

   farc + xa2 + ya6 + a0 + ax2 + ay2 + more,  // a
   fline + xa4 + ya4 + xb4 + yb8,

   farc + xa2 + ya6 + a0 + ax2 + ay2 + more,  // b
   fline + xa0 + ya4 + xb0 + ybC,

   farc + xa2 + ya6 + a9 + ax2 + ay2 + more,  // c
   fline + xa2 + ya4 + xb4 + yb4 + more,
   fline + xa2 + ya8 + xb4 + yb8,

   farc + xa2 + ya6 + a0 + ax2 + ay2 + more,  // d
   fline + xa4 + ya4 + xb4 + ybC,

   farc + xa2 + ya6 + a4 + ax2 + ay2 + more,  // e
   fline + xa0 + ya6 + xb4 + yb6 + more,
   fline + xa2 + ya4 + xb4 + yb4,

   farc + xa4 + yaA + aD + ax2 + ay2 + more,  // f
   fline + xa0 + ya8 + xb4 + yb8 + more,
   fline + xa2 + ya4 + xb2 + ybA,

   farc + xa2 + ya6 + a0 + ax2 + ay2 + more,  // g
   farc + xa2 + ya3 + aF + ax2 + ay2 + more,
   fline + xa4 + ya3 + xb4 + yb8 + more,
   fline + xa1 + ya1 + xb2 + yb1,

   farc + xa2 + ya6 + a8 + ax2 + ay2 + more,  // h
   fline + xa0 + ya4 + xb0 + ybC + more,
   fline + xa4 + ya4 + xb4 + yb6,

   fline + xa1 + ya4 + xb3 + yb4 + more,      // i
   fline + xa2 + ya4 + xb2 + yb8 + more,
   fline + xa1 + ya8 + xb2 + yb8 + more,
   fline + xa2 + yaB + xb2 + ybA,

   farc + xa0 + ya3 + aF + ax2 + ay2 + more,  // j
   fline + xa2 + ya3 + xb2 + yb8 + more,
   fline + xa1 + ya8 + xb2 + yb8 + more,
   fline + xa2 + yaB + xb2 + ybA,

   fline + xa0 + ya4 + xb0 + ybC + more,      // k
   fline + xa0 + ya6 + xb2 + yb6 + more,
   fline + xa2 + ya6 + xb4 + yb8 + more,
   fline + xa2 + ya6 + xb4 + yb4,

   fline + xa1 + ya4 + xb3 + yb4 + more,      // l
   fline + xa2 + ya4 + xb2 + ybC + more,
   fline + xa1 + yaC + xb2 + ybC,

   farc + xa1 + ya7 + a8 + ax1 + ay1 + more,  // m
   farc + xa3 + ya7 + a8 + ax1 + ay1 + more,
   fline + xa0 + ya4 + xb0 + yb8 + more,
   fline + xa2 + ya4 + xb2 + yb7 + more,
   fline + xa4 + ya4 + xb4 + yb7,

   farc + xa2 + ya6 + a8 + ax2 + ay2 + more,  // n
   fline + xa0 + ya4 + xb0 + yb8 + more,
   fline + xa4 + ya4 + xb4 + yb6,

   farc + xa2 + ya6 + a0 + ax2 + ay2,         // o

   farc + xa2 + ya6 + a0 + ax2 + ay2 + more,  // p
   fline + xa0 + ya1 + xb0 + yb8,

   farc + xa2 + ya6 + a0 + ax2 + ay2 + more,  // q
   fline + xa4 + ya1 + xb4 + yb8,

   farc + xa2 + ya7 + a8 + ax2 + ay1 + more,  // r
   fline + xa0 + ya4 + xb0 + yb8,

   farc + xa2 + ya7 + a9 + ax2 + ay1 + more,  // s
   farc + xa2 + ya5 + aB + ax2 + ay1 + more,
   fline + xa0 + ya4 + xb2 + yb4 + more,
   fline + xa2 + ya8 + xb4 + yb8,

   farc + xa4 + ya6 + aE + ax2 + ay2 + more,  // t
   fline + xa0 + ya8 + xb4 + yb8 + more,
   fline + xa2 + ya6 + xb2 + ybA,

   farc + xa2 + ya6 + aA + ax2 + ay2 + more,  // u
   fline + xa0 + ya6 + xb0 + yb8 + more,
   fline + xa4 + ya4 + xb4 + yb8,

   fline + xa0 + ya8 + xb2 + yb4 + more,      // v
   fline + xa4 + ya8 + xb2 + yb4,

   farc + xa1 + ya5 + aA + ax1 + ay1 + more,  // w
   farc + xa3 + ya5 + aA + ax1 + ay1 + more,
   fline + xa0 + ya5 + xb0 + yb8 + more,
   fline + xa2 + ya5 + xb2 + yb6 + more,
   fline + xa4 + ya5 + xb4 + yb8,

   fline + xa0 + ya8 + xb4 + yb4 + more,      // x
   fline + xa0 + ya4 + xb4 + yb8,

   farc + xa2 + ya6 + aA + ax2 + ay2 + more,  // y
   farc + xa2 + ya3 + aF + ax2 + ay2 + more,
   fline + xa4 + ya3 + xb4 + yb8 + more,
   fline + xa0 + ya6 + xb0 + yb8 + more,
   fline + xa1 + ya1 + xb2 + yb1,

   fline + xa0 + ya8 + xb4 + yb8 + more,      // z
   fline + xa4 + ya8 + xb0 + yb4 + more,
   fline + xa0 + ya4 + xb4 + yb4,

   farc + xa3 + yaA + aD + ax1 + ay3 + more,  // {
   farc + xa1 + ya6 + aC + ax1 + ay2 + more,
   farc + xa1 + yaA + aF + ax1 + ay2 + more,
   farc + xa3 + ya6 + aE + ax1 + ay3,

   fline + xa2 + ya3 + xb2 + ybD,             // |

   farc + xa1 + yaA + aC + ax1 + ay3 + more,  // }
   farc + xa3 + ya6 + aD + ax1 + ay2 + more,
   farc + xa3 + yaA + aE + ax1 + ay2 + more,
   farc + xa1 + ya6 + aF + ax1 + ay3,

   farc + xa1 + ya8 + a8 + ax1 + ay1 + more,  // ~
   farc + xa3 + ya8 + aA + ax1 + ay1,

// Vector font - custom characters ($7F+)

   fline + xa2 + ya9 + xb0 + yb4 + more,      // delta
   fline + xa2 + ya9 + xb4 + yb4 + more,
   fline + xa0 + ya4 + xb4 + yb4,

   farc + xa2 + ya7 + a8 + ax2 + ay2 + more,  // omega
   farc + xa1 + ya7 + aE + ax1 + ay2 + more,
   farc + xa3 + ya7 + aF + ax1 + ay2 + more,
   fline + xa1 + ya5 + xb1 + yb4 + more,
   fline + xa3 + ya5 + xb3 + yb4 + more,
   fline + xa0 + ya4 + xb1 + yb4 + more,
   fline + xa4 + ya4 + xb3 + yb4,

   farc + xa2 + ya8 + a0 + ax1 + ay1          // bullet

*/

};


// Set bitmap parameters
//
//   x_origin       - relative-x center pixel
//   y_origin       - relative-y center pixel
//   n_tiles        - number of tiles in tile space
//   tile_ptr       - tile space pointer (16 * n_tiles longs)
//                    must be 64 byte aligned
//
// NOTE: you do not need to provide x_tiles, y_tiles, or the mode
//       or the tile map - this function gets them automatically.
//
void g_setup(int x_org, int y_org, int n_tiles, void *tile_ptr) {

   register int *arg_ptr = G_VAR.ARGS;
   int x_tiles;
   int y_tiles;
   int mode;
   short *tile;
   short *tile_list;
   short *off_ptr;
   short *on_ptr;
   short *map_ptr;
   int   *vga_ptr;
   int tpm_tiles;
   int i;
   int x;
   int y;
   int map_padded;

   x_tiles = cgi_x_tiles();
   y_tiles = cgi_y_tiles();

   _vgi_cog = _locate_plugin(LMM_VGI) + 0x80;
   _vdb_cog = _locate_plugin(LMM_VDB) + 0x80;

   _display_base = (char *) cgi_display_base();

   // used to calulate offsets (more efficient than using VGI_ONSCRN etc)
   map_padded = MAP_PADDED; 

   off_ptr = (short *)(_display_base);
   on_ptr  = (short *)(_display_base - map_padded);
   map_ptr = (short *)(_display_base + map_padded);
   vga_ptr = (int   *)(_display_base + 2*map_padded + 4);

   
   mode = *((int *)(_display_base + 2*map_padded));

   tile = (short *)tile_ptr;

   // zero the entire tile space - including the special first tile
   memset(tile_ptr, '\0', 64*n_tiles);
     
   tile_list = NULL;

   // the first tile is a special 'all zero' tile - put remaining 
   // tiles in a linked list of free tiles
   for (i = 1; i < n_tiles; i++) {
     tile[i * 32] = (int)tile_list;
     tile_list = tile + (i * 32);
   }

   // init map (used to map virtual address to tile addresses)
   for (x = 0; x < x_tiles; x++) {
     for (y = 0; y < y_tiles; y++) {
       map_ptr[x*y_tiles + y] = (short)(long)(off_ptr + (y*x_tiles + x));
     }
   }
    
  // init tpm (initially all entries point to special 
  // 'all 0' tile, and have colour 0)
   tpm_tiles = x_tiles*y_tiles;  // number of words in tile pointer map
   for (i =  0; i < tpm_tiles; i++) {
      // init tile screen to all blanks (tile 0)
      off_ptr[i] = (short)((long)tile_ptr)>>6;
   }

   for (i = 0; i < min(x_tiles,50); i++) {
      G_VAR.BASES[i] = i*(y_tiles<<6);
   }
              
   G_VAR.MODE         = mode;
   G_VAR.X_TILES      = x_tiles;
   G_VAR.Y_TILES      = y_tiles;
   G_VAR.ONSCRN_BASE  = on_ptr;
   G_VAR.OFFSCRN_BASE = off_ptr;
   G_VAR.MAP_BASE     = map_ptr;
   G_VAR.TILE_LIST    = tile_list;
   G_VAR.TILE_0       = tile_ptr;
   G_VAR.PIXEL_WIDTH  = 0;
   G_VAR.TEXT_XS      = 0;
   G_VAR.TEXT_YS      = 0;
   G_VAR.TEXT_SP      = 0;
   G_VAR.TEXT_JUST    = 0;

   y_tiles = y_tiles << 4;
   y_org = y_tiles - y_org - 1;

   G_VAR.COLORS[0] = 0x00000000;
   if (mode == 0) {
      // 2 color mode
      G_VAR.COLORS[1] = 0xFFFFFFFF;
      G_VAR.COLORS[2] = 0xFFFFFFFF;
      G_VAR.COLORS[3] = 0xFFFFFFFF;
   }
   else {
      // 4 color mode
      G_VAR.COLORS[1] = 0x55555555;
      G_VAR.COLORS[2] = 0xAAAAAAAA;
      G_VAR.COLORS[3] = 0xFFFFFFFF;
   }

   *arg_ptr++ = mode;
   *arg_ptr++ = x_tiles;
   *arg_ptr++ = y_tiles;
   *arg_ptr++ = x_org;
   *arg_ptr++ = y_org;
#if defined(__CATALINA_TINY) || defined(__CATALINA_COMPACT)
   // passing the font pointer during setup is a special for Catalina
   *arg_ptr++ = (int)font; 
#else
   // font data has to exist in hub RAM when using XMM
   for (i = 0; i < FONT_WORDS ; i++) {
      G_VAR.FONT[i] = font[i];
   }
   *arg_ptr++ = (int)G_VAR.FONT; // font data address in Hub RAM
#endif
   *arg_ptr++ = (int)map_ptr;
   *arg_ptr++ = (int)tile_ptr;
   *arg_ptr++ = (int)&G_VAR.TILE_LIST;
   *arg_ptr++ = (int)G_VAR.BASES;
   *arg_ptr   = (int)G_VAR.SLICES;

   _setcommand(VGI_setup, (long)G_VAR.ARGS);

   // setup double buffering support driver, but set 
   // it to disabled - it can be enabled later 
   g_db_setup(0);

   // enable graphics
   *(vga_ptr + 1) = 1;
  
   

}


