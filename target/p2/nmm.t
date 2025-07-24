{{
'------------------------------------------------------------------------------
' Catalina_NMM - Implements a Native Memory Model Kernel intended
'                for use by the Catalina Code Generator backend 
'                for LCC 
'
' Version 3.15 - Initial version.
'
'
' This file incorporates software derived from:
'    Float_32A by Cam Thompson, Micromega Corporation, 
'              Copyright (c) 2006-2007 Parallax, Inc.
'
'------------------------------------------------------------------------------
'
'    Copyright 2009 Ross Higson
'
'    The portion of this file identified as the LMM Kernel is part of the 
'    Catalina Target Package.
'
'    The Catalina Target Package is free software: you can redistribute 
'    it and/or modify it under the terms of the GNU Lesser General Public 
'    License as published by the Free Software Foundation, either version 
'    3 of the License, or (at your option) any later version.
'
'    The Catalina Target Package is distributed in the hope that it will
'    be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
'    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
'    See the GNU Lesser General Public License for more details.
'
'    You should have received a copy of the GNU Lesser General Public 
'    License along with the Catalina Target Package.  If not, see 
'    <http://www.gnu.org/licenses/>.
'
'------------------------------------------------------------------------------
}}

#include <constant.inc>

' NO_INTERRUPTS - if defined, we can the use SKIPF because this code will not  
'                 be used in an interrupt service routine. Can be defined here 
'                 or on the command-line (i.e. -C NO_INTERRUPTS)

'#ifndef NO_INTERRUPTS
'#define NO_INTERRUPTS
'#endif

' FAST_SAVE_RESTORE - if defined, we use fast block moves to save and restore
'                     multiple registers. This improves speed, but uses more
'                     stack space. Can be defined here or on the command-line 
'                     (i.e. -C FAST_SAVE_RESTORE) for single kernel programs,
'                     but for multi-kernel programs it must be defined both
'                     here and in the dynamic kernel, and then recompile the 
'                     library. This option can't be used with NO_INTERRUPTS, 
'                     which uses SKIPF.
'
'#ifndef FAST_SAVE_RESTORE
'#define FAST_SAVE_RESTORE
'#endif

' SUPPORT_LUT_EXEC - if defined, modify the PSHM primitive to expect the
'                    register specification to be passed in RI instead of
'                    in the LONG following the PSHM primitive. See also the
'                    changes required in the LCC backend (the file name is
'                    'catalina_p2_native.md') and note that similar changes
'                    to those in this kernel will be required in all other
'                    NMM kernels, and that LCC and the libraries will all 
'                    have to be recompiled).
'
'#ifndef SUPPORT_LUT_EXEC
'#define SUPPORT_LUT_EXEC
'#endif


'--------------------- Start of NMM Kernel ------------------------------------

DAT

        org 0
KERNEL_START

' the first $54 longs must be in the same place in all NMM kernels, to 
' allow for the separate compilation of code that uses these locations

INIT    jmp #nmm_init          '$00 ' CAN ONLY BE CALLED ONCE !!!
PSHB    jmp #push_b            '$01
CPYB    jmp #copy_b            '$02
NEWF    jmp #new_fp            '$03
RETF    jmp #fp_ret            '$04
CALA    jmp #f_call            '$05
RETN    jmp #f_ret             '$06
CALI    jmp #f_cali            '$07
DIVS    jmp #f_d32s            '$08
SYSP    jmp #plugin            '$09
FADD    jmp #flt_add           '$0a
FSUB    jmp #flt_sub           '$0b
FMUL    jmp #flt_mul           '$0c
FDIV    jmp #flt_div           '$0d
FCMP    jmp #flt_cmp           '$0e
FLIN    jmp #flt_int           '$0f
INFL    jmp #int_flt           '$10
PSHM    jmp #push_m            '$11
POPM    jmp #pop_m             '$12
PSHF    jmp #push_i            '$13

RI      long 0                 '$14
BC      long 0                 '$15

r0      long 0                 '$16
r1      long 0                 '$17
r2      long 0                 '$18
r3      long 0                 '$19
r4      long 0                 '$1a
r5      long 0                 '$1b 
r6      long 0                 '$1c 
r7      long 0                 '$1d 
r8      long 0                 '$2e 
r9      long 0                 '$2f 
r10     long 0                 '$20 
r11     long 0                 '$21 
r12     long 0                 '$22 
r13     long 0                 '$23 
r14     long 0                 '$24 
r15     long 0                 '$25 
r16     long 0                 '$26 
r17     long 0                 '$27 
r18     long 0                 '$28 
r19     long 0                 '$29
r20     long 0                 '$2a
r21     long 0                 '$2b
r22     long 0                 '$2c
r23     long 0                 '$2d

#if defined(QUICKBUILD) || defined(QUICKFORCE)
Save_PC long 0                 '$2e
#else                             
Save_PC long @C_main           '$2e set here only for creating blobs!
#endif
Save_FP long 0                 '$2f
Save_SP long 0                 '$30
Save_PA long 0                 '$31

Bit31   long  $80000000        '$32
all_1s  long  $ffffffff        '$33
cviu_m1 long  $000000ff        '$34
cviu_m2 long  $0000ffff        '$35
top8    long  $ff000000        '$36 top 8 bits bitmask
low24   long  $00ffffff        '$37 low 24 bits bitmask

req     long  0                '$38 request block address
reg     long  0                '$39 registry address

' NOTE - the initial values below are used only during kernel initialization

t1      long  HUB_TOP          '$3a
t2      long  FREE_MEM         '$3b
t3      long  REQUESTS         '$3c
t4      long  REGISTRY         '$3d

ct1     long  0                '$3e
ct2     long  0                '$3f
ct3     long  0                '$40

DBG1    long  0                '$41 ' debugger opAddr
DBG2    long  0                '$42 ' debugger temp

' nmm_init : initialize VM - note that this code may be overlaid by 
'            19 longs of debug code once initialization is complete  

DEBUG_OVERLAY
nmm_init
#if defined(QUICKBUILD) || defined(QUICKFORCE)
        rdlong  reg,PTRA++      '$43  1 load registry address (used later)   
        cogid   r2              '$44  2 register ...
        shl     r2,#2           '$45  3 ... ourselves ...
        add     r2,reg          '$46  4 ... as ...
        rdlong  req,r2          '$47  5 ... a ...
        and     req,low24       '$48  6 ... new ...
        wrlong  req,r2          '$49  7  kernel
        rdlong  save_PC,PTRA++  '$4a  8 load initial PC
        rdlong  save_SP,PTRA++  '$4b  9 load initial SP
        rdlong  r0,PTRA++       '$4c 10 load initial LUT library size (-1)
        rdlong  r1,PTRA++       '$4d 11 load initial LUT library address
        rdlong  r3,PTRA++       '$4e 12 load initial arg1
        rdlong  r2,PTRA++       '$4f 13 load initial arg2
        nop                     '$50 14 
        setq2   r0              '$51 15 copy lut library ...
        rdlong  $100,r1         '$52 16 ... to LUT RAM, starting at $100
        mov     SP,Save_SP      '$45 17
        jmp     save_PC         '$54 18 jump to initial PC
#else
        wrlong  t1,t2           '$43  1 set up free memory pointer
        mov     reg,t4          '$44  2 point to registry
        cogid   t2              '$45  3 get our cog id
        shl     t2,#2           '$46  4 point to ...
        add     t4,t2           '$47  5 ... our registry entry
        rdlong  t2,t4           '$48  6 get our request block
        and     t2,low24        '$49  7 register ...    
        wrlong  t2,t4           '$4a  8 ... our kernel
        setq2   #(LUT_LIBRARY_END - LUT_STARTUP - 1) '$4b 9 load start/library code ...
        rdlong  0, ##@LUT_STARTUP '$4c&4d 10&11 ... to LUT RAM
        neg     t1,#1           '$4e 12 set ... MEM_LOCK ...
        wrlong  t1,##MEM_LOCK   '$4f&50 13&14 ... to unused
        call    #_C_init        '$51 15 execute startup code
        jmp     #C_main         '$52 16 start executing C code
        long    0               '$53 17
        long    0               '$54 18
#endif
        long    0               '$55 19
        long    0               '$56 20
        long    0               '$57 21
        long    0               '$58 22
        long    0               '$59 23
        long    0               '$5a 24
        long    0               '$5a 25
        long    0               '$5b 26
        long    0               '$5c 27
        long    0               '$5d 28
        long    0               '$5e 29
'
' push_i - push a value whose address is specified indirectly in a 
'          frame variable onto the stack
'
push_i
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       rdlong RI,PA         ' load the long value
       adds   RI,PTRB       ' add the frame pointer
push_x
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       rdlong RI,RI         ' read the value at that address
       wrlong RI,--PTRA     ' save value on stack
       add    PA,#4         ' increment PC ...
returni
#ifndef NO_INTERRUPTS
       allowi               ' ... enable interrupts ...
#endif
       jmp    PA            ' ... and return

'
' push_m - push many registers (specified by RI) onto the stack,
' decrementing the SP (PTRA) before each one
'
push_m
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
#ifdef FAST_SAVE_RESTORE
       sub     PTRA,#18*4
       mov     t1,PTRA
       setq    #18-1        ' save 18 registers ...
       wrlong  r6,t1        ' ... to register save area
#else
#ifndef SUPPORT_LUT_EXEC
       rdlong RI,PA         ' load the long value specifying registers to push
#endif
#ifndef NO_INTERRUPTS
       mov    t1,RI         ' save register specification for later
       shr    RI,#6         ' ignore registers r0 - r5 (never saved)
       mov    t3,#r6        ' start with r6
push_nxt
       shr    RI,#1 wcz     ' save rX?
 if_c  altd   t3            ' yes - decrement SP ...
 if_c  wrlong 0-0,--PTRA    ' ... and save the register
       add    t3,#1         ' point to next register
 if_nz jmp    #push_nxt     ' continue till all registers saved
#else
       shr    RI,#6         ' ignore registers r0 - r5 (never saved)
       not    RI            ' invert (i.e. skip instructions if bit clr)
       and    RI,Bits18     ' only skip a max of 18 insructions
       mov    t1,RI         ' save register specification for later
       skipf  RI            ' save register if bit clear
       wrlong r6,--PTRA
       wrlong r7,--PTRA
       wrlong r8,--PTRA
       wrlong r9,--PTRA
       wrlong r10,--PTRA
       wrlong r11,--PTRA
       wrlong r12,--PTRA
       wrlong r13,--PTRA
       wrlong r14,--PTRA
       wrlong r15,--PTRA
       wrlong r16,--PTRA
       wrlong r17,--PTRA
       wrlong r18,--PTRA
       wrlong r19,--PTRA
       wrlong r20,--PTRA
       wrlong r21,--PTRA
       wrlong r22,--PTRA
       wrlong r23,--PTRA
#endif
       wrlong t1,--PTRA     ' save register specification
#endif
#ifndef SUPPORT_LUT_EXEC
       add    PA,#4         ' increment PC ...
#endif
       jmp    #returni      ' ... and return

Bits18 long   %0000_0000_0000_0011_1111_1111_1111_1111

'
' pop_m - pop many registers (specified by the long on top of stack) 
' from the stack, incremening the SP after each one
'
pop_m
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
#ifdef FAST_SAVE_RESTORE
       mov     t1,PTRA
       setq    #18-1        ' read 18 registers ...
       rdlong  r6,t1        ' ... from register save area
       add     PTRA,#18*4
#else
       rdlong RI,PTRA++     ' pop the long value specifying registers to pop
#ifndef NO_INTERRUPTS
       mov    t2,#r23       ' start with ...
       shl    RI,#(32-24)   ' ... r23         
pop_nxt
       shl    RI,#1 wcz     ' load rX?
 if_c  altd   t2            ' yes - load the register ...
 if_c  rdlong 0-0,PTRA++    ' ... and increment the stack pointer
 if_nz sub    t2,#1         ' if more to do, point to previous register ...
 if_nz jmp    #pop_nxt      ' ... and continue till all registers popped
#else
       rev    RI            ' reverse the bits (now specifies r31 .. r0)
       shr    RI,#(31-23)+6 ' start with r23
       skipf  RI            ' load register if bit clear
       rdlong r23,PTRA++
       rdlong r22,PTRA++
       rdlong r21,PTRA++
       rdlong r20,PTRA++
       rdlong r19,PTRA++
       rdlong r18,PTRA++
       rdlong r17,PTRA++
       rdlong r16,PTRA++
       rdlong r15,PTRA++
       rdlong r14,PTRA++
       rdlong r13,PTRA++
       rdlong r12,PTRA++
       rdlong r11,PTRA++
       rdlong r10,PTRA++
       rdlong r9,PTRA++
       rdlong r8,PTRA++
       rdlong r7,PTRA++
       rdlong r6,PTRA++
#endif
#endif
       jmp    #returni

'
' push_b - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP (PTRA). 
'
push_b
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       rdlong BC,PA         ' load the byte count
       add    PA,#4         ' increment the PC
       mov    t3,BC         ' round up the count ...
       add    t3,#3         ' ... to be ...
       andn   t3,#3         ' ... a multiple of 4
       sub    PTRA,t3       ' decrement SP (PTRA) by rounded up size
       mov    t1,R0         ' source is in R0
       mov    t2,PTRA       ' destination is SP (PTRA)
       jmp    #copy_bytes   ' do the copy
'
' copy_b - copy a structure (size in bytes at the PC)
'          from the address in R1 to the address in R0
'
copy_b
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       rdlong BC,PA         ' load the byte count
       add    PA,#4         ' increment the PC
       mov    t1,R1         ' source is in R1
       mov    t2,R0         ' destination is in R0
'
copy_bytes
       rep    #4,BC         ' repeat the next 4 instructions BC times
       rdbyte t3,t1         ' read from src to t3
       wrbyte t3,t2         ' write t3 to dst
       add    t1,#1         ' increment source
       add    t2,#1         ' increment destination
       jmp    #returni
'
' new_fp - save current frame pointer and set up a new frame pointer
' also calculate what SP (PTRA) was before data was pushed and save it in BC
'
new_fp
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       wrlong PTRB,--PTRA   ' save FP (PTRB) to stack
       mov    PTRB,PTRA     ' set up new FP (PTRB)
       add    BC,#8         ' calculate what SP (PTRA) was ...
       add    BC,PTRB       ' ... before arguments were pushed
       sub    PTRA,#4       ' allow for alloca
       wrlong Bit31,PTRA    ' initialize pre-alloca SP (to a known value)
       jmp    #returni
'
' fp_ret - pop current frame, restore previous frame and stack pointers,
'          then restore the previous program counter
'
' f_ret -  just restore the previous program counter
'
fp_ret
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       add    PTRA,#4       ' allow for alloca
       rdlong PTRB,PTRA++   ' restore previous FP (PTRB)
f_ret
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       rdlong PA,PTRA       ' read the PC
       add    PTRA,#8       ' increment the SP (PTRA)
       jmp    #returni
'
' f_call - call the routine at the address pointed to by the PC
' f_cali - call the routine whose address is in RI
'
f_call                    
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       rdlong RI,PA         ' get the address to call
       add    PA,#4         ' increment the PC (this is the return address)
f_cali
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       sub    PTRA,#8       ' decrement the SP (PTRA)
       wrlong PA,PTRA       ' save current PC to stack
#ifndef NO_INTERRUPTS
       allowi               ' enable interrupts
#endif
       jmp    RI            ' execute next instruction

'fd_32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1

f_d32s
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       call   #\signed_d32  ' perform signed division
       jmp    #returni

' plugin - call a plugin
' On entry:
'       R3 = code:
'            - cog id if >= 128 (i.e. $80 + cog id)
'            - plugin type if < 128 (i.e. 0 .. 127)
'            - service id if < 0
'       R2 = data (optional pointer)
'
' NOTES: Locks are currently only supported when invoking via a service id.
'        When using service id, the data should only use the lower 24 bits.
'
' On exit:
'       R0 = result

plugin
#ifndef NO_INTERRUPTS
       stalli               ' disable interrupts
#endif
       call   #\do_plugin   ' do_plugin does all the work
       jmp    #returni

'--------------------- Start of Float32 Components ----------------------------

{{
                            TERMS OF USE: MIT License 
              (Float32 Components only - i.e. excludes LMM Kernel)

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
}}

#ifndef CONSTANTS_INCLUDED

CON

' Float32 constants:

SignFlag      = $1
ZeroFlag      = $2
NaNFlag       = $8

#endif

DAT

'------------------------------------------------------------------------------
' Float32 Assembly language routines
'------------------------------------------------------------------------------
' flt_add   r0 = r0 + r1
' flt_sub   r0 = r0 - r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1
'------------------------------------------------------------------------------

flt_sub                 xor     r1, Bit31               ' negate B
flt_add                 
#ifndef NO_INTERRUPTS
                        stalli               ' disable interrupts
#endif
                        call    #_Unpack2               ' unpack two variables
          if_c_or_z     jmp     #returni                ' check for NaN or B = 0

                        test    flagA, #SignFlag wz     ' negate A mantissa if negative
          if_nz         neg     manA, manA
                        test    flagB, #SignFlag wz     ' negate B mantissa if negative
          if_nz         neg     manB, manB

                        mov     t1, expA                ' align mantissas
                        sub     t1, expB
                        abs     t1, t1
                        fle     t1, #31
                        cmps    expA, expB wcz
          if_nz_and_nc  sar     manB, t1
          if_nz_and_c   sar     manA, t1
          if_nz_and_c   mov     expA, expB

                        add     manA, manB              ' add the two mantissas
                        cmps    manA, #0 wc             ' set sign of result
          if_c          or      flagA, #SignFlag
          if_nc         andn    flagA, #SignFlag
                        abs     manA, manA              ' pack result and exit
pack_rtni               call    #_Pack
                        jmp     #returni

'------------------------------------------------------------------------------
' flt_mul  r0 = r0 * r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1, t2
'------------------------------------------------------------------------------

flt_mul                 
#ifndef NO_INTERRUPTS
                        stalli               ' disable interrupts
#endif
                        call    #_Unpack2               ' unpack two variables
          if_nc         jmp     #flt_mul2               ' multiply if neither is NaN
                        cmp     expA, #255 wz           ' NaN, so check for r0 = Inf
          if_z          jmp     #flt_mul1               ' yes - return Inf
                        cmp     expB, #255 wz           ' no - check for r1 = Inf
          if_nz         jmp     #returni                ' no - return NaN
flt_mul1                mov     r0, Inf                 ' yes, r0 or r1 is Inf, so return Inf
                        xor     flagA, flagB            ' 
                        test    flagA, #SignFlag wz
          if_nz         or      r0, Bit31
                        jmp     #returni
flt_mul2                xor     flagA, flagB            ' get sign of result
                        add     expA, expB              ' add exponents
                        qmul    manA, manB
                        getqy   t1
                        shl     t1, #3                  ' justify result and exit
                        mov     manA, t1
                        jmp     #pack_rtni

'------------------------------------------------------------------------------
' flt_div  r0 = r0 / r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1, t2
'------------------------------------------------------------------------------

flt_div          
#ifndef NO_INTERRUPTS
                        stalli               ' disable interrupts
#endif
                        call    #_Unpack2               ' unpack two variables
          if_c_or_z     mov     r0, NaN                 ' check for NaN or divide by 0
          if_c_or_z     jmp     #returni

                        xor     flagA, flagB            ' get sign of result
                        sub     expA, expB              ' subtract exponents

                        shr     manA, #1
                        setq    manA
                        qdiv    #0, manB
                        getqx   manA
                        shr     manA, #2
                        jmp     #pack_rtni

'------------------------------------------------------------------------------
' flt_int  r0 = float(r0)
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

flt_int            
#ifndef NO_INTERRUPTS
                        stalli               ' disable interrupts
#endif
                        mov     flagA, r0               ' get integer value
                        mov     r0, #0                  ' set initial result to zero
                        abs     manA, flagA wz          ' get absolute value of integer
          if_z          jmp     #returni                ' if zero, exit
                        shr     flagA, #31              ' set sign flag
                        mov     expA, #31               ' set initial value for exponent
normalize_1             shl     manA, #1 wc             ' normalize the mantissa
          if_nc         sub     expA, #1                ' adjust exponent
          if_nc         jmp     #normalize_1
                        rcr     manA, #1                ' justify mantissa
                        shr     manA, #2
                        jmp     #pack_rtni

'------------------------------------------------------------------------------
' int_flt  r0 = fix(r0)
' changes: r0, flagA, expA, manA, t1
'------------------------------------------------------------------------------

int_flt                
#ifndef NO_INTERRUPTS
                        stalli               ' disable interrupts
#endif
fix                     call    #_Unpack                ' unpack floating point value
          if_c          jmp     #returni                ' check for NaN
                        shl     manA, #2                ' left justify mantissa
                        mov     r0, #0                  ' initialize result to zero
                        neg     expA, expA              ' adjust for exponent value
                        add     expA, #31 wz
                        cmps    expA, #33 wc
          if_nc_or_z    jmp     #returni
                        sub     expA, #1
                        shr     manA, expA
                        shr     manA, #1
                        test    flagA, #signFlag wz     ' check sign and exit
                        sumnz   r0, manA
                        jmp     #returni

'------------------------------------------------------------------------------
' flt_cmp   set Z and C flags for r0 - r1
' changes: status, t1
'------------------------------------------------------------------------------

flt_cmp                 
#ifndef NO_INTERRUPTS
                        stalli               ' disable interrupts
#endif
                        mov     t1, r0               ' compare signs
                        xor     t1, r1
                        and     t1, Bit31 wz
          if_z          jmp     #cmp1                  ' same, then compare magnitude

                        mov     t1, r0               ' check for +0 or -0
                        or      t1, r1
                        andn    t1, Bit31 wcz
          if_z          jmp     #returni

                        test    r0, Bit31 wc         ' compare signs
                        jmp     #returni

cmp1                    test    r0, Bit31 wz         ' check signs
          if_nz         jmp     #cmp2
                        cmp     r0, r1 wcz
                        jmp     #returni
cmp2                    cmp     r1, r0 wcz           ' reverse test if negative
                        jmp     #returni

'------------------------------------------------------------------------------
' input:   r0        32-bit floating point value
'          r1        32-bit floating point value
' output:  flagA        r0 flag bits (Nan, Infinity, Zero, Sign)
'          expA         r0 exponent (no bias)
'          manA         r0 mantissa (aligned to bit 29)
'          flagB        r1 flag bits (Nan, Infinity, Zero, Sign)
'          expB         r1 exponent (no bias)
'          manB         r1 mantissa (aligned to bit 29)
'          C flag       set if r0 or r1 is NaN
'          Z flag       set if r1 is zero
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1
'------------------------------------------------------------------------------

_Unpack2                mov     t1, r0               ' save A
                        mov     r0, r1               ' unpack B to A
                        call    #_Unpack

                        mov     r1, r0               ' save B variables
                        mov     flagB, flagA
                        mov     expB, expA
                        mov     manB, manA

                        mov     r0, t1               ' unpack A
                        call    #_Unpack
          if_nc         test    flagB, #NanFlag wz
          if_nc_and_nz  modc    _set wc
          _ret_         cmp     manB, #0 wz          ' set Z flag

'------------------------------------------------------------------------------
' input:   r0        32-bit floating point value
' output:  flagA        r0 flag bits (Nan, Infinity, Zero, Sign)
'          expA         r0 exponent (no bias)
'          manA         r0 mantissa (aligned to bit 29)
'          C flag       set if r0 is NaN
'          Z flag       set if r0 is zero
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

_Unpack                 mov     flagA, r0            ' get sign
                        shr     flagA, #31
                        mov     manA, r0             ' get mantissa
                        and     manA, Mask23
                        mov     expA, r0             ' get exponent
                        shl     expA, #1
                        shr     expA, #24 wz
          if_z          jmp     #zeroSubnormal         ' check for zero or subnormal
                        cmp     expA, #255 wz           ' check if finite
          if_nz         jmp     #finite
                        mov     r0, NaN              ' no, then return NaN
                        or      flagA, #NaNFlag
                        jmp     #U_exit2

zeroSubnormal           mov     t4, manA          
                        or      t4, expA wz             ' check for zero
          if_nz         jmp     #subnorm
                        or      flagA, #ZeroFlag        ' yes, then set zero flag
                        neg     expA, #150              ' set exponent and exit
                        jmp     #U_exit2

subnorm                 shl     manA, #7                ' fix justification for subnormals
subnorm2                test    manA, Bit29 wz
          if_nz         jmp     #U_exit1
                        shl     manA, #1
                        sub     expA, #1
                        jmp     #subnorm2

finite                  shl     manA, #6                ' justify mantissa to bit 29
                        or      manA, Bit29             ' add leading one bit

U_exit1                 sub     expA, #127              ' remove bias from exponent
U_exit2                 test    flagA, #NaNFlag wc      ' set C flag
          _ret_         cmp     manA, #0 wz             ' set Z flag

'------------------------------------------------------------------------------
' input:   flagA        r0 flag bits (Nan, Infinity, Zero, Sign)
'          expA         r0 exponent (no bias)
'          manA         r0 mantissa (aligned to bit 29)
' output:  r0        32-bit floating point value
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

_Pack                   cmp     manA, #0 wz             ' check for zero
          if_z          mov     expA, #0
          if_z          jmp     #P_exit3

normalize_2             shl     manA, #1 wc             ' normalize the mantissa
          if_nc         sub     expA, #1                ' adjust exponent
          if_nc         jmp     #normalize_2

                        add     expA, #2                ' adjust exponent
                        add     manA, #$100 wc          ' round up by 1/2 lsb
          if_c          add     expA, #1

                        add     expA, #127              ' add bias to exponent
                        fges    expA, Minus23
                        fles    expA, #255

                        cmps    expA, #1 wc             ' check for subnormals
          if_nc         jmp     #P_exit3

subnormal               or      manA, #1                ' adjust mantissa
                        ror     manA, #1

                        neg     expA, expA
                        shr     manA, expA
                        mov     expA, #0                ' biased exponent = 0

P_exit3                 mov     r0, manA             ' bits 22:0 mantissa
                        shr     r0, #9
                        shl     expA, #23
                        or      r0, expA
                        shl     flagA, #31
          _ret_          or      r0, flagA            ' bit 31 sign

NaN                     long    $7FFF_FFFF
Inf                     long    $7F80_0000
Minus23                 long    -23
Mask23                  long    $007F_FFFF
Bit29                   long    $2000_0000

flagA                   long    0
expA                    long    0
manA                    long    0

flagB                   long    0
expB                    long    0
manB                    long    0

'-------------------- End of Float32 Components -------------------------------

' lockbits must be in the same place in all NMM kernels

         fit    $1ea
         orgf   $1ea

lockbits long   0               ' lockbits used to simulate P1-style locks

' last 5 longs are reserved for debug overlay vectors (or debug LED)

         fit    $1eb                  
         orgf   $1eb

DEBUG_VECTORS
#ifdef DEBUG_LED
led_mask
         long   |< (_DEBUG_PIN-32)    
hex_value
         long   $10203040
hex_count
         long   $0
flash_count
         long   $0
         long   $0
#else
         long   DEBUG_BREAK
         long   DEBUG_ADDR
         long   DEBUG_OUT
         long   DEBUG_IN
         long   DEBUG_FLAG
#endif
         fit    $1f0

         fit    $1f8
         orgf   $1f8
SP       long   $0    ' SP is PTRA
FP       long   $0    ' FP is PTRB

'------------------------- END OF KERNEL --------------------------------------

