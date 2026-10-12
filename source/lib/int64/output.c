/* This is a modified version of jslong.c Rev 3.11 from mozilla.org. It has
   been modified for inclusion in and distribution as part of Catalina. 

   The original file is available here:
      http://mxr.mozilla.org/mozilla/source/js/src/jslong.c

  As permitted by the original version, this version is issued under the 
  Lesser GNU General Public License - see the file COPYING for details.

  This program is free software: you can redistribute it and/or modify it 
  under the terms of the GNU General Public License as published by the Free 
  Software Foundation, either version 3 of the License, or (at your option) 
  any later version.

  This program is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for 
  more details.

  You should have received a copy of the GNU General Public License along with
  this program. If not, see <https://www.gnu.org/licenses/>.
*/

#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "int64.h"

/*** BeginHeader jsll_decstr */
/*** EndHeader */
int jsll_decstr( char *buffer, const Int64 *v)
{
    if ((Int32)v->hi < 0)
    {
        Uint64 _abs;

        LL_NEG( _abs, *v);
        *buffer = '-';
        return jsll_udecstr( buffer + 1, &_abs);
    }

    return jsll_udecstr( buffer, v);
}

/*** BeginHeader jsll_udecstr */
/*** EndHeader */
// Technique is to convert 4 characters at a time, since 16-bit divide is less
// expensive on embedded platforms.  Limits number of 64-bit divides to 5.
// On platforms with efficient 32-bit divide, this method could be modified
// to divide by 1 billion and convert 9 digits at a time.
int jsll_udecstr( char *buffer, const Uint64 *v)
{
    char temp[20];      // maximum of 20 digits, don't need pointer for null
    char *p;
    int length;
    uint_fast8_t i;
    bool_t fill;
    Uint64 quot, rem;
    uint16_t rem16;
    const Uint64 divisor = LL_INIT( 0, 10000);

    quot = *v;
    if (LL_IS_ZERO( quot))
    {
        strcpy( buffer, "0");
        return 1;
    }

    p = temp;
    do
    {
        jsll_udivmod( &quot, &rem, quot, divisor);
        rem16 = (uint16_t) rem.lo;
        fill = ! LL_IS_ZERO( quot);
        for (i = 4; i && (fill || rem16); ++p, --i)
        {
            *p = '0' + (rem16 % 10);
            rem16 /= 10;
        }
    } while (fill);

    length = p - temp;
    // copy <length> characters from <temp> to <buffer>, in reverse order
    for (i = (uint_fast8_t) length; i; ++buffer, --i)
    {
        *buffer = *--p;
    }
    *buffer = '\0';     // add null terminator

    return length;
}

int jsll_hexstr( char *buffer, const Int64 *v)
{
    static char hexdigit[17] = "0123456789abcdef";
    char temp[16];      // always exactly 16 digits
    char *p;
    register uint32_t hex;
    register int i;

    if (LL_IS_ZERO(*v))
    {
        strcpy( buffer, "0000000000000000");
        return 16;
    }

    p = temp;
    hex = (uint32_t) v->lo;
    for (i = 0; i < 8; i++) {
       *p++ = hexdigit[hex&0xF];
       hex >>= 4;
    }
    hex = (uint32_t) v->hi;
    for (i = 0; i < 8; i++) {
       *p++ = hexdigit[hex&0xF];
       hex >>= 4;
    }
    // copy 16 characters from <temp> to <buffer>, in reverse order
    for (i = 16; i; ++buffer, --i)
    {
        *buffer = *--p;
    }
    *buffer = '\0';     // add null terminator

    return 16;

}


