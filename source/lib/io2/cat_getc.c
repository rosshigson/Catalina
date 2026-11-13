/*
 * Simplified i/o for supporting stdin/stdout/stderr only
 *
 * These functions are called in place of the standard getc
 * and ungetc functions when using __CATALINA_SIMPLE_IO mode
 *
 */

#include <stdio.h>

#include <hmi.h>

#define MAX_UNGETS 10

static int unget_count = 0;

static int unget_buff[MAX_UNGETS];

int catalina_getc(FILE *stream) {
   int c;
	if (stream == stdin) {
		if (unget_count > 0) {
			c = unget_buff[--unget_count];
		}
		else {
			c = k_wait();
         if (c != -1) {
            t_char(1, c & 0xFF);
         }
		}
	}
	else {
		c = EOF;
	}
   return c;
}

int catalina_ungetc(int ch, FILE *stream) {

   if (ch != EOF) {
   	if (stream == stdin) {
		   if (unget_count < MAX_UNGETS) {
		      unget_buff[unget_count++] = ch;
         }
		}
		else {
         return EOF;
		}
	}
	else {
		return EOF;
	}

   return ch;
}

int catalina_fflush(FILE *stream) {

   unget_count = 0;
   return 0;
}
