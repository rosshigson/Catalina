/*
 *  Modified for Catalina by Ross Higson
 */

// ISO C9x  compliant inttypes.h for Microsoft Visual Studio
// Based on ISO/IEC 9899:TC2 Committee draft (May 6, 2005) WG14/N1124 
// 
//  Copyright (c) 2006 Alexander Chemeris
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
//   1. Redistributions of source code must retain the above copyright notice,
//      this list of conditions and the following disclaimer.
// 
//   2. Redistributions in binary form must reproduce the above copyright
//      notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
// 
//   3. The name of the author may be used to endorse or promote products
//      derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
// EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 
///////////////////////////////////////////////////////////////////////////////

#ifndef _INTTYPES_H_
#define _INTTYPES_H_

#include <stdint.h>

// 7.8 Format conversion of integer types

typedef struct {
   intmax_t quot;
   intmax_t rem;
} imaxdiv_t;

// 7.8.1 Macros for format specifiers

#ifdef __STDC_FORMAT_MACROS

// fprintf macros for signed integers:
#define PRId8       "d"
#define PRIi8       "i"
#define PRIdLEAST8  "d"
#define PRIiLEAST8  "i"
#define PRIdFAST8   "d"
#define PRIiFAST8   "i"

#define PRId16       "hd"
#define PRIi16       "hi"
#define PRIdLEAST16  "hd"
#define PRIiLEAST16  "hi"
#define PRIdFAST16   "hd"
#define PRIiFAST16   "hi"

#define PRId32       "d"
#define PRIi32       "i"
#define PRIdLEAST32  "d"
#define PRIiLEAST32  "i"
#define PRIdFAST32   "d"
#define PRIiFAST32   "i"

#ifdef INT64_MAX

#define PRId64       "d"
#define PRIi64       "i"
#define PRIdLEAST64  "d"
#define PRIiLEAST64  "i"
#define PRIdFAST64   "d"
#define PRIiFAST64   "i"

#define PRIdMAX     "d"
#define PRIiMAX     "i"

#endif

#define PRIdPTR     "Id"
#define PRIiPTR     "Ii"

// fprintf macros for unsigned integers:
#define PRIo8       "o"
#define PRIu8       "u"
#define PRIx8       "x"
#define PRIX8       "X"
#define PRIoLEAST8  "o"
#define PRIuLEAST8  "u"
#define PRIxLEAST8  "x"
#define PRIXLEAST8  "X"
#define PRIoFAST8   "o"
#define PRIuFAST8   "u"
#define PRIxFAST8   "x"
#define PRIXFAST8   "X"

#define PRIo16       "ho"
#define PRIu16       "hu"
#define PRIx16       "hx"
#define PRIX16       "hX"
#define PRIoLEAST16  "ho"
#define PRIuLEAST16  "hu"
#define PRIxLEAST16  "hx"
#define PRIXLEAST16  "hX"
#define PRIoFAST16   "ho"
#define PRIuFAST16   "hu"
#define PRIxFAST16   "hx"
#define PRIXFAST16   "hX"

#define PRIo32       "o"
#define PRIu32       "u"
#define PRIx32       "x"
#define PRIX32       "X"
#define PRIoLEAST32  "o"
#define PRIuLEAST32  "u"
#define PRIxLEAST32  "x"
#define PRIXLEAST32  "X"
#define PRIoFAST32   "o"
#define PRIuFAST32   "u"
#define PRIxFAST32   "x"
#define PRIXFAST32   "X"

#ifdef INT64_MAX

#define PRIo64       "o"
#define PRIu64       "u"
#define PRIx64       "x"
#define PRIX64       "X"
#define PRIoLEAST64  "o"
#define PRIuLEAST64  "u"
#define PRIxLEAST64  "x"
#define PRIXLEAST64  "X"
#define PRIoFAST64   "o"
#define PRIuFAST64   "u"
#define PRIxFAST64   "x"
#define PRIXFAST64   "X"

#define PRIoMAX     "o"
#define PRIuMAX     "u"
#define PRIxMAX     "x"
#define PRIXMAX     "X"

#endif

#define PRIoPTR     "Io"
#define PRIuPTR     "Iu"
#define PRIxPTR     "Ix"
#define PRIXPTR     "IX"

// fscanf macros for signed integers:
#define SCNd8       "d"
#define SCNi8       "i"
#define SCNdLEAST8  "d"
#define SCNiLEAST8  "i"
#define SCNdFAST8   "d"
#define SCNiFAST8   "i"

#define SCNd16       "hd"
#define SCNi16       "hi"
#define SCNdLEAST16  "hd"
#define SCNiLEAST16  "hi"
#define SCNdFAST16   "hd"
#define SCNiFAST16   "hi"

#define SCNd32       "ld"
#define SCNi32       "li"
#define SCNdLEAST32  "ld"
#define SCNiLEAST32  "li"
#define SCNdFAST32   "ld"
#define SCNiFAST32   "li"

#ifdef INT64_MAX

#define SCNd64       "d"
#define SCNi64       "i"
#define SCNdLEAST64  "d"
#define SCNiLEAST64  "i"
#define SCNdFAST64   "d"
#define SCNiFAST64   "i"

#define SCNdMAX     "d"
#define SCNiMAX     "i"

#endif

#  define SCNdPTR     "ld"
#  define SCNiPTR     "li"

// fscanf macros for unsigned integers:
#define SCNo8       "o"
#define SCNu8       "u"
#define SCNx8       "x"
#define SCNX8       "X"
#define SCNoLEAST8  "o"
#define SCNuLEAST8  "u"
#define SCNxLEAST8  "x"
#define SCNXLEAST8  "X"
#define SCNoFAST8   "o"
#define SCNuFAST8   "u"
#define SCNxFAST8   "x"
#define SCNXFAST8   "X"

#define SCNo16       "ho"
#define SCNu16       "hu"
#define SCNx16       "hx"
#define SCNX16       "hX"
#define SCNoLEAST16  "ho"
#define SCNuLEAST16  "hu"
#define SCNxLEAST16  "hx"
#define SCNXLEAST16  "hX"
#define SCNoFAST16   "ho"
#define SCNuFAST16   "hu"
#define SCNxFAST16   "hx"
#define SCNXFAST16   "hX"

#define SCNo32       "lo"
#define SCNu32       "lu"
#define SCNx32       "lx"
#define SCNX32       "lX"
#define SCNoLEAST32  "lo"
#define SCNuLEAST32  "lu"
#define SCNxLEAST32  "lx"
#define SCNXLEAST32  "lX"
#define SCNoFAST32   "lo"
#define SCNuFAST32   "lu"
#define SCNxFAST32   "lx"
#define SCNXFAST32   "lX"

#ifdef INT64_MAX

#define SCNo64       "o"
#define SCNu64       "u"
#define SCNx64       "x"
#define SCNX64       "X"
#define SCNoLEAST64  "o"
#define SCNuLEAST64  "u"
#define SCNxLEAST64  "x"
#define SCNXLEAST64  "X"
#define SCNoFAST64   "o"
#define SCNuFAST64   "u"
#define SCNxFAST64   "x"
#define SCNXFAST64   "X"

#define SCNoMAX     "o"
#define SCNuMAX     "u"
#define SCNxMAX     "x"
#define SCNXMAX     "X"

#endif

#  define SCNoPTR     "lo"
#  define SCNuPTR     "lu"
#  define SCNxPTR     "lx"
#  define SCNXPTR     "lX"

#endif /* __STDC_FORMAT_MACROS */

// 7.8.2 Functions for greatest-width integer types

// 7.8.2.1 The imaxabs function
#define imaxabs _abs

// 7.8.2.2 The imaxdiv function

// This is modified version of div() function from Microsoft's div.c found
// in %MSVC.NET%\crt\src\div.c
static imaxdiv_t imaxdiv(intmax_t numer, intmax_t denom)
{
   imaxdiv_t result;

   result.quot = numer / denom;
   result.rem = numer % denom;

   if (numer < 0 && result.rem > 0) {
      // did division wrong; must fix up
      ++result.quot;
      result.rem -= denom;
   }

   return result;
}

// 7.8.2.3 The strtoimax and strtoumax functions
#define strtoimax _strtoi
#define strtoumax _strtou

// 7.8.2.4 The wcstoimax and wcstoumax functions
// (Catalina has no wide character support!)
//#define wcstoimax _wcstoi64
//#define wcstoumax _wcstoui64


#endif 
