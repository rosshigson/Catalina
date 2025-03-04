{{
'------------------------------------------------------------------------------
' Catalina_NMM_threaded_dynamic - Implements a multi-threaded dynamically 
'                                 loadable Native Memory Model Kernel 
'                                 intended for use by the Catalina Code 
'                                 Generator backend for LCC 
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

#ifdef BLACKBOX
#error : THREADED KERNEL DOES NOT CURRENTLY SUPPORT THE BLACKBOX DEBUGGER
#endif

CON

#include <constant.inc>

' NO_INTERRUPTS - note that we CANNOT use SKIPF (which is enabled by the 
'                 symbol NO_INTERRUPTS) in either the dynamic or threaded 
'                 NMM kernels - either because they need interrupts themselves,
'                 or because because we cannot guarantee they will not be used
'                 in programs that use interrupts.  We cannot check even check
'                 for this this at compile time, because these kernels are 
'                 precompiled into the library. So we must simply avoid SKIPF.

' FAST_SAVE_RESTORE - if defined, we use fast block moves to save and restore
'                     multiple registers. This improves speed, but uses more
'                     stack space. Can be defined here, but not on the 
'                     command-line for programs that use multiple cogs.
'                     Note that if you change this option, you also need 
'                     to change it in the non-dynamic threaded kernel, and 
'                     recompile the library.
'
'#ifndef FAST_SAVE_RESTORE
'#define FAST_SAVE_RESTORE
'#endif

'--------------------- Start of NMM Dynamic Kernel ----------------------------

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

_Thread_init
r5      rdlong  r3,PTRA++      '$1b load argc
r6      rdlong  r2,PTRA++      '$1c load argv
r7      sub     SP,#(THREAD_BLOCK_SIZE-THREAD_EXT_OFF)*4 '$1d  write -1 ...
r8      neg     t1,#1          '$1e ... to extended information ...
r9      wrlong  t1,SP          '$1f ... (i.e. we are not a pthread!)
r10     sub     SP,#(THREAD_EXT_OFF-THREAD_AFF_OFF)*4 '$20 set up ...
r11     cogid   t1             '$21 ... affinity ...
r12     shl     t1,#8          '$22 ... flags ... 
r13     wrlong  t1,r4          '$23 ... and set ticks to zero
r14     sub     r4,#THREAD_AFF_OFF*4 '$24 point to begining of thread block
r15     wrlong  r4,r4          '$25 make thread block point to itself
r16     mov     TP,r4          '$26 make thread block the current thread
r17     mov     ijmp3,#NMM_isr '$27 set int3 vector
r18     getct   ct3            '$28 set initial ct3 target
r19     addct3  ct3,ticks      '$29 (interrupt will do nothing till TP set)
r20     setint3 #3             '$2a set int3 for ct-passed-ct3 event
r21     sub     r4,#12         '$2b allow space for spilled arguments
r22     rdlong  r0,PTRA++      '$2c load return address
r23     wrlong  r0,r4          '$2d set up return address
Save_PC ret                    '$2e
Save_FP long  0                '$2f
Save_SP long  0                '$30
Save_PA long  0                '$31

Bit31   long  $80000000        '$32
all_1s  long  $ffffffff        '$33
cviu_m1 long  $000000ff        '$34
cviu_m2 long  $0000ffff        '$35
top8    long  $ff000000        '$36 top 8 bits bitmask
low24   long  $00ffffff        '$37 low 24 bits bitmask

req     long  0                '$38 request block address
reg     long  0                '$39 registry address

t1      long  0                '$3a
t2      long  0                '$3b
t3      long  0                '$3c
t4      long  0                '$3d

ct1     long  0                '$3e
ct2     long  0                '$3f
ct3     long  0                '$40


DBG1    long  0                '$41 ' debugger opAddr
DBG2    long  0                '$42 ' debugger temp

' nmm_init : initialize VM - note that this code must be at least 17 longs
'            to make various offsets match the main kernel, where this
'            code may be overlaid by 19 longs of debug code once 
'            initialization is complete - eventually, the same may be
'            true of this kernel as well.  

DEBUG_OVERLAY
nmm_init
        rdlong  reg,PTRA++     '$43  1 load registry address (used later)   
        cogid   r2             '$44  2 register ...
        shl     r2,#2          '$45  3 ... ourselves ...
        add     r2,reg         '$46  4 ... as ...
        rdlong  req,r2         '$47  5 ... a ...
        and     req,low24      '$48  6 ... new ...
        wrlong  req,r2         '$49  7  kernel
        rdlong  r1,PTRA++      '$4a  8 load initial PC (to r1 temporarily)
        rdlong  r4,PTRA++      '$4b  9 load initial SP (to r4 temporarily)
        rdlong  r0,PTRA++      '$4c 10 load initial LUT library size (-1)
        rdlong  r2,PTRA++      '$4d 11 load initial LUT library address
        setq2   r0             '$4e 12 copy lut library ...
        rdlong  $100,r2        '$4f 13 ... to LUT RAM, starting at $100
        mov     r0,#0          '$50 14 zero ...
        wrlong  r0,req         '$51 15 ... our request block  
        call    #_Thread_init  '$52 16 set up initial thread
        mov     PTRA,r4        '$53 17 set up correct SP 
        jmp     r1             '$54 18 we can now start executing Native code
        long    0              '$55 19
        long    0              '$56 20
        long    0              '$57 21
        long    0              '$58 22
        long    0              '$59 23
        long    0              '$5a 24
        long    0              '$5b 25
        long    0              '$5c 26
        long    0              '$5d 27
        long    0              '$5e 28
        long    0              '$5f 29
'
' push_i - push a value whose address is specified indirectly in a 
'          frame variable onto the stack
'
push_i
       stalli               ' disable interrupts
       rdlong RI,PA         ' load the long value
       adds   RI,PTRB       ' add the frame pointer
push_x
       stalli               ' disable interrupts
       rdlong RI,RI         ' read the value at that address
       wrlong RI,--PTRA     ' save value on stack
       add    PA,#4         ' increment PC ...
returni
       allowi               ' ... enable interrupts ...
       jmp    PA            ' ... and return

'
' push_m - push many registers (specified by long at PC) onto the stack,
' decrementing the SP (PTRA) before each one
'
push_m
       stalli               ' disable interrupts
#ifdef FAST_SAVE_RESTORE
       sub     PTRA,#18*4
       mov     t1,PTRA
       setq    #18-1        ' save 18 registers ...
       wrlong  r6,t1        ' ... to register save area
#else
       rdlong RI,PA         ' load the long value specifying registers to push
       mov    t1,RI         ' save register specification for later
       shr    RI,#6         ' ignore registers r0 - r5 (never saved)
       mov    t3,#r6        ' start with r6
push_nxt
       shr    RI,#1 wcz     ' save rX?
 if_c  altd   t3            ' yes - decrement SP ...
 if_c  wrlong 0-0,--PTRA    ' ... and save the register
       add    t3,#1         ' point to next register
 if_nz jmp    #push_nxt     ' continue till all registers saved
       wrlong t1,--PTRA     ' save register specification
#endif
       add    PA,#4         ' increment PC ...
       jmp    #returni      ' ... and return

Bits18 long   %0000_0000_0000_0011_1111_1111_1111_1111

'
' pop_m - pop many registers (specified by the long on top of stack) 
' from the stack, incremening the SP after each one
'
pop_m
       stalli               ' disable interrupts
#ifdef FAST_SAVE_RESTORE
       mov     t1,PTRA
       setq    #18-1        ' read 18 registers ...
       rdlong  r6,t1        ' ... from register save area
       add     PTRA,#18*4
#else
       rdlong RI,PTRA++     ' pop the long value specifying registers to pop
       mov    t2,#r23       ' start with ...
       shl    RI,#(32-24)   ' ... r23         
pop_nxt
       shl    RI,#1 wcz     ' load rX?
 if_c  altd   t2            ' yes - load the register ...
 if_c  rdlong 0-0,PTRA++    ' ... and increment the stack pointer
 if_nz sub    t2,#1         ' if more to do, point to previous register ...
 if_nz jmp    #pop_nxt      ' ... and continue till all registers popped
#endif
       jmp    #returni

'
' push_b - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP (PTRA). 
'
push_b
       stalli               ' disable interrupts
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
       stalli               ' disable interrupts
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
       stalli
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
       stalli               ' disable interrupts
       add    PTRA,#4       ' allow for alloca
       rdlong PTRB,PTRA++   ' restore previous FP (PTRB)
f_ret
       stalli               ' disable interrupts
       rdlong PA,PTRA       ' read the PC
       add    PTRA,#8       ' increment the SP (PTRA)
       jmp    #returni
'
' f_call - call the routine at the address pointed to by the PC
' f_cali - call the routine whose address is in RI
'
f_call
       stalli               ' disable interrupts
       rdlong RI,PA         ' get the address to call
       add    PA,#4         ' increment the PC (this is the return address)
f_cali
       stalli               ' disable interrupts
       sub    PTRA,#8       ' decrement the SP (PTRA)
       wrlong PA,PTRA       ' save current PC to stack
       allowi               ' enable interrupts
       jmp    RI            ' execute next instruction

'fd_32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1

f_d32s
       stalli               ' disable interrupts
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
       stalli               ' disable interrupts
       call   #\do_plugin   ' do_plugin does all the work
       jmp    #returni

'-------------------------- Multi-Threading Support ----------------------------

' NMM_isr - check whether we should context switch (and switch if so)
                 
NMM_isr
        stalli
        getct   ct3
        addct3  ct3,##180000    ' interrupt every millisec (nominal)
        cmps    lock,#0 wcz     ' lock set yet?
  if_b  jmp     #NMM_resume     ' no - cannot switch yet
        bith    lockbits,lock wcz    ' have we acquired ...              
 if_nz  locktry lock wc              ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits,lock    ' true = if_c_and_nz, false = if_nc_or_z
 if_nc_or_z  jmp #NMM_resume    ' no - cannot switch - restore C & Z and resume
        rdlong  t2, TP wz       ' yes - is there a next thread block pointer?
 if_z   jmp     #NMM_unlock     ' no - unlock and resume
        rdlong  t1, req wz      ' yes - is there an affinity request oustanding?
 if_nz  jmp     #NMM_affine     ' yes - service it         
        cmp     t2, TP wz       ' no - is there only one thread executing?
 if_z   jmp     #NMM_unlock     ' yes - unlock and resume
        djnz    ticks, #NMM_unlock ' no - time to switch?
NMM_switch
        mov     t3, t2          ' yes - get ...
        add     t3, #THREAD_AFF_OFF*4+1 ' ... affinity byte 
        rdbyte  t1, t3          ' ... of proposed next thread
        test    t1, #%11100000 wz ' affinity stop, or thread terminated or completed?
  if_z  jmp     #:next          ' no - switch to next thread
        or      t1, #%10000000  ' yes - make sure ...
        wrbyte  t1, t3          ' ... thread terminated bit of next thread is set
        rdlong  t2, t2          ' remove next thread ...
        wrlong  t2, TP          ' ... from the executing thread list
:next   mov     t1, TP          ' point to ...  
        add     t1, #THREAD_REG_OFF*4 ' ... current thread register save area
        mov     Save_PC,iret3   ' Save PC and flags
        mov     Save_PA,PA      ' Save PA
        mov     Save_FP,FP      ' Save FP
        mov     Save_SP,SP      ' Save SP
        setq    #30-1           ' save 30 registers ...
        wrlong  RI,t1           ' ... to register save area
        mov     TP, t2          ' set TP to next thread block
        add     t2, #THREAD_REG_OFF*4 ' point to that thread's register save area
        setq    #30-1           ' load 30 registers ...
        rdlong  RI,t2           ' ... from register save area
        mov     SP,Save_SP      ' restore SP
        mov     FP,Save_FP      ' restore FP
        mov     PA,Save_PA      ' restore PA
        mov     iret3,Save_PC   ' restore PC and flags
        mov     t1,TP           ' up date ticks ...
        add     t1,#THREAD_AFF_OFF*4+2 ' ... with ticks ...
        rdword  ticks,t1        ' ... for current thread ...
        and     t1,##%11111111111111 ' ticks is lower 14 bits
        add     ticks,#1        ' ensure ticks is not zero
NMM_unlock
        lockrel lock                 ' release inter-cog lock
        bitl    lockbits,lock        ' release intra-cog lock
NMM_resume
        allowi
        reti3                   ' resume execution
NMM_affine
        cmp     t2, TP wz       ' is there only one thread executing?
 if_nz  rdlong  t3, t2          ' no - get next thread of next thread ...        
 if_nz  wrlong  t3, t1          ' no - ... and make it next thread of new thread
 if_z   wrlong  t2, t1          ' yes - make new thread next thread of current thread 
        wrlong  t1, t2          ' make current thread next thread of new thread 
        mov     t3, #THREAD_AFF_OFF*4+1 ' update ...
        add     t3, t1          ' ...
        rdbyte  t4, t3          ' ...
        cogid   t1              ' ...
        andn    t4, #%111       ' ...
        or      t4, t1          ' ...
        wrbyte  t4, t3          ' ... thread affinity
        mov     t3, #0          ' zero ...
        wrlong  t3, req         ' ... request block
        jmp     #NMM_switch     ' now switch to next thread
NMM_force
        stalli                  ' disable interrupts
        mov     iret3,PA        ' set up return address as if from interrupt
        rdlong  t2, TP wz       ' is there a next thread block pointer?
 if_z   jmp     #NMM_unlock     ' no - unlock and resume
        rdlong  t1, req wz      ' yes - is there an affinity request oustanding?
 if_nz  jmp     #NMM_affine     ' yes - service it         
        cmp     t2, TP wz       ' no - is there only one thread executing?
 if_nz  jmp     #NMM_switch     ' no - perform context switch
        jmp     #NMM_unlock     ' yes - unlock, restore C & Z and resume

'--------------------- End of NMM Kernel --------------------------------------

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
flt_add                 stalli
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

flt_mul                 stalli
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

flt_div                 stalli
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

flt_int                 stalli  
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

int_flt                 stalli 
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

flt_cmp                 stalli
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

'-------------------------- Multi-Threading Support ----------------------------

' These must be in the same place in all the threaded kernels of the 
' same 'flavor' (i.e. CMM, LMM, NMM etc). 

         fit    $1e7
         orgf   $1e7

ticks    long   180000          ' time between context switches (initial value)
TP       long   0               ' current thread pointer
lock     long   -1              ' lock to use for context switching
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

         org $300

' Common Kernel library functions. This code is included only to get the LUT
' offsets correct in the dynamically loaded kernel. The actual LUT code is 
' loaded into LUT from elsewhere. There must be a better way to do this, but I
' can't think of one at the moment :(

#include "klib.inc"

#include "nmmklib.inc"

#include "thlib.inc"
