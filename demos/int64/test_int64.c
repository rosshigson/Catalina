
/*
	This program tests support of 64-bit integers.  Use the
	int64_gen.c program to generate a series of test vectors 
  (stored in int64_vectors.h) using a platform with native 
  support for 64-bit integers.

	Then, compile this test on the platform that must use the 
	non-native 64-bit integers.

*/

#include <stdio.h>
#include <string.h>

#include <stdbool.h>
#ifndef TRUE
   #define TRUE true
#endif
#ifndef FALSE
   #define FALSE false
#endif

#define __STDC_FORMAT_MACROS
#include <inttypes.h>

#include "unittest.h"
#include "int64.h"

/// Helper macro for calculating the number of entries in an array.
#define _TABLE_ENTRIES(array)    ((sizeof (array)) / (sizeof (*array)))

// include the pre-computed test vectors
// (note that this file uses the original JS* names, so define them here)
#define JSInt64 Int64
#define JSUint64 Uint64
#define JSLL_INIT LL_INIT
#include "int64_vectors.h"

#define BINARY_TEST(m, el)	\
	do { sprintf( errstr, "%s failed on record %u", #m, i);			\
	m( c, a, b); test_bool( LL_EQ( c, rec->el), errstr); } while (0)
#define SHIFT_TEST(m, el, bits)	\
	do { sprintf( errstr, "%s failed on record %u", #m, i);			\
	m( c, a, bits); test_bool( LL_EQ( c, rec->el), errstr); } while (0)
#define UNARY_TEST(m, el)	\
	do { sprintf( errstr, "%s failed on record %u", #m, i);			\
	m( c, a); test_bool( LL_EQ( c, rec->el), errstr); } while (0)
#define CP_TEST(m, op, el)	\
	do { sprintf( errstr, "%s(%s) failed on record %u", #m, #op, i);	\
	test_bool( m( a, op, b) == rec->el, errstr); } while (0)
#define STRING_TEST( m, el) \
	do { memset( buffer, 0, sizeof buffer); m( buffer, a);			\
		sprintf( errstr, "%s failed on record %u", #m, i);				\
		test_string( buffer, rec->el, errstr); } while (0)

void t_jslong_shift( void)
{
	const shifttest_t *test;
	const shiftrec_t *rec;
	char errstr[60];
	uint_fast8_t i, sh;
	Uint64 a, c;

	test = shift_tests;
	for (i = 0; i < _TABLE_ENTRIES(shift_tests); ++test, ++i)
	{
		a = test->base;
		for (rec = test->shift, sh = 1; sh < 64; ++rec, ++sh)
		{
			SHIFT_TEST( LL_SHL, shl, sh);
			SHIFT_TEST( LL_SHR, shr, sh);
			SHIFT_TEST( LL_USHR, ushr, sh);
		}
	}
}

void t_jslong( void)
{
	int i;
	char errstr[60];
	char buffer[25];
	const testrec_t *rec;
	Int64 a, b, c;
	int32_t i32;
	uint32_t ui32;

	for (rec = tests, i = 0; i < _TABLE_ENTRIES(tests); ++rec, ++i)
	{
		a = rec->a;
		b = rec->b;

		BINARY_TEST( LL_ADD, add);
		BINARY_TEST( LL_SUB, sub);
		BINARY_TEST( LL_MUL, mul);
		BINARY_TEST( LL_AND, and);
		BINARY_TEST( LL_OR, or);
		BINARY_TEST( LL_XOR, xor);

		UNARY_TEST( LL_NOT, not);
		UNARY_TEST( LL_NEG, neg);

		SHIFT_TEST( LL_SHL, shl, SHIFT_BITS);
		SHIFT_TEST( LL_SHR, shr, SHIFT_BITS);
		SHIFT_TEST( LL_USHR, ushr, SHIFT_BITS);

		LL_L2I( i32, a);
		sprintf( errstr, "%s failed on record %u", "LL_L2I", i);
		if (! test_compare( i32, rec->l2i, "0x%08" PRIx32, errstr))
		{
			LL_I2L( c, i32);
			sprintf( errstr, "%s failed on record %u", "LL_I2L", i);
			test_bool( LL_EQ( c, rec->i2l), errstr);
		}

		LL_L2UI( ui32, a);
		sprintf( errstr, "%s failed on record %u", "LL_L2UI", i);
		if (! test_compare( ui32, rec->l2ui, "0x%08" PRIx32, errstr))
		{
			LL_UI2L( c, ui32);
			sprintf( errstr, "%s failed on record %u", "LL_UI2L", i);
			test_bool( LL_EQ( c, rec->ui2l), errstr);
		}

		STRING_TEST( LL_HEXSTR, hexstr);
		STRING_TEST( LL_DECSTR, decstr);
		STRING_TEST( LL_UDECSTR, udecstr);

		CP_TEST( LL_UCMP, >, gtu);
		CP_TEST( LL_UCMP, <, ltu);
		CP_TEST( LL_CMP, >, gt);
		CP_TEST( LL_CMP, <, lt);
	}
}

int main( int argc, char **argv)
{
	int failures = 0;

  _waitsec(1); // delay for external terminal emulator

  failures += DO_TEST( t_jslong);
	failures += DO_TEST( t_jslong_shift);

	return test_exit( failures);
}
