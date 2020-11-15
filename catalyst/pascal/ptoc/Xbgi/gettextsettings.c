/*
 * $Id: gettextsettings.c,v 0.1 1993/12/10 00:15:31 king Exp king $
 * Gets information about the current graphics text font.
 *
 * $Log: gettextsettings.c,v $
 * Revision 0.1  1993/12/10  00:15:31  king
 * Initial version.
 *
 */
#include "graphics.h"

void gettextsettings(textsettingstype *texttypeinfo)
{
    *texttypeinfo = txt_settings;
}
