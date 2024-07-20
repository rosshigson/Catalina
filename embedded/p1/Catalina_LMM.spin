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

' Float32 constants:
SignFlag      = $1
ZeroFlag      = $2
NaNFlag       = $8

OBJ
   ' MUST INCLUDE THIS, SINCE ALTERNATE AND THREADED KERNELS DO, 
   ' AND WE NEED TO KEEP THE OFFSETS THE SAME (FOR SMM LOADER) !!!
   common : "Catalina_Common" 

PUB Entry_Addr : addr

   addr := @entry ' Kernel Entry Address
  '
  ' NOTE: Start now replaced by Run (below) - and only one of them can be 
  ' compiled at any one time due to assumptions in the loader about how 
  ' many methods the kernel has
  '
{
PUB Start : cog
  ' Starts the kernel in a new cog and returns
  
  cog := cognew(@entry, Common#REGISTRY)
}  
'{
PUB Run (Initial_BA) : cog
  ' Starts the kernel in the current cog and never returns

  ' set up base address and stack pointer in this cog's request block
  long[Common#REQUESTS][2 * cogid + 1] := long[Common#FREE_MEM]
  long[Common#REQUESTS][2 * cogid]     := Initial_BA
  ' now restart this cog as the kernel
  coginit(cogid, @entry, Common#REGISTRY)
'}
DAT
 org 0
'
entry
'
'--------------------- Start of LMM Kernel ------------------------------------
'
   jmp #INIT            '$00
'
'------------------------------------------------------------------------------
   jmp #INIT            '$01 remove this line when using POD, since it
                        '    adds a jump instruction before the program
'------------------------------------------------------------------------------
'
INIT    jmp #lmm_init          '$02 ' CAN ONLY BE CALLED ONCE !!!
LODL    jmp #load_l            '$03
LODI    jmp #load_i            '$04
LODF    jmp #fp_ind            '$05
PSHL    jmp #push_l            '$06
PSHB    jmp #push_b            '$07
CPYB    jmp #copy_b            '$08
NEWF    jmp #new_fp            '$09
RETF    jmp #fp_ret            '$0a
CALA    jmp #f_call            '$0b
RETN    jmp #f_ret             '$0c
CALI    jmp #f_cali            '$0d
JMPA    jmp #f_jump            '$0e
JMPI    jmp #f_jmpi            '$0f
DIVS    jmp #f_d32s            '$10
DIVU    jmp #f_d32u            '$11
MULT    jmp #f_m32             '$12
BR_Z    jmp #bra_z             '$13
BRNZ    jmp #bra_nz            '$14
BRAE    jmp #bra_ae            '$15
BR_A    jmp #bra_a             '$16
BRBE    jmp #bra_be            '$17
BR_B    jmp #bra_b             '$18
SYSP    jmp #plugin            '$19
PSHA    jmp #push_a            '$1a
FADD    jmp #flt_add           '$1b
FSUB    jmp #flt_sub           '$1c
FMUL    jmp #flt_mul           '$1d
FDIV    jmp #flt_div           '$1e
FCMP    jmp #flt_cmp           '$1f
FLIN    jmp #flt_int           '$20
INFL    jmp #int_flt           '$21
PSHM    jmp #push_m            '$22
POPM    jmp #pop_m             '$23
PSHF    jmp #push_i            '$24
RLNG    jmp #rd_long           '$25
RWRD    jmp #rd_word           '$26
RBYT    jmp #rd_byte           '$27
WLNG    jmp #wr_long           '$28
WWRD    jmp #wr_word           '$29
WBYT    jmp #wr_byte           '$2a
'                             
PC      long 0                 '$2b
SP      long 0                 '$2c
FP      long 0                 '$2d
RI      long 0                 '$2e
BC      long 0                 '$2f
BA      long 0                 '$30
BZ      long 0                 '$31
CS      long 0                 '$32
'
'------------------------------------------------------------------------------
' Register & Relocate are functions used only during Kernel initialization, so
' this code is placed over what will be registers once this initialization has
' completed.
'------------------------------------------------------------------------------
'                          
' Register ourselves by zeroing the upper half of our registry enty, 
' and then return the address of our request block in t1. 
'
' On Entry:
'   t1 : points to our registry entry
' On Exit:
'   t1 : points to our request block
Register
r0      rdword  t2,t1          '$33
r1      wrlong  t2,t1          '$34
r2      mov     t1,t2          '$35
r3      nop                    '$36
Register_ret
r4      ret                    '$37
'
' Relocate - move segments as indicated by the BA. We move all Catalina
'            data (i.e. from BA to BZ) to start at location zero, but do 
'            not overwrite the first 16 bytes of RAM, since they contain
'            special values (clock freq etc). 
'
Relocate
r5      mov     BC,BZ          '$38 ' length of data to be relocated
r6      add     BC,#3          '$39 ' round up ...
r7      andn    BC,#3          '$3a ' ... to a multiple of 4 bytes
r8      sub     BC,#$10        '$3b ' omit first 16 bytes
r9      mov     t2,#$10        '$3c ' destination is byte 16
r10     mov     t1,BA          '$3d ' source is BA ...
r11     add     t1,#$10        '$3e ' ... plus 16 bytes 
reloc_loop
r12     tjz    BC,#Relocate_ret'$3f ' no more to copy
r13     rdlong t3,t1           '$40 ' read from src to t3
r14     wrlong t3,t2           '$41 ' write t3 to dst
r15     add    t1,#4           '$42 ' increment source
r16     add    t2,#4           '$43 ' increment destination
r17     sub    BC,#4           '$44 ' decrement count ...
r18     jmp    #reloc_loop     '$45 ' ... and keep copying
Relocate_ret
r19     ret                    '$46
'
r20     long 0                 '$47
r21     long 0                 '$48
r22     long 0                 '$49
r23     long 0                 '$4a
'                             
Bit31   long  $80000000        '$4b
all_1s  long  $ffffffff        '$4c
cviu_m1 long  $000000ff        '$4d
cviu_m2 long  $0000ffff        '$4e
top8    long  $ff000000        '$4f ' top 8 bits bitmask
low24   long  $00ffffff        '$50 ' low 24 bits bitmask
'                             
init_B0                        ' must match lmm_progbeg.s!
'
init_BZ long  $00000000        '$51 ' end of code / start of heap
init_PC long  $00000000        '$52 ' the initial PC
'
' lmm_init : initialize VM - note that this code may be overlaid by 
'            17 longs of debug code once initialization is complete  
'
lmm_init
        cogid   t1              '1 convert ...
        shl     t1,#2           '2 ... my cog id ...
        add     t1,par          '3 ... to my registration addr
        call    #Register       '4 register ourselves, and get request block
wait
        rdlong  BA,t1 wz        '5 Wait till we are given the base address ...
  if_z  jmp     #wait           '6 .. (required to relocate segments)
        add     t1,#4           '7 Load our initial SP ...
        rdlong  SP,t1           '8 ... from the request block
        mov     BZ,#(init_BZ-init_B0)<<2+8 '9 calculate ...
        add     BZ,BA           '10 ... pointer to initial BZ
        mov     PC,BZ           '11 load ...
        add     PC,#4           '12 ... initial  ...
        rdlong  PC,PC           '13 ... PC and ...
        rdlong  BZ,BZ           '14 ... BZ and ...
        call    #Relocate       '15 ... relocate segments 
        jmp     #LMM_loop       '16 we can now start executing LMM code
        nop                     '17
'
' LMM_next - increment the PC then execute the instruction pointed to by the new PC
'        
LMM_next
        add    PC,#4
'
' LMM_loop - Fetch an instruction from HUB RAM to COG RAM and execute it.
' The basic LMM loop is unrolled 4 times to increase speed.
'
LMM_loop
        rdlong LMM_1,PC
        add    PC,#4
LMM_1
        nop
        rdlong LMM_2,PC
        add    PC,#4
LMM_2
        nop
        rdlong LMM_3,PC
        add    PC,#4
LMM_3
        nop
        rdlong LMM_4,PC
        add    PC,#4
LMM_4
        nop
        jmp    #LMM_loop
'
'load_l - load the long stored at the PC into RI, incrementing the PC
'
load_l
       rdlong RI,PC         ' load the address
       jmp    #LMM_next     ' increment PC, execute next instruction
'
'load_i - load the long at the address stored at the PC into RI, 
'         incrementing the PC (i.e. load indirect)
'
load_i
       rdlong RI,PC         ' load the address
       rdlong RI,RI         ' load the long at that address
       jmp    #LMM_next     ' execute next instruction
'
' fp_ind - load the FP into RI, then add the long at the PC to result, incrementing the PC
'
fp_ind
       rdlong RI,PC         ' load the long value
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
       rdlong RI,PC         ' load the address
       jmp    #push_x       ' use the result as an address of the value to push
'
' push_i - push a value whose address is specified indirectly in a frame variable
'          onto the stack
'
push_i
       rdlong RI,PC         ' load the long value
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
       rdlong RI,PC         ' load the long value specifying the registers to push
       mov    t1,RI         ' save register specification for later
       movd   :push_x,#r6   ' start with ...
       shr    RI,#6         ' ... r6 ...
       test   RI,#$1FF wz   ' ... or ...
  if_z shr    RI,#9         ' ... with ...
  if_z movd   :push_x,#r15  ' ... r15 if r6 - r15 not used
:push_nxt
       shr    RI,#1 wc,wz   ' save rX?
 if_c  sub    SP,#4         ' yes - save ...
:push_x                     ' ... the ...
 if_c  wrlong 0-0,SP        ' ... register
       add    :push_x,dlsb  ' point to next register
 if_nz jmp    #:push_nxt    ' continue till all registers checked
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
       movd   :pop_x,#r23   ' start with ...
       shl    RI,#(32-24)   ' ... r23         
:pop_nxt
       shl    RI,#1 wc,wz   ' load rX?
:pop_x                      ' if so ...
 if_c  rdlong 0-0,SP        ' ... load ...
 if_c  add    SP,#4         ' ... the register
 if_z  jmp    #LMM_loop     ' execute next instruction if all done
       sub    :pop_x,dlsb   ' point to previous register
       jmp    #:pop_nxt     ' continue till all registers popped
'
' push_b - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP.
'
push_b
       rdlong BC,PC         ' load the byte count
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
       rdlong BC,PC         ' load the byte count
       add    PC,#4         ' increment the PC
       mov    t1,R1         ' source is in R1
       mov    t2,R0         ' destination is in R0
'
copy_bytes
       tjz    BC,#LMM_Loop  ' no more to copy
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
       sub     SP,#4         ' decrement the stack pointer
       wrlong FP,SP         ' save FP to stack
       mov    FP,SP         ' set up new FP
       add    BC,#8         ' calculate what SP was ...
       add    BC,FP         ' ... before arguments were pushed
       jmp    #LMM_loop     ' execute the next instruction
'
' fp_ret - pop current frame, restore previous frame and stack pointers,
'          then restore the previous program counter
'
' f_ret -  just restore the previous program counter
'
fp_ret
       rdlong FP,SP         ' restore previous FP
       add    SP,#4         ' increment the SP
f_ret
       rdlong PC,SP         ' read the PC
       add    SP,#8         ' increment the SP
       jmp    #LMM_loop     ' execute the next instruction
'
' f_call - call the routine at the address pointed to by the PC (increment the PC)
' f_cali - call the routine whose address is in RI
'
f_call                    
       rdlong RI,PC         ' get the address to call
       add    PC,#4         ' increment the PC (this is the return address)
f_cali
       sub    SP,#8         ' decrement the SP
       wrlong PC,SP         ' save current PC to stack
       jmp    #f_jmpi       ' jump to location in RI
'
' f_jump - jump to the location at the address pointed to by PC (increment the PC)
'
f_jump
       rdlong PC,PC         ' get the address to jump to
       jmp    #LMM_loop     ' execute next instruction
'
' f_jmpi - jump to the location whose address in RI
'
f_jmpi
       mov    PC,RI         ' get the address to jump to
       jmp    #LMM_loop     ' execute next instruction
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
        jmp     #LMM_Next
rd_word
        rdword  BC,RI
        jmp     #LMM_Next
rd_byte
        rdbyte  BC,RI
        jmp     #LMM_Next
'
' wr_long/wr_word/wr_byte : Write long/word/byte to HUB memory at address in RI into BC.
'
' On entry:
'    RI : address to write
'    BC : long/word/byte to write
' On exit:
'    (none)
'
wr_long
        wrlong  BC,RI
        jmp     #LMM_Next
wr_word
        wrword  BC,RI
        jmp     #LMM_Next
wr_byte
        wrbyte  BC,RI
        jmp     #LMM_Next
'

#ifndef OLD_DIVISION

'
'fd_32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1
'
f_d32s
        mov     t3,r1           ' save sign for later
        mov     t4,r0
        abs     r1,r1
        abs     r0,r0
        xor     t3,t4

        call    #f_d32          ' perform unsigned division
        
        mov     t4,t4 WC        ' get bit #31 into carry
        negc    r1,r1           ' adjust the sign of the remainder
        mov     t3,t3 WC        ' get bit #31 into carry
        negc    r0,r0           ' adjust the sign of the result
        jmp     #LMM_loop
'
'f_d32u - unsigned 32 bit division 
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1
'
f_d32u  movs    f_d32_ret,#LMM_loop ' set return to #LMM_loop & fall into div
        
'
'f_d32  - 32 bit division (used by signed and unsigned)
'
f_d32
        mov     t1,#32
        mov     t2,#0           ' tmp2 is temp register to hold the remainder
:loop
        shl     r0,#1 WC
        rcl     t2,#1 
        cmpsub  t2,r1 WC
 if_c   add     r0,#1
        djnz    t1,#:loop
        mov     r1,t2           ' set remainder
f_d32_ret
        ret

#else

'
'fd_32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1
'                           
' This is Pullmoll's division algorithm

f_d32s
        mov  t1,#32
        mov  t2,#0           ' tmp2 is temp register to hold the remainder
        mov  ftemp,r1
        mov  ftmp2,r0
        abs  r1, r1
        abs  r0, r0
        xor  ftemp, ftmp2
:loop
        shl  r0,#1 WC
        rcl  t2,#1 WC
        cmpsub t2,r1 WC,WZ
 if_be add  r0,#1
        djnz t1,#:loop
        mov  r1,t2
        mov  ftmp2,ftmp2 WC  ' get bit #31 into carry
        negc r1,r1                   ' adjust the sign of the remainder
        mov  ftemp,ftemp WC  ' get bit #31 into carry
        negc r0,r0                   ' adjust the sign of the result
        jmp  #LMM_loop
        
'
'f_d32u - Unsigned 32 bit division
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        mov ftemp,#32
        mov ftmp2, #0
:up2
        shl r0,#1       WC
        rcl ftmp2,#1    WC
        cmp r1,ftmp2    WC,WZ
 if_a   jmp #:down
        sub ftmp2,r1
        add r0,#1
:down
        sub ftemp, #1   WZ
 if_ne  jmp #:up2
        mov r1,ftmp2
        jmp #LMM_loop
'

#endif

'
'f_m32 - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result:
'           Product in r0 (<= 32 bit)
'
f_m32
        mov ftemp,#0
:start
        cmp r0,#0       WZ
 if_e   jmp #:down3
        shr r0,#1       WC
 if_ae  jmp #:down2
        add ftemp,r1    WC
:down2
        shl r1,#1       WC
        jmp #:start
:down3
        mov r0,ftemp
        jmp #LMM_loop
'
' bra_xx - branch if condition is true to the address at the PC,
'          otherwise, just increment the PC by 4
'
'
bra_z
  if_z  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_nz
 if_nz  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_ae
 if_ae  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_a
 if_a   jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_be
 if_be  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_b
 if_b   jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
'
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
'
plugin
        mov     ftemp,#8        ' ftemp stores lock - default to none required
        mov     r0,r3 wc        ' get plugin type or cog id or service id
 if_b   jmp     #psvc           ' if < 0, code is a service id
        test    r0,#$80 wz      ' if bit 7 set ...
 if_nz  jmp     #pcog           ' code is a cog id ...
ptype                           ' ... otherwize it's a plugin type
        mov     t1,par          ' point to registry
        mov     t2,#0           ' start at cog id 0
plgt1
        cmp     t2,#8 wc,wz     ' run out of cogs?
 if_ae  jmp     #plugerr        ' yes - no such plugin
        rdlong  t3,t1           ' no - check cog's plugin type
        shr     t3,#24          ' is it ...
        cmp     t3,r0 wz        ' ... the plugin type what we wanted?
' if_z   jmp     #plgt2          ' yes - invoke plugin at this cog id
 if_nz  add     t2,#1           ' no - try ...
 if_nz  add     t1,#4           ' ... next ...
 if_nz  jmp     #plgt1          ' ... cog id
plgt2
        mov     r0,t2           ' use the cog where we found the plugin
        jmp     #pcog           ' invoke plugin (via the cog id)
psvc
        shl     r0,#1           ' read entry ...
        add     r0,par          ' ... from ...
        rdword  r0,r0           ' ... the service registry
        mov     t1,r0           ' save in t1 and extract ...
        shr     r0,#12          ' ... cog number to r0
        mov     ftemp,t1        ' save in ftemp and extract ...
        and     t1,#$7f         ' ... 7 bit plugin-specific code ...
        shl     t1,#24 wz       ' ... to t1 (top 8 bits) ...
  if_z  jmp     #plugerr        ' ... or throw error if request code is zero
        shr     ftemp,#7        ' put lock number in lower 5 bits of t4
        test    ftemp,#8 wz     ' are we required to use a lock?
 if_nz  jmp     #no_lock        ' no - just make the request
set_lock
        lockset ftemp wc        ' yes - loop ...
 if_c   jmp     #set_lock       ' ... until we have set the lock
no_lock
'        and     r2,low24        ' combine data ...
        or      r2,t1           ' ... with request code
pcog
        and     r0,#7           ' mask off cog id to 0 .. 7
        shl     r0,#2           ' point to ...
        add     r0,par          ' ... registry entry for the cog
        rdlong  r0,r0           ' get request block from registry
        test    r0,top8 wz      ' is a plugin registered in this cog?
 if_z   jmp     #plugerr        ' no - throw error 
'       and     r0,low24        ' yes - write ...
        wrlong  r2,r0           ' ... request 
ploop
        rdlong  r3,r0   wz      ' wait till ...
 if_nz  jmp     #ploop          ' ... request completed
        add     r0,#4           ' get ...
        rdlong  r0,r0           ' ... result
clr_lock
        test    ftemp,#8 wz     ' did we set a lock?
 if_z   lockclr ftemp           ' yes - clear the lock we set
        jmp     #LMM_loop
plugerr 
        neg     r0,#1           ' plugin error (e.g. not registered)
        jmp     #clr_lock       ' done - clear lock if required
'
'--------------------- End of LMM Kernel --------------------------------------
'
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

'------------------------------------------------------------------------------
' Float32 Assembly language routines
'------------------------------------------------------------------------------
' flt_add   r0 = r0 + r1
' flt_sub   r0 = r0 - r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1
'------------------------------------------------------------------------------

flt_sub                 xor     r1, Bit31               ' negate B
flt_add                 call    #_Unpack2               ' unpack two variables
          if_c_or_z     jmp     #LMM_Loop               ' check for NaN or B = 0

                        test    flagA, #SignFlag wz     ' negate A mantissa if negative
          if_nz         neg     manA, manA
                        test    flagB, #SignFlag wz     ' negate B mantissa if negative
          if_nz         neg     manB, manB

                        mov     t1, expA                ' align mantissas
                        sub     t1, expB
                        abs     t1, t1
                        max     t1, #31
                        cmps    expA, expB wz,wc
          if_nz_and_nc  sar     manB, t1
          if_nz_and_c   sar     manA, t1
          if_nz_and_c   mov     expA, expB

                        add     manA, manB              ' add the two mantissas
                        cmps    manA, #0 wc, nr         ' set sign of result
          if_c          or      flagA, #SignFlag
          if_nc         andn    flagA, #SignFlag
                        abs     manA, manA              ' pack result and exit
                        call    #_Pack
                        jmp     #LMM_Loop

'------------------------------------------------------------------------------
' flt_mul  r0 = r0 * r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1, t2
'------------------------------------------------------------------------------

flt_mul                 call    #_Unpack2               ' unpack two variables
          if_c          jmp     #LMM_Loop               ' check for NaN

                        xor     flagA, flagB            ' get sign of result
                        add     expA, expB              ' add exponents
                        mov     t1, #0                  ' t2 = upper 32 bits of manB
                        mov     t2, #32                 ' loop counter for multiply
                        shr     manB, #1 wc             ' get initial multiplier bit

:multiply if_c          add     t1, manA wc             ' 32x32 bit multiply
                        rcr     t1, #1 wc
                        rcr     manB, #1 wc
                        djnz    t2, #:multiply

                        shl     t1, #3                  ' justify result and exit
                        mov     manA, t1
                        call    #_Pack
                        jmp     #LMM_Loop

'------------------------------------------------------------------------------
' flt_div  r0 = r0 / r1
' changes: r0, flagA, expA, manA, r1, flagB, expB, manB, t1, t2
'------------------------------------------------------------------------------

flt_div                 call    #_Unpack2               ' unpack two variables
          if_c_or_z     mov     r0, NaN                 ' check for NaN or divide by 0
          if_c_or_z     jmp     #LMM_Loop

                        xor     flagA, flagB            ' get sign of result
                        sub     expA, expB              ' subtract exponents
                        mov     t1, #0                  ' clear quotient
                        mov     t2, #30                 ' loop counter for divide

:divide                 shl     t1, #1                  ' divide the mantissas
                        cmps    manA, manB wz,wc
          if_z_or_nc    sub     manA, manB
          if_z_or_nc    add     t1, #1
                        shl     manA, #1
                        djnz    t2, #:divide

                        mov     manA, t1                ' get result and exit
                        call    #_Pack
                        jmp     #LMM_Loop
'------------------------------------------------------------------------------
' flt_int  r0 = float(r0)
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

flt_int                 mov     flagA, r0               ' get integer value
                        mov     r0, #0                  ' set initial result to zero
                        abs     manA, flagA wz          ' get absolute value of integer
          if_z          jmp     #LMM_Loop               ' if zero, exit
                        shr     flagA, #31              ' set sign flag
                        mov     expA, #31               ' set initial value for exponent
:normalize              shl     manA, #1 wc             ' normalize the mantissa
          if_nc         sub     expA, #1                ' adjust exponent
          if_nc         jmp     #:normalize
                        rcr     manA, #1                ' justify mantissa
                        shr     manA, #2
                        call    #_Pack                  ' pack and exit
                        jmp     #LMM_Loop

'------------------------------------------------------------------------------
' int_flt  r0 = fix(r0)
' changes: r0, flagA, expA, manA, t1
'------------------------------------------------------------------------------

int_flt
fix                     call    #_Unpack                ' unpack floating point value
          if_c          jmp     #LMM_Loop               ' check for NaN
                        shl     manA, #2                ' left justify mantissa
                        mov     r0, #0                  ' initialize result to zero
                        neg     expA, expA              ' adjust for exponent value
                        add     expA, #31 wz
                        cmps    expA, #33 wc
          if_nc_or_z    jmp     #LMM_Loop
                        sub     expA, #1
                        shr     manA, expA
                        shr     manA, #1
                        test    flagA, #signFlag wz     ' check sign and exit
                        sumnz   r0, manA
                        jmp     #LMM_Loop

'------------------------------------------------------------------------------
' flt_cmp   set Z and C flags for r0 - r1
' changes: status, t1
'------------------------------------------------------------------------------

flt_cmp                 mov     t1, r0               ' compare signs
                        xor     t1, r1
                        and     t1, Bit31 wz
          if_z          jmp     #:cmp1                  ' same, then compare magnitude

                        mov     t1, r0               ' check for +0 or -0
                        or      t1, r1
                        andn    t1, Bit31 wz,wc
          if_z          jmp     #LMM_Loop

                        test    r0, Bit31 wc         ' compare signs
                        jmp     #LMM_Loop

:cmp1                   test    r0, Bit31 wz         ' check signs
          if_nz         jmp     #:cmp2
                        cmp     r0, r1 wz,wc
                        jmp     #LMM_Loop
:cmp2                   cmp     r1, r0 wz,wc      ' reverse test if negative
                        jmp     #LMM_Loop

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
                        mov     r0, r1            ' unpack B to A
                        call    #_Unpack
          if_c          jmp     #_Unpack2_ret           ' check for NaN

                        mov     r1, r0            ' save B variables
                        mov     flagB, flagA
                        mov     expB, expA
                        mov     manB, manA

                        mov     r0, t1               ' unpack A
                        call    #_Unpack
                        cmp     manB, #0 wz             ' set Z flag
_Unpack2_ret            ret

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
          if_z          jmp     #:zeroSubnormal         ' check for zero or subnormal
                        cmp     expA, #255 wz           ' check if finite
          if_nz         jmp     #:finite
                        mov     r0, NaN              ' no, then return NaN
                        mov     flagA, #NaNFlag
                        jmp     #:exit2

:zeroSubnormal          or      manA, expA wz,nr        ' check for zero
          if_nz         jmp     #:subnorm
                        or      flagA, #ZeroFlag        ' yes, then set zero flag
                        neg     expA, #150              ' set exponent and exit
                        jmp     #:exit2

:subnorm                shl     manA, #7                ' fix justification for subnormals
:subnorm2               test    manA, Bit29 wz
          if_nz         jmp     #:exit1
                        shl     manA, #1
                        sub     expA, #1
                        jmp     #:subnorm2

:finite                 shl     manA, #6                ' justify mantissa to bit 29
                        or      manA, Bit29             ' add leading one bit

:exit1                  sub     expA, #127              ' remove bias from exponent
:exit2                  test    flagA, #NaNFlag wc      ' set C flag
                        cmp     manA, #0 wz             ' set Z flag
_Unpack_ret             ret

'------------------------------------------------------------------------------
' input:   flagA        r0 flag bits (Nan, Infinity, Zero, Sign)
'          expA         r0 exponent (no bias)
'          manA         r0 mantissa (aligned to bit 29)
' output:  r0        32-bit floating point value
' changes: r0, flagA, expA, manA
'------------------------------------------------------------------------------

_Pack                   cmp     manA, #0 wz             ' check for zero
          if_z          mov     expA, #0
          if_z          jmp     #:exit1

:normalize              shl     manA, #1 wc             ' normalize the mantissa
          if_nc         sub     expA, #1                ' adjust exponent
          if_nc         jmp     #:normalize

                        add     expA, #2                ' adjust exponent
                        add     manA, #$100 wc          ' round up by 1/2 lsb
          if_c          add     expA, #1

                        add     expA, #127              ' add bias to exponent
                        mins    expA, Minus23
                        maxs    expA, #255

                        cmps    expA, #1 wc             ' check for subnormals
          if_nc         jmp     #:exit1

:subnormal              or      manA, #1                ' adjust mantissa
                        ror     manA, #1

                        neg     expA, expA
                        shr     manA, expA
                        mov     expA, #0                ' biased exponent = 0

:exit1                  mov     r0, manA             ' bits 22:0 mantissa
                        shr     r0, #9
                        movi    r0, expA             ' bits 23:30 exponent
                        shl     flagA, #31
                        or      r0, flagA            ' bit 31 sign
_Pack_ret               ret

NaN                     long    $7FFF_FFFF
Minus23                 long    -23
Mask23                  long    $007F_FFFF
Bit29                   long    $2000_0000

flagA                   res     1
expA                    res     1
manA                    res     1

flagB                   res     1
expB                    res     1
manB                    res     1

'-------------------- End of Float32 Components -------------------------------

'---------------------------- local variables ---------------------------------

t1            res    1
t2            res    1
t3            res    1
#ifndef OLD_DIVISION
t4            res    1
#endif
'
' temporary storage used in mul & div calculations
'
ftemp         res    1
ftmp2         res    1
'
' last 5 longs are reserved for debug overlay vectors
'
              fit    $1eb                  
              org    $1eb
DEBUG_VECTORS long   0,0,0,0,0
              fit    $1f0
