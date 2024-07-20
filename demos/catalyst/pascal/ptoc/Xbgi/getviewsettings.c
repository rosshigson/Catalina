/*
 * $Id: getviewsettings.c,v 0.1 1993/12/10 00:15:31 king Exp king $
 * Gets information about the current viewport.
 *
 * $Log: getviewsettings.c,v $
 * Revision 0.1  1993/12/10  00:15:31  king
 * Initial version.
 *
 */
#include "graphics.h"

void getviewsettings(viewporttype *viewport)
{
        memcpy(viewport, &view_settings, sizeof(viewporttype));
}
