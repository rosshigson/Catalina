/*
 * $Id: getcolor.c,v 0.1 1993/12/10 00:15:31 king Exp king $
 * Returns the current drawing colour.
 *
 * $Log: getcolor.c,v $
 * Revision 0.1  1993/12/10  00:15:31  king
 * Initial version.
 *
 */
#include "graphics.h"

int getcolor(void)
{
        XGCValues values;
        bgi_info *BGIptr;
        int i;

        XGetGCValues(dpy, gc, GCForeground, &values);
        for (i = 0, BGIptr = vga_palette; i <= MAXCOLORS; i++, BGIptr++) {
                if (values.foreground == BGIptr->pixel_value)
                        return BGIptr->colour_index;
        }
	return 0;	/* this should not happen */
}
