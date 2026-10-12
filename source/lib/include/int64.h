/* This is a modified version of jslong.h Rev 3.13 from mozilla.org. It has
   been modified for inclusion in and distribution as part of Catalina. 

   The original file is available here:
      http://mxr.mozilla.org/mozilla/source/js/src/jslong.h

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

#ifndef __int64_H
#define __int64_H

#define IS_LITTLE_ENDIAN // Propeller is a little endian architecture

#include <stdbool.h>
#include <stdint.h>

typedef struct {
#ifdef IS_LITTLE_ENDIAN
         uint32_t lo, hi;
#else
         uint32_t hi, lo;
#endif
} Int64;

typedef Int64 Uint64;

typedef int32_t   Int32;
typedef uint32_t  Uint32;
typedef bool bool_t;

#ifdef IS_LITTLE_ENDIAN
#define LL_INIT(hi, lo) { lo, hi }
#else
#define LL_INIT(hi, lo) { hi, lo }
#endif

#define LL_IS_ZERO(a)         (((a).hi == 0) && ((a).lo == 0))
#define LL_EQ(a, b)           (((a).hi == (b).hi) && ((a).lo == (b).lo))
#define LL_NE(a, b)           (((a).hi != (b).hi) || ((a).lo != (b).lo))
#define LL_GE_ZERO(a)         (((a).hi >> 31) == 0)

#define LL_CMP(a, op, b)      rhll_real_cmp(a, #op, b)
#define LL_UCMP(a, op, b)     rhll_real_ucmp(a, #op, b)

int rhll_real_cmp(Int64 a, const char *op, Int64 b);
int rhll_real_ucmp(Uint64 a, const char *op, Uint64 b);

#define LL_AND(r, a, b)       ((r).lo = (a).lo & (b).lo, \
                                 (r).hi = (a).hi & (b).hi)
#define LL_OR(r, a, b)        ((r).lo = (a).lo | (b).lo, \
                                 (r).hi = (a).hi | (b).hi)
#define LL_XOR(r, a, b)       ((r).lo = (a).lo ^ (b).lo, \
                                 (r).hi = (a).hi ^ (b).hi)
#define LL_OR2(r, a)          ((r).lo = (r).lo | (a).lo, \
                                 (r).hi = (r).hi | (a).hi)
#define LL_NOT(r, a)          ((r).lo = ~(a).lo, \
                                 (r).hi = ~(a).hi)

#define LL_NEG(r, a)          ((r).lo = -(Int32)(a).lo, \
                                 (r).hi = -(Int32)(a).hi - ((r).lo != 0))
#define LL_ADD(r, a, b) { \
    Uint32 t; \
    t = (a).lo + (b).lo; \
    (r).hi = (a).hi + (b).hi + (t < (b).lo); \
    (r).lo = t; \
}

#define LL_SUB(r, a, b) { \
    (r).hi = (a).hi - (b).hi - ((a).lo < (b).lo); \
    (r).lo = (a).lo - (b).lo; \
}

#define LL_MUL(r, a, b)             jsll_mul( &(r), a, b)
void jsll_mul(Uint64 *rp, Uint64 a, Uint64 b);

#define LL_MUL32(r, a, b)           jsll_mul32( &(r), a, b)
void jsll_mul32(Uint64 *rp, Uint32 a, Uint32 b);

#define LL_UDIVMOD(qp, rp, a, b)    jsll_udivmod(qp, rp, a, b)
void jsll_udivmod(Uint64 *qp, Uint64 *rp, Uint64 a, Uint64 b);

#define LL_DIV(r, a, b)             jsll_div( &(r), &(a), &(b))
void jsll_div( Uint64 *r, const Uint64 *a, const Uint64 *b);

#define LL_MOD(r, a, b)             jsll_mod( &(r), &(a), &(b))
void jsll_mod( Uint64 *r, const Uint64 *a, const Uint64 *b);

/* a is an Int32, b is Int32, r is Int64 */
#define LL_ISHL(r, a, b) { \
    if (b) { \
        if ((b) < 32) { \
            (r).lo = (a) << ((b) & 31); \
            (r).hi = ((a) >> (32 - (b))); \
        } else { \
            (r).lo = 0; \
            (r).hi = (a) << ((b) & 31); \
        } \
    } else { \
        (r).lo = (a); \
        (r).hi = 0; \
    } \
}

#define LL_SHL(r, a, b)             jsll_shl( &(r), a, b)
#define LL_SHR(r, a, b)             jsll_shr( &(r), a, b)
#define LL_USHR(r, a, b)            jsll_ushr( &(r), a, b)

void jsll_shl( Uint64 *r, Uint64 a, uint_fast8_t b);
void jsll_shr( Int64 *r, Int64 a, uint_fast8_t b);
void jsll_ushr( Uint64 *r, Uint64 a, uint_fast8_t b);

#define LL_L2I(i, l)        ((i) = (l).lo)
#define LL_L2UI(ui, l)      ((ui) = (l).lo)
#define LL_L2F(f, l)        { double _d; LL_L2D(_d, l); (f) = (float)_d; }

#define LL_L2D(d, l) { \
    bool_t _negative; \
    Int64 _absval; \
 \
    _negative = (Int32)(l).hi < 0; \
    if (_negative) { \
        LL_NEG(_absval, l); \
    } else { \
        _absval = l; \
    } \
    (d) = (double)_absval.hi * 4.294967296e9 + _absval.lo; \
    if (_negative) \
        (d) = -(d); \
}

#define LL_I2L(l, i)        {(l).lo = (i); (l).hi = (Int32)(i) >> 31; }
#define LL_UI2L(l, ui)      ((l).lo = (ui), (l).hi = 0)
#define LL_F2L(l, f)        { double _d = (double)f; LL_D2L(l, _d); }

#define LL_D2L(l, d) { \
    int _negative; \
    double _absval, _d_hi; \
    Int64 _lo_d; \
 \
    _negative = ((d) < 0); \
    _absval = _negative ? -(d) : (d); \
 \
    (l).hi = _absval / 4.294967296e9; \
    (l).lo = 0; \
    LL_L2D(_d_hi, l); \
    _absval -= _d_hi; \
    _lo_d.hi = 0; \
    if (_absval < 0) { \
    _lo_d.lo = -_absval; \
    LL_SUB(l, l, _lo_d); \
    } else { \
    _lo_d.lo = _absval; \
    LL_ADD(l, l, _lo_d); \
    } \
 \
    if (_negative) \
    LL_NEG(l, l); \
}

#define LL_HEXSTR(s, a)        jsll_hexstr( s, &(a))
#define LL_DECSTR(s, a)        jsll_decstr( s, &(a))
#define LL_UDECSTR(s, a)       jsll_udecstr( s, &(a))

int jsll_hexstr( char *buffer, const Int64 *v);
int jsll_decstr( char *buffer, const Int64 *v);
int jsll_udecstr( char *buffer, const Uint64 *v);

#define LL_STRHEX(a,s)         rhll_STRHEX( &(a), s)
#define LL_STRDEC(a,s)         rhll_STRDEC( &(a), s)

int rhll_STRHEX(Uint64 *v, char *buffer);
int rhll_STRDEC(Uint64 *v, char *buffer);

// macros to return lower or upper 32 bit values (always unsigned)
#define _low(a) (a.lo)
#define _high(a) (a.hi)

/*
 * Infix functions - note that the Uint64 vs Int64 declarations make no 
 * actual difference - they are used to indicates how the arguments and 
 * results should be interpreted.
 */
Uint64 _int64(uint32_t hi, uint32_t lo); // hi and lo are both UNSIGNED

Int64  _int32(int32_t lo);     // lo is SIGNED
Uint64 _uint32(uint32_t lo);   // lo is UNSIGNED

Int64  _add64(Int64 a, Int64 b);
Int64  _sub64(Int64 a, Int64 b);
Int64  _mul64(Int64 a, Int64 b);
Int64  _mul32(uint32_t a, uint32_t b);
Int64  _div64(Int64 a, Int64 b);
Int64  _mod64(Int64 a, Int64 b);
Int64  _neg64(Uint64 a);

Uint64 _and64(Uint64 a, Uint64 b);
Uint64 _or64(Uint64 a, Uint64 b);
Uint64 _xor64(Uint64 a, Uint64 b);
Uint64 _not64(Uint64 a);

Uint64 _shl32(uint32_t a, uint32_t b);
Uint64 _shl64(Uint64 a, uint32_t b);
Uint64 _lsr64(Uint64 a, uint32_t b);
Int64  _asr64(Int64 a, uint32_t b);

#endif /* __int64_H */
