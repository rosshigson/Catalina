
//renderer.c

#include "renderer.h"

int draw_line(int x1, int y1, int x2, int y2, uint32_t colour) {


  g_colorwidth(colour&3,1);
  g_plot(x1,screen_height-y1);
  g_line(x2,screen_height-y2);

	return 0;	
}

int draw_pixel(int x, int y, uint32_t colour) {
	
	//dont draw any pixels that are outside of the pixel buffer
	if (x < 0 || y < 0) {
			
		return 1;
	}
	
	//dont draw any pixels that are outside of the pixel buffer
	if (x >= screen_width || y >= screen_height) {
			
		return 1;
	}

  g_colorwidth(colour&3,1);
  g_plot(x,screen_height-y);

	return 0;
}

