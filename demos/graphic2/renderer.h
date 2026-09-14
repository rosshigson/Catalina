
//renderer.h

#include <stdint.h>
#include <math.h>
#include <graphic2.h>

extern int32_t screen_width;
extern int32_t screen_height;

#define round(f) (f>=0.0 ? ceil(f) : -ceil(-f))

//assing a colour to a single pixel
int draw_pixel(int x, int y, uint32_t colour);

int draw_line(int x1, int y1, int x2, int y2, uint32_t colour);

//assign a colour to all pixels
void clear_pixels(uint32_t colour);

