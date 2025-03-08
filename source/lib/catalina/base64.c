/*********************************************************************\

base64.c - based on Bob Trower's b64.c - see that file for full details.

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

#include <stdio.h>
#include <stdlib.h>

/*
** Translation Table as described in RFC1113
*/
static const char cb64[]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

/*
** Translation Table to decode (created by author)
*/
static const char cd64[]="|$$$}rstuvwxyz{$$$$$$$>?@ABCDEFGHIJKLMNOPQRSTUVW$$$$$$XYZ[\\]^_`abcdefghijklmnopq";

#define B64_DEF_LINE_SIZE   72
#define B64_MIN_LINE_SIZE    4

/*
** encodeblock
**
** encode 3 8-bit binary bytes as 4 '6-bit' characters
*/
static void encodeblock( unsigned char *in, unsigned char *out, int len )
{
    out[0] = (unsigned char) cb64[ (int)(in[0] >> 2) ];
    out[1] = (unsigned char) cb64[ (int)(((in[0] & 0x03) << 4) | ((in[1] & 0xf0) >> 4)) ];
    out[2] = (unsigned char) (len > 1 ? cb64[ (int)(((in[1] & 0x0f) << 2) | ((in[2] & 0xc0) >> 6)) ] : '=');
    out[3] = (unsigned char) (len > 2 ? cb64[ (int)(in[2] & 0x3f) ] : '=');
}

/*
** encode_buff
**
** base64 encode a buffer adding padding and line breaks as per spec.
** returns -1 if the output buffer if not large enough. otherwise 0.
*/
int encode_buff( char *inbuff, int inlen, char *outbuff, int outlen, int linesize ) {
    unsigned char in[3];
    unsigned char out[4];
    int i, len, blocksout = 0;
    int index = 0;
    int outdex = 0;

    if (linesize == 0) {
        linesize = B64_DEF_LINE_SIZE;
    }
    else if (linesize < B64_MIN_LINE_SIZE) {
        linesize = B64_MIN_LINE_SIZE;
    }
    *in = (unsigned char) 0;
    *out = (unsigned char) 0;
    while( index < inlen ) {
        len = 0;
        for( i = 0; i < 3; i++ ) {
            in[i] = (unsigned char) inbuff[index];

            if(index < inlen) {
                len++;
            }
            else {
                in[i] = (unsigned char) 0;
            }
            index++;
        }
        if( len > 0 ) {
            encodeblock( in, out, len );
            for( i = 0; i < 4; i++ ) {
                if (outdex < outlen) {
                   outbuff[outdex] = out[i];
                }
                else {
                   outdex = -1;
                   break;
                }
                outdex++;
            }
            blocksout++;
        }
        if( blocksout >= (linesize/4) || (index >= inlen )) {
            if( blocksout > 0 ) {
                outbuff[outdex++] = '\n';
            }
            blocksout = 0;
        }
    }
    return( outdex );
}

/*
** decodeblock
**
** decode 4 '6-bit' characters into 3 8-bit binary bytes
*/
static void decodeblock( unsigned char *in, unsigned char *out ) {   
    out[ 0 ] = (unsigned char ) (in[0] << 2 | in[1] >> 4);
    out[ 1 ] = (unsigned char ) (in[1] << 4 | in[2] >> 2);
    out[ 2 ] = (unsigned char ) (((in[2] << 6) & 0xc0) | in[3]);
}

/*
** decode_buff
**
** decode a base64 encoded buffer discarding padding, line breaks and noise.
** returns -1 if the output buffer if not large enough. otherwise 0.
*/
int decode_buff( char *inbuff, int inlen, char *outbuff, int outlen )
{
    unsigned char in[4];
    unsigned char out[3];
    int v;
    int i, len;
    int index = 0;
    int outdex = 0;

    *in = (unsigned char) 0;
    *out = (unsigned char) 0;
    while(index < inlen ) {
        for( len = 0, i = 0; i < 4 && (index < inlen); i++ ) {
            v = 0;
            while( (index < inlen) && v == 0 ) {
                v = inbuff[index];
                if( index < inlen ) {
                    v = ((v < 43 || v > 122) ? 0 : (int) cd64[ v - 43 ]);
                    if( v != 0 ) {
                        v = ((v == (int)'$') ? 0 : v - 61);
                    }
                }
                index++;
            }
            if( index < inlen ) {
                len++;
                if( v != 0 ) {
                    in[ i ] = (unsigned char) (v - 1);
                }
            }
            else {
                in[i] = (unsigned char) 0;
            }
        }
        if( len > 0 ) {
            decodeblock( in, out );
            for( i = 0; i < len - 1; i++ ) {
                if( outdex < outlen ) {
                    outbuff[outdex] = out[i];
                }
                else {
                    outdex = -1;
                    break;
                }
                outdex++;
            }
        }
    }
    return( outdex );
}

