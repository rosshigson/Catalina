Portable 64 bit bit integer support
===================================

This directory contains macros and functions that provide support for 64-bit
integers (aka long longs) for platforms that do not have native 64-bit integer
support, such as Catalina. The Propeller is basically a 32 bit platform, where
64 bit integers have little use. But (for example) the system counter is a 64
bit value (which must be fetched as two 32 bit values), so this implementation
is very suitable in that instance, and a function to get the Propeller clock
as a 64 bit value is provided in the example programs.

The 64 bit integers are implemented using a structure of two 32 bit integers,
with full arithmetic and bitwise operations, plus facilities for converting
64-bit values to and from strings.

The 64 bit integer support functions themselves (i.e. the versions in this
directory in int64.h and int64.c, and the versions in Catalina's libint64 
library) are licensed under the Lesser GNU General Public license. See the
file COPYING for full details.

Portions of the test harness in this directory (which are not included
in the Catalina libint64 library) are licensed under the Mozilla Public 
License, v. 2.0 (see http://mozilla.org/MPL/2.0/).

The basic 64 bit types are called Int64 (intended to be used to hold signed
values) and Uint64 (intended for unsigned values). However, these types are
in fact identical - whether the values are treated as signed or unsigned is 
determined by the operations performed on them, not on how they are declared.

On platforms where 64 bit numeric literals are not supported, 64 bit values 
can be initialized using 2 x 32 bit literals, one for the upper 32 bits, and 
the other for the lower 32 bits, using the LL_INIT macro. For example:

   Int64 a = LL_INIT(0x12345678, 0x90abcdef); // i.e. a = 0x01234567890abcdef

However, note that the LL_INIT macro can only be used as an initializer in a 
variable declaration, and not in variable assignments (but see the "operator"
functions described below).

64-bit values can also be initialized by parsing hex or decimal strings:

   Int64 a, b;
   LL_STRHEX(a, "1234567890absdef");
   LL_STRDEC(b, "-123456789000");

They can also be initialized by converting floating point values:

   Int64 c;
   LL_D2L(c, 1.0e10);

The following comparison operations are supported:

   LL_IS_ZERO(a)         a == 0
   LL_EQ(a,b)            a == b
   LL_NE(a,b)            a != b
   LL_GE_ZERO(a)         a >= 0
   LL_CMP(a,op,b)        a op b   signed comparison    e.g. LL_CMP(a, <, b)
   LL_UCMP(a,op,b)       a op b   unsigned comparison  e.g. LL_UCMP(a, >=, b)

The following bitwise operations are supported:

   LL_AND(r,a,b)         r = a & b
   LL_OR(r,a,b)          r = a | b
   LL_XOR(r,a,b)         r = a ^ b
   LL_OR2(r,a)           r = r | a
   LL_NOT(r,a)           r = ~a

The following arithmetic operations are supported:

   LL_NEG(r, a)          r = -a
   LL_ADD(r,a,b)         r = a + b
   LL_SUB(r,a,b)         r = a - b
   LL_MUL(r,a,b)         r = a * b   a and b are 64 bit values
   LL_MUL32(r,a,b)       r = a * b   a and b are 32 bit values
   LL_UDIVMOD(qp,rp,a,b) *qp = a / b, *qr = a % b  unsigned division & modulus
   LL_DIV(r,a,b)         r = a / b   signed division
   LL_MOD(r,a,b)         r = a % b   signed modulus

The following shift operations are supported:

   LL_ISHL(r,a,b)        r = a << b   shift left, a is 32 bits, b is [0..64]
   LL_SHL(r,a,b)         r = a << b   shift left, a is 64 bits, b is [0..64]
   LL_SHR(r,a,b)         r = a >> b   signed(arithmetic) shift right
                                      a is 64 bits, b is [0..64]
   LL_USHR(r,a,b)        r = a >> b   unsigned(logical) shift right
                                      a is 64 bits, b is [0..64]

The following conversion operations are supported:

   LL_L2I(i, l)          l = (integer)i    Int64 to integer
   LL_L2UI(ui,l)         ui = (unsigned)l  Uint64 to unsigned
   LL_L2D(d,l)           d = (double)l     Int64 to double
   LL_D2L(l, d)          l = (Int64)d      double to Int64
   LL_UI2L(l,ui)         l = (Uint64)ui    usigned to Int64

The following string operations are supported:

   LL_HEXSTR(s,a)        write hex value of a to s (s >= 16 chars)
   LL_DECSTR(a,a)        write signed decimal value of a to s (s >= 20 chars)
   LL_UDECSTR(a,a)       write unsigned decimal value of a to s (s >= 20 chars)
   
   LL_STRHEX(a,s)        read a hex value from s to a 
                         (s <= 16 hex digits)
   LL_STRDEC(a,s)        read a decimal value from s to a 
                         (s <= 20 digits, with an optional leading sign)

The above operations are implemented using a macros, and are quite efficient,
if a little cumbersome to use. However, the following "operator" functions are 
also provided, which can be used in both declarations and expressions:

   _int64(hi, lo)        returns 64 bits made from UNSIGNED hi and UNSIGNED lo

   _int32(lo)            returns 64 bits made from SIGNED lo
   _uint32(lo)           returns 64 bits made from UNSIGNED lo

   _add64(a, b)          return a + b
   _sub64(a, b)          return a - b
   _mul64(a, b)          return a * b
   _mul32(a, b)          return a * b where a and b are 32 bits each
   _div64(a, b)          return a / b
   _mod64(a, b)          return a % b
   _neg(a)               returns -a

   _and64(a, b)          return a & b
   _or64(a, b)           return a | b
   _xor64(a, b)          return a ^ b
   _not(a)               returns ~a

   _shl32(a, b)          return a << b where a is 32 bits and b is [0..64]
   _shl64(a, b)          return a << b where b is [0..64]
   _lsr64(a, b)          return a >> b where a is unsigned and b is [0..64]
   _asr64(a, b)          return a >> b where a is signed and bi is [0..64]

For example:

   Uint64 a = _int64(0,0);
   Int64  b = _shl32(1,63);
   a = _sub64(b, _mul64(c, d)); // a = b - (c*d)

Demo Programs
=============

There are two demo programs in this directory:

  test_int64.c - this is the test program for the original implementation of
                 portable 64 bit integers. It can be used to verify that the
                 implementation works as intended.

  example.c    - this is an example program that demonstrates how to use 64 
                 bit values on the Propeller, and includes an example function
                 that fetches the current system counter as 64 bits (Propeller
                 2 only).

There is a build_all script can be used to build the demos. Note that to build
for the Propeller 1, COMPACT, SMALL or LARGE mode must be used, and for SMALL
or LARGE mode the build_utilities batch file will have to be used to build an 
appropriate loader. For example:

   build_all C3 SMALL CACHED_1K TTY OPTIMIZE

On the Propeller 2, any memory model can be used. For example, to compile for
the P2_EVAL board in COMPACT mode:

   build_all P2_EVAL COMPACT

The 64 bit integer support library is included as a Catalina library, and 
can be used by a program simply by adding -lint64 to any Catalina command. 
This is the method used in the Makefile in this directory. However, there is 
also a stand-alone version of the library contained in the files int64.h and 
int64.c

So if program.c needs 64 bit integer support, it can be compiled using
either of the following methods:

  catalina -lc program.c int64.c
  catalina -lc -lint64 program.c

