#include <stdio.h>

/*
 * This program is demonstrates a public domain itoa function - itoa 
 * was common on many pre-ANSI C compilers and Unix systems.
 */


/*
 * itoa - convert int to string
 * Written by Lukás Chmela
 * Released under GPLv3.
 */
char* itoa(int value, char* result, int base) {
		char* ptr = result, *ptr1 = result, tmp_char;
		int tmp_value;

		// check that the base if valid
		if (base < 2 || base > 36) { *result = '\0'; return result; }

		do {
			tmp_value = value;
			value /= base;
			*ptr++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz" [35 + (tmp_value - value * base)];
		} while ( value );

		// Apply negative sign
		if (tmp_value < 0) *ptr++ = '-';
		*ptr-- = '\0';
		while(ptr1 < ptr) {
			tmp_char = *ptr;
			*ptr--= *ptr1;
			*ptr1++ = tmp_char;
		}
		return result;
}


void main() {
   int i; 
   char text[20];

   i = 123456789;
   itoa(i, text, 10);
   printf("itoa(%d) = \"%s\"\n", i, text);

   i = -987654321;
   itoa(i, text, 10);
   printf("itoa(%d) = \"%s\"\n", i, text);

   i = 0xbadf00d;
   itoa(i, text, 16);
   printf("itoa(0x%x) = \"%s\"\n", i, text);

   i = -0x1234abcd;
   itoa(i, text, 16);
   printf("itoa(-0x%x) = \"%s\"\n", -i, text);

   while(1);
}

