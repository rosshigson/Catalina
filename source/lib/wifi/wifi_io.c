/*
 * This is a cut-down version of the tiny I/O library, containing only
 * the functions needed by the WiFi library (i.e. an integer version of 
 * sscanf & sprintf plus supporting functions). These functions are
 * called isscanf and iprintf, and are similar to sscanf and sprintf
 * but support only the %d, %u, %x, %c and %s format specifiers.
 *
 * This allows the wifi library to be used with both -lci and -lcix.
 *
 * Currently, these are only used by the wifi library, but in future these 
 * functions may be added to both libci and libcix.
 *
 * See the original header below for credits.
 */

/*
 * Super-simple text I/O for PropGCC, stripped of all stdio overhead.
 * Copyright (c) 2012, Ted Stefanik. Concept inspired by:
 *
 *     very simple printf, adapted from one written by me [Eric Smith]
 *     for the MiNT OS long ago
 *     placed in the public domain
 *       - Eric Smith
 *     Propeller specific adaptations
 *     Copyright (c) 2011 Parallax, Inc.
 *     Written by Eric R. Smith, Total Spectrum Software Inc.
 *
 * MIT licensed (see terms at end of file)
 */

#include <limits.h>
#include <string.h>
#include <stdarg.h>

#define PRINTF_NOT_MEMORY ((char*)0x3000000)

static int _printf_putc(unsigned ch, char* buf);
static int _printf_puts(const char* s, char* buf);
static int _printf_putn(const char* str, int width, unsigned int fillChar, char* origBuf);
static int _printf_putl(unsigned long u, int base, int isSigned, int width, unsigned int fillChar, char* buf);
static int _printf_pad(int width, int used, unsigned int fillChar, char* origBuf);

static int _doprintf(const char* fmt, va_list args, char* origBuf);

static const char* _scanf_getl(const char *str, int* dst, int base, unsigned width, int isSigned);

static int _doscanf(const char* str, const char *fmt, va_list args);


static int _printf_pad(int width, int used, unsigned int fillChar, char* origBuf)
{
    char* buf = origBuf;

    if (width <= 0)
        return 0;
    width -= used;

	while (width-- > 0)
		buf += _printf_putc(fillChar, buf);

    return buf - origBuf;
}


static int _printf_putc(unsigned ch, char* buf)
{
    if ((unsigned long)buf & (unsigned long)PRINTF_NOT_MEMORY)
        putchar(ch);
    else
        *buf++ = ch;

    return 1;
}

static char digits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

static int _printf_putl(unsigned long u, int base, int isSigned, int width, unsigned int fillChar, char* origBuf)
{
	char tmpBuf[12];  // Base must be 10 or 16, so ~4,000,000,000 is greatest number.
   register char* start;
	register char* tmp;
   register int rem;
   int used;
   char* buf;
   int tmpStart;


   
	tmpBuf[11] = 0;

   start = &tmpBuf[10];
	tmp = start;

    if (isSigned && base == 10 && (long)u < 0)
        u = -(long)u;
    else
        isSigned = 0;

	do
    {
#ifdef __CATALINA__
        rem = u % base; u = u / base;
#else
        __asm__ volatile("mov r0,%[_u] \n\t "
                         "mov r1,%[_base] \n\t "
                         "call #__UDIVSI \n\t "
                         "mov %[_u],r0 \n\t "
                         "mov %[_rem],r1"
                         : [_u] "+r" (u), [_rem] "=r" (rem)
                         : [_base] "r" (base)
                         : "r0", "r1");
#endif
		*tmp-- = digits[rem];
	} while (u > 0);

    if (isSigned)
		*tmp-- = '-';

    used = start - tmp;
    buf = origBuf;
    tmpStart = 1;

    if (isSigned && fillChar != ' ')
    {
        buf += _printf_putc('-', buf);
        tmpStart++;
    }
	buf += _printf_pad(width, used, fillChar, buf);
    buf += _printf_puts(tmp + tmpStart, buf);
	buf += _printf_pad(-width, used, ' ', buf);
	return buf - origBuf;
}

static int _printf_putn(const char* str, int width, unsigned int fillChar, char* origBuf)
{
    int len = strlen(str);
    char* buf = origBuf;
	buf += _printf_pad(-width, len, fillChar, buf);
    buf += _printf_puts(str, buf);
	buf += _printf_pad(width, len, fillChar, buf);
	return buf - origBuf;
}

static int _printf_puts(const char* sin, char* buf)
{
    const char* s = sin;
	while (*s)
        _printf_putc(*s++, buf++);
	return s - sin;
}

static int charToInt(char ch)
{
    ch -= '0';
    if (ch >= 10)
        ch -= 'A' - '9' - 1;
    if (ch > 15)
        ch -= 'a' - 'A';
    return ch;
}

static const char* _scanf_getl(const char *str, int* dst, int base, unsigned width, int isSigned)
{
    int isNegative = 0;

    int ch = *str;
    unsigned num;
    int foundAtLeastOneDigit;

    if (isSigned)
    {
        isNegative = (ch == '-');
        if (ch == '+' || ch == '-')
            str++;
    }

    num = 0;
    foundAtLeastOneDigit = 0;
    while (width--)
    {
        ch = *str;
        if (!((ch >= '0' && ch <= '9') ||
              (base == 16 && ((ch >= 'A' && ch <= 'F') || (ch >= 'a' && ch <= 'f')))))
        {
            if (!foundAtLeastOneDigit)
                return 0;
            break;
        }

        foundAtLeastOneDigit = 1;
        num = base * num + charToInt(ch);
        str++;
    }

    if (isNegative)
        *dst = -(int)num;
    else
        *dst = num;

    return str;
}

static int _doprintf(const char* fmt, va_list args, char* origBuf)
{
    char ch;
    char* buf = origBuf;
    int leftJust;
    int width;
    char fillChar;
    int base;
    unsigned long arg;
    unsigned long cch;

    while((ch = *fmt++) != 0)
    {
        if (ch != '%')
        {
            buf += _printf_putc(ch, buf);
            continue;
        }

        ch = *fmt++;

        leftJust = 0;
        if (ch == '-')
        {
            leftJust = 1;
            ch = *fmt++;
        }

        width = 0;
        fillChar = ' ';
        if (ch == '0')
            fillChar = '0';
        while (ch && isdigit(ch))
        {
            width = 10 * width + (ch - '0');
            ch = *fmt++;
        }

        if (!ch)
            break;
        if (ch == '%')
        {
            buf += _printf_putc(ch, buf);
            continue;
        }

        arg = va_arg(args, int);
        base = 16;

        switch (ch)
        {
        case 'c':
            cch = (char)arg;
            arg = (unsigned long)&cch;
            /* Fall Through */
        case 's':
            if (leftJust)
                width = -width;
            buf += _printf_putn((const char*)arg, width, fillChar, buf);
            break;
        case 'd':
        case 'u':
            base = 10;
            /* Fall Through */
        case 'x':
            if (!width)
                width = 1;
            if (leftJust)
                width = -width;
            buf += _printf_putl((unsigned long)arg, base, (ch == 'd'), width, fillChar, buf);
            break;

        }
    }
    
    return buf - origBuf;
}

static int isspace(int ch) 
{
    return (ch == 0 || ch == ' ' || ch == '\f' || ch == '\v' || ch == '\t' || ch == '\r' || ch == '\n');
}

static const char* trim(const char* str) 
{
    while (isspace(*str))
        str++;

    return str;
}

static const char* _scanf_gets(const char *str, char* dst, unsigned width, int gettingChars) 
{
    while (width-- && (gettingChars || !isspace(*str)))
        *dst++ = *str++;

    if (!gettingChars)
        *dst = 0;

    return str;
}

static int _doscanf(const char* str, const char *fmt, va_list args) 
{
    int blocks = 0;
   
    int fch;
    int width;
    int base;
    int isWhiteSpaceOK;
    unsigned long arg;
    int done;
        

    while (str && *str && (fch = *fmt++))
    {
        if (fch != '%')
        {
            if (isspace(fch))
                str = trim(str);
            else if (*str++ != fch)
                break;
            continue;
        }
                
        if (!isdigit(*fmt))
            width = INT_MAX;
        else
            fmt = _scanf_getl(fmt, &width, 10, 11, 0);
                
        fch = *fmt++;
        if (fch != 'c' && fch != '%')
        {
            str = trim(str);
            if (!*str)
                break;
        }
                
        base = 16;
        isWhiteSpaceOK = 0;
        arg = va_arg(args, int);
        done = 0;
        
        switch (fch) 
        {
        case '%':
            if (*str++ != '%')
                done = 1;
            break;
        case 'c':
            isWhiteSpaceOK = 1;
            if (width == INT_MAX)
                width = 1;
            /* Fall Through */
        case 's': 
            if ((str = _scanf_gets(str, (char*)arg, width, isWhiteSpaceOK)))
                blocks++;
            break;
        case 'u':
        case 'd':
            base = 10;
            /* Fall Through */
        case 'x': 
            if ((str = _scanf_getl(str, (int*)arg, base, width, (fch == 'd'))))
                blocks++;;
            break;
        default:
            done = 1;
        }

        if (done)
            break;
    }
    
    return blocks;
}

int isscanf(const char *str, const char *fmt, ...) 
{
    va_list args;
    int blocks;
    
    va_start(args, fmt);
    blocks = _doscanf(str, fmt, args);
    va_end(args);
    
    return blocks;
}

int isprintf(char* buf, const char* fmt, ...)
{
    va_list args;
    int r;

    va_start(args, fmt);
    r = _doprintf(fmt, args, buf);
    va_end(args);

    buf[r] = 0;
    return r;
}

/* +--------------------------------------------------------------------
 * ¦  TERMS OF USE: MIT License
 * +--------------------------------------------------------------------
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * +--------------------------------------------------------------------
 */

