/* 
 * $Id: getarccoords.c,v 0.1 1993/12/10 00:13:38 king Exp king $
 * Gets coordinates of the last call to arc().
 *
 * $Log: getarccoords.c,v $
 * Revision 0.1  1993/12/10  00:13:38  king
 * Initial version.
 *
 */
#include "graphics.h"

void getarccoords(arccoordstype *arccoords)
{
        memcpy(arccoords, &last_arc, sizeof(arccoordstype));
}
