/*
 * spinc - Convert SPIN objects to C arrays. Based on the original program 
 *         by Steve Densen (original copyright below). 
 *
 *         Modified by Ross Higson for use with Catalina.
 *
 * Version 3.1 Added command line option processing.
 *             Added ability to generate byte array or long array.
 *             Added generation of #defines in header file.
 *             Added ability to generate whole SPIN program.
 *
 * Version 3.2 Added ability to specify the spin function to use.
 *
 * Version 3.3 - just update version number.
 *
 * Version 3.4 - just update version number.
 *
 * Version 3.5 - just update version number.
 *
 * Version 3.6 - just update version number.
 *
 * Version 3.7 - just update version number.
 *
 * Version 3.8 - just update version number.
 *
 * Version 3.9 - just update version number.
 *
 * Version 3.10 - just update version number.
 *
 * Version 4.1  - add blob support.
 *
 *              - fix an error in header definitions (was using "short"
 *                instead of "unsigned short")
 *
 * Version 4.2 - just update version number.
 *
 * Version 4.3  - Just update version number.
 *
 * Version 4.4  - Just update version number.
 *
 * Version 4.5  - Just update version number.
 *
 * Version 4.6  - Just update version number.
 *
 * Version 4.7  - Just update version number.
 *
 * Version 4.8  - Just update version number.
 *
 * Version 4.9  - Just update version number.
 *
 * Version 5.0  - Just update version number.
 *
 * Version 5.6  - Add support for extracting the code segment from binary 
 *                files that identify themselves as XMM SMALL or XMM 
 *                LARGE. Note that this is not full support for these files, 
 *                it is only intended to allow the extraction of code from the 
 *                Catalina library files, which are not true XMM binaries.
 *
 * Version 5.7  - Just update version number.
 *
 * Version 5.8  - Just update version number.
 *
 * Version 5.9  - Just update version number.
 *
 * Version 6.0  - Just update version number.
 *
 * Version 7.0  - Increase default stack size.
 *
 * Version 7.6  - allow hex constants and modifiers for stack size
 *
 * Version 7.9  - just update version number.
 *
 * version 8.1  - just update version number.
 *
 * version 8.2  - just update version number.
 *
 * version 8.3  - add '-g' option to generate file (required to use SpinC
 *                in Catalyst).
 *
 * version 8.4  - just update version number.
 *
 * version 8.5  - just update version number.
 *
 * version 8.6  - just update version number.
 *
 * ----------------------------------------------------------------------------
 * @file spinc.h
 * Defines data structures and API for spinc converter
 * Copyright (c) 2008, Steve Denson
 * ----------------------------------------------------------------------------
 */


#ifndef SPINC_H
#define SPINC_H

#define SPIN_OBJSTART 0x0010

#define LMM_LAYOUT 0
#define CMM_LAYOUT 8
#define NMM_LAYOUT 11
#define XMM_SMALL_LAYOUT 2 
#define XMM_LARGE_LAYOUT 5 

#define P2_CLOCKFREQ_OFFSET 0x1004
#define P2_CLOCKMODE_OFFSET 0x1008
#define P2_CODE_OFFSET      0x1010
#define P2_PC_OFFSET_CMM    0x0060
#define P2_PC_OFFSET_LMM    0x00AC
#define P2_PC_OFFSET_NMM    0x00B8

#define P2_PC_OFFSET_XMM    0x1038 // not currently used

#define VERSION       "8.6"

#define MAX_FILES     10
#define MAX_LINELEN   1000

typedef struct spinobj_struct {
    //short nextobj;
    unsigned short objlen;
    char  pubcnt;
    char  objcnt;
    int  meth_obj[512];
    //short pubstart;
    //short numlocal;
} SpinObj_st;

typedef struct spinhdr_struct {
    int     clkfreq;
    char    clkmode;
    char    sum;
    unsigned short   objstart;
    unsigned short   varstart;
    unsigned short   stkstart;
    unsigned short   pubstart;
    unsigned short   stkbase;
    char*   code;
} SpinHdr_st;

typedef struct catalina_p1_hdr_struct {
    unsigned int    init_BZ;
    unsigned int    init_PC;
    unsigned int    seglayout;
    unsigned int    catalina_code;
    unsigned int    catalina_cnst;
    unsigned int    catalina_init;
    unsigned int    catalina_data;
    unsigned int    catalina_ends;
    unsigned int    catalina_ro_base;
    unsigned int    catalina_rw_base;
    unsigned int    catalina_ro_ends;
    unsigned int    catalina_rw_ends;
    char*   code;
} CatalinaP1Hdr_st;

typedef struct catalina_p2_hdr_struct {
    unsigned int    seglayout;
    unsigned int    catalina_code;
    unsigned int    catalina_cnst;
    unsigned int    catalina_init;
    unsigned int    catalina_data;
    unsigned int    catalina_ends;
    unsigned int    catalina_ro_base;
    unsigned int    catalina_rw_base;
    unsigned int    catalina_ro_ends;
    unsigned int    catalina_rw_ends;
    char*   code;
} CatalinaP2Hdr_st;

#endif
// SPINC_H

