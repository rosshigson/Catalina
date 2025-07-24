{{
'------------------------------------------------------------------------------
' Catalina_LMM - Implements a Large Memory Model Kernel intended
'                for use by the Catalina Code Generator backend 
'                for LCC 
'
' Version 1.0 - initial version - by Ross Higson
' Version 2.0 - add new LMM primitives (RBYT,RWRD,RLNG,WBYT,WWRD,WLNG)
' Version 2.1 - added new Run method (makes current cog the kernel)
' Version 2.5 - Add Pullmoll's new f_d32s routine, and move debug vectors
' Version 3.5 - Minor virtual machine changes (e.g. load_i replaced load_a)
'             - Tidy up initialization (no longer need to pass stack) 
' Version 3.6 - New smaller image format. 
'               New smaller division.
' Version 3.13 - Improve PSHM performance
' Version 3.15 - Modified for P2.
' Version 8.7  - Updated to support FIFO (not enabled by default).
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

CON

#include <constant.inc>

' NO_INTERRUPTS - if defined, we can the use SKIPF because this code will not  
'                 be used in an interrupt service routine. Can be defined here 
'                 or on the command-line (i.e. -C NO_INTERRUPTS)

'#ifndef NO_INTERRUPTS
'#define NO_INTERRUPTS
'#endif

' FIFO - if defined, RDFAST and RFLONG will be used to read instructions,
'        otherwise RDLONG and PC will be used - but note that the PC 
'        still needs be kept up to date, and a new RDFAST needs to be 
'        issued whenever the PC has to change by anything other than 
'        just adding 4 to move to the next long.

'--------------------- Start of LMM Kernel ------------------------------------

DAT

        org 0
KERNEL_START

' the first $73 longs must be in the same place in all LMM kernels, to 
' allow for the separate compilation of code that uses these locations

INIT    jmp #lmm_init          '$00 ' CAN ONLY BE CALLED ONCE !!!
SPEC    jmp #special           '$01
LODL    jmp #load_l            '$02
LODI    jmp #load_i            '$03
LODF    jmp #fp_ind            '$04
PSHL    jmp #push_l            '$05
PSHB    jmp #push_b            '$06
CPYB    jmp #copy_b            '$07
NEWF    jmp #new_fp            '$08
RETF    jmp #fp_ret            '$09
CALA    jmp #f_call            '$0a
RETN    jmp #f_ret             '$0b
CALI    jmp #f_cali            '$0c
JMPA    jmp #f_jump            '$0d
JMPI    jmp #f_jmpi            '$0e
DIVS    jmp #f_d32s            '$0f
DIVU    jmp #f_d32u            '$10
MULT    jmp #f_m32             '$11
BR_Z    jmp #bra_z             '$12
BRNZ    jmp #bra_nz            '$13
BRAE    jmp #bra_ae            '$14
BR_A    jmp #bra_a             '$15
BRBE    jmp #bra_be            '$16
BR_B    jmp #bra_b             '$17
SYSP    jmp #plugin            '$18
PSHA    jmp #push_a            '$19
FADD    jmp #flt_add           '$1a
FSUB    jmp #flt_sub           '$1b
FMUL    jmp #flt_mul           '$1c
FDIV    jmp #flt_div           '$1d
FCMP    jmp #flt_cmp           '$1e
FLIN    jmp #flt_int           '$1f
INFL    jmp #int_flt           '$20
PSHM    jmp #push_m            '$21
POPM    jmp #pop_m             '$22
PSHF    jmp #push_i            '$23
RLNG    jmp #rd_long           '$24
RWRD    jmp #rd_word           '$25
RBYT    jmp #rd_byte           '$26
WLNG    jmp #wr_long           '$27
WWRD    jmp #wr_word           '$28
WBYT    jmp #wr_byte           '$29

        long 0                 '$2a spare

#if defined(QUICKBUILD) || defined(QUICKFORCE)
PC      long 0                 '$2b
#else
PC      long @C_main           '$2b
#endif
SP      long 0                 '$2c ' set up during initialization
FP      long 0                 '$2d
RI      long 0                 '$2e
BC      long 0                 '$2f
DBG1    long 0                 '$30 debug opAddr
DBG2    long 0                 '$31 debug temp
        long 0                 '$32 spare

r0      long 0                 '$33
r1      long 0                 '$34
r2      long 0                 '$35
r3      long 0                 '$36
r4      long 0                 '$37
r5      long 0                 '$38 
r6      long 0                 '$39 
r7      long 0                 '$3a 
r8      long 0                 '$3b 
r9      long 0                 '$3c 
r10     long 0                 '$3d 
r11     long 0                 '$3e 
r12     long 0                 '$3f 
r13     long 0                 '$40 
r14     long 0                 '$41 
r15     long 0                 '$42 
r16     long 0                 '$43 
r17     long 0                 '$44 
r18     long 0                 '$45 
r19     long 0                 '$46
r20     long 0                 '$47
r21     long 0                 '$48
r22     long 0                 '$49
r23     long 0                 '$4a
                             
Bit31   long  $80000000        '$4b
all_1s  long  $ffffffff        '$4c
cviu_m1 long  $000000ff        '$4d
cviu_m2 long  $0000ffff        '$4e
top8    long  $ff000000        '$4f ' top 8 bits bitmask
low24   long  $00ffffff        '$50 ' low 24 bits bitmask

Save_PC long  0                '$51
reg     long  0                '$52 ' registry address

' NOTE - the initial values below are used only during kernel initialization

t1      long  HUB_TOP          '$53
t2      long  FREE_MEM         '$54
t3      long  REQUESTS         '$55
t4      long  REGISTRY         '$56

ct1     long  0                '$57
ct2     long  0                '$58
ct3     long  0                '$59

' lmm_init : initialize VM - note that this code may be overlaid by 
'            17 longs of debug code once initialization is complete  

DEBUG_OVERLAY
lmm_init
#if defined(QUICKBUILD) || defined(QUICKFORCE)
        rdlong  reg,PTRA++      '$5a  1 load registry address (used later)   
        cogid   r2              '$5b  2 register ...
        shl     r2,#2           '$5c  3 ... ourselves ...
        add     r2,reg          '$5d  4 ... as ...
        rdlong  r1,r2           '$5e  5 ... a ...
        and     r1,low24        '$5f  6 ... new ...
        wrlong  r1,r2           '$60  7  kernel
        rdlong  PC,PTRA++       '$61  8 load initial PC
        rdlong  SP,PTRA++       '$62  9 load initial SP
        rdlong  r0,PTRA++       '$63 10 load initial LUT library size (-1)
        rdlong  r1,PTRA++       '$64 11 load initial LUT library address
        rdlong  r3,PTRA++       '$65 12 load initial arg1
        rdlong  r2,PTRA++       '$66 13 load initial arg2
        nop                     '$67 14 
        setq2   r0              '$68 15 copy lut library ...
        rdlong  $100,r1         '$69 16 ... to LUT RAM, starting at $100
#ifdef FIFO
        jmp     #LMM_fifo       '$6a 17 start executing LMM code
#else
        jmp     #LMM_loop       '$6a 17 start executing LMM code
#endif
#else
        wrlong  t1,t2           '$5a  1 set up free memory pointer
        mov     reg,t4          '$5b  2 point to registry
        cogid   t2              '$5c  3 get our cog id
        shl     t2,#2           '$5d  4 point to ...
        add     t4,t2           '$5e  5 ... our registry entry
        rdlong  t2,t4           '$5f  6 get our request block
        and     t2,low24        '$60  7 register ...    
        wrlong  t2,t4           '$61  8 ... our kernel
        setq2   #(LUT_LIBRARY_END - LUT_STARTUP - 1) '$62 9 load start/library code ...
        rdlong  0, ##@LUT_STARTUP '$63&64 10&11 ... to LUT RAM
        neg     t1,#1           '$65 12 set ... MEM_LOCK ...
        wrlong  t1,##MEM_LOCK   '$66&67 13&14 ... to unused
        call    #_C_init        '$68 15 execute startup code
#ifdef FIFO
        jmp     #LMM_fifo       '$69 16 start executing LMM code
#else
        jmp     #LMM_loop       '$69 16 start executing LMM code
#endif
        long    0               '$6a 17
#endif
        long    0               '$6b 18
        long    0               '$6c 19
        long    0               '$6d 20
'
' LMM_next - increment the PC then execute the instruction pointed to by the new PC
'        
LMM_next
        add    PC,#4            '$6e
'
' LMM_loop - Fetch an instruction from HUB RAM to COG RAM and execute it.
'
LMM_loop
        stalli                  '$6f
#ifdef FIFO
        rflong LMM_1            '$70
#else
        rdlong LMM_1,PC         '$70
#endif
        add    PC,#4            '$71
        nop                     '$72 P2 needs an extra NOP
LMM_1
        nop                     '$73
        allowi
        jmp    #LMM_loop

'
'load_l - load the long stored at the PC into RI, incrementing the PC
'
load_l
#ifdef FIFO
       rflong RI            ' load the address
#else
       rdlong RI,PC         ' load the address
#endif
       jmp    #LMM_next     ' increment PC, execute next instruction
'
'load_i - load the long at the address stored at the PC into RI, 
'         incrementing the PC (i.e. load indirect)
'
load_i
#ifdef FIFO
       rflong RI            ' load the address
#else
       rdlong RI,PC         ' load the address
#endif
       rdlong RI,RI         ' load the long at that address
       jmp    #LMM_next     ' execute next instruction
'
' fp_ind - load the FP into RI, then add the long at the PC to result, incrementing the PC
'
fp_ind
#ifdef FIFO
       rflong RI            ' load the long value
#else
       rdlong RI,PC         ' load the long value
#endif
       adds   RI,FP         ' add the frame pointer
       jmp    #LMM_next     ' increment PC, execute next instruction
'
' push_l - push a long value in RI onto the stack, decrementing the SP
'
push_l
       sub    SP,#4         ' decrement SP
       wrlong RI,SP         ' save value on stack
       jmp    #LMM_loop     ' increment PC, execute next instruction
'
' push_a - push a value whose address is specified indirectly in a global
'          variable onto the stack
'
push_a
#ifdef FIFO
       rflong RI            ' load the address
#else
       rdlong RI,PC         ' load the address
#endif
       jmp    #push_x       ' use the result as an address of the value to push
'
' push_i - push a value whose address is specified indirectly in a frame variable
'          onto the stack
'
push_i
#ifdef FIFO
       rflong RI            ' load the long value
#else
       rdlong RI,PC         ' load long value
#endif
       adds   RI,FP         ' add the frame pointer
push_x
       rdlong RI,RI         ' read the value at that address
       sub    SP,#4         ' decrement SP
       wrlong RI,SP         ' save value on stack
       jmp    #LMM_next     ' increment PC, execute next instruction
'
' push_m - push many registers (specified by long at PC) onto the stack,
' decrementing the SP before each one
'
push_m
#ifdef FIFO
       rflong RI            ' load long value specifying registers to push
#else
       rdlong RI,PC         ' load long value specifying registers to push
#endif
       mov    t1,RI         ' save register specification for later
       mov    t2, #r6       ' start with ...
       shr    RI,#6         ' ... r6 ...
       test   RI,#$1FF wz   ' ... or ...
  if_z shr    RI,#9         ' ... with ...
  if_z mov    t2,#r15       ' ... r15 if r6 - r15 not used
push_nxt
       shr    RI,#1 wcz     ' save rX?
 if_c  sub    SP,#4         ' yes - save ...
 if_c  altd   t2
 if_c  wrlong 0-0,SP        ' ... register
       add    t2,#1         ' point to next register
 if_nz jmp    #push_nxt    ' continue till all registers checked
       sub    SP,#4         ' save ...
       wrlong t1,SP         ' .... register specification
       jmp    #LMM_next     ' increment PC, execute next instruction
'
' pop_m - pop many registers (specified by the long on top of stack) 
' from the stack, incremening the SP after each one
'
pop_m
       rdlong RI,SP         ' load ...
       add    SP,#4         ' ... register specification to pop
       mov    t2, #r23      ' start with ...
       shl    RI,#(32-24)   ' ... r23         
pop_nxt
       shl    RI,#1 wcz     ' load rX?
 if_c  altd   t2 
 if_c  rdlong 0-0,SP        ' ... load ...
 if_c  add    SP,#4         ' ... the register
 if_z  jmp    #LMM_loop     ' execute next instruction if all done
       sub    t2,#1         ' point to previous register
       jmp    #pop_nxt     ' continue till all registers popped
'
' push_b - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP.
'
push_b
#ifdef FIFO
       rflong BC            ' load the byte count
#else
       rdlong BC,PC         ' load the byte count
#endif
       add    PC,#4         ' increment the PC
       mov    t3,BC         ' round up the count ...
       add    t3,#3         ' ... to be ...
       andn   t3,#3         ' ... a multiple of 4
       sub    SP,t3         ' decrement SP by rounded up size
       mov    t1,R0         ' source is in R0
       mov    t2,SP         ' destination is SP
       jmp    #copy_bytes   ' do the copy
'
' copy_b - copy a structure (size in bytes at the PC)
'          from the address in R1 to the address in R0
'
copy_b
#ifdef FIFO
       rflong BC            ' load the byte count
#else
       rdlong BC,PC         ' load the byte count
#endif
       add    PC,#4         ' increment the PC
       mov    t1,R1         ' source is in R1
       mov    t2,R0         ' destination is in R0
'
copy_bytes
       tjz    BC,#LMM_loop  ' no more to copy
       rdbyte t3,t1         ' read from src to t3
       wrbyte t3,t2         ' write t3 to dst
       add    t1,#1         ' increment source
       add    t2,#1         ' increment destination
       sub    BC,#1         ' decrement count ...
       jmp    #copy_bytes   ' ... and keep copying
'
' new_fp - save current frame pointer and set up a new frame pointer
' also calculate what SP was before data was pushed and save it in BC
'
new_fp
       sub    SP,#4         ' decrement the stack pointer
       wrlong FP,SP         ' save FP to stack
       mov    FP,SP         ' set up new FP
       add    BC,#8         ' calculate what SP was ...
       add    BC,FP         ' ... before arguments were pushed
       sub    SP,#4         ' allow for alloca
       wrlong Bit31,SP      ' initialize pre-alloca SP (to a known value)
       jmp    #LMM_loop     ' execute the next instruction
'
' fp_ret - pop current frame, restore previous frame and stack pointers,
'          then restore the previous program counter
'
' f_ret -  just restore the previous program counter
'
fp_ret
       add    SP,#4         ' allow for alloca
       rdlong FP,SP         ' restore previous FP
       add    SP,#4         ' increment the SP
f_ret
       rdlong PC,SP         ' read the PC
       add    SP,#8         ' increment the SP
#ifdef FIFO
       jmp    #LMM_fifo     ' re-initialize FIFO, execute next instruction
#else
       jmp    #LMM_loop     ' execute the next instruction
#endif
'
' f_call - call the routine at the address pointed to by the PC (increment the PC)
' f_cali - call the routine whose address is in RI
'
f_call
#ifdef FIFO
       rflong RI            ' get the address to call
#else                    
       rdlong RI,PC         ' get the address to call
#endif
       add    PC,#4         ' increment the PC (this is the return address)
f_cali
       sub    SP,#8         ' decrement the SP
       wrlong PC,SP         ' save current PC to stack
       jmp    #f_jmpi       ' jump to location in RI
'
' f_jump - jump to the location at the address pointed to by PC (increment the PC)
'
f_jump
#ifdef FIFO
       rflong PC            ' get the address to jump to
       jmp    #LMM_fifo     ' re-initialize FIFO, execute next instruction
#else                    
       rdlong PC,PC         ' get the address to jump to
       jmp    #LMM_loop     ' execute next instruction
#endif
'
' f_jmpi - jump to the location whose address in RI
'
f_jmpi
       mov    PC,RI         ' get the address to jump to
#ifdef FIFO
       jmp    #LMM_fifo     ' re-initialize FIFO, execute next instruction
#else
       jmp    #LMM_loop     ' execute next instruction
#endif
'
' rd_long/rd_word/rd_byte : Read long/word/byte from HUB memory at address in RI into BC.
'
' On entry:
'    RI : address to read
' On exit:
'    BC : long/word/byte read
'
rd_long
        rdlong  BC,RI
        jmp     #LMM_next
rd_word
        rdword  BC,RI
        jmp     #LMM_next
rd_byte
        rdbyte  BC,RI
        jmp     #LMM_next
'
' wr_long/wr_word/wr_byte : Write long/word/byte to HUB memory at address in RI into BC.
'
' On entry:
'    RI : address to write
'    BC : long/word/byte to write
' On exit:
'    (none)

wr_long
        wrlong  BC,RI
        jmp     #LMM_next
wr_word
        wrword  BC,RI
        jmp     #LMM_next
wr_byte
        wrbyte  BC,RI
        jmp     #LMM_next

'f_d32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1

f_d32s
        call    #\signed_d32     ' perform signed division
        jmp     #LMM_loop

'f_d32u - unsigned 32 bit division 
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        call    #\unsigned_d32   ' perform signed division
        jmp     #LMM_loop
        

'f_m32 - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result:
'           Product in r0 (<= 32 bit)

f_m32
        qmul   r0,r1
        getqx  r0
        jmp #LMM_loop

' bra_xx - branch if condition is true to the address at the PC,
'          otherwise, just increment the PC by 4
'
bra_z
  if_z  jmp    #f_jump       ' if condition true, branch is equiv to jump
#ifdef FIFO
        jmp    #f_nojump     ' read addr, increment PC, execute next instruction
#else
        jmp    #LMM_next     ' increment PC, execute next instruction
#endif
bra_nz
 if_nz  jmp    #f_jump       ' if condition true, branch is equiv to jump
#ifdef FIFO
        jmp    #f_nojump     ' read addr, increment PC, execute next instruction
#else
        jmp    #LMM_next     ' increment PC, execute next instruction
#endif
bra_ae
 if_ae  jmp    #f_jump       ' if condition true, branch is equiv to jump
#ifdef FIFO
        jmp    #f_nojump     ' read addr, increment PC, execute next instruction
#else
        jmp    #LMM_next     ' increment PC, execute next instruction
#endif
bra_a
 if_a   jmp    #f_jump       ' if condition true, branch is equiv to jump
#ifdef FIFO
        jmp    #f_nojump     ' read addr, increment PC, execute next instruction
#else
        jmp    #LMM_next     ' increment PC, execute next instruction
#endif
bra_be
 if_be  jmp    #f_jump       ' if condition true, branch is equiv to jump
#ifdef FIFO
        jmp    #f_nojump     ' read addr, increment PC, execute next instruction
#else
        jmp    #LMM_next     ' increment PC, execute next instruction
#endif
bra_b
 if_b   jmp    #f_jump       ' if condition true, branch is equiv to jump
#ifdef FIFO
f_nojump
        rflong RI            ' read addr, even though we don't use it
#endif
        jmp    #LMM_next     ' increment PC, execute next instruction

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
        call    #\do_plugin     ' do_plugin does all the work
        jmp     #LMM_loop

'---------------------------- local constants ---------------------------------

dlsb          long   1<<9

'--------------------- Start of Float32 Components ----------------------------
'
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
flt_add                 call    #_Unpack2               ' unpack two variables
          if_c_or_z     jmp     #LMM_loop               ' check for NaN or B = 0

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
pack_loop               call    #_Pack
                        jmp     #LMM_loop

'------------------------------------------------------------------------------
' flt_mul  r0 = r0 * r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1, t2
'------------------------------------------------------------------------------

flt_mul                 call    #_Unpack2               ' unpack two variables
          if_nc         jmp     #flt_mul2               ' multiply if neither is NaN
                        cmp     expA, #255 wz           ' NaN, so check for r0 = Inf
          if_z          jmp     #flt_mul1               ' yes - return Inf
                        cmp     expB, #255 wz           ' no - check for r1 = Inf
          if_nz         jmp     #LMM_loop               ' no - return NaN
flt_mul1                mov     r0, Inf                 ' yes, r0 or r1 is Inf, so return Inf
                        xor     flagA, flagB            ' 
                        test    flagA, #SignFlag wz
          if_nz         or      r0, Bit31
                        jmp     #LMM_loop
flt_mul2                xor     flagA, flagB            ' get sign of result
                        add     expA, expB              ' add exponents
                        qmul    manA, manB
                        getqy   t1
                        shl     t1, #3                  ' justify result and exit
                        mov     manA, t1
                        jmp     #pack_loop

'------------------------------------------------------------------------------
' flt_div  r0 = r0 / r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1, t2
'------------------------------------------------------------------------------

flt_div                 call    #_Unpack2               ' unpack two variables
          if_c_or_z     mov     r0, NaN                 ' check for NaN or divide by 0
          if_c_or_z     jmp     #LMM_loop

                        xor     flagA, flagB            ' get sign of result
                        sub     expA, expB              ' subtract exponents
                        shr     manA, #1
                        setq    manA
                        qdiv    #0, manB
                        getqx   manA
                        shr     manA, #2
                        jmp     #pack_loop

'------------------------------------------------------------------------------
' flt_int  r0 = float(r0)
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

flt_int                 mov     flagA, r0               ' get integer value
                        mov     r0, #0                  ' set initial result to zero
                        abs     manA, flagA wz          ' get absolute value of integer
          if_z          jmp     #LMM_loop               ' if zero, exit
                        shr     flagA, #31              ' set sign flag
                        mov     expA, #31               ' set initial value for exponent
normalize_1             shl     manA, #1 wc             ' normalize the mantissa
          if_nc         sub     expA, #1                ' adjust exponent
          if_nc         jmp     #normalize_1
                        rcr     manA, #1                ' justify mantissa
                        shr     manA, #2
                        jmp     #pack_loop

'------------------------------------------------------------------------------
' int_flt  r0 = fix(r0)
' changes: r0, flagA, expA, manA, t1
'------------------------------------------------------------------------------

int_flt
fix                     call    #_Unpack                ' unpack floating point value
          if_c          jmp     #LMM_loop               ' check for NaN
                        shl     manA, #2                ' left justify mantissa
                        mov     r0, #0                  ' initialize result to zero
                        neg     expA, expA              ' adjust for exponent value
                        add     expA, #31 wz
                        cmps    expA, #33 wc
          if_nc_or_z    jmp     #LMM_loop
                        sub     expA, #1
                        shr     manA, expA
                        shr     manA, #1
                        test    flagA, #signFlag wz     ' check sign and exit
                        sumnz   r0, manA
                        jmp     #LMM_loop

'------------------------------------------------------------------------------
' flt_cmp   set Z and C flags for r0 - r1
' changes: status, t1
'------------------------------------------------------------------------------

flt_cmp                 mov     t1, r0               ' compare signs
                        xor     t1, r1
                        and     t1, Bit31 wz
          if_z          jmp     #cmp1                  ' same, then compare magnitude

                        mov     t1, r0               ' check for +0 or -0
                        or      t1, r1
                        andn    t1, Bit31 wcz
          if_z          jmp     #LMM_loop

                        test    r0, Bit31 wc         ' compare signs
                        jmp     #LMM_loop

cmp1                    test    r0, Bit31 wz         ' check signs
          if_nz         jmp     #cmp2
                        cmp     r0, r1 wcz
                        jmp     #LMM_loop
cmp2                    cmp     r1, r0 wcz           ' reverse test if negative
                        jmp     #LMM_loop

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

zeroSubnormal          mov     t4, manA          
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

#ifdef FIFO
LMM_fifo
        rdfast #0,PC
        jmp    #LMM_loop
#endif

'---------------------------- local variables ---------------------------------

' temporary storage used in mul & div calculations

ftemp    long    0
ftmp2    long    0

' lockbits must be in the same place in all LMM kernels

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

'------------------------- END OF KERNEL --------------------------------------



