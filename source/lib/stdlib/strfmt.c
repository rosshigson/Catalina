/*
 * Modified for Catalina by Ross Higson
 */
//===================================================
// $Id: strfmt.c,v 1.2 2005/05/12 21:52:12 plg Exp $
//===================================================
/* Copyright (c) 1999-2004, Paul L. Gatille <paul.gatille@free.fr>
 *
 * This file is part of Toolbox, an object-oriented utility library
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the "Artistic License" which comes with this Kit.
 *
 * This software is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the Artistic License for more
 * details.
 */

/**
 * @file strfmt.c string formating
 *
 * Shamelessly stolen and patched from Str lib (see copyright notices)
 *
 *  Str - String Library
 *  Copyright (c) 1999-2000 Ralf S. Engelschall <rse@engelschall.com>
 *
 *  This file is part of Str, a string handling and manipulation
 *  library which can be found at http://www.engelschall.com/sw/str/.
 *
 *  Permission to use, copy, modify, and distribute this software for
 *  any purpose with or without fee is hereby granted, provided that
 *  the above copyright notice and this permission notice appear in all
 *  copies.
 *
 *  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 *  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 *  IN NO EVENT SHALL THE AUTHORS AND COPYRIGHT HOLDERS AND THEIR
 *  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 *  USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 *  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 *  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 *  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 *  SUCH DAMAGE.
 *
 *  str_format.c: formatting functions
 */

/*
 *  Copyright (c) 1995-1999 The Apache Group.  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *  1. Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *  2. Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *
 *  3. All advertising materials mentioning features or use of this
 *     software must display the following acknowledgment:
 *     "This product includes software developed by the Apache Group
 *     for use in the Apache HTTP server project (http://www.apache.org/)."
 *
 *  4. The names "Apache Server" and "Apache Group" must not be used to
 *     endorse or promote products derived from this software without
 *     prior written permission. For written permission, please contact
 *     apache@apache.org.
 *
 *  5. Products derived from this software may not be called "Apache"
 *     nor may "Apache" appear in their names without prior written
 *     permission of the Apache Group.
 *
 *  6. Redistributions of any form whatsoever must retain the following
 *     acknowledgment:
 *     "This product includes software developed by the Apache Group
 *     for use in the Apache HTTP server project (http://www.apache.org/)."
 *
 *  THIS SOFTWARE IS PROVIDED BY THE APACHE GROUP ``AS IS'' AND ANY
 *  EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 *  PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE APACHE GROUP OR
 *  ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 *  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 *  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 *  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 *  OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * This is a generic printf-style formatting code which is based on
 * Apache's ap_snprintf which it turn is based on and used with the
 * permission of, the SIO stdio-replacement strx_* functions by Panos
 * Tsirigotis <panos@alumni.cs.colorado.edu> for xinetd. The IEEE
 * floating point formatting routines are derived from an anchient
 * FreeBSD version which took it from GNU libc-4.6.27 and modified it
 * to be thread safe. The whole code was finally cleaned up, stripped
 * and extended by Ralf S. Engelschall for use inside the Str library.
 * Especially and Apache and network specific kludges were removed again
 * and instead the formatting engine now can be extended by the caller
 * on-the-fly.
 */

#ifndef NOFLOAT

#include <math.h>       /* for modf(3) */

#ifndef TRUE
#define TRUE 1
#endif

#ifndef FALSE
#define FALSE 0
#endif

/* null values for pointers and characters */
#ifndef NULL
#define NULL ((void *)0)
#endif
#ifndef NUL
#define NUL '\0'
#endif

       
#define NDIG            80

/* 
 * convert string to decimal. the number of digits is specified by
 * ndigit decpt is set to the position of the decimal point sign is set
 * to 0 for positive, 1 for negative. buf must have at least NDIG bytes.
 */

static char *
str_cvt(
    double arg, 
    int ndigits, 
    int *decpt, 
    int *sign, 
    int eflag,
    char *buf)
{
    register int r2;
    double fi, fj;
    register char *p, *p1;

    if (ndigits >= NDIG - 1)
        ndigits = NDIG - 2;
    r2 = 0;
    *sign = FALSE;
    p = &buf[0];
    if (arg < 0) {
        *sign = TRUE;
        arg = -arg;
    }
    arg = modf(arg, &fi);
    p1 = &buf[NDIG];

    /* Do integer part */
    if (fi != 0) {
        p1 = &buf[NDIG];
        while (fi != 0) {
            fj = modf(fi / 10, &fi);
            *--p1 = (int) ((fj + .03) * 10) + '0';
            r2++;
        }
        while (p1 < &buf[NDIG]) {
            *p++ = *p1++;
        }
    }
    else if (arg > 0) {
        while ((fj = arg * 10) < 1) {
            arg = fj;
            r2--;
        }
    }
    p1 = &buf[ndigits];
    if (eflag == 0) {
        p1 += r2;
    }
    *decpt = r2;
    if (p1 < &buf[0]) {
        buf[0] = NUL;
        return (buf);
    }
    while (p <= p1 && p < &buf[NDIG]) {
        arg *= 10;
        arg = modf(arg, &fj);
        *p++ = (int) fj + '0';
    }
    if (p1 >= &buf[NDIG]) {
        buf[NDIG - 1] = NUL;
        return (buf);
    }
    p = p1;
    *p1 += 5;
    while (*p1 > '9') {
        *p1 = '0';
        if (p1 > buf)
            ++ * --p1;
        else {
            *p1 = '1';
            (*decpt)++;
            if (eflag == 0) {
                if (p > buf)
                    *p = '0';
                p++;
            }
        }
    }
    *p = NUL;
    return (buf);
}

char * _ecvt(double arg, int ndigits, int *decpt, int *sign, char *buf) {

    return str_cvt(arg, ndigits, decpt, sign, 1, buf);

}

char * _fcvt(double arg, int ndigits, int *decpt, int *sign, char *buf) {

    return str_cvt(arg, ndigits, decpt, sign, 0, buf);

}

#endif /* NOFLOAT */

