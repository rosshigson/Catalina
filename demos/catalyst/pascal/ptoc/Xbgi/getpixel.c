/*
 * $Id: getpixel.c,v 0.1 1993/12/10 00:15:31 king Exp king $
 * Gets the colour of a specified pixel.
 *
 * $Log: getpixel.c,v $
 * Revision 0.1  1993/12/10  00:15:31  king
 * Initial version.
 *
 */
#include "graphics.h"

unsigned int getpixel(int x, int y)
{
	XImage *ximage;
	unsigned long pixel;
	ximage = XGetImage(dpy, window, x, y, 1, 1, plane_masks, XYPixmap);
	pixel = XGetPixel(ximage, 0, 0);	
	XDestroyImage(ximage);
	return ((pixel & plane_mask[0]) ? 1 : 0) + 
	       ((pixel & plane_mask[1]) ? 2 : 0) + 
	       ((pixel & plane_mask[2]) ? 4 : 0) + 
	       ((pixel & plane_mask[3]) ? 8 : 0); 
}



