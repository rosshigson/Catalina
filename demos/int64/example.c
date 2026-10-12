/*
 * This program demonstrates some basic 64-bit operations implemented in the 
 * portable 64-bit integer library. The library works on both the Propeller 1
 * and Propeller 2, but the system counter is only 64 bits on the Propeller 2, 
 * so the code to return it as 64 bits is not used on the Propeller 1.
 *
 * To compile it to use the version of the portable 64-bit functions in this
 * folder, use a command like:
 *
 *   catalina -lc example.c int64.c
 *
 * To compile it to use the version of the portable 64-bit functions in the
 * libint64 library, use a command like:
 *
 *   catalina -lc -lint64 example.c
 *
 * Note that the standard C libraries (-lc or -lcx) must be used by this 
 * program rather than the integer C libraries (-lci or -lcix) because it 
 * prints out floating point values. However, these are not normally required
 * just to use the int64 functions for interger operations only.
 *
 * On the Propeller 1, COMPACT, SMALL or LARGE may need to be used.
 *
 */

#include <stdio.h>
#include <int64.h>
#if defined(__CATALINA_P2)
#include <prop2.h>
#endif

// convenience function for printing 3 signed decimal Int64 values
void print_3_dec(char *format, Int64 a, Int64 b, Int64 c) {
   char sa[32];
   char sb[32];
   char sc[32];

   LL_DECSTR(sa, a);
   LL_DECSTR(sb, b);
   LL_DECSTR(sc, c);
   printf(format, sa, sb, sc);
}

// convenience function for printing 3 unsigned decimal Uint64 values
void print_3_udec(char *format, Uint64 a, Uint64 b, Uint64 c) {
   char sa[32];
   char sb[32];
   char sc[32];

   LL_UDECSTR(sa, a);
   LL_UDECSTR(sb, b);
   LL_UDECSTR(sc, c);
   printf(format, sa, sb, sc);
}

// convenience function for printing 3 hexadecimal Int64 values
void print_3_hex(char *format, Uint64 a, Uint64 b, Uint64 c) {
   char sa[32];
   char sb[32];
   char sc[32];

   LL_HEXSTR(sa, a);
   LL_HEXSTR(sb, b);
   LL_HEXSTR(sc, c);
   printf(format, sa, sb, sc);
}

// test 64-bit macros
void test_macros() {
   // initialize some 64 bit values - note that we can declare the
   // variables as either Int64 or Uint64 because these are identical.
   // Whether they represent signed or unsigned values depends on the 
   // values assigned and operations performed on them, not on how they 
   // are declared.
   Int64 a = LL_INIT(0x976bab8f, 0x61995b04);
   Int64 b = LL_INIT(0x01faa1e3, 0xcfa159d8);
   Int64 c = LL_INIT(0x00000000, 0x00000000);
   Int64 d = LL_INIT(0x00000000, 0x00000000);

   printf("Signed Addition:\n");

   LL_ADD(c, a, b); // c = a + b;

   print_3_hex("  (Hex): 0x%s + 0x%s = 0x%s\n", a, b, c);
   print_3_dec("  (Dec): %s + %s = %s\n\n", a, b, c);

   printf("Signed Subtraction:\n");

   LL_SUB(c, a, b); // c = a - b;

   print_3_hex("  (Hex): 0x%s - 0x%s = 0x%s\n", a, b, c);
   print_3_dec("  (Dec): %s - %s = %s\n\n", a, b, c);

   printf("Signed Division and Modulus:\n");

   LL_DIV(c, a, b); 
   LL_MOD(d, a, b); 

   print_3_dec("  (Dec): %s / %s = %s\n", a, b, c);
   print_3_dec("  (Dec): %s %% %s = %s\n\n", a, b, d);

   printf("Unsigned Division and Modulus:\n");

   LL_UDIVMOD(&c, &d, a, b); // c = a / b; d = a % b;

   // note use of print_3_udec() rather than print_3_dec() below because 
   // LL_UDIVMOD assumes its arguments are unsigned integers.
   print_3_udec("  (Dec): %s / %s = %s\n", a, b, c);
   print_3_udec("  (Dec): %s %% %s = %s\n\n", a, b, d);

}

// test 64-bit "operator" functions
void test_operators() {
   // declare some 64 bit values, but don't initialize them
   Int64 a;
   Int64 b;
   Int64 c;
   Int64 d;

   char buffer[32];

   // initialize the 64 bit variables using the operator function
   a = _int64(0x976bab8f, 0x61995b04);
   b = _int64(0x01faa1e3, 0xcfa159d8);
   c = _int64(0x00000000, 0x00000000);
   d = _int64(0x00000000, 0x00000000);

   printf("Signed Addition (operators):\n");

   c = _add64(a, b); // c = a + b

   print_3_hex("  (Hex): 0x%s + 0x%s = 0x%s\n", a, b, c);
   print_3_dec("  (Dec): %s + %s = %s\n\n", a, b, c);

   printf("Signed Subtraction (operators):\n");

   c = _sub64(a, b); // c = a - b

   print_3_hex("  (Hex): 0x%s - 0x%s = 0x%s\n", a, b, c);
   print_3_dec("  (Dec): %s - %s = %s\n\n", a, b, c);

   printf("Signed Division and Modulus (operators):\n");

   c = _div64(a, b); // c = a / b
   d = _mod64(a, b); // c = a % b

   print_3_dec("  (Dec): %s / %s = %s\n", a, b, c);
   print_3_dec("  (Dec): %s %% %s = %s\n\n", a, b, d);

   printf("Combined operations (operators):\n");

   a = _shl32(1, 7);
   b = _int64(0, 10);
   c = _int64(0, 5);
   a = _mul64(a, _sub64(b, c)); // a = a * (b-c))

   LL_DECSTR(buffer, a);
   printf("  (Dec): %s\n\n", buffer);
}

// test 64-bit string parsing and floating point conversion functions
void test_parsing() {
   Int64 a = _int64(0x976bab8f, 0x61995b04);

   char buffer[32];

   // strings to be parsed
   char s1[] = "1234567890abcdef";
   char s2[] = "-1234567890123456789";
   char s3[] = "FFFFFFFFFFFFFFFF";
   char s4[] = "18446744073709551615";

   // floating point values
   double x = 0.0;
   double y = -1.23456e10;

   printf("Floating point conversion:\n");

   LL_L2D(x,a); // x = (double)a;
   LL_DECSTR(buffer, a);
   printf("  %s => %f\n", buffer, x);

   LL_D2L(a, y); // c = (Int64)y;
   LL_DECSTR(buffer, a);
   printf("  %f => %s\n\n", y, buffer);

   printf("String Parsing:\n");

   LL_STRHEX(a, s1);
   LL_HEXSTR(buffer, a);
   printf("  \"%s\" => 0x%s\n", s1, buffer);

   LL_STRDEC(a, s2);
   LL_DECSTR(buffer, a);
   printf("  \"%s\" => %s\n", s2, buffer);

   LL_STRHEX(a, s3);
   LL_UDECSTR(buffer, a);
   printf("  \"%s\" => %s\n", s3, buffer);

   LL_STRDEC(a, s4);
   LL_UDECSTR(buffer, a);
   printf("  \"%s\" => %s\n\n", s4, buffer);
}

#if defined(__CATALINA_P2)

/*
 * _cnt64() : Return the system counter as a Uint64. 
 *            Uses the existing _cnthl() function, but this
 *            version allows 64 bit arithmetic, comparison
 *            and bitwise operations to be performed on the 
 *            result. Works in all memory models.
 */
Uint64 _cnt64() {
   counter64_t cnt = _cnthl();
   return _int64(cnt.high, cnt.low);
}

// test the 64-bit system counter function (never exits)
void test_counter() {
   Uint64 syscount = _int64(0,0);
   char buffer[32];

   while(1) {
      printf("Press a key ...\n");
      k_wait();
      syscount = _cnt64();
      LL_HEXSTR(buffer, syscount);
      printf("System Counter (Hex): %s\n", buffer);
   }
}

#endif

void main() {

   _waitsec(1);       // delay for an external terminal emulator

   test_macros();     // test macros
   test_operators();  // test "operator" functions
   test_parsing();    // test conversion and parsinga

#if defined(__CATALINA_P2)
   test_counter();   // test the 64 bit system counter (P2 only)
#else
   printf("Done.\n");
   while(1);
#endif

}
