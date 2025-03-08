#ifndef _BASE64_H
#define _BASE64_H  1

/*********************************************************************\

base64.h - based on Bob Trower's b64.c - see that file for full details.

LICENCE:        Copyright (c) 2001 Bob Trower, Trantor Standard Systems Inc.

                Permission is hereby granted, free of charge, to any person
                obtaining a copy of this software and associated
                documentation files (the "Software"), to deal in the
                Software without restriction, including without limitation
                the rights to use, copy, modify, merge, publish, distribute,
                sublicense, and/or sell copies of the Software, and to
                permit persons to whom the Software is furnished to do so,
                subject to the following conditions:

                The above copyright notice and this permission notice shall
                be included in all copies or substantial portions of the
                Software.

                THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
                KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
                WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
                PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
                OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
                OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
                OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
                SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


\******************************************************************* */

/*
** encode_buff
**
** base64 encode a buffer adding padding and line breaks as per spec.
** Returns the size of the encoded result, or -1 if the output buffer 
** is not large enough.
*/
int encode_buff( char *inbuff, int inlen, char *outbuff, int outlen, int linesize);

/*
** decode_buff
**
** decode a base64 encoded buffer discarding padding, line breaks and noise.
** Returns the size of the decoded result, or -1 if the output buffer 
** is not large enough.
*/
int decode_buff( char *inbuff, int inlen, char *outbuff, int outlen);

#endif
