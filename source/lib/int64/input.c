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

int rhll_STRDEC(Uint64 *v, char *buffer) {
   char *temp = buffer;
   char *p = buffer;
   int neg = 0;
   Uint64 ten = LL_INIT(0,10);
   v->lo = 0;
   v->hi = 0;
   if (*p == '+') {
     p++;
   }
   else if (*p == '-') {
     neg = 1;
     p++;
   }
   while (isdigit(*p)) {
      uint32_t digit = *p - '0';
      uint32_t t;
      Uint64 tmp = LL_INIT(0,0);
      LL_MUL(tmp, *v, ten);
      t = tmp.lo + digit;
      v->hi = tmp.hi + (t < tmp.lo);
      v->lo = t;
      p++;
   }
   if (neg) {
     int32_t lo = -(int32_t)(v->lo);
     v->lo = -(int32_t)(v->lo);
     v->hi = -(int32_t)(v->hi) - (lo != 0);
   }
   return (p - buffer);
}

int rhll_STRHEX(Uint64 *v, char *buffer) {
   char *p = buffer;
   v->lo = 0;
   v->hi = 0;
   while (isxdigit(*p)) {
      uint32_t dig = *p;
      uint32_t newdigit = ((dig <= '9') ? (dig-'0') : (toupper(dig)-'A'+10));
      uint32_t topdigit = v->lo>>28;
      v->hi = (v->hi<<4) + topdigit;
      v->lo = (v->lo<<4) + newdigit;
      p++;
   }
   return (p - buffer);
}
    

