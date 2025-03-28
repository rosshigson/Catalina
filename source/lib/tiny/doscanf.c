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
#include "siodev.h"

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

int _doscanf(const char* str, const char *fmt, va_list args) 
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
            width = ULONG_MAX;
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
            if (width == ULONG_MAX)
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


/* +--------------------------------------------------------------------
 * �  TERMS OF USE: MIT License
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
