/*
 * Simplified i/o for supporting stdin/stdout/stderr only
 *
 * These functions are called in place of the standard putc 
 * function when using __CATALINA_SIMPLE_IO mode
 *
 */

#include <stdio.h>

#include <hmi.h>

int catalina_putc(int c, FILE *stream) {
	if (stream == stdout) {
		t_char(1, c);
	}
	else if (stream == stderr) {
		t_char(1, c);
	}
	return c;
}
