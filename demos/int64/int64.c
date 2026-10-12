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

#define jslo16(a)        ((a) & 0x0000FFFF)
#define jshi16(a)        ((uint32_t)(a) >> 16)

/*** BeginHeader jsll_mul */
/*** EndHeader */
void jsll_mul(Uint64 *rp, Uint64 a, Uint64 b)
{
    jsll_mul32(rp, a.lo, b.lo);
    rp->hi += a.hi * b.lo + a.lo * b.hi;
}

/*** BeginHeader jsll_mul32 */
/*** EndHeader */
void jsll_mul32(Uint64 *rp, Uint32 a, Uint32 b)
{
    Uint32 _a1, _a0, _b1, _b0, _y0, _y1, _y2, _y3;

    _a1 = jshi16(a), _a0 = jslo16(a);
    _b1 = jshi16(b), _b0 = jslo16(b);
    _y0 = _a0 * _b0;
    _y1 = _a0 * _b1;
    _y2 = _a1 * _b0;
    _y3 = _a1 * _b1;
    _y1 += jshi16(_y0);                         /* can't carry */
    _y1 += _y2;                                /* might carry */
    if (_y1 < _y2)
    {
        _y3 += (Uint32)(0x00010000);  /* propagate */
    }
    rp->lo = (jslo16(_y1) << 16) + jslo16(_y0);
    rp->hi = _y3 + jshi16(_y1);
}

/*** BeginHeader jsll_udivmod */
/*** EndHeader */
/*
** Divide 64-bit a by 32-bit b, which must be normalized so its high bit is 1.
*/
static void norm_udivmod32(Uint32 *qp, Uint32 *rp, Uint64 a, Uint32 b)
{
    Uint32 d1, d0, q1, q0;
    Uint32 r1, r0, m;

    d1 = jshi16(b);
    d0 = jslo16(b);
    r1 = a.hi % d1;
    q1 = a.hi / d1;
    m = q1 * d0;
    r1 = (r1 << 16) | jshi16(a.lo);
    if (r1 < m) {
        q1--, r1 += b;
        if (r1 >= b     /* i.e., we didn't get a carry when adding to r1 */
            && r1 < m) {
            q1--, r1 += b;
        }
    }
    r1 -= m;
    r0 = r1 % d1;
    q0 = r1 / d1;
    m = q0 * d0;
    r0 = (r0 << 16) | jslo16(a.lo);
    if (r0 < m) {
        q0--, r0 += b;
        if (r0 >= b
            && r0 < m) {
            q0--, r0 += b;
        }
    }
    *qp = (q1 << 16) | q0;
    *rp = r0 - m;
}

static uint_fast8_t CountLeadingZeros(Uint32 a)
{
    Uint32 t;
    uint_fast8_t r = 32;

    if ((t = a >> 16) != 0)
        r -= 16, a = t;
    if ((t = a >> 8) != 0)
        r -= 8, a = t;
    if ((t = a >> 4) != 0)
        r -= 4, a = t;
    if ((t = a >> 2) != 0)
        r -= 2, a = t;
    if ((t = a >> 1) != 0)
        r -= 1, a = t;
    if (a & 1)
        r--;
    return r;
}

void jsll_udivmod(Uint64 *qp, Uint64 *rp, Uint64 a, Uint64 b)
{
    Uint32 n0, n1, n2;
    Uint32 q0, q1;
    uint_fast8_t rsh, lsh;

    n0 = a.lo;
    n1 = a.hi;

    if (b.hi == 0) {
        if (b.lo > n1) {
            /* (0 q0) = (n1 n0) / (0 D0) */

            lsh = CountLeadingZeros(b.lo);

            if (lsh) {
                /*
                 * Normalize, i.e. make the most significant bit of the
                 * denominator be set.
                 */
                b.lo = b.lo << lsh;
                n1 = (n1 << lsh) | (n0 >> (uint_fast8_t)(32 - lsh));
                n0 = n0 << lsh;
            }

            a.lo = n0, a.hi = n1;
            norm_udivmod32(&q0, &n0, a, b.lo);
            q1 = 0;

            /* remainder is in n0 >> lsh */
        } else {
            /* (q1 q0) = (n1 n0) / (0 d0) */

            if (b.lo == 0)              /* user wants to divide by zero! */
                b.lo = 1 / b.lo;        /* so go ahead and crash */

            lsh = CountLeadingZeros(b.lo);

            if (lsh == 0) {
                /*
                 * From (n1 >= b.lo)
                 *   && (the most significant bit of b.lo is set),
                 * conclude that
                 *      (the most significant bit of n1 is set)
                 *   && (the leading quotient digit q1 = 1).
                 *
                 * This special case is necessary, not an optimization
                 * (Shifts counts of 32 are undefined).
                 */
                n1 -= b.lo;
                q1 = 1;
            } else {
                /*
                 * Normalize.
                 */
                rsh = 32 - lsh;

                b.lo = b.lo << lsh;
                n2 = n1 >> rsh;
                n1 = (n1 << lsh) | (n0 >> rsh);
                n0 = n0 << lsh;

                a.lo = n1, a.hi = n2;
                norm_udivmod32(&q1, &n1, a, b.lo);
            }

            /* n1 != b.lo... */

            a.lo = n0, a.hi = n1;
            norm_udivmod32(&q0, &n0, a, b.lo);

            /* remainder in n0 >> lsh */
        }

        if (rp) {
            rp->lo = n0 >> lsh;
            rp->hi = 0;
        }
    } else {
        if (b.hi > n1) {
            /* (0 0) = (n1 n0) / (D1 d0) */

            q0 = 0;
            q1 = 0;

            /* remainder in (n1 n0) */
            if (rp) {
                rp->lo = n0;
                rp->hi = n1;
            }
        } else {
            /* (0 q0) = (n1 n0) / (d1 d0) */

            lsh = CountLeadingZeros(b.hi);
            if (lsh == 0) {
                /*
                 * From (n1 >= b.hi)
                 *   && (the most significant bit of b.hi is set),
                 * conclude that
                 *      (the most significant bit of n1 is set)
                 *   && (the quotient digit q0 = 0 or 1).
                 *
                 * This special case is necessary, not an optimization.
                 */

                /*
                 * The condition on the next line takes advantage of that
                 * n1 >= b.hi (true due to control flow).
                 */
                if (n1 > b.hi || n0 >= b.lo) {
                    q0 = 1;
                    a.lo = n0, a.hi = n1;
                    LL_SUB(a, a, b);
                } else {
                    q0 = 0;
                }
                q1 = 0;

                if (rp) {
                    rp->lo = n0;
                    rp->hi = n1;
                }
            } else {
                Int64 m;

                /*
                 * Normalize.
                 */
                rsh = 32 - lsh;

                b.hi = (b.hi << lsh) | (b.lo >> rsh);
                b.lo = b.lo << lsh;
                n2 = n1 >> rsh;
                n1 = (n1 << lsh) | (n0 >> rsh);
                n0 = n0 << lsh;

                a.lo = n1, a.hi = n2;
                norm_udivmod32(&q0, &n1, a, b.hi);
                jsll_mul32(&m, q0, b.lo);

                if ((m.hi > n1) || ((m.hi == n1) && (m.lo > n0))) {
                    q0--;
                    LL_SUB(m, m, b);
                }

                q1 = 0;

                /* Remainder is ((n1 n0) - (m1 m0)) >> lsh */
                if (rp) {
                    a.lo = n0, a.hi = n1;
                    LL_SUB(a, a, m);
                    rp->lo = (a.hi << rsh) | (a.lo >> lsh);
                    rp->hi = a.hi >> lsh;
                }
            }
        }
    }

    if (qp) {
        qp->lo = q0;
        qp->hi = q1;
    }
}

/*** BeginHeader jsll_div */
/*** EndHeader */
void jsll_div( Uint64 *r, const Uint64 *a, const Uint64 *b)
{
    // since we may need to copy a and b (to negate them), pass them
    // as pointers
    Int64 _a, _b;
    bool_t _negative = (Int32)a->hi < 0;

    if (_negative)
    {
        LL_NEG(_a, *a);
    } else {
        _a = *a;
    }
    if ((Int32)b->hi < 0)
    {
        _negative ^= 1;
        LL_NEG(_b, *b);
    } else {
        _b = *b;
    }
    jsll_udivmod(r, NULL, _a, _b);
    if (_negative)
    {
        LL_NEG(*r, *r);
    }
}

/*** BeginHeader jsll_mod */
/*** EndHeader */
void jsll_mod( Uint64 *r, const Uint64 *a, const Uint64 *b)
{
    // since we may need to copy a and b (to negate them), pass them
    // as pointers
    Int64 _a, _b;
    bool_t _negative = (Int32)a->hi < 0;

    if (_negative) {
        LL_NEG(_a, *a);
    } else {
        _a = *a;
    }
    if ((Int32)b->hi < 0) {
        LL_NEG(_b, *b);
    } else {
        _b = *b;
    }
    jsll_udivmod(NULL, r, _a, _b);
    if (_negative)
    {
        LL_NEG(*r, *r);
    }
}

/*** BeginHeader jsll_shl */
/*** EndHeader */
void jsll_shl( Uint64 *r, Uint64 a, uint_fast8_t b)
{
    // pass a by value so we don't have to make a copy of it
    uint_fast8_t lowb;

    if (b) {
        lowb = b & 31;
        if (b < 32) {
            r->lo = a.lo << lowb;
            r->hi = (a.hi << lowb) | (a.lo >> (uint8_t)(32 - b));
        } else {
            r->lo = 0;
            r->hi = a.lo << lowb;
        }
    } else {
        *r = a;
    }
}

/*** BeginHeader jsll_shr */
/*** EndHeader */
void jsll_shr( Int64 *r, Int64 a, uint_fast8_t b)
{
    // pass a by value so we don't have to make a copy of it
    uint_fast8_t lowb;

    if (b) {
        lowb = b & 31;
        if (b < 32) {
            r->lo = (a.hi << (uint8_t)(32 - b)) | (a.lo >> lowb);
            r->hi = (Int32)a.hi >> lowb;
        } else {
            r->lo = (Int32)a.hi >> lowb;
            r->hi = (Int32)a.hi >> 31;
        }
    } else {
        *r = a;
    }
}

/*** BeginHeader jsll_ushr */
/*** EndHeader */
void jsll_ushr( Int64 *r, Int64 a, uint_fast8_t b)
{
    // pass a by value so we don't have to make a copy of it
    uint_fast8_t lowb;

    if (b) {
        lowb = b & 31;
        if (b < 32) {
            r->lo = (a.hi << (uint8_t)(32 - b)) | (a.lo >> lowb);
            r->hi = a.hi >> lowb;
        } else {
            r->lo = a.hi >> lowb;
            r->hi = 0;
        }
    } else {
        *r = a;
    }
}

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
    
int rhll_real_cmp(Uint64 a, const char *op, Uint64 b) {
  if (op[1] == 0) { // one character operator
    switch(op[0]) {
      case '<': return (((Int32)a.hi < (Int32)b.hi) || ((a.hi == b.hi) && ((Int32)a.lo < (Int32)b.lo)));
      case '>': return (((Int32)a.hi > (Int32)b.hi) || ((a.hi == b.hi) && ((Int32)a.lo > (Int32)b.lo)));
      default : break;
    }
  }
  else if (op[1] == '=') {
    switch(op[0]) { // two character operator
      case '!': return ((a.hi != b.hi) || (a.lo != b.lo));
      case '=': return ((a.hi == b.hi) && (a.lo == b.lo));
      case '<': return (((Int32)a.hi < (Int32)b.hi) || ((a.hi == b.hi) && ((Int32)a.lo <= (Int32)b.lo)));
      case '>': return (((Int32)a.hi > (Int32)b.hi) || ((a.hi == b.hi) && ((Int32)a.lo >= (Int32)b.lo)));
      default : break;
    }
  }
  return 0; // this is an error!
}

int rhll_real_ucmp(Uint64 a, const char *op, Uint64 b) {
  if (op[1] == 0) { // one character operator
    switch(op[0]) {
      case '<': return ((a.hi < b.hi) || ((a.hi == b.hi) && (a.lo < b.lo)));
      case '>': return ((a.hi > b.hi) || ((a.hi == b.hi) && (a.lo > b.lo)));
      default : break;
    }
  }
  else if (op[1] == '=') {
    switch(op[0]) { // two character operator
      case '!': return ((a.hi != b.hi) || (a.lo != b.lo));
      case '=': return ((a.hi == b.hi) && (a.lo == b.lo));
      case '<': return ((a.hi < b.hi) || ((a.hi == b.hi) && (a.lo <= b.lo)));
      case '>': return ((a.hi > b.hi) || ((a.hi == b.hi) && (a.lo >= b.lo)));
      default : break;
    }
  }
  return 0; // this is an error!
}

Uint64 _int64(uint32_t hi, uint32_t lo) {
  Uint64 c;
  c.hi = hi;
  c.lo = lo;
  return c;
}

Int64 _int32(int32_t lo) {
  Uint64 c;
  c.hi = (lo < 0) ? -1 : 0;
  c.lo = lo;
  return c;
}

Uint64 _uint32(uint32_t lo) {
  Uint64 c;
  c.hi = 0;
  c.lo = lo;
  return c;
}

Int64  _add64(Int64 a, Int64 b) {
  Int64 c;
  LL_ADD(c, a, b);
  return c;
}

Int64  _sub64(Int64 a, Int64 b) {
  Int64 c;
  LL_SUB(c, a, b);
  return c;
}

Int64  _mul64(Int64 a, Int64 b) {
  Int64 c;
  LL_MUL(c, a, b);
  return c;
}

Int64  _mul32(uint32_t a, uint32_t b) {
  Int64 c;
  LL_MUL32(c, a, b);
  return c;
}

Int64  _div64(Int64 a, Int64 b) {
  Int64 c;
  LL_DIV(c, a, b);
  return c;
}

Int64  _mod64(Int64 a, Int64 b) {
  Int64 c;
  LL_MOD(c, a, b);
  return c;
}

Int64 _neg64(Int64 a) {
  Int64 c;
  LL_NEG(c, a);
  return c;
}

Uint64 _and64(Uint64 a, Uint64 b) {
  Int64 c;
  LL_AND(c, a, b);
  return c;
}

Uint64 _or64(Uint64 a, Uint64 b) {
  Int64 c;
  LL_OR(c, a, b);
  return c;
}

Uint64 _xor64(Uint64 a, Uint64 b) {
  Int64 c;
  LL_XOR(c, a, b);
  return c;
}

Uint64 _not64(Uint64 a) {
  Int64 c;
  LL_NOT(c, a);
  return c;
}

Uint64 _shl32(uint32_t a, uint32_t b) {
  Uint64 c;
  LL_ISHL(c, a, b);
  return c;
}

Uint64 _shl64(Uint64 a, uint32_t b) {
  Uint64 c;
  LL_SHL(c, a, b);
  return c;
}

Uint64 _lsr64(Uint64 a, uint32_t b) {
  Uint64 c;
  LL_USHR(c, a, b);
  return c;
}

Int64 _asr64(Int64 a, uint32_t b) {
  Int64 c;
  LL_SHR(c, a, b);
  return c;
}


